{ pkgs, ... }:

{
  programs.zed-editor-extensions = {
    enable = true;
    packages = with pkgs.zed-extensions; [
      biome
      codebook
      csv
      dockerfile
      git-firefly
      github-actions
      graphql
      html
      just
      latex
      mermaid
      nix
      pylsp
      sql
      terraform
      toml
      typst
      xml
    ];
  };
}
