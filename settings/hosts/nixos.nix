{
  hostname = "nixos";
  system = "x86_64-linux";
  kernel = "latest";
  users = [ "tristand" ];
  stateVersion = "24.11";
  trustedUsers = [ "tristand" ];
  nixPath = "/home/dotfiles";
  misc = { };
}
