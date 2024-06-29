{ ... }: {
  keymaps = [
    {
      key = "<leader>s";
      mode = "n";

      action = ''
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
      '';
    }

    {
      key = "<leader>pv";
      mode = "n";

      action = ''
        <cmd>Ex<cr>
      '';
    }

    {
      key = "<leader>f";
      mode = "n";

      action = ''
        <cmd>!cargo fmt<cr>
      '';
    }
  ];
}
