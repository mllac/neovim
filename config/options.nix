{ ... }: {
  globals.mapleader = " ";

  globalOpts = {
    relativenumber = true;
    termguicolors = true;
    
    # TAB // INDENT
    
    smartindent = true;
    ignorecase = true;
    smartcase = true;
    expandtab = true;
    softtabstop = 2;
    shiftwidth = 2;
    wrap = false;
    tabstop = 2;

    # LIST CHARS

    listchars = {
      precedes = "«";
      extends = "»";
      trail = "·";
      nbsp = "_";
      tab = "▸ ";
    };
  };
}
