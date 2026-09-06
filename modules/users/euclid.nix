{ den, __findFile, ... }:
{
  den.aspects.euclid = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")

      <sys/secrets>

      <apps/shell>
      <apps/utils>
      <apps/tui>
    ];

    nixos =
      { config, ... }:
      {
        users.users.root.password = "root";
        users.users.euclid.password = "test";
      };
  };

  den.hosts.x86_64-linux.gyro.users.euclid = { };
}
