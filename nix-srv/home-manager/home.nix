{ config, pkgs, ... }:

{
  # Home config
  home.username = "alr";
  home.homeDirectory = "/home/alr";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config = {
  	allowUnfree = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
	# Utils
	pkgs.screen
	pkgs.wget
	pkgs.tree
	pkgs.file
	pkgs.tldr
        pkgs.zip
        pkgs.p7zip
        pkgs.bat
        pkgs.dig
        pkgs.neofetch
        pkgs.git
  ];



  
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Configure programs


  

  programs.ssh = {
    enable = true;
    
    extraConfig = ''    


    Host 10.0.0.1
	KexAlgorithms +diffie-hellman-group1-sha1
	PubkeyAcceptedAlgorithms +ssh-rsa
	HostkeyAlgorithms +ssh-rsa

    Host 10.0.0.2
	KexAlgorithms +diffie-hellman-group1-sha1
	PubkeyAcceptedAlgorithms +ssh-rsa
	HostkeyAlgorithms +ssh-rsa

    Host 10.0.0.20
        KexAlgorithms +diffie-hellman-group1-sha1
	Ciphers +aes256-cbc
        HostkeyAlgorithms +ssh-rsa

    Host github.com
      HostName github.com
      User git
      IdentityFile ~/.ssh/alr.priv


    '';

  };

  home.file = {
    # Home dotfiles


  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
