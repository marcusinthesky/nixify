# System-level shell — zsh with oh-my-zsh, autosuggestions, syntax-highlighting
#
# This enables zsh as a valid login shell system-wide.
# Per-user shell config (aliases, initExtra) lives in home/*/shell.nix.
_:

{
  programs = {
    # ── Zsh ────────────────────────────────────────────────────────────
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      histSize = 50000;
      interactiveShellInit = ''
        # History substring search (up/down arrow)
        bindkey '^[[A' history-substring-search-up
        bindkey '^[[B' history-substring-search-down
      '';
      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
          "docker"
          "kubectl"
          "helm"
          "history-substring-search"
        ];
      };
    };

    # ── nix-ld — run dynamically linked binaries (uv, etc.) ──────────
    nix-ld.enable = true;

    # ── Firefox ───────────────────────────────────────────────────────
    firefox.enable = true;

    # ── Git (system-level) ────────────────────────────────────────────
    git.enable = true;
  };
}
