{ inputs, lib, ... }:
let
  colorBeaver = {
    slug = "beaver";
    name = "beaver (ANSI)";
    author = "Talia Napierala (https://github.com/talianappin)";
    palette = {
      base00 = "000000"; # regular0	black
      base01 = "DE0249"; # regular1	red
      base02 = "03FB98"; # regular2	green
      base03 = "F1C11A"; # regular3	yellow
      base04 = "032D57"; # regualr4	blue
      base05 = "FE54B8"; # regualr5	magenta
      base06 = "00FFFE"; # regular6	cyan
      base07 = "CDCDCD"; # regular7	white

      base08 = "141414"; # bright0	black
      base09 = "FF347B"; # bright1	red
      base0A = "35FFDE"; # bright2	green
      base0B = "FFF34C"; # bright3	yellow
      base0C = "355F89"; # bright4	blue
      base0D = "FF86EA"; # bright5	magenta
      base0E = "14FFFF"; # bright6	cyan
      base0F = "FFFFFF"; # bright7	white
    };
  };
in
{
  sys.theme._.beaver = {
    homeManager =
      { pkgs, ... }:
      {
        imports = [ inputs.nix-colors.homeManagerModule ];
        colorScheme = colorBeaver;
      };
  };
}
