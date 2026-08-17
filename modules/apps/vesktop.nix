{ inputs, ... }:
{
  apps.vesktop.homeManager.programs.vesktop = 
  {
    enable = true;
    settings =
    {
      appBadge = true;
      arRPC = true;
      checkUpdates = true;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = true;
      tray = false;
      hardwareAcceleration = true;
      discordBranch = "stable";
    };
  };
}
