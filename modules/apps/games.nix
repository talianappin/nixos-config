{ inputs, ... }:
{
  apps.games.homeManager =
  { pkgs, ... }:
  {
    home.packages = with pkgs; [
      prismlauncher
      mangohud
      modrinth-app
    ];
  };
}
