{
  nvim.lsp =
  {
    homeManager.programs.nixvim.plugins = {
      lspconfig.enable = true;
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      lsp = {
        enable = true;
        servers = {
          lua_ls.enable = true;
	  yamlls.enable = true;
	  nixd.enable = true;
        };
      };
    };
  };
}
