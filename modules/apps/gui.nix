{ inputs, ... }:
{
  apps.gui.homeManager =
  { pkgs, ... }:
  {
    home.packages = with pkgs; [
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
      libresprite
      signal-desktop
      libreoffice-qt
      fuzzel
      bisq2
      heroic
      discord
    ];
  };
}
