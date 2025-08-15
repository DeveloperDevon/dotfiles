return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { "<leader>cpc", "<cmd>CopilotChat<CR>", mode = "n", desc = "CopilotChat" },
      { "<leader>cps", "<cmd>CopilotChat<CR>", mode = "v", desc = "CopilotChat: With Selected Text" },
      { "<leader>cpt", "<cmd>CopilotChatToggle<CR>", mode = "n", desc = "CopilotChat: Toggle" },
      { "<leader>cpr", "<cmd>CopilotChatReset<CR>", mode = "n", desc = "CopilotChat: Reset" },
      { "<leader>cpe", "<cmd>CopilotChatExplain<CR>", mode = "v", desc = "CopilotChat: Explain Code" },
      { "<leader>cpr", "<cmd>CopilotChatReview<CR>", mode = "v", desc = "CopilotChat: Review Code" },
      { "<leader>cpf", "<cmd>CopilotChatFix<CR>", mode = "v", desc = "CopilotChat: Fix Code" },
      { "<leader>cpo", "<cmd>CopilotChatOptimize<CR>", mode = "v", desc = "CopilotChat: Optimize Code" },
      { "<leader>cpd", "<cmd>CopilotChatDocs<CR>", mode = "v", desc = "CopilotChat: Generate Docs For Selection" },
      { "<leader>cpg", "<cmd>CopilotChatCommit<CR>", mode = "n", desc = "CopilotChat: Generate Commit Message" },
      { "<leader>cpt", "<cmd>CopilotChatTests<CR>", mode = "v", desc = "CopilotChat: Generate Tests" },
      { "<leader>cpp", "<cmd>CopilotChatPrompts<CR>", mode = "v", desc = "CopilotChat: Prompts" },
      { "<leader>cpm", "<cmd>CopilotChatModels<CR>", mode = "n", desc = "CopilotChat: Models" },
    },
  },
}
