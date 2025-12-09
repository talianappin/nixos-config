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
        services.tailscale.enable = true;
        systemd.services.tailscaled.wantedBy = lib.mkForce [];
      };
    };
    server = den.lib.parametric {
      includes = [ sys.networking.base ];
      nixos =
      { config, pkgs, ... }:
      {
        networking = {
          trustedInterfaces = [ "tailscale0" ];
          allowedUDPPorts = [ config.services.tailscale.port ];
        };
        systemd.services.tailscale-autoconnect = {
          description = "Automatic connection to Tailscale";

          after = [ "network-pre.target" "tailscale.service" ];
          wants = [ "network-pre.target" "tailscale.service" ];
          wantedBy = [ "multi-user.target" ];

          serviceConfig.Type = "oneshot";

          script = with pkgs; ''
            sleep 2
            ${tailscale}/bin/tailscale up --advertise-exit-node
          '';
        };
      };
    };
  };
}
