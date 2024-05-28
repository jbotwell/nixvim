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
  };

  extraPackages = with pkgs; [netcoredbg];
}
