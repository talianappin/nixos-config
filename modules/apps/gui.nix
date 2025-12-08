{ inputs, ... }:
{
  apps.gui.homeManager =
  { pkgs, ... }:
  {
    home.packages = with pkgs; [
      vesktop
      librewolf
      pavucontrol
      nicotine-plus
      droidcam
    ];
  };
}
