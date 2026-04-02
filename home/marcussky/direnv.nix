# direnv — Home Manager module
#
# Automatic environment loading when entering a directory.
# nix-direnv caches nix develop environments for fast re-entry.
_:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
}
