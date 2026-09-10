{ inputs, ... }:
{
  apps.gui.homeManager =
  { pkgs, ... }:
  {
    home.packages = with pkgs; [
      librewolf

      #audio, both for now
      pavucontrol
      helvum

      nicotine-plus
      droidcam
      obsidian
      freecad
      qbittorrent
      signal-desktop
      libreoffice-qt
      bisq2
      heroic
      openrgb
    ];
  };
}
