# Zsh — Home Manager module (user-level)
#
# Per-user aliases, session variables, and initExtra.
# System-level zsh (oh-my-zsh, plugins) is in modules/nixos/shell.nix.
_:

{
  programs.zsh = {
    enable = true;

    # Aliases
    shellAliases = {
      ll = "eza -la --icons --git";
      la = "eza -a --icons";
      lt = "eza --tree --icons --level=2";
      cat = "bat";
      k = "kubectl";
      kns = "kubectl config set-context --current --namespace";
      dc = "docker compose";
      gs = "git status";
      gd = "git diff";
      gp = "git push";
      gl = "git pull";
    };

    sessionVariables = {
      EDITOR = "code --wait";
      DOCKER_BUILDKIT = "1";
    };

    initContent = ''
      # Load completions
      autoload -Uz compinit && compinit
    '';
  };
}
