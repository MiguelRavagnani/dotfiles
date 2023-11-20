return {

    "christoomey/vim-tmux-navigator",

    keys = {

        {
            "<C-\\>",
            "<cmd>TmuxNavigatePrevious<cr>",
            desc = "Go to the previous pane",
            { silent = true },
        },

        {
            "<C-h>",
            "<cmd>TmuxNavigateLeft<cr>",
            desc = "Got to the left pane",
            { silent = true },
        },

        {
            "<C-j>",
            "<cmd>TmuxNavigateDown<cr>",
            desc = "Got to the down pane",
            { silent = true },
        },

        {
            "<C-k>",
            "<cmd>TmuxNavigateUp<cr>",
            desc = "Got to the up pane",
            { silent = true },
        },

        {
            "<C-l>",
            "<cmd>TmuxNavigateRight<cr>",
            desc = "Got to the right pane",
            { silent = true },
        },
    },
}
