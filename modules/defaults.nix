{ inputs, __findFile, ... }:
{
  den.default = {
    includes = [
      <den/home-manager>
      <den/define-user>
      ({ host, ... }: {${host.class}.networking.hostName = host.name;})
    ];
    nixos =
      { pkgs, lib, ... }:
      {
        imports = with inputs; [
          nixos-facter-modules.nixosModules.facter
        ];

        nixpkgs.config.allowUnfree = true;

        users.mutableUsers = false;

        i18n.defaultLocale = "en_US.UTF-8";
        time.timeZone = "Europe/Warsaw";

        system.stateVersion = "26.05";
      };
    homeManager = {
      programs.home-manager.enable = true;
      home = {
        stateVersion = "26.05";
        sessionPath = [ "$HOME/.local/bin" ];
        sessionVariables.NIXPKGS_ALLOW_UNFREE = "1"; 
      };
    };  
  };
}
