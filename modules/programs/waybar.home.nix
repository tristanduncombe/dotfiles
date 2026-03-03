{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  p = config.palette;
in
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 38;
        margin-top = 4;
        margin-left = 8;
        margin-right = 8;

        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "bluetooth"
          "pulseaudio"
          "network"
          "battery"
        ];

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "󰮯";
            default = "󰊠";
            empty = "󰑊";
          };
        };

        "niri/window" = {
          format = "{}";
          max-length = 40;
          rewrite = {
            "(.*) — Mozilla Firefox" = "󰈹 $1";
            "(.*) - Visual Studio Code" = "󰨞 $1";
            "(.*)kitty" = " $1";
          };
        };

        "tray" = {
          spacing = 10;
          icon-size = 16;
        };

        "clock" = {
          format = "  {:L%I:%M %p}";
          format-alt = "  {:L%A, %B %d}";
          tooltip = true;
          tooltip-format = "<big>{:%A, %d %B %Y}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "battery" = {
          interval = 30;
          states = {
            good = 80;
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-charging = "󰂄  {capacity}%";
          format-plugged = "󱘖  {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          tooltip-format = "{timeTo}\n{power}W";
        };

        "network" = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = "  {bandwidthDownOctets}";
          format-wifi = "{icon}  {signalStrength}%";
          format-disconnected = "󰤮  Off";
          tooltip-format-wifi = "{essid} ({signalStrength}%)\n{ipaddr}/{cidr}";
          tooltip-format-ethernet = "{ifname}\n{ipaddr}/{cidr}";
          on-click = "sleep 0.1 && nm-connection-editor";
        };

        "pulseaudio" = {
          format = "{icon}  {volume}%";
          format-bluetooth = "  {volume}%";
          format-muted = "  Muted";
          format-icons = {
            headphone = "󰋋";
            default = [
              "󰕿"
              "󰖀"
              "󱄠"
            ];
          };
          on-click = "sleep 0.1 && pavucontrol";
          tooltip-format = "{desc}\n{volume}%";
        };

        "bluetooth" = {
          format = "";
          format-connected = "  {num_connections}";
          format-disabled = "󰂲";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          on-click = "sleep 0.1 && blueman-manager";
        };
      };
    };

    style = ''
      * {
        font-family: "FiraCode Nerd Font Mono Medium", "Font Awesome 6 Free";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: alpha(#${p.base00}, 0.85);
        border-radius: 12px;
        border: 1px solid alpha(#${p.base02}, 0.6);
      }

      tooltip {
        background: #${p.base01};
        border: 1px solid #${p.base02};
        border-radius: 8px;
        color: #${p.base05};
      }

      #workspaces {
        margin: 4px 4px;
        padding: 0px 4px;
        background: alpha(#${p.base01}, 0.6);
        border-radius: 8px;
      }

      #workspaces button {
        color: #${p.base03};
        padding: 2px 6px;
        margin: 2px;
        border-radius: 6px;
        transition: all 0.2s ease;
      }

      #workspaces button.active {
        color: #${p.primaryAccent};
        background: alpha(#${p.primaryAccent}, 0.15);
      }

      #workspaces button:hover {
        color: #${p.base0C};
        background: alpha(#${p.base02}, 0.5);
      }

      #window {
        color: #${p.base04};
        padding: 0px 12px;
        font-style: italic;
      }

      #clock {
        font-weight: bold;
        color: #${p.base05};
        padding: 0px 14px;
      }

      #battery,
      #pulseaudio,
      #bluetooth,
      #network,
      #tray {
        color: #${p.base05};
        background: alpha(#${p.base01}, 0.6);
        margin: 4px 3px;
        padding: 0px 12px;
        border-radius: 8px;
        transition: all 0.2s ease;
      }

      #battery:hover,
      #pulseaudio:hover,
      #bluetooth:hover,
      #network:hover {
        background: alpha(#${p.base02}, 0.6);
      }

      #battery.warning {
        color: #${p.base09};
      }

      #battery.critical {
        color: #${p.base08};
        animation: blink 1s linear infinite;
      }

      #network.disconnected {
        color: #${p.base03};
      }

      #pulseaudio.muted {
        color: #${p.base03};
      }

      @keyframes blink {
        to {
          color: #${p.base00};
          background: #${p.base08};
        }
      }
    '';
  };
}
