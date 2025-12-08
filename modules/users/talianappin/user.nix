{ den, __findFile, ... }:
{
  den.aspects.talianappin = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")

      <sys/theme/johnny>
#      <sys/dots/talianappin>

      <apps/shell>
      <apps/utils>
      <apps/steam>
      <apps/gui>
      <apps/tui>
    ];

    nixos =
      { config, ... }:
      {
        sops.secrets.talianappin-password.neededForUsers = true;

        users.users.root.hashedPasswordFile = config.sops.secrets.talianappin-password.path;
        users.users.talianappin.hashedPasswordFile = config.sops.secrets.talianappin-password.path;
      };
  };

  den.hosts.x86_64-linux.johnny.users.talianappin = { };
}
