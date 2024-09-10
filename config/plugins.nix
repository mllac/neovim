{ pkgs, fenix, ... }: 

{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
    name = "vimwiki";

    src = pkgs.fetchFromGitHub {
      hash = "sha256-K82iqA5IBNUn/IfaDV5AJzcupffY+ye9SfSe10x3Pl0";
      rev = "v2024.01.24";
      owner = "vimwiki";
      repo = "vimwiki";
    };
    })
    (pkgs.vimUtils.buildVimPlugin {
      pname = "luau-lsp.nvim";
      version = "1.5.0";

      src = pkgs.fetchFromGitHub {
        hash = "sha256-mWMijz3LI+N/JmHV5m0yZrjWEOlGGb1SgL923YaCBA8=";
        repo = "luau-lsp.nvim";
        owner = "lopi-py";
        rev = "2b312aa";
      };
    }) 
    (pkgs.vimUtils.buildVimPlugin {
      pname = "plenary.nvim";
      version = "0.1.4-1";

      src = pkgs.fetchFromGitHub {
        hash = "sha256-s561tW5YaNQ8q7zRen1hYNrYIbh+KguBHOuSR29yzOY=";
        repo = "plenary.nvim";
        owner = "nvim-lua";
        rev = "f97a076";
      };
    }) 
  ];

  extraConfigLuaPost = ''
  require("luau-lsp").setup {
    platform = {
      type = "roblox",
    },
    types = {
      roblox_security_level = "PluginSecurity",
    },
    sourcemap = {
      rojo_project_file = "default.project.json",
      autogenerate = true,
      enabled = true,
    },
    fflags = {
      sync = true,
      override = {
        LuauTarjanChildLimit = 0,
      },
    },
  }
  '';

  plugins = {
    cmp = {
      enable = true;

      settings = {
        autoEnableSources = true;

        sources = [
         {name = "nvim_lsp";}
        ];

        mapping = {
          "jj" = ''
            cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})
          '';
          "kk" = ''
            cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})
          '';
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
          "<C-u>" = ''
            cmp.mapping.scroll_docs(-4)
          '';
          "<C-d>" = ''
            cmp.mapping.scroll_docs(4)
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

      keymaps = {
        diagnostic = {
          "]d" = "goto_next";
          "[d" = "goto_prev";
        };
      };

      servers = {
        rust-analyzer = {
          rustcPackage = fenix.packages."x86_64-linux".complete.toolchain;

          installCargo = true;
          installRustc = true;

          enable = true;
        };

        dockerls = {
          enable = true;
        };

        lua-ls = {
          enable = true;
        };

        yamlls = {
          enable = true;
        };

        tsserver = {
          enable = true;
        };

        elixirls = {
          enable = true;
        };

        cssls = {
          enable = true;
        };

        jsonls = {
          enable = true;
        };

        htmx = {
          enable = true;
        };

        html = {
          enable = true;
        };

        nixd = {
          enable = true;
        };
      };
    };
  };

  colorschemes = {
    catppuccin = {
      enable = true;
    };
  };
}
