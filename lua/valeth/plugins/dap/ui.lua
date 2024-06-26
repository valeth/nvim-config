local spec = {
    "rcarriga/nvim-dap-ui",
    tag = "v3.9.1"
}

spec.dependencies = {
    "mfussenegger/nvim-dap",
}

spec.keys = {
    { "<Leader>dbg", "<cmd>DapContinue<CR>",         desc = "Continue DAP session" },
    { "<Leader>dbr", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
    { "<Leader>dso", "<cmd>DapStepOver<CR>",         desc = "Step over" },
    { "<Leader>dq",  "<cmd>DapTerminate<CR>",        desc = "Terminate DAP ssession" },
    {
        "<Leader>dt",
        function()
            require("dapui").toggle()
        end,
        desc = "Toggle DAP UI"
    }
}

spec.config = function()
    local dap = require("dap")
    local dap_ui = require("dapui")

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dap_ui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
        dap_ui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
        dap_ui.close()
    end

    local side = {
        position = "right",
        size = 40, -- columns
        elements = {
            {
                id = "stacks",
                size = 0.5,
            },
            {
                id = "breakpoints",
                size = 0.5,
            }
        },
    }

    local bottom = {
        position = "bottom",
        size = 10, -- rows
        elements = {
            {
                id = "scopes",
                size = 0.5,
            },
            {
                id = "repl",
                size = 0.5,
            }
        },
    }

    local opts = {
        layouts = { side, bottom },
    }

    dap_ui.setup(opts)
end

return spec
