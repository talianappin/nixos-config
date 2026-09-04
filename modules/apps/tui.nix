{
  apps.tui.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        kew
        fastfetch
        bottom
        astroterm
	cava
	bitwarden-cli
      ];
    };
}
