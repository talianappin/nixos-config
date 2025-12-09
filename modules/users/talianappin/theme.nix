\{ inputs, lib, ... }:
let
  colorJohnny = {
    slug = "johnny";
    name = "Johnny";
    author = "Talia Napierala (https://github.com/talianappin)";
    palette = {
      base00 = "1F1F1F";
      base01 = "8d96b6";
      base02 = "8b8aa3";
      base03 = "a8b3d5";
      base04 = "ae9e7a";
      base05 = "6f878b";
      base06 = "bfd1e5";
      base07 = "fcf9f7";
      base08 = "587495";
      base09 = "b2b1d3";
      base0A = "e9d6b0";
      base0B = "b89152";
      base0C = "667b97";
      base0D = "8a91d4";
      base0E = "e2ca98";
      base0F = "e3e0d4";
    };
  };
in
{
  sys.theme._.johnny = {
    homeManager =
      { pkgs, ... }:
      {
        imports = [ inputs.nix-colors.homeManagerModule ];
        colorScheme = colorJohnny;
      };
  };
}
