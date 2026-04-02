# VS Code — Home Manager module
#
# Declarative VS Code with pre-installed extensions.
# The VS Code binary tracks nixpkgs-unstable for bleeding-edge updates.
# Extensions are pinned from stable nixpkgs — no marketplace drift.
{ pkgs, pkgs-unstable, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # ── Nix ──────────────────────────────────────────────────────────
      jnoortheen.nix-ide

      # ── Python ───────────────────────────────────────────────────────
      ms-python.python
      ms-toolsai.datawrangler
      ms-toolsai.jupyter

      # ── Go ───────────────────────────────────────────────────────────
      golang.go

      # ── Rust ─────────────────────────────────────────────────────────
      rust-lang.rust-analyzer

      # ── Lean ─────────────────────────────────────────────────────────
      leanprover.lean4

      # ── GitHub ───────────────────────────────────────────────────────
      github.copilot-chat
      github.vscode-pull-request-github
      github.vscode-github-actions

      # ── Remote development ───────────────────────────────────────────
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh

      # ── Docker / Kubernetes ──────────────────────────────────────────
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools

      # ── Infrastructure ───────────────────────────────────────────────
      hashicorp.terraform

      # ── Config formats ───────────────────────────────────────────────
      redhat.vscode-yaml
      redhat.vscode-xml
      tamasfe.even-better-toml
      esbenp.prettier-vscode

      # ── Utilities ────────────────────────────────────────────────────
      skellock.just
      streetsidesoftware.code-spell-checker
      yzhang.markdown-all-in-one
    ];
  };
}
