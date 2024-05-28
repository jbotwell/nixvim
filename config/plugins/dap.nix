{pkgs, ...}: {
  plugins.dap = {
    enable = true;
    adapters = {
      executables = {
        coreclr = {
          command = "netcoredbg";
          args = ["--interpreter=vscode"];
        };
      };
    };
    extensions = {
      dap-ui.enable = true;
    };
  };

  extraConfigLuaPost = ''
    require("dap").configurations.cs = {
      {
        type = "coreclr",
        name = "Attach to process",
        request = "attach",
        processId = require('dap.utils').pick_process,
        env = {
          ASPNETCORE_ENVIRONMENT = 'Development',
        },
        cwd = vim.fn.getcwd(),
      },
    }
  '';

  extraPackages = with pkgs; [netcoredbg];
}
