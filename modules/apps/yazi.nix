{ inputs, ... }:
{
  apps.yazi.homeManager.programs.yazi =
  { pkgs, ... }:
  {
    enable = true;
    enableFishIntegration = true;
    extraPackages = with pkgs;
    [
      glow
      ouch
      ffmpeg
      jq
      fd
      rg
      fzf
      resvg
    ];
  };
};
