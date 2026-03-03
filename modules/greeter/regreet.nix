{ pkgs, self, ... }:

let
  # Rose Pine Moon palette
  base   = "#232136";
  surface = "#2a273f";
  overlay = "#393552";
  muted   = "#6e6a86";
  subtle  = "#908caa";
  text    = "#e0def4";
  iris    = "#c4a7e7";
  love    = "#eb6f92";
  foam    = "#3e8fb0";
  gold    = "#f6c177";
  rose    = "#ea9a97";

  regreetCss = ''
    /* ── Window ───────────────────────────────────── */
    window {
      background-color: transparent;
      color: ${text};
      font-family: "FiraCode Nerd Font", monospace;
    }

    /* ── Login box — frosted glass card ───────────── */
    #login_box,
    box.linked,
    .content {
      background-color: alpha(${base}, 0.75);
      border-radius: 24px;
      border: 1px solid alpha(${overlay}, 0.6);
      padding: 36px 44px;
    }

    /* ── Password entry ───────────────────────────── */
    entry {
      background-color: alpha(${surface}, 0.8);
      color: ${text};
      border: 2px solid alpha(${iris}, 0.4);
      border-radius: 24px;
      padding: 12px 20px;
      font-size: 14px;
      min-height: 24px;
      caret-color: ${iris};
    }

    entry:focus {
      border-color: alpha(${iris}, 0.8);
    }

    /* ── Buttons ──────────────────────────────────── */
    button {
      background-color: alpha(${overlay}, 0.6);
      color: ${text};
      border: 1px solid alpha(${overlay}, 0.4);
      border-radius: 24px;
      padding: 10px 22px;
      font-weight: 600;
      min-height: 18px;
    }

    button:hover {
      background-color: alpha(${iris}, 0.3);
      color: ${text};
      border-color: alpha(${iris}, 0.5);
    }

    button:active {
      background-color: alpha(${iris}, 0.15);
    }

    button.suggested-action {
      background-color: alpha(${iris}, 0.25);
      border-color: alpha(${iris}, 0.4);
      font-weight: 700;
    }

    button.suggested-action:hover {
      background-color: alpha(${iris}, 0.45);
    }

    button.destructive-action {
      color: ${love};
      border-color: alpha(${love}, 0.3);
    }

    button.destructive-action:hover {
      background-color: alpha(${love}, 0.2);
      color: ${love};
    }

    /* ── Dropdowns ────────────────────────────────── */
    combobox button,
    dropdown button {
      background-color: alpha(${surface}, 0.8);
      border: 1px solid alpha(${overlay}, 0.5);
      border-radius: 24px;
      padding: 8px 16px;
      color: ${subtle};
    }

    combobox button:hover,
    dropdown button:hover {
      color: ${text};
      border-color: alpha(${iris}, 0.4);
    }

    /* ── Labels ───────────────────────────────────── */
    label {
      color: ${text};
    }

    label.dim-label {
      color: ${muted};
    }

    label.error {
      color: ${love};
    }

    /* ── Clock ────────────────────────────────────── */
    #clock-label {
      font-size: 96px;
      font-weight: 300;
      color: alpha(${text}, 0.70);
      letter-spacing: 2px;
    }

    /* ── Greeting ─────────────────────────────────── */
    #greeting-label {
      font-size: 22px;
      font-weight: 600;
      color: ${iris};
      letter-spacing: 0.5px;
    }

    /* ── Scrollbar ────────────────────────────────── */
    scrollbar slider {
      background-color: alpha(${muted}, 0.3);
      border-radius: 999px;
      min-width: 4px;
    }

    scrollbar slider:hover {
      background-color: alpha(${iris}, 0.4);
    }
  '';
in
{
  imports = [
    "${self}/modules/greeter/greetd.nix"
  ];

  programs.regreet = {
    enable = true;

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine-moon";
    };

    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine-moon";
    };

    cursorTheme = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir";
    };

    font = {
      package = pkgs.nerd-fonts.fira-code;
      name = "FiraCode Nerd Font";
      size = 14;
    };

    cageArgs = [ "-s" "-d" ];

    extraCss = regreetCss;

    settings = {
      background = {
        path = "/home/tristand/Pictures/wallpaper.jpg";
        fit = "Cover";
      };

      GTK = {
        application_prefer_dark_theme = true;
      };

      appearance = {
        greeting_msg = "Welcome back!";
      };

      widget.clock = {
        format = "%a %H:%M";
        resolution = "500ms";
      };

      commands = {
        reboot   = [ "systemctl" "reboot" ];
        poweroff = [ "systemctl" "poweroff" ];
      };

      env = {
        XDG_SESSION_TYPE = "wayland";
        FONTCONFIG_FILE = "/etc/fonts/fonts.conf";
      };
    };
  };

  # Pin greetd to VT1 so heavy user sessions can't knock out the greeter
  services.greetd.settings = {
    terminal.vt = 1;
  };
}
