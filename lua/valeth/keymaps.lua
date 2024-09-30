local maps = {
    { "n",               "<Leader><CR>", "<cmd>noh<CR>",        { desc = "Clear search highlighting" } },
    { "n",               "U",            "<cmd>redo<CR>",       { desc = "Redo the last action" } },
    { "n",               "Y",            "y$",                  { desc = "Yank until the end of the line" } },
    { { "n", "v", "i" }, "<C-s>",        "<cmd>w<CR>",          { desc = "Write current file" } },
    { "n",               "s",            "<NOP>" },

    -- Yank to clipboard
    { { "n", "v" },      "<Leader>y",    [["+y]],               { desc = "Yank to clipboard" } },
    { { "n", "v" },      "<Leader>Y",    [["+Y]],               { desc = "Yank line to clipboard" } },

    -- Move up and down visual lines for the few times I need wrapping
    { "n",               "j",            "gj" },
    { "n",               "k",            "gk" },

    { { "n", "v" },      "H",            "0",                   { desc = "Move to start of line" } },
    { { "n", "v" },      "L",            "$",                   { desc = "Move to end of line" } },

    { "i",               "jk",           "<ESC>l",              { desc = "Exit insert mode", silent = true } },

    { { "n", "v" },      "<F1>",         "q",                   { desc = "Record a macro" } },
    { { "i" },           "<F1>",         "<NOP>" },
    { { "n", "v" },      "q",            "<NOP>" },
    { { "n" },           "K",            "<NOP>" },

    { "v",               "J",            ":move '>+1<CR>gv=gv", { desc = "Move selected lines down" } },
    { "v",               "K",            ":move '<-2<CR>gv=gv", { desc = "Move selected lines up" } },

    { "n",               "J",            "mzJ`z",               { desc = "Join lines without moving the cursor" } },
    { "n",               "<C-p>",        "mzyyp`zj",            { desc = "Duplicate current line" } },
}

for _, m in pairs(maps) do
    vim.keymap.set(m[1], m[2], m[3], m[4])
end
