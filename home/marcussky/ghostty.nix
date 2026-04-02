# Ghostty Terminal — Home Manager module
#
# Window layout and behaviour only.
# Fonts, colours, and opacity are managed by Stylix.
_:

{
  programs.ghostty = {
    enable = true;
    settings = {
      # ── Window ─────────────────────────────────────────────────────
      window-padding-x = 14;
      window-padding-y = 14;

      # ── Behaviour ──────────────────────────────────────────────────
      copy-on-select = "clipboard";
      confirm-close-surface = false;
    };
  };
}
