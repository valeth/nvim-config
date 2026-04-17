vim.api.nvim_create_autocmd({ "FileType" }, {
    callback = function(event)
        local ft = vim.bo[event.buf].filetype
        if vim.treesitter.language.add(ft) then
            vim.treesitter.start(event.buf, ft)
        end
    end
})
