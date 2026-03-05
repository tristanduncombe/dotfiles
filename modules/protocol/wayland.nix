{ pkgs, ... }:
{
  programs.xwayland.enable = true;

  environment = {
    variables = {
      XDG_SESSION_TYPE = "wayland";
      NIXOS_OZONE_WL = "1";
      XDG_CURRENT_DESKTOP = "niri";
    };
    sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      GDK_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      mpvpaper
      swappy
      wl-clipboard
      wlr-randr
      swww
      xwayland
      xdg-utils
      xdg-desktop-portal
      v4l-utils
    ];
  };

  # Webcam kernel modules
  boot.kernelModules = [ "v4l2loopback" "uvcvideo" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "gnome;gtk;";
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
}
