{ ... }: {
  plugins = {
    cmp = {
      enable = true;

      settings = {
        autoEnableSources = true;

        sources = [
         {name = "nvim_lsp";}
        ];

        mapping = {
          "<CR>" = ''
            cmp.mapping(cmp.mapping.select_next_item(), {
                'i',
                's',
            })
          '';
          "<Tab>" = ''
            cmp.mapping.confirm({ select = true })
          '';
          "<C-Space>" = ''
            cmp.mapping.complete()
          '';
        };
      };
    };

    nvim-autopairs = {
      enable = true;
    };

    treesitter = {
      enable = true;
    }; 

    undotree = {
      enable = true;
    };

    harpoon = {
      enable = true;

      keymaps = {
        toggleQuickMenu = "<C-e>";
        addFile = "<Space>a";
      };
    };

    nix = {
      enable = true;
    };

    cmp-nvim-lsp = {
      enable = true;
    };

    lsp = {
      enable = true;

      servers = {
        rust-analyzer = {
          installCargo = true;
          installRustc = true;

          enable = true;
        };

        nixd = {
          enable = true;
        };
      };
    };
  };

  colorschemes = {
    kanagawa = {
      enable = true;
    };
  };
}
