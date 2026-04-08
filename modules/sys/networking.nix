{ sys, den, lib, ... }:
{
  sys.networking.provides = {
    base =
    { host, ... }:
    {
      nixos = {
        networking = {
          networkmanager.enable = true;
          firewall.enable = true;
        };
        services.mullvad-vpn.enable = true;
      };
      homeManager.programs.mullvad-vpn.enable = true;
    };
    server = den.lib.parametric {
      includes = [ sys.networking._.base ];
    };
  };
}
