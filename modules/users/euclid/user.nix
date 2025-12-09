{ den, __findFile, ... }:
{
  den.aspects.euclid = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")

#      <sys/theme/johnny>
#      <sys/dots/talianappin>

      <apps/shell>
      <apps/utils>
      <apps/tui>
    ];

    nixos =
      { config, ... }:
      {
        sops.secrets.talianappin-password.neededForUsers = true;

        users.users.root.hashedPasswordFile = config.sops.secrets.talianappin-password.path;
        users.users.euclid.hashedPasswordFile = config.sops.secrets.talianappin-password.path;
      };
  };

  den.hosts.x86_64-linux.gyro.users.euclid = { };
}
