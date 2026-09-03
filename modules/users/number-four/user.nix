{ den, __findFile, ... }:
{
  den.aspects.number-four = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")

      <sys/secrets>

      <sys/theme/beaver>

      <apps/shell>
      <apps/utils>
      <apps/tui>
      <apps/nvim>
      <apps/yazi>
    ];

    nixos =
      { config, pkgs, ... }:
      {
        sops.secrets.rasp-passwd.neededForUsers = true;

        users.users.root.hashedPasswordFile = config.sops.secrets.rasp-passwd.path;
        users.users.number-four =
	{
	  hashedPasswordFile = config.sops.secrets.rasp-passwd.path;
	  openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID3jszEJAsQMpKXiH7s/RRaE2Bt1mWDBG5eb74UZZ/+D number-four" ];
        };
      };
  };

  den.hosts.aarch64-linux.mista.users.number-four = { };
}
