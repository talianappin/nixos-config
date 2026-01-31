{ inputs, ... }:
{
  apps.nvim.homeManager.programs.neovim =
  { pkgs, ... }:
  {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      haskell-nvim-tools
    ];
  };
}
