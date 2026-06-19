# VS Code — Home Manager module
#
# Declarative VS Code with pre-installed extensions.
# The VS Code binary tracks nixpkgs-unstable for bleeding-edge updates.
# Extensions are pinned from stable nixpkgs — no marketplace drift.
{ pkgs, pkgs-unstable, ... }:

let
  marketplaceExt = { publisher, name, version, sha256 }:
    pkgs-unstable.vscode-utils.buildVscodeMarketplaceExtension {
      mktplcRef = { inherit publisher name version sha256; };
    };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode;
    profiles.default.extensions = with pkgs-unstable.vscode-extensions; [
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

      # ── AI agents ───────────────────────────────────────────────────
      anthropic.claude-code

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

      # ── Typst ────────────────────────────────────────────────────────
      myriad-dreamin.tinymist

      # ── Utilities ────────────────────────────────────────────────────
      skellock.just
      streetsidesoftware.code-spell-checker
      yzhang.markdown-all-in-one

      # ── Marketplace (not yet in nixpkgs) ─────────────────────────────
      (marketplaceExt {
        publisher = "mathematic";
        name = "vscode-pdf";
        version = "0.1.11";
        sha256 = "0f9nkysxzmcifagqyq10rdblizr7zirryjngckj238ry0n564jc7";
      })
      (marketplaceExt {
        publisher = "openai";
        name = "chatgpt";
        version = "26.5616.32156";
        sha256 = "0ag8vabylw04h3wd45wd8mh8dc2h4b3pvcsikjahd6lviqrfq4lw";
      })
      (marketplaceExt {
        publisher = "sst-dev";
        name = "opencode";
        version = "0.0.13";
        sha256 = "14yrcyvx5s7i350104jdw88901nkvz86dqqw0klabswv6k559csc";
      })
      foam.foam-vscode
    ];
  };
}
