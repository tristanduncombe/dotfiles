{
  pkgs,
  inputs,
  config,
  userSettings,
  self,
  lib,
  systemSettings,
  ...
}:
let
  inherit (lib) mkOption types;
  palette = "${systemSettings.nixPath}/${userSettings.theme}.json";
in
{
  imports = [
    inputs.stylix.homeModules.stylix
    "${self}/modules/themes/palette.home.nix"
  ];

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";

    targets = {
      hyprland.enable = false;
      firefox.enable = false;
      spicetify.enable = false;
      hyprlock.enable = false;
      dunst.enable = false;
      kde.enable = false;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";

    image = "/home/tristand/.wallpaper";

    cursor = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono Medium";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };
}
