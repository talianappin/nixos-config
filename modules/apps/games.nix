{ inputs, ... }:
{
  apps.games.homeManager =
  { pkgs, ... }:
  {
    home.packages = with pkgs; [
      mangohud
      deadlock-mod-manager
      prismlauncher
    ];
  };
}
