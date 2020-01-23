# HashiCrop `packer` Template of Debian 10 (buster)
This repo contains a `packer` template for building a Vagrant Base Box of [Debian 10.x](https://www.debian.org/releases/buster/) (aka buster).


### Prerequisites
Ensure that you already have the following applications installed & working:
 - [**Virtualbox**](https://www.virtualbox.org/)
 - [**Virtualbox Guest Additions (VBox GA)**](https://download.virtualbox.org/virtualbox/)
 - > **MacOS** (aka OSX) - VirtualBox 6.x+ is expected to be shipped with the related .iso present under (eg):
 `/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso`
You may however need to download the .iso specific to your version (mount it) and execute the VBoxDarwinAdditions.pkg
 - [**Vagrant**](https://www.vagrantup.com/)
 - [**Packer**](https://www.packer.io/)


## Usage
Make all changes as required (such as locations, eg: `d-i mirror/country string Netherlands` in ``ui-input.http/pressed_debian10-buster.cfg``) and thereafter commence with build using `packer` CLI:

```bash
packer validate debian10-buster.json && \
# if output: Template validated successfully. \
packer build debian10-buster.json
```

The resulting Vagrant Base **\*.box** file will be produced in the root of the repository (where no issues / errors).


## Notes
Make adjustments to use appropriate mirrors (which are insecure ftp or http presently) where intended to extend to make proper use beyond a mere practise / training.


## Reference & Credits:
Accreditation due for material that are from other repo's which also worth referencing:
 * [deimosfr/packer-debian](https://github.com/deimosfr/packer-debian)
 * [rgl/debian-vagrant](https://github.com/rgl/debian-vagrant)
------
