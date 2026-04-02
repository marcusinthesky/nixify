# GNOME Desktop — Home Manager module
#
# Extensions, dconf settings, and shell tweaks for GNOME.
# Colour scheme and cursor are handled by Stylix; polarity is read
# from theme.nix so the GNOME interface tracks the same dark/light
# preference as every other app.
{ pkgs, ... }:

let
  theme = import ../../theme.nix;
in
{
  # ── GNOME Extensions & Tools ────────────────────────────────────────────
  home.packages = (with pkgs.gnomeExtensions; [
    blur-my-shell # Glass-like blur on panel, overview, and dash
    dash-to-dock # macOS-style dock
    just-perfection # Fine-tune GNOME Shell UI elements
    appindicator # System tray icons (Tailscale, Docker, etc.)
  ]) ++ [
    pkgs.gnome-tweaks # Advanced GNOME settings GUI
  ];

  # ── dconf — GNOME Shell & extension settings ──────────────────────────
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "just-perfection-desktop@just-perfection"
        "appindicatorsupport@rgcjonas.gmail.com"
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = if theme.polarity == "dark" then "prefer-dark" else "default";
      enable-hot-corners = false;
      clock-show-weekday = true;
      show-battery-percentage = true;
    };

    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      natural-scroll = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "BOTTOM";
      dash-max-icon-size = 40;
      intellihide-mode = "ALL_WINDOWS";
      show-trash = false;
      show-mounts = false;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      animation = 2;
      startup-status = 0;
    };

    # ── Blur My Shell ────────────────────────────────────────────────────
    "org/gnome/shell/extensions/blur-my-shell" = {
      hacks-level = 1;
    };
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      brightness = 0.75;
      sigma = 20;
    };
    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      blur = true;
      sigma = 20;
    };
    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.75;
      sigma = 20;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
    };
  };
}
