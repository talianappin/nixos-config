{ inputs, ... }:
{
  sys.dots._.talianappin.nixos = {
    imports = [ inputs.hjem.nixosModules.default ];

    hjem.users.talianappin = {
      enable = true;
      user = "talianappin";
      directory = "/home/talianappin";
      clobberFiles = true;

      files = {
          ".config/niri/config.kdl".source = ./config/niri/config.kdl;
      };
    };
  };
}
