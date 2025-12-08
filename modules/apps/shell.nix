{
  apps.shell = {
    nixos.programs.fish.enable = true;
    homeManager =
      { pkgs, config, ... }:
      {
        programs = {
          fish.enable = true;

          zellij = {
            enable = true;
            enableFishIntegration = true;
            enableBashIntegration = true;
          };
 
          emacs = {
            enable = true;
            package = pkgs.emacs;
          };

          foot = {
            enable = true;
            settings = {
              main = {
                term = "xterm-256color";

                font = "Mononoki Nerd Font:size=16";
                dpi-aware = "yes";
              };
            };
          };
        };
      };
  };
}
