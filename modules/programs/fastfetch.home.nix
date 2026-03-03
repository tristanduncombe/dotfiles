_: {
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        size.binaryPrefix = "si";
        separator = "  ";
      };
      logo = {
        type = "small";
        padding = {
          top = 1;
          left = 2;
          right = 2;
        };
        color = {
          "1" = "magenta";
          "2" = "blue";
        };
      };
      modules = [
        {
          type = "title";
          format = "{#magenta}{user-name}{#reset}@{#blue}{host-name}";
        }
        {
          type = "separator";
          string = "─────────────────────────";
        }
        {
          type = "os";
          key = " ";
          keyColor = "magenta";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "magenta";
        }
        {
          type = "uptime";
          key = "󰅐 ";
          keyColor = "blue";
        }
        {
          type = "packages";
          key = "󰏗 ";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "cyan";
        }
        {
          type = "wm";
          key = " ";
          keyColor = "cyan";
        }
        {
          type = "terminal";
          key = " ";
          keyColor = "green";
        }
        {
          type = "terminalfont";
          key = " ";
          keyColor = "green";
        }
        "break"
        {
          type = "cpu";
          key = "󰻠 ";
          keyColor = "yellow";
        }
        {
          type = "gpu";
          key = "󰍛 ";
          keyColor = "yellow";
        }
        {
          type = "memory";
          key = "󰑭 ";
          keyColor = "red";
        }
        {
          type = "disk";
          key = "󰋊 ";
          keyColor = "red";
        }
        {
          type = "battery";
          key = "󰁹 ";
          keyColor = "green";
        }
        "break"
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
      ];
    };
  };
}
