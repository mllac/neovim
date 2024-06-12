{ ... }: {
  globals.mapleader = " ";

  globalOpts = {
    relativenumber = true;
    termguicolors = true;
    
    # TAB // INDENT
    
    smartindent = true;
    signcolumn = "yes";
    ignorecase = true;
    swapfile = false;
    smartcase = true;
    expandtab = true;
    softtabstop = 2;
    shiftwidth = 2;
    wrap = false;
    tabstop = 2;
    list = true;

    # LIST CHARS

    listchars = {
      precedes = "«";
      extends = "»";
      space = "⋅";
      trail = "·";
      nbsp = "_";
      tab = "▸ ";
      eol = "↴";
    };
  };
}
