# Packages — Home Manager module
#
# CLI tools, development toolchains, and Kubernetes utilities.
# Grouped by domain for easy scanning.
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # ── Kubernetes ─────────────────────────────────────────────────────
    kubectl
    minikube
    kubernetes-helm
    k9s

    # ── Containers ─────────────────────────────────────────────────────
    docker-compose

    # ── Cloud / Infra ──────────────────────────────────────────────────
    terraform

    # ── Python ─────────────────────────────────────────────────────────
    uv

    # ── JavaScript / TypeScript ─────────────────────────────────────────
    bun

    # ── General ─────────────────────────────────────────────────────────
    quarto
    typst
    texliveFull
    inkscape
    gimp
    audacity # Audio editing
    obs-studio # Screen recording & streaming
    handbrake # Video transcoding
    ffmpeg

    # ── Go ─────────────────────────────────────────────────────────────
    go
    gopls
    delve

    # ── Rust ───────────────────────────────────────────────────────────
    cargo
    rustc
    clippy
    rustfmt

    # ── Theorem proving ────────────────────────────────────────────────
    elan

    # ── Shell utilities ────────────────────────────────────────────────
    ripgrep
    fd
    bat
    eza
    jq
    yq
    tree
    htop
    fastfetch
    just
    wget
    curl
    unzip
    zip
    rsync
    tmux
    imagemagick
    lsof
    strace

    # ── Harneses ────────────────────────────────────────────────
    neovim
    zed-editor          # Zed editor
    code-cursor         # Cursor AI editor
    antigravity         # Antigravity agentic IDE
    opencode            # Terminal AI coding agent
    claude-code         # Anthropic terminal coding agent
    codex               # OpenAI terminal coding agent

    # ── Build toolchain ─────────────────────────────────────────────────
    gnumake
    gcc
    binutils

    # ── Networking ─────────────────────────────────────────────────────
    openssh

    # ── Browsers ───────────────────────────────────────────────────────
    google-chrome
    obsidian


    # ── Nix tooling ────────────────────────────────────────────────────
    nixpkgs-fmt
    statix
    deadnix
  ];
}
