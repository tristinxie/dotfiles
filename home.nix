{ config, pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "tristin";
    homeDirectory = "/home/tristin";
    stateVersion = "26.05";
    packages = with pkgs; [
      kdePackages.kate
      neovim
      fastfetch
      htop
      kitty
      (python3.withPackages (ps: with ps; [ 
        tkinter 
      ]))
      google-chrome
    #  thunderbird
    ];
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      sudo = "sudo ";
      rebuild = "sudo nixos-rebuild switch --flake /home/tristin/xpstriple";
      home-rebuild = "home-manager switch --flake /home/tristin/xpstriple";
    };
  };
  programs.git = {
    enable = true;
  
    settings = {
      user = {
        name = "Tristin Xie";
        email = "tristinxie@gmail.com";
      };
  
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}

