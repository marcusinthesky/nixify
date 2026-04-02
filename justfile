# nixify — common tasks
#
# Usage: just <recipe>
# Requires: https://github.com/casey/just

# Default recipe — show available commands
default:
    @just --list

# ── System ─────────────────────────────────────────────────────────────

# Build and switch to the new configuration
switch:
    sudo nixos-rebuild switch --flake .#nixos

# Build without switching (dry run)
build:
    nixos-rebuild build --flake .#nixos

# Test the configuration (activate without adding to bootloader)
test:
    sudo nixos-rebuild test --flake .#nixos

# ── Quality Gates ──────────────────────────────────────────────────────

# Run ALL pre-commit hooks on every file
lint:
    nix develop -c pre-commit run --all-files

# Format all Nix files
fmt:
    nix fmt

# Run statix linter on all Nix files
statix:
    nix develop -c statix check .

# Detect unused Nix bindings
deadnix:
    nix develop -c deadnix .

# Scan the system closure for known CVEs (vulnix)
vulnix:
    nix develop -c vulnix --system

# Run nix flake check (sandboxed — used in CI)
check:
    nix flake check

# ── Flake Management ──────────────────────────────────────────────────

# Update all flake inputs (nixpkgs, home-manager, git-hooks)
update:
    nix flake update

# Update a single input
update-input input:
    nix flake update {{input}}

# Show the flake outputs
show:
    nix flake show

# Enter the development shell (hooks install automatically)
dev:
    nix develop

# ── Maintenance ────────────────────────────────────────────────────────

# Garbage collect old generations
gc:
    sudo nix-collect-garbage -d

# List system generations
generations:
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Diff against the running system
diff:
    nix store diff-closures /run/current-system $(nixos-rebuild build --flake .#nixos --print-out-paths 2>/dev/null)
