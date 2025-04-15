
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



  networking.hostName = "alr-nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "no";
    xkb.variant = "";
  };


  #security.rtkit.enable = true;
  

  # Configure console keymap
  console.keyMap = "no";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alr = {
    isNormalUser = true;
    description = "alr";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
  # Disk stuff
  ];



  programs.zsh.enable = true;

   
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
