# btop — Home Manager module
#
# Terminal-based system monitor.
_:

{
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      vim_keys = true;
    };
  };
}
