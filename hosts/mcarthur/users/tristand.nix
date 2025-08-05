{ pkgs, ... }:
{
  users.groups.usb = { };
  users.users."tristand" = {
    shell = pkgs.nushell; # cannot be set in home manager! very sad
    isNormalUser = true;
    description = "tristand";
    password = "123";
    extraGroups = [
      "networkmanager"
      "libvirtd"
      "wheel"
      "audio"
      "corectrl"
      "daemon"
      "usb"
    ];
  };

}
