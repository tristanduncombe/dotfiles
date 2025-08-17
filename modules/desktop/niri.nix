{
  self,
  userSettings,
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    (import (self + "/modules/scripts/overview.nix") {
      inherit pkgs;
    })
    pkgs.jq
    pkgs.killall
  ];
}
