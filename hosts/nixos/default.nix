# Host: nixos — Marcus's personal workstation
#
# Machine-specific configuration: boot, LUKS encryption, hostname,
# and hardware. Everything else is in shared modules.
{ pkgs, userName, userDescription, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # --------------------------------------------------------------------------
  # Boot & Encryption
  # --------------------------------------------------------------------------
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices."luks-60a07f23-65d2-4af8-b2ae-95378e57301d".device =
      "/dev/disk/by-uuid/60a07f23-65d2-4af8-b2ae-95378e57301d";
  };

  # --------------------------------------------------------------------------
  # Identity
  # --------------------------------------------------------------------------
  networking.hostName = "nixos";

  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_GB.UTF-8";

  # --------------------------------------------------------------------------
  # User account
  # --------------------------------------------------------------------------
  users.users.${userName} = {
    isNormalUser = true;
    description = userDescription;
    extraGroups = [
      "networkmanager"
      "wheel" # sudo
      "docker" # Docker without sudo
    ];
    shell = pkgs.zsh;
  };

  # --------------------------------------------------------------------------
  # Allow unfree packages (VS Code, Chrome, etc.)
  # --------------------------------------------------------------------------
  nixpkgs.config.allowUnfree = true;

  # --------------------------------------------------------------------------
  # State version — do not change after initial install
  # --------------------------------------------------------------------------
  system.stateVersion = "25.11";
}
