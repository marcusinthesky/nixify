# Home Manager — marcussky
#
# Entrypoint that imports all per-concern modules.
# Each module is self-contained and can be toggled by removing the import.
_:

{
  imports = [
    ./ghostty.nix
    ./starship.nix
    ./git.nix
    ./shell.nix
    ./direnv.nix
    ./btop.nix
    ./vscode.nix
    ./packages.nix
  ];

  home.stateVersion = "25.11";
}
