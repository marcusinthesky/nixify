# Docker — container runtime with weekly auto-prune
{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker_29;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };
}
