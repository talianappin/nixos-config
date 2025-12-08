{
  apps.tui.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        kew
        fastfetch
        yazi
        bottom
        astroterm
      ];
    };
}
