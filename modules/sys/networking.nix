{ sys, inputs, den, lib, ... }:
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
      nixos =
      { config, pkgs, ... }:
      {
        sops.secrets.udpport = {};

        networking = {
          firewall.allowedUDPPorts = [ config.sops.secrets.udpport ];
          useNetworkd = true;
        };
        
        systemd.network = {
          enable = true;
          
          networks."wg-server" = {
            matchConfig.Name = "wg0";
            adress = [
              "fd31:bf08:57cb::7/128"
              "192.168.26.7/32"
            ];
          };
          
          netdevs."wg-server" = {
            netdevConfig = {
              Kind = "wireguard";
              Name = "wg0";
            };

            wireguardConfig = {
              ListenPort = config.sops.secrets.udpport;
              PrivateKeyFile = config.sops.secrets.wg-key.path;
              RouteTable = "main";
              FirewallMark = 42;
            };
            wireguardPeers = [
              {
              }
            ];
          };
        };
      };
    };
  };
}
