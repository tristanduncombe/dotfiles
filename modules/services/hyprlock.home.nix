{ config, ... }:
let
  p = config.palette;
  rgba = hex: alpha: "rgba(${hex}, ${alpha})";
  rgb = hex: "rgb(${hex})";
in
{
  programs.hyprlock = {
    enable = true;
    sourceFirst = true;
    settings = {
      general = {
        disable_loading_bar = false;
        grace = 0;
        no_fade_in = false;
      };

      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 3;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      image = [
        {
          monitor = "";
          path = "~/.config/hypr/vivek.png";
          border_size = 2;
          border_color = rgba p.base0D "0.6";
          size = 130;
          rounding = -1;
          rotate = 0;
          reload_time = -1;
          reload_cmd = "";
          position = "0, 40";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
          color = rgba p.base05 "0.70";
          font_size = 25;
          font_family = "FiraCode Nerd Font Mono Medium";
          position = "0, 350";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"'';
          color = rgba p.base05 "0.70";
          font_size = 120;
          font_family = "FiraCode Nerd Font Mono Medium";
          position = "0, 250";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(~/.config/hypr/Scripts/songdetail.sh)"'';
          color = rgba p.base04 "0.6";
          font_size = 18;
          font_family = "FiraCode Nerd Font Mono Medium";
          position = "0, 50";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "    $USER";
          color = rgba p.base05 "0.80";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          font_size = 18;
          font_family = "FiraCode Nerd Font Mono Medium";
          position = "0, -130";
          halign = "center";
          valign = "center";
        }
      ];

      shape = [
        {
          monitor = "";
          size = "300, 60";
          color = rgba p.base02 "0.4";
          rounding = -1;
          border_size = 0;
          border_color = rgba p.base0D "0.0";
          rotate = 0;
          xray = false;
          position = "0, -130";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = rgba p.base0D "0.4";
          inner_color = rgba p.base01 "0.6";
          font_color = rgb p.base05;
          fade_on_empty = false;
          font_family = "FiraCode Nerd Font Mono Medium";
          placeholder_text = ''<i><span foreground="##${p.base04}99">Enter Pass</span></i>'';
          hide_input = false;
          check_color = rgba p.base0B "0.6";
          fail_color = rgba p.base08 "0.6";
          position = "0, -210";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
