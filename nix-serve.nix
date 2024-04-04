{
  nix = {
    settings = {
      trusted-users = [ "nix-ssh" ];
    };
    sshServe = {
      protocol = "ssh-ng";
      enable = true;
      write = true;
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOq9gQxVP6k8TNYgkBR+oasyEIooP3QTPmWSkyvywic6 root@t480"
      ];
    };
  };
}
