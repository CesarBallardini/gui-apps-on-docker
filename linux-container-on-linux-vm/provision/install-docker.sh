#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
export APT_OPTIONS=' -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold '

install_os_requirements() {
  sudo apt-get update

  sudo apt install --no-install-recommends \
    apt-transport-https \
    curl \
    gnupg-agent \
    ca-certificates \
    software-properties-common \
    ${APT_OPTIONS}
}


install_docker_deb_source() {
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  sudo apt-key export 0EBFCD88 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg

  echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update
}


install_docker_deb_packages() {
sudo apt install \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-compose-plugin \
  ${APT_OPTIONS}
}

configure_proxy() {
  # if needed for corporate proxy traversal
  sudo mkdir -p /etc/systemd/system/docker.service.d/
  sudo chown -R root:root /etc/systemd/system/
  sudo chmod -R 0755 /etc/systemd/system/

cat | sudo tee /etc/systemd/system/docker.service.d/http-proxy.conf <<!EOF
[Service]
Environment="HTTP_PROXY=${http_proxy}" "HTTPS_PROXY=${https_proxy}" "NO_PROXY=${no_proxy}"

!EOF

}

enable_docker() {
  sudo systemctl daemon-reload

  sudo systemctl enable docker
  sudo systemctl restart docker

  sudo systemctl status docker --no-pager
}


configure_docker_user() {
sudo usermod -aG docker $USER

newgrp docker << NEWGROUP
# dollar sign ($) must be escaped inside here-doc so they are not executed on the previous shell, before the newgrp
docker version
docker run hello-world
NEWGROUP

}

##
# main
#
install_os_requirements
install_docker_deb_source
install_docker_deb_packages
configure_proxy
enable_docker
configure_docker_user
