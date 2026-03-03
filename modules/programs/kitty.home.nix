{ pkgs, lib, ... }:
{
  programs = {
    ghostty.enable = true;
    kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      font = {
        package = lib.mkForce pkgs.fira-code-nerdfont;
        name = lib.mkForce "Fira Code Nerd Font";
        size = lib.mkForce 14;
      };
      settings = {
        background_opacity = lib.mkForce "0.90";
        background_blur = lib.mkForce "20";
        confirm_os_window_close = 0;
        disable_ligatures = "cursor";
        window_padding_width = "6";
        placement_strategy = "center";
      };
    };
  };
}
