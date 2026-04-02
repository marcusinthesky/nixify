# GNOME Desktop Environment — GDM, Wayland, printing, audio
_:

{
  services = {
    # ── Display & Desktop ──────────────────────────────────────────────
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome.games.enable = false;

    xserver = {
      enable = true;
      xkb = {
        layout = "za";
        variant = "";
      };
    };

    # ── Firmware updates ───────────────────────────────────────────────
    fwupd.enable = true;

    # ── Printing ───────────────────────────────────────────────────────
    printing.enable = true;

    # ── Audio (PipeWire) ───────────────────────────────────────────────
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # RealtimeKit — lets PipeWire acquire realtime scheduling
  security.rtkit.enable = true;
}
