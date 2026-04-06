{ inputs, lib, ... }:
let
  colorJohnny = {
    slug = "johnny";
    name = "Johnny";
    author = "Talia Napierala (https://github.com/talianappin)";
    palette = {
      base00 = "fcf9f7"; # ++++   
      base01 = "edebe9"; # +++
      base02 = "dfdddb"; # ++
      base03 = "d1cfce"; # +
      base04 = "33373a"; # -
      base05 = "272c2f"; # --
      base06 = "1c2125"; # ---
      base07 = "11171b"; # ----
      base08 = "de69a5"; # johnny	pink
      base09 = "c6961a"; # johhny	orange
      base0A = "fed134"; # johnny	yellow
      base0B = "45be30"; # gyro	green
      base0C = "5a71a3"; # johnny	old blue	
      base0D = "50c0fc"; # johhny	blue
      base0E = "8261ba"; # gyro 	purple
      base0F = "F03D2D"; # johnny	red
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
