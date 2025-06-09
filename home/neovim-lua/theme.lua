require("catppuccin").setup({
    flavour = "latte", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    integrations = {
        coc_nvim = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {"bold"},
        functions = {"bold"},
        keywords = {"italic"},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {"bold", "italic"},
        properties = {"italic"},
        types = {},
        operators = {},
    },
    custom_highlights = function(c)
        return {
            Structure = {fg = c.maroon},
            Constant = {fg = c.peach, style = {"italic", "bold"}},
            Identifier = {fg = c.lavender},
            Function = {fg = c.sky, style = {"italic"}},
            Boolean = {fg = c.peach, style = {"italic", "bold"}},
            Repeat = {fg = c.blue},
            Conditional = {fg = c.blue},
            Operator = {fg = c.rosewater},
            Statement = {fg = c.mauve, style = {"italic"}}
        }
    end
})
