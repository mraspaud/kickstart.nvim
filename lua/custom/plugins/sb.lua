-- conceallevel for obsidian plugin
-- vim.opt.conceallevel = 2
-- vim.keymap.set("n", "<leader>nt", ":ObsidianToday<CR>", { desc = "[T]oday" })
-- vim.keymap.set("n", "<leader>nn", ":ObsidianNew ", { desc = "[N]ew" })
--
-- return {
--   "epwalsh/obsidian.nvim",
--   version = "*", -- recommended, use latest release instead of latest commit
--   lazy = false,
--   -- ft = "markdown",
--   -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
--   event = {
--     -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
--     -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
--     -- refer to `:h file-pattern` for more examples
--     "BufReadPre ~/Documents/Obsidian Vault/*.md",
--     "BufNewFile ~/Documents/Obsidian Vault/*.md",
--   },
--   dependencies = {
--     -- Required.
--     "nvim-lua/plenary.nvim",
--
--     -- see below for full list of optional dependencies 👇
--   },
--   opts = {
--     workspaces = {
--       {
--         name = "personal",
--         path = "~/Documents/Obsidian Vault",
--       },
--     },
--     daily_notes = {
--       folder = "2. Areas/Log",
--       template = "Daily Log.md",
--     },
--     templates = {
--       folder = "utils/templates",
--     },
--     notes_subdir = "0. Inbox",
--     new_notes_location = "notes_subdir",
--
--     note_id_func = function(title)
--       -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
--       -- In this case a note with the title 'My new note' will be given an ID that looks
--       -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
--       local suffix = ""
--       if title ~= nil then
--         -- If title is given, transform it into valid file name.
--         suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
--       else
--         -- If title is nil, just add 4 random uppercase letters to the suffix.
--         for _ = 1, 4 do
--           suffix = suffix .. string.char(math.random(65, 90))
--         end
--       end
--       return tostring(os.date "%Y%m%dT%H%M%S") .. "-" .. suffix
--     end,
--   },
-- }

local opts = { noremap = true, silent = false }

-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)

return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup {
      picker = "select",
    }
  end,
}
