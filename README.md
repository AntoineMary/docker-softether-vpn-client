# Lightweight [Softether VPN][softether] Bridge
[![Build Status][project-build-image]][project-build-link] [![Docker Build][docker-build-image]][docker-build-link] [![Docker Stars][docker-stars-image]][docker-stars-link] [![Docker Pulls][docker-pulls-image]][docker-pulls-link]

This docker only contains a working **SoftEther VPN Bridge** other components have been removed.

If you need other parts :
* [SoftEther VPN Client][client-link]
* [SoftEther VPN CMD][cmd-link]
* [SoftEther VPN Server][server-link]
___

# What is SoftEther VPN Bridge
> SoftEther VPN Bridge is software that allows you to cascade-connect to a Virtual Hub of SoftEther VPN Server operating at a remote location and create a Layer-2 bridge connection between that VPN connection and a physical network adapter on a computer running SoftEther VPN Bridge. SoftEther VPN Bridge is the ideal software for a computer connected to a remote base LAN when you want to connect the remote base LAN to a VPN configured with SoftEther VPN Server (namely, a Virtual Hub on a SoftEther VPN Server).

[https://www.softether.org/4-docs/1-manual/5._SoftEther_VPN_Bridge_Manual](https://www.softether.org/4-docs/1-manual/5._SoftEther_VPN_Bridge_Manual)

# About this image
Versions will follow [Softether VPN Github Repository][softether-repository] tags and [Alpine][alpine-link] update.

This image is make'd from [the offical Softether VPN Github Repository][softether-repository] with 1 patchs :
1. [Server Patch][server-patch]:
  * Default Server cipher changed from **"RC4-MD5"** to **"DHE-RSA-AES256-SHA"**

Nothing else have been edited. So when you will start it the first time you will get the default configuration which is :
* **/!\ Administration without any password /!\**
* Bridge listenning on 443/tcp, 992/tcp, 1194/tcp+udp, tcp/5555
* Unconfigured Bridge

You will have to configure it. To do so use :
* [SoftEther VPN CMD][cmd-link] (any platform - Console)
* [SoftEther VPN Server Manager][softether-download] (Windows, Mac OS X - GUI)
* Edit by hand /usr/vpnserver/vpn_server.config then restart the server (Not Recommended)

# How to use this image
For a simple use without persistence :
```
docker run -d --cap-add NET_ADMIN -p 443:443/tcp -p 992:992/tcp -p 1194:1194/udp -p 5555:5555/tcp amary/softether-vpn-bridge
```
For a simple use with persistence (will give you acces to configuration and logs) :
```
docker run -d --cap-add NET_ADMIN -p 443:443/tcp -p 992:992/tcp -p 1194:1194/udp -p 5555:5555/tcp -v /host/path/vpnbridge:/usr/vpnbridge:Z amary/softether-vpn-bridge
```
Add/delete any ```-p $PORT:$PORT/{tcp,udp} depending on you will ```

# Changelog
* v4.22-9634-beta : Initial Release

[//]: <> (==== Reference Part ====)

[//]: <> (External Websites)
[softether]: https://www.softether.org/
[softether-download]: http://www.softether-download.com/en.aspx?product=softether
[softether-repository]: https://github.com/SoftEtherVPN/SoftEtherVPN

[client-link]: https://hub.docker.com/r/amary/softether-vpn-client/
[cmd-link]: https://hub.docker.com/r/amary/softether-vpn-cmd/
[server-link]: https://hub.docker.com/r/amary/softether-vpn-server/

[alpine-link]: https://hub.docker.com/_/alpine/

[//]: <> (Repository Link)
[server-patch]: https://github.com/AntoineMary/docker-softether-vpn-bridge/blob/master/assets/patchs/00_Server.sh
[openvpn-patch]: https://github.com/AntoineMary/docker-softether-vpn-bridge/blob/master/assets/patchs/01_OpenVPN.sh

[//]: <> (Badges)
[project-build-image]: https://travis-ci.org/AntoineMary/docker-softether-vpn-bridge.svg?branch=master
[project-build-link]: https://travis-ci.org/AntoineMary/docker-softether-vpn-bridge

[docker-build-image]: https://img.shields.io/docker/automated/amary/softether-vpn-bridge.svg
[docker-build-link]: https://hub.docker.com/r/amary/softether-vpn-bridge/

[docker-stars-image]: https://img.shields.io/docker/stars/amary/softether-vpn-bridge.svg
[docker-stars-link]: https://hub.docker.com/r/amary/softether-vpn-bridge/

[docker-pulls-image]: https://img.shields.io/docker/pulls/amary/softether-vpn-bridge.svg
[docker-pulls-link]: https://hub.docker.com/r/amary/softether-vpn-bridge/
