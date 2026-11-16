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
      #obsidian
      #freecad
      qbittorrent
      signal-desktop

      # --- libreoffice + spellcheck
      #libreoffice-qt
      #hunspell
      #hunspellDicts.pl_PL

      #bisq2
      heroic
      openrgb

      #file manager
      nautilus

      #source2viewer-cli
      #vpkedit
    ];
  };
}
