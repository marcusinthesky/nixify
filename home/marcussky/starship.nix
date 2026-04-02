# Starship Prompt — Home Manager module
#
# Minimal, informative shell prompt with zsh integration.
# Shows: directory, git, nix-shell, python, node, k8s, command duration.
# Palette colours are injected by Stylix (base16).
_:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      format = builtins.concatStringsSep "" [
        "$directory"
        "$git_branch"
        "$git_status"
        "$nix_shell"
        "$python"
        "$nodejs"
        "$kubernetes"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };

      directory.truncation_length = 3;

      nix_shell = {
        format = "via [$symbol$state]($style) ";
        symbol = "❄️ ";
      };

      kubernetes.disabled = false;

      cmd_duration.min_time = 2000;
    };
  };
}
