# Ghostty Terminal — Home Manager module
#
# Modern GPU-accelerated terminal with JetBrainsMono Nerd Font.
# Fonts are provided system-wide by modules/nixos/fonts.nix.
_:

{
  programs.ghostty = {
    enable = true;
    settings = {
      # ── Font ───────────────────────────────────────────────────────
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;

      # ── Window ─────────────────────────────────────────────────────
      window-padding-x = 14;
      window-padding-y = 14;

      # ── Behaviour ──────────────────────────────────────────────────
      copy-on-select = "clipboard";
      confirm-close-surface = false;
    };
  };
}
