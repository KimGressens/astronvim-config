return {
    "heilgar/nvim-http-client",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp", -- Optional but recommended for enhanced autocompletion
        "nvim-telescope/telescope.nvim", -- Optional for better environment selection
    },
    event = "VeryLazy",
    ft = { "http", "rest" },
    config = function()
        require("http_client").setup({
            -- Default configuration (works out of the box)
            default_env_file = '.env.json',
            request_timeout = 30000,
            split_direction = "right",
            create_keybindings = true,
            user_agent = "heilgar/nvim-http-client", -- Custom User-Agent header
            
            -- Profiling (timing metrics for requests)
            profiling = {
                enabled = true,
                show_in_response = true,
                detailed_metrics = true,
            },
            
            -- Default keybindings (can be customized)
            keybindings = {
                select_env_file = "<leader>jf",
                set_env = "<leader>je",
                run_request = "<leader>jr",
                stop_request = "<leader>jx",
                toggle_verbose = "<leader>jv",
                toggle_profiling = "<leader>jp",
                dry_run = "<leader>jd",
                copy_curl = "<leader>jc",
                save_response = "<leader>js",
                set_project_root = "<leader>jg",
                get_project_root = "<leader>jgg",
            },
        })
        
        -- Set up Telescope integration if available
        if pcall(require, "telescope") then
            require("telescope").load_extension("http_client")
        end
    end
}
