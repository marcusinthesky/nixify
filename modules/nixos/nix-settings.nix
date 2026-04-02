# Nix daemon settings — flakes, store optimisation, garbage collection
_:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      trusted-users = [ "root" "@wheel" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };
}
