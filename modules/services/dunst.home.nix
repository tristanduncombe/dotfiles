{ config, ... }:
let
  p = config.palette;
in
{
  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          width = "(300, 450)";
          offset = "10x10";

          progress_bar_min_width = 380;
          progress_bar_max_width = 380;
          progress_bar_corner_radius = 6;
          progress_bar_frame_width = 1;

          padding = 14;
          horizontal_padding = 14;
          text_icon_padding = 14;
          frame_width = 2;
          gap_size = 4;
          font = "FiraCode Nerd Font Mono Medium 10";

          icon_theme = "rose-pine-icon-theme";
          enable_recursive_icon_lookup = true;
          corner_radius = 12;
          separator_color = "frame";

          background = "#${p.base01}";
          foreground = "#${p.base05}";
          frame_color = "#${p.base02}";

          mouse_left_click = "close_current";
          mouse_right_click = "close_all";
        };

        urgency_low = {
          background = "#${p.base01}e6";
          highlight = "#${p.base0B}";
          frame_color = "#${p.base0B}80";
          default_icon = "dialog-information";
          format = "<b><span foreground='#${p.base0B}'>%s</span></b>\n%b";
        };

        urgency_normal = {
          background = "#${p.base01}e6";
          highlight = "#${p.base09}";
          frame_color = "#${p.base09}80";
          default_icon = "dialog-warning";
          format = "<b><span foreground='#${p.base09}'>%s</span></b>\n%b";
        };

        urgency_critical = {
          background = "#${p.base01}e6";
          highlight = "#${p.base08}";
          frame_color = "#${p.base08}";
          default_icon = "dialog-error";
          format = "<b><span foreground='#${p.base08}'>%s</span></b>\n%b";
          timeout = 0;
        };
      };
    };
  };
}
