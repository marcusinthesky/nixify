# Nix daemon settings — flakes, store optimisation, garbage collection
_:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      trusted-users = [ "root" "@wheel" ];

      # ── Binary cache mirrors ─────────────────────────────────────────
      substituters = [
        "https://cache.nixos.org"
        "https://nix-mirror.freetls.fastly.net" # Fastly CDN — global edge nodes
      ];

      # ── Download parallelism ─────────────────────────────────────────
      http-connections = 50; # max parallel HTTP connections (default: 25)
      max-substitution-jobs = 32; # max concurrent nar fetches  (default: 16)
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };
}
