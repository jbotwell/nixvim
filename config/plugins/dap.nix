{pkgs, ...}: {
  plugins.dap = {
    enable = true;
    adapters = {
      executables = {
        csharp = {
          command = "netcoredbg";
        };
      };
    };
    extensions = {
      dap-ui.enable = true;
    };
  };

  extraPackages = with pkgs; [netcoredbg];
}
