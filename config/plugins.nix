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
          "<Tab>" = ''
          cmp.mapping(function(callback)
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item({
                  behavior = cmp.SelectBehavior.Select
                })
              else
                cmp.confirm()
              end
            else
              callback()
            end
          end, {"i", "s", "c"})
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

        tsserver = {
          enable = true;
        };

        elixirls = {
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
