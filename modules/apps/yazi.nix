{ inputs, ... }:
{
  apps.yazi.homeManager = 
  { pkgs, ... }:
  {
    programs.yazi =
    {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
