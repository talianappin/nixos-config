{ inputs, ... }:
{
  apps.spicetify.homeManager =
  { pkgs, ... }:
  {
    imports = with inputs; [ inputs.spicetify-nix.homeManagerModules.spicetify ];
    programs.spicetify = {
      enable = true;
      theme =
      {
        name = "Comfy";
	src = inputs.self + "/themes/Comfy";
      };
      colorScheme = "Comfy";
    };
  };
}
