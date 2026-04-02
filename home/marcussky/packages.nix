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

    # ── General ─────────────────────────────────────────────────────────
    quarto
    texliveFull
    inkscape
    gimp
    kdenlive # Video editing
    audacity # Audio editing
    obs-studio # Screen recording & streaming
    handbrake # Video transcoding

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
    tree
    htop
    fastfetch
    just
    wget
    curl
    unzip

    # ── Networking ─────────────────────────────────────────────────────
    openssh

    # ── Browsers ───────────────────────────────────────────────────────
    google-chrome

    # ── Nix tooling ────────────────────────────────────────────────────
    nixpkgs-fmt
    statix
    deadnix
  ];
}
