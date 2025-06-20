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
	pkgs.htop
	pkgs.tree
	pkgs.file
	pkgs.tldr
        pkgs.zip
        pkgs.p7zip
        pkgs.bat
        pkgs.dig
        # Picture view
        pkgs.qimgv
	# Notes
        pkgs.obsidian
	# File transfer
	pkgs.filezilla
	# Password
	pkgs.bitwarden
	# Network Analyze
	pkgs.wireshark
	# Remote Desktop
        pkgs.remmina
        #pkgs.realvnc-vnc-viewer
        #pkgs.gnome.vinagre
	# Video
	pkgs.vlc
	# Web Browser
	pkgs.firefox
	# Office Stuff
        #pkgs.libreoffice
        # Version control
        pkgs.git
  ];

  home.file = {
    # Home dotfiles
  };

  
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Configure programs


  programs.vim = {
    enable = true;
    
    settings = {    
      number = true;
    };

  };

  programs.gpg = {
    enable = true;
    
  };


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

programs.zsh = {

        enable = true;
        autosuggestion.enable = true;

        #enableCompletion = true;

        oh-my-zsh = {
          enable = true;
          theme = "agnoster";  
          plugins = [ "git" "z" "sudo" "docker" ];
    };

        shellAliases = {
            cat = "bat -p";
            ssh="TERM=xterm-256color ssh";
        };


        history = {
            size = 10000;
        };

        initContent = 
        "
          # Check if zsh-autosuggestions script is not downloaded
          if [[ ! -f ~/.zsh/zsh-autosuggestions.zsh ]]; then
          # Download zsh-autosuggestions script
          mkdir -p ~/.zsh
          curl -o ~/.zsh/zsh-autosuggestions.zsh https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/zsh-autosuggestions.zsh
          fi
 
        # Source zsh-autosuggestions script
        source ~/.zsh/zsh-autosuggestions.zsh
 
 
        # The following lines were added by compinstall
        zstyle :compinstall filename '~/.zshrc'
 
        autoload -Uz compinit 
        compinit
 
 
      # Theme (preview: prompt -p)
      #prompt fire red magenta blue black white red
 
      export PS1='%B%F{magenta}%K{magenta}%{█▓▒░%}%B%F{black}%K{magenta}%n@%m%b%F{black}%K{magenta}%{░▒%}%b%F{black}%K{blue}%{▒░%}%F{black}%K{blue}%~%F{black}%K{blue}%{░▒▓%}%k%B%F{white} 
%}%B%F{green}%\-->%b%f '


      # Keep at the bottom
      if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
               source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      fi
        ";



      };



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
