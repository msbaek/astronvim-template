return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
          ["<Tab>"] = { "<cmd>bn<cr>", desc = "Next tab" },
          ["<S-Tab>"] = { "<cmd>bp<cr>", desc = "Previous Tab" },
          ["<leader>a"] = { "ggVG", desc = "select all" },
          ["<leader>-"] = { "<cmd>split<cr>", desc = "vsplit" },
          ["<leader>|"] = { "<cmd>vsplit<cr>", desc = "split" },
          ["<C-s>"] = { "<cmd>w!<cr>", desc = "force save" },
          -- map("n", "<leader>fs", "<cmd>set ft=sql<cr>")
          -- map("n", "<leader>fd", "<cmd>set ft=markdown<cr>")
          -- map("n", "<leader>fj", "<cmd>set ft=java<cr>")
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
