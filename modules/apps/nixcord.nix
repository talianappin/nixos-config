{ inputs, ... }:
{
  apps.nixcord.homeManager =
  { pkgs, ... }:
  {
    imports = with inputs; [ inputs.nixcord.homeModules.nixcord ];
    programs.nixcord = {
      enable = true;
      discord.vencord.enable = true;
      vesktop.enable = true;
      config =
      {
        enabledThemes = [ "noctalia.theme.css" ];
      };
    };
  };
}
