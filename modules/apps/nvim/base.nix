{ inputs, nvim, ... }:
{
  apps.nvim =
  {
    includes = with nvim; [ lsp ];

    homeManager =
    {
      imports = with inputs; [ nixvim.homeModules.nixvim ];
      home.shellAliases.v = "nvim";
      programs.nixvim = {
        enable = true;
        defaultEditor = true;
        nixpkgs.useGlobalPackages = true;
        viAlias = true;
        vimAlias = true;
      };
    };
  };
}
