{
  apps.tui.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        kew
        fastfetch
        bottom
        astroterm
        gurk-rs
        neomutt
	cava
      ];
    };
}
