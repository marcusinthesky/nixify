# Packages — Home Manager module
#
# CLI tools, development toolchains, and Kubernetes utilities.
# Grouped by domain for easy scanning.
{ pkgs, pkgs-unstable, ... }:

let
  # Superset Desktop — agentic coding workspace (Electron AppImage).
  # Not in nixpkgs; wrapped from upstream release.
  # See: https://github.com/superset-sh/superset/releases
  superset-desktop = pkgs.appimageTools.wrapType2 {
    pname = "superset-desktop";
    version = "1.12.5";
    src = pkgs.fetchurl {
      url = "https://github.com/superset-sh/superset/releases/download/desktop-v1.12.5/superset-1.12.5-x86_64.AppImage";
      hash = "sha256-TMfY0q5AnBFUhpU62AkiXBDj1mXeRzIQyRZhiPErvNg=";
    };
  };
in
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
    zed-editor # Zed editor
    pkgs-unstable.code-cursor # Cursor AI editor (unstable for latest)
    pkgs-unstable.antigravity # Antigravity agentic IDE
    pkgs-unstable.opencode # Terminal AI coding agent
    pkgs-unstable.claude-code # Anthropic terminal coding agent
    pkgs-unstable.codex # OpenAI terminal coding agent
    pkgs-unstable.pi-coding-agent # Pi coding agent
    pkgs-unstable.kilocode-cli # Kilo code terminal coding agent
    superset-desktop # Superset Desktop agentic coding workspace


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
