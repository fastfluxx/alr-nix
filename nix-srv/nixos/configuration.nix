
{ config, pkgs, ... }:

{
  #imports =
    #[ # Include the results of the hardware scan.
    #  ./hardware-configuration.nix
    #];



  # GRUB bootloader
  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "/dev/nvme0n1";
  #boot.loader.grub.useOSProber = true;

  # EFI systemd bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  ## Enable flakes
  nix.settings.experimental-features = "nix-command flakes";


  networking.hostName = "nix-srv"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "no";
    xkb.variant = "";
  };


  virtualisation.docker = {
    enable = true;
  };

  # Configure console keymap
  console.keyMap = "no";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alr = {
    isNormalUser = true;
    description = "alr";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
  git
  vim
  iptables
  ebtables
  dnsmasq
  ];


  services.openssh.enable = true;

  #networking.interfaces.ens3.ipv4.addresses = [ {
  #	address = "10.99.99.30";
  #	prefixLength = 24;
  #} ];

  networking.defaultGateway = "10.99.99.1";

  

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
