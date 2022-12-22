# README

* install the graphical app

```bash
sudo apt-get install x11-apps -y
```

* Build the image

```bash
docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy .
```

* run the container

```bash
docker run --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix aliustaoglu/firefox
```


# References

* https://cuneyt.aliustaoglu.biz/en/running-gui-applications-in-docker-on-windows-linux-mac-hosts/

