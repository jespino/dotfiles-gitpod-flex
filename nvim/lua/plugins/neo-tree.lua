return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files by default
        hide_dotfiles = false, -- Don't hide dotfiles
        hide_gitignored = false, -- Don't hide gitignored files
        hide_hidden = false, -- Don't hide hidden files on Windows
        never_show = {}, -- Optionally remove items from never_show list
      },
    },
  },
}
