# Docker — container runtime with weekly auto-prune
_:

{
  virtualisation.docker = {
    enable = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };
}
