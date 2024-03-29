_: {
  mainBar = {
    layer = "top";
    position = "top";
    mod = "dock";
    modules-left = ["custom/arch" "hyprland/workspaces"];
    modules-center = ["hyprland/window"];
    modules-right = [
      "tray"
      "cpu"
      "memory"
      "network"
      "battery"
      "pulseaudio"
      "clock"
    ];

    "hyprland/workspaces" = {
      active-only = false;
      on-click = "activate";
      on-scroll-up = "hyprctl dispatch workspace m+1";
      on-scroll-down = "hyprctl dispatch workspace m-1";
      format = "{icon}";
      format-icons = {
        "1" = "一";
        "2" = "二";
        "3" = "三";
        "4" = "四";
        "5" = "五";
        "6" = "六";
        "7" = "七";
        "8" = "八";
        "9" = "九";
        "10" = "十";
        "urgent" = "";
        "active" = "零";
        "default" = "";
      };
    };

    "custom/arch" = {
      format = " 󱄅 ";
      tooltip = false;
      on-click-release = "fuzzel";
    };

    "custom/media" = {
      "format" = " {}";
      "max-lenght" = "40";
      "interval" = "1";
      "exec" = "playerctl metadata --format '{{ artist }} - {{ title }}'";
      "on-click" = "playerctl play-pause";
      "on-click-right" = "playerctl stop";
      "smooth-scrolling-threshold" = "4";
      "on-scroll-up" = "playerctl next";
      "on-scroll-down" = "playerctl previous";
    };

    "idle_inhibitor" = {
      format = "{icon}";
      format-icons = {
        activated = " ";
        deactivated = " ";
      };
    };

    "tray" = {
      spacing = "10";
      icon-size = "13";
    };

    "clock" = {
      format = "󰥔 {:%H:%M - %Y/%m/%d}";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };

    "cpu" = {
      format = " {usage}%";
      tooltip = "false";
    };

    "memory" = {
      format = " {}%";
      on-click = "foot -e btop";
    };

    "backlight" = {
      format = "{icon}{percent}%";
      format-icons = ["󰃞 " "󰃟 " "󰃠 "];
      on-scroll-up = "light -A 1";
      on-scroll-down = "light -U 1";
    };

    "battery" = {
      states = {
        warning = "30";
        critical = "15";
      };
      format = "{icon}{capacity}%";
      tooltip-format = "{timeTo} {capacity}%";
      format-charging = "󰂄 {capacity}%";
      format-plugged = " ";
      format-alt = "{time} {icon}";
      format-icons = ["  " "  " "  " "  " "  "];
    };

    "network" = {
      format-wifi = "󰖩 {essid}";
      format-ethernet = "󰈀 ";
      format-linked = "{ifname} (No IP) 󰈀 ";
      format-disconnected = "󰖪  Disconnected";
      on-click = "foot -e nmtui";
      tooltip-format = "{essid} {signalStrength}%";
    };

    "pulseaudio" = {
      format = "{icon}{volume}%";
      format-muted = " 󰖁 ";
      format-icons = {
        default = ["  " "  " "  "];
      };
      on-click = "pavucontrol &";
    };

    "custom/wmname" = {
      format = " ";
      tooltip = "false";
      on-click = "$HOME/.config/rofi/launchers/type-1/launcher.sh";
      on-click-right = "$HOME/.config/hypr/Scripts/screenshot";
      on-click-middle = "$HOME/.config/hypr/Scripts/wallpaper-switch";
    };

    "custom/powermenu" = {
      format = " ";
      on-click = "$HOME/.config/rofi/powermenu/powermenu.sh";
    };
  };
}
