{ ... }: {
  keymaps = [
    # EX

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
