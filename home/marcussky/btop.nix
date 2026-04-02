# btop — Home Manager module
#
# Terminal-based system monitor.
# Colour theme is managed by Stylix.
_:

{
  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
    };
  };
}
