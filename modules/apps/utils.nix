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
      ];
    };
}
