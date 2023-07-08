local function ismap(key_sequence, action, options)
    for _, mode in ipairs({ 'i', 's' }) do
        vim.api.nvim_set_keymap(mode, key_sequence, action, options)
    end
end

local options = { expr = true }

-- Expand
ismap('<C-j>', 'vsnip#expandable()  ? "<Plug>(vsnip-expand)" : "<C-j>"', options)

-- Expand or jump
ismap('<C-l>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"', options)

-- Jump forward
ismap('<Tab>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"', options)

-- Jump backward
ismap('<S-Tab>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"', options)
