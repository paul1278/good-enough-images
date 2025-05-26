# Good enough images
A growing collection of useful tools, completely bundled inside docker-images.
Those images are *good-enough* to work, but might not be perfectly optimized.

Using the install-script, those images can be used as you would normally use them, but always inside a container!
For example, after installing the `metasploit`-image, you can use `msfconsole` as usual from your commandline, but it will start inside a container.

Currently, the following commands can be used:
<!-- LIST COMMANDS -->
- bopscrk
- certipy
- cme
- dirb
- git-dumper
- impacket-addcomputer
- impacket-atexec
- impacket-changepasswd
- impacket-dacledit
- impacket-dcomexec
- impacket-describeTicket
- impacket-dpapi
- impacket-DumpNTLMInfo
- impacket-esentutl
- impacket-exchanger
- impacket-findDelegation
- impacket-GetADComputers
- impacket-GetADUsers
- impacket-getArch
- impacket-Get-GPPPassword
- impacket-GetLAPSPassword
- impacket-GetNPUsers
- impacket-getPac
- impacket-getST
- impacket-getTGT
- impacket-GetUserSPNs
- impacket-goldenPac
- impacket-karmaSMB
- impacket-keylistattack
- impacket-kintercept
- impacket-lookupsid
- impacket-machine_role
- impacket-mimikatz
- impacket-mqtt_check
- impacket-mssqlclient
- impacket-mssqlinstance
- impacket-net
- impacket-netview
- impacket-ntfs-read
- impacket-ntlmrelayx
- impacket-owneredit
- impacket-ping
- impacket-ping6
- impacket-psexec
- impacket-raiseChild
- impacket-rbcd
- impacket-rdp_check
- impacket-reg
- impacket-registry-read
- impacket-rpcdump
- impacket-rpcmap
- impacket-sambaPipe
- impacket-samrdump
- impacket-secretsdump
- impacket-services
- impacket-smbclient
- impacket-smbexec
- impacket-smbserver
- impacket-sniff
- impacket-sniffer
- impacket-split
- impacket-ticketConverter
- impacket-ticketer
- impacket-tstool
- impacket-wmiexec
- impacket-wmipersist
- impacket-wmiquery
- msfconsole
- msfvenom
- nikto
- psudohash
- responder-multirelay.py
- responder.py
- sqlmap
- testssl.sh
<!-- END LIST COMMANDS -->

## Params for all images

### Global workdir
All containers will automatically mount the global working-directory, this is usually `/opt/good-enough-images/workdir/all`, but you can change it using
the configuration file under `/etc/good-enough-images.conf`.

### Networking
When it comes to networking, all containers use the `host`-network.

## Install
Simply clone the repo and run `./install.sh -a`. To uninstall everything, use `./install.sh -a --remove`. You can also install a selection of images,
for that run `./install.sh --image <imagename>`.

## Updating images
You can always do a quick `git pull` and follow the steps above to install a newer version. After that, you may have to download the docker-image for a final update. For that, use `./install.sh -a -u` or `./install.sh --image <imagename> -u` respectively.

## Debugging
For easier debugging, there are some environment variables to modify the behavior of the `runbase.sh` script. This is the default run-script for any image not providing an own script.
- `DEBUG=1` won't run images, it will only print the `docker run` command.
- `OVERRIDE_IMAGE=...` changes the image which will be used to run. Perfect when building locally.