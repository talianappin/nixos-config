{ inputs, ... }:
{
  apps.gui.homeManager =
  { pkgs, ... }:
  {
    home.packages = with pkgs; [
      # vesktop
      librewolf
      pavucontrol
      nicotine-plus
      droidcam
      spotify
      nautilus #temp
      parsec-bin
      obsidian
      freecad
      qbittorrent
      discord
      libresprite
      signal-desktop
      libreoffice-qt
    ];
  };
}
