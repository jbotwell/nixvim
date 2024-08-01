{pkgs, ...}: {
  keymaps = [
    {
      key = "<leader>du";
      action = "<cmd>lua require('dapui').toggle()<cr>";
      options.desc = "Toggle DAP UI";
    }
    {
      key = "<leader>dd";
      action = "<cmd>DapToggleBreakpoint<cr>";
      options.desc = "Toggle Breakpoint";
    }
    {
      key = "<leader>dc";
      action = "<cmd>DapContinue<cr>";
      options.desc = "Continue";
    }
    {
      key = "<leader>ds";
      action = "<cmd>DapStepOver<cr>";
      options.desc = "Step Over";
    }
    {
      key = "<leader>di";
      action = "<cmd>DapStepInto<cr>";
      options.desc = "Step Into";
    }
    {
      key = "<leader>do";
      action = "<cmd>DapStepOut<cr>";
      options.desc = "Step Out";
    }
    {
      key = "<leader>dt";
      action = "<cmd>DapTerminate<cr>";
      options.desc = "Terminate";
    }
  ];

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
        name = "launch - netcoredbg",
        request = "launch",
        env = {
          ASPNETCORE_ENVIRONMENT = "Development",
          AWS_PROFILE = "bdc-dev",
          CA_AWS_ENVIRONMENT = "dev"
        },
        program = function()
          return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
      },
    }
  '';

  extraPackages = with pkgs; [netcoredbg];
}
