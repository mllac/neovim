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
  ];
}
