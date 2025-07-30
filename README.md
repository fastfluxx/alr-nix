# alr-nix


## Note
# build system with
sudo nixos-rebuild switch --flake "path:/home/alr/.config/alr-nix#alr-nix"


## Crypto
The LUKS volume should be automatically picked up by nixos-generate-config, but you might want to verify that your hardware-configuration.nix looks correct. To manually ensure that the system is automatically mounted at boot time as /, add the following to configuration.nix:

{
  boot.initrd.luks.devices.crypted.device = "/dev/disk/by-uuid/3f6b0024-3a44-4fde-a43a-767b872abe5d";
  fileSystems."/".device = "/dev/mapper/crypted";
}

Should grub be used as bootloader, and /boot is located on an encrypted partition, it is necessary to add the following grub option:

{
  boot.loader.grub.enableCryptodisk = true;
}

