{ inputs, ... }:
{
  apps.gui.homeManager =
  { pkgs, ... }:
  {
    home.packages = with pkgs; [
      vesktop
      librewolf

    ];
  };
}
