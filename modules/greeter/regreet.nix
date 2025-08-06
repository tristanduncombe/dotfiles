{ pkgs, self, ... }:
{
  imports = [
    "${self}/modules/greeter/greetd.nix"
  ];
  programs.regreet.enable = true;
  services.greetd.settings = {
    default_session = {
      command = "niri-session";
      user = "tristand";
    };
  };
}
