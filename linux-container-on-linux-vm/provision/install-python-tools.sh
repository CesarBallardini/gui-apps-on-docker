#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
export APT_OPTIONS=' -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold '

export MY_PYTHON_VERSION=3.10.2

install_utilities() {
  sudo apt-get install \
    mc \
    screen \
    tree \
    "${APT_OPTIONS}"
}


install_python_version_with_pyenv() {

  curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

  cat | tee -a ~/.bashrc <<'EOF'

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

EOF

  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"

  # instala la version de Python necesaria
  pyenv install ${MY_PYTHON_VERSION}

  # pone disponible dentro del repositorio
  pyenv local ${MY_PYTHON_VERSION}

}


pip_virtualenv_install() {
  sudo apt-get install python3-pip -y
  pip3 install virtualenv
  export PATH=/home/vagrant/.local/bin:$PATH
}

##
# main
#

sudo apt-get update

# install OS requirements
sudo apt-get install --no-install-recommends \
  make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
  libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev \
  libxmlsec1-dev libffi-dev liblzma-dev \
  ${APT_OPTIONS}


# add on ubuntu 20:
sudo apt-get install \
  gcc make zlib1g-dev libreadline-dev libreadline8 sqlite3 libsqlite3-dev \
  libbz2-dev python-tk python3-tk tk-dev \
  ${APT_OPTIONS}


install_utilities
install_python_version_with_pyenv
pip_virtualenv_install

