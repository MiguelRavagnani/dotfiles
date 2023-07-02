require("clangd_extensions").setup{
   server = {
      cmd = {
         "clangd",
         "-j=4",
         "--background-index",
         "--clang-tidy",
         "--fallback-style=llvm",
         "--all-scopes-completion",
         "--completion-style=detailed",
         "--header-insertion=iwyu",
         "--header-insertion-decorators",
         "--pch-storage=memory",
      },
      initialization_options = {
         fallback_flags = { "-std=c++17" },
      },
   },
}
