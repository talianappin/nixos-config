{
  apps.nvim.homeManager =
  { pkgs, ... }:
  {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
#      plugins = with pkgs.vimPlugins; [
#        nvim-lspconfig
#        nvim-treesitter.withAllGrammars
#        haskell-tools-nvim
#      ];
    };
  };
}
