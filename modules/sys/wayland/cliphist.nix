{
  sys.wayland._.cliphist.homeManager.services.cliphist =
  {
    enable = true;
    systemdTargets = ["config.wayland.systemd.target"];
    allowImages = true;
  };
}
