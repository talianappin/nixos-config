{
  apps.tui.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        kew
        zenith
        astroterm
	cava
	bitwarden-cli
	moji
	superfile
	htop
      ];
    };
}
