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

    # CARGO FMT

    {
      key = "<leader>f";
      mode = "n";

      action = ''
        <cmd>!cargo fmt<cr>
      '';
    }
  ];
}
