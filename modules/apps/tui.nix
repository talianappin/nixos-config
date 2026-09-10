{
  apps.tui.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        kew
        fastfetch
        zenith
        astroterm
	cava
	bitwarden-cli
	moji
      ];
    };
}
