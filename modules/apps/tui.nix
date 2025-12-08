{
  apps.utils.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        kew
        fastfetch
      ];
    };
}
