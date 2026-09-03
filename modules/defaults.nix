{ inputs, __findFile, den, ... }:
{
  den.default = {
    includes = [
      <den/define-user>
      <den/hostname>
    ];
    nixos =
      { pkgs, lib, ... }:
      {
        imports = with inputs; [
          nixos-facter-modules.nixosModules.facter
	  niri.nixosModules.niri
        ];

        nixpkgs =
	{
	  config = 
	  {
	    allowUnfree = true;
	    allowUnsupportedSystem = true;
	  };
	  overlays = [ inputs.millennium.overlays.default ];
	};

        users.mutableUsers = false;

        i18n.defaultLocale = "en_US.UTF-8";
        time.timeZone = "Europe/Warsaw";

        system.stateVersion = "26.05";

        services.xserver.xkb = {
          layout = "pl";
          variant = "prog";
        };
        console.keyMap = "pl";
        
        home-manager = {
	  useUserPackages = true;
          useGlobalPkgs = true;
	  backupFileExtension = "old";
	};

	nix = {
          settings = {
	    keep-outputs = true;
            keep-derivations = true;
	    auto-optimise-store = true;
	    experimental-features = [ "nix-command" "flakes" ];
	    extra-platforms = [ "aarch64-linux" ];
	  };
          package = pkgs.lixPackageSets.stable.lix;
        };
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
