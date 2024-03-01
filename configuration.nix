{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    git
    gh
  ];
  services.openssh.enable = true;
  systemd.services.display-manager.restartIfChanged = lib.mkForce true;
  users = {
    users.o = {
      password = "o";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
  networking = {
    hostName = "gdrn";
    firewall.enable = true;
    networkmanager.enable = lib.mkForce false;
    interfaces.enp11s0.useDHCP = true;
  };
  nix.settings = {
    experimental-features = lib.mkDefault "nix-command flakes";
    trusted-users = [ "root" "@wheel" ];
  };
}
