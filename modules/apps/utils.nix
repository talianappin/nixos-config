{
  apps.utils.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        git
        age
        ripgrep
        coreutils
        fd
        clang
        slurp
        grim
        fzf
        imagemagick
        unzip
        protontricks
        protonup-qt
        steamtinkerlaunch
        p7zip
        rar
      ];
    };
}
