# Lightweight [Softether VPN][softether] Client
[![Build Status][project-build-image]][project-build-link] [![Docker Build][docker-build-image]][docker-build-link] [![Docker Stars][docker-stars-image]][docker-stars-link] [![Docker Pulls][docker-pulls-image]][docker-pulls-link]

This docker only contains a working **SoftEther VPN Client** other components have been removed.

If you need other parts :
* [SoftEther VPN Bridge][bridge-link]
* [SoftEther VPN CMD][cmd-link]
* [SoftEther VPN Server][server-link]
___

# What is SoftEther VPN Client
> SoftEther VPN Client is VPN client software with a Virtual Network Adapter function that enables connection to a Virtual Hub on SoftEther VPN Server operated at a remote location. The user can use the easy settings on a computer with SoftEther VPN Client installed to connect to a Virtual Hub on SoftEther VPN Server and flexibly connect via a Virtual Network Adapter.

[https://www.softether.org/4-docs/1-manual/4._SoftEther_VPN_Client_Manual](https://www.softether.org/4-docs/1-manual/4._SoftEther_VPN_Client_Manual)

# About this image
Versions will follow [Softether VPN Github Repository][softether-repository] tags and [Alpine][alpine-link] update.

This image is make'd from [the offical Softether VPN Github Repository][softether-repository]

Nothing have been edited. So when you will start it the first time you will get the default configuration which is :
* Unconfigured client

You will have to configure it. To do so use :
* [SoftEther VPN CMD][cmd-link] (any platform - Console)
* [SoftEther VPN Server Manager][softether-download] (Windows, Mac OS X - GUI)
* Edit by hand /usr/vpnclient/vpn_client.config then restart the server (Not Recommended)

# How to use this image
For a simple use without persistence :
```
docker run -d amary/softether-vpn-client
```
For a simple use with persistence (will give you acces to configuration and logs) :
```
docker run -d -v /host/path/vpnclient:/usr/vpnclient:Z amary/softether-vpn-client
```
Add/delete any ```-p $PORT:$PORT/{tcp,udp} depending on you will ```

# Changelog
* v4.22-9634-beta : Initial Release

[//]: <> (==== Reference Part ====)

[//]: <> (External Websites)
[softether]: https://www.softether.org/
[softether-download]: http://www.softether-download.com/en.aspx?product=softether
[softether-repository]: https://github.com/SoftEtherVPN/SoftEtherVPN

[bridge-link]: https://hub.docker.com/r/amary/softether-vpn-bridge/
[cmd-link]: https://hub.docker.com/r/amary/softether-vpn-cmd/
[server-link]: https://hub.docker.com/r/amary/softether-vpn-server/

[alpine-link]: https://hub.docker.com/_/alpine/

[//]: <> (Repository Link)
[server-patch]: https://github.com/AntoineMary/docker-softether-vpn-bridge/blob/master/assets/patchs/00_Server.sh
[openvpn-patch]: https://github.com/AntoineMary/docker-softether-vpn-bridge/blob/master/assets/patchs/01_OpenVPN.sh

[//]: <> (Badges)
[project-build-image]: https://travis-ci.org/AntoineMary/docker-softether-vpn-client.svg?branch=master
[project-build-link]: https://travis-ci.org/AntoineMary/docker-softether-vpn-client

[docker-build-image]: https://img.shields.io/docker/automated/amary/softether-vpn-client.svg
[docker-build-link]: https://hub.docker.com/r/amary/softether-vpn-client/

[docker-stars-image]: https://img.shields.io/docker/stars/amary/softether-vpn-client.svg
[docker-stars-link]: https://hub.docker.com/r/amary/softether-vpn-client/

[docker-pulls-image]: https://img.shields.io/docker/pulls/amary/softether-vpn-client.svg
[docker-pulls-link]: https://hub.docker.com/r/amary/softether-vpn-client/
