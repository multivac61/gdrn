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
  boot = {
    kernelPackages = lib.mkForce pkgs.linuxPackages_testing;
    loader = {
      generic-extlinux-compatible.enable = lib.mkDefault true;
      grub.enable = lib.mkDefault false;
    };
  };
  # disk with this label on first boot. Therefore, we need to keep it. It is the
  # only information from the installer image that we need to keep persistent
  fileSystems."/" =
    {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
}
