# Good enough images
A growing collection of useful tools, completely bundled inside docker-images.
Those images are *good-enough* to work, but might not be perfectly optimized.

Using the install-script, those images can be used as you would normally use them, but always inside a container!
For example, after installing the `metasploit`-image, you can use `msfconsole` as usual from your commandline, but it will start inside a container.

Currently, the following commands can be used:
<!-- LIST COMMANDS -->
- bopscrk (wordlists)
- certipy (certipy)
- cme (cme)
- dirb (websectools)
- git-dumper (websectools)
- impacket-addcomputer (impacket)
- impacket-atexec (impacket)
- impacket-changepasswd (impacket)
- impacket-dacledit (impacket)
- impacket-dcomexec (impacket)
- impacket-describeTicket (impacket)
- impacket-dpapi (impacket)
- impacket-DumpNTLMInfo (impacket)
- impacket-esentutl (impacket)
- impacket-exchanger (impacket)
- impacket-findDelegation (impacket)
- impacket-GetADComputers (impacket)
- impacket-GetADUsers (impacket)
- impacket-getArch (impacket)
- impacket-Get-GPPPassword (impacket)
- impacket-GetLAPSPassword (impacket)
- impacket-GetNPUsers (impacket)
- impacket-getPac (impacket)
- impacket-getST (impacket)
- impacket-getTGT (impacket)
- impacket-GetUserSPNs (impacket)
- impacket-goldenPac (impacket)
- impacket-karmaSMB (impacket)
- impacket-keylistattack (impacket)
- impacket-kintercept (impacket)
- impacket-lookupsid (impacket)
- impacket-machine_role (impacket)
- impacket-mimikatz (impacket)
- impacket-mqtt_check (impacket)
- impacket-mssqlclient (impacket)
- impacket-mssqlinstance (impacket)
- impacket-net (impacket)
- impacket-netview (impacket)
- impacket-ntfs-read (impacket)
- impacket-ntlmrelayx (impacket)
- impacket-owneredit (impacket)
- impacket-ping6 (impacket)
- impacket-ping (impacket)
- impacket-psexec (impacket)
- impacket-raiseChild (impacket)
- impacket-rbcd (impacket)
- impacket-rdp_check (impacket)
- impacket-reg (impacket)
- impacket-registry-read (impacket)
- impacket-rpcdump (impacket)
- impacket-rpcmap (impacket)
- impacket-sambaPipe (impacket)
- impacket-samrdump (impacket)
- impacket-secretsdump (impacket)
- impacket-services (impacket)
- impacket-smbclient (impacket)
- impacket-smbexec (impacket)
- impacket-smbserver (impacket)
- impacket-sniffer (impacket)
- impacket-sniff (impacket)
- impacket-split (impacket)
- impacket-ticketConverter (impacket)
- impacket-ticketer (impacket)
- impacket-tstool (impacket)
- impacket-wmiexec (impacket)
- impacket-wmipersist (impacket)
- impacket-wmiquery (impacket)
- msfconsole (metasploit)
- msfvenom (metasploit)
- nikto (websectools)
- pdflatex (miktex)
- psudohash (wordlists)
- responder-multirelay.py (responder)
- responder.py (responder)
- sqlmap (websectools)
- testssl.sh (sslcheck)
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