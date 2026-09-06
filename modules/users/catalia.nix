{ den, __findFile, ... }:
{
  den.aspects.catalia = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")

      <sys/secrets>

      <apps/shell>
      <apps/utils>
      <apps/steam>
      <apps/gui>
      <apps/tui>
      <apps/games>
      <apps/nvim>
      <apps/yazi>
      <apps/spicetify>
      <apps/nixcord>
    ];

    nixos =
      { config, pkgs, ... }:
      {
        sops.secrets.catalia-password.neededForUsers = true;

        users.users.root.hashedPasswordFile = config.sops.secrets.catalia-password.path;
        users.users.catalia.hashedPasswordFile = config.sops.secrets.catalia-password.path;
      };
  };

  den.hosts.x86_64-linux.johnny.users.catalia = { };
}
