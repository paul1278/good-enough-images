# Good enough images
A growing collection of useful tools, completely bundled inside docker-images.
Those images are *good-enough* to work, but might not be perfectly optimized.

Using the install-script, those images can be used as you would normally use them, but always inside a container!
For example, after installing the `metasploit`-image, you can use `msfconsole` as usual from your commandline, but it will start inside a container.

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