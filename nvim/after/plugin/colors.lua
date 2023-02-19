require("catppuccin").setup({
    transparent_background = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter=true,
        notify = true,
        mini = false,
    },
})

function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
