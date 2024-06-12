{ ... }: {
  keymaps = [
    {
      key = "<leader>pv";
      mode = "n";

      action = ''
        <cmd>Ex<cmd>
      '';
    }
  ];
}
