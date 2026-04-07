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
	  niri.nixosModules.niri
        ];

        nixpkgs.config.allowUnfree = true;

        users.mutableUsers = false;

        i18n.defaultLocale = "en_US.UTF-8";
        time.timeZone = "Europe/Warsaw";

        system.stateVersion = "26.05";

        services.xserver.xkb = {
          layout = "pl";
          variant = "";
        };
        console.keyMap = "pl";
        
        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;
      };
    homeManager = {
      programs.home-manager.enable = true;
      home = {
        stateVersion = "26.05";
        sessionPath = [ "$HOME/.local/bin" ];
        sessionVariables.NIXPKGS_ALLOW_UNFREE = "1"; 
      };
    };  
    nix = {
      binaryCachePublicKeys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
      binaryCaches = [ "https://cache.iog.io" ];
      settings.experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
