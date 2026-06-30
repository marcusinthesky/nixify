# Packages — Home Manager module
#
# CLI tools, development toolchains, and Kubernetes utilities.
# Grouped by domain for easy scanning.
{ pkgs, pkgs-unstable, kilo-pkg, ... }:

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
  home.packages = (with pkgs; [
    # ── Kubernetes ─────────────────────────────────────────────────────
    kubectl          # K8s CLI
    minikube         # Local K8s cluster
    kubernetes-helm  # K8s package manager
    k9s              # K8s TUI
    kube-linter      # K8s manifest linter
    kustomize        # K8s manifest overlays
    skaffold         # K8s build/push/deploy pipeline
    ctlptl           # Declarative local cluster setup

    # ── Containers ─────────────────────────────────────────────────────
    docker-compose   # Multi-container Docker

    # ── Infrastructure ─────────────────────────────────────────────────
    terraform        # Infrastructure as code
    opentofu         # Open-source Terraform fork
    terragrunt       # Terraform/OpenTofu orchestrator
    tflint           # Terraform linter
    terraform-ls     # Terraform/HCL LSP

    # ── Build toolchain ────────────────────────────────────────────────
    gnumake          # Build automation
    gcc              # C/C++ compiler
    binutils         # Linker & tools
    just             # Command runner

    # ── Language servers ───────────────────────────────────────────────
    typescript-language-server  # TS/JS LSP
    nixd             # Nix LSP
    yaml-language-server        # YAML LSP
    marksman         # Markdown LSP
    tombi            # TOML LSP
    tinymist         # Typst LSP
    ty               # Python type checker & LSP
    lean4            # Lean 4 language + LSP

    # ── Go ─────────────────────────────────────────────────────────────
    go               # Go compiler
    gopls            # Go language server
    delve            # Go debugger

    # ── Rust ───────────────────────────────────────────────────────────
    cargo            # Rust package manager
    rustc            # Rust compiler
    clippy           # Rust linter
    rustfmt          # Rust formatter

    # ── Python ─────────────────────────────────────────────────────────
    uv               # Python package manager

    # ── JavaScript / TypeScript ────────────────────────────────────────
    bun              # JS runtime & bundler

    # ── Theorem proving ────────────────────────────────────────────────
    elan             # Lean toolchain manager

    # ── Nix tooling ────────────────────────────────────────────────────
    nixfmt-rfc-style # Official Nix formatter (RFC 166)
    nixpkgs-fmt      # Nix formatter
    statix           # Nix anti-pattern linter
    deadnix          # Unused Nix code detector

    # ── Editors & IDEs ─────────────────────────────────────────────────
    neovim           # Terminal editor
    zed-editor       # Zed editor
    pkgs-unstable.code-cursor      # Cursor AI editor
    pkgs-unstable.antigravity      # Antigravity agentic IDE
    pkgs-unstable.opencode         # Terminal AI coding agent
    pkgs-unstable.claude-code      # Anthropic terminal coding agent
    pkgs-unstable.codex            # OpenAI terminal coding agent
    pkgs-unstable.pi-coding-agent  # Pi coding agent
    superset-desktop               # Superset Desktop agentic workspace

    # ── Document prep ──────────────────────────────────────────────────
    quarto           # Scientific publishing
    typst            # Markup typesetter
    texliveFull      # LaTeX distribution

    # ── Media ──────────────────────────────────────────────────────────
    gimp             # Image editing
    inkscape         # Vector graphics
    audacity         # Audio editing
    obs-studio       # Screen recording & streaming
    handbrake        # Video transcoding
    ffmpeg           # Media processing

    # ── Text & file tools ──────────────────────────────────────────────
    ripgrep          # Fast grep
    fd               # Fast find
    bat              # Cat with syntax highlighting
    eza              # Modern ls
    jq               # JSON processor
    yq               # YAML processor
    tree             # Directory tree
    tmux             # Terminal multiplexer
    imagemagick      # Image manipulation

    # ── System tools ───────────────────────────────────────────────────
    htop             # Process monitor
    fastfetch        # System info
    lsof             # Open file inspector
    strace           # Syscall tracer

    # ── Networking ─────────────────────────────────────────────────────
    openssh          # SSH client
    wget             # HTTP downloader
    curl             # URL transfer
    rsync            # File sync

    # ── Archiving ──────────────────────────────────────────────────────
    unzip            # Archive extractor
    zip              # Archive creator

    # ── Desktop apps ───────────────────────────────────────────────────
    google-chrome    # Web browser
    obsidian         # Note-taking
  ]) ++ [
    # ── From extraSpecialArgs (not in nixpkgs) ────────────────────────
    kilo-pkg         # Kilo code terminal coding agent (upstream flake)
  ];
}
