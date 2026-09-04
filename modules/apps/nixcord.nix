{ inputs, ... }:
{
  apps.nixcord.homeManager =
  { pkgs, ... }:
  {
    imports = with inputs; [ inputs.nixcord.homeModules.nixcord ];
    programs.nixcord = {
      enable = true;
      discord.enable = false;
      vesktop.enable = true;
      config =
      {
        enabledThemes = [ "noctalia.theme.css" ];
      };
    };
  };
}
