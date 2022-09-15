# HashiCrop `packer` Template of Debian 11 (bullseye)
This repo contains a `packer` template for building a Vagrant Base Box of [Debian 11.5](https://www.debian.org/releases/bullseye/) (aka bullseye).


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
1. Set `"iso_checksum": "sha512:..."` getting the required SUM via the version specific URL & SHASUM path eg:
   - [https://cdimage.debian.org/cdimage/release/:warning:_***11.5.0***_:warning:/amd64/iso-cd/SHA512SUMS](https://cdimage.debian.org/cdimage/release/11.5.0/amd64/iso-cd/SHA512SUMS)

2. Make all changes as required (eg: `d-i mirror/country string Netherlands` in `ui-input.http/pressed_debian11-bullseye.cfg`) and thereafter commence with build using `packer` CLI:
    ```bash
    packer validate debian11-bullseye.json && \
    # if output: Template validated successfully. \
    packer build debian10-bullseye.json
    ```
3. Adjust `disk_size` which has been intentional set to 2Gb primary drive only!

The resulting Vagrant Base **\*.box** file will be produced in the root of the repository (where no issues / errors).


## Notes
Make adjustments to use appropriate mirrors (which are insecure ftp or http presently) where intended to extend to make proper use beyond a mere practise / training.

If your development & delivery resource specifications differ (eg - you'd like to use more resource locally) then then update (`debian11-bullseye.json`) by adding the below noted **`vboxmanage_post`** block (after: *`vboxmanage`*) within the *`builders`* section as well its related **`variables`**:
```
"variables":
{
    ...
 	"cpu_cores_delivery": "1",
	"memory_delivery": "1024",
    ...
},
"builders":
[{
    ...
	"vboxmanage_post":
	[
		[ "modifyvm", "{{.Name}}", "--memory", "{{user `memory_delivery`}}" ],
		[ "modifyvm", "{{.Name}}", "--cpus", "{{user `cpu_cores_delivery`}}" ]
	],
    ...
}],
```


## Reference & Credits:
Accreditation due for material that are from other repo's which also worth referencing:
 * [deimosfr/packer-debian](https://github.com/deimosfr/packer-debian)
 * [rgl/debian-vagrant](https://github.com/rgl/debian-vagrant)
------
