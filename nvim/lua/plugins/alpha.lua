return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set the header (You can put any text here)
      dashboard.section.header.val = {
        "                                ",
        "  ███╗   ██╗███████╗ ██████╗   ",
        "  ████╗  ██║██╔════╝██╔═══██╗  ",
        "  ██╔██╗ ██║█████╗  ██║   ██║  ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║  ",
        "  ██║ ╚████║███████╗╚██████╔╝  ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ",
        "                                ",
      }

      -- Define menu buttons
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("s", "  Settings", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "󰈆  Quit", ":qa<CR>"),

      }

      alpha.setup(dashboard.opts)
    end,
  },
}
