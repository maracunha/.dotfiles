null-ls: require("null-ls.health").check()
========================================================================
  - OK: prettier: the command "prettier" is executable.
  ```bash  
    npm -g i eslint-cli
  ```
  - ERROR: black: the command "black" is not executable.
  - ERROR: stylua: the command "stylua" is not executable.
  - ERROR: shfmt: the command "shfmt" is not executable.
  - ERROR: shellcheck: the command "shellcheck" is not executable.
  - OK: eslint: the command "eslint" is executable.
  ```bash  
    npm -g i eslint-cli
  ```

  
nvim-treesitter: require("nvim-treesitter.health").check()
========================================================================
  - Error: `tree-sitter` 
  ```bash  
    npm -g i tree-sitter-cli
  ```

