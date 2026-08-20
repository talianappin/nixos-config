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
      spotify
      nautilus #temp
      obsidian
      freecad
      qbittorrent
      signal-desktop
      libreoffice-qt
      fuzzel
      bisq2
      heroic
      discord
    ];
  };
}
