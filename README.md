# dotfiles

Personal macOS dotfiles: zsh, tmux, WezTerm, and a LazyVim-based Neovim config.

## Contents

| File / directory      | Links to               | Purpose                          |
| ---------------------- | ----------------------- | --------------------------------- |
| `.zshrc`               | `~/.zshrc`               | zsh config: prompt, aliases, fzf/zoxide/thefuck integration |
| `.tmux.conf`           | `~/.tmux.conf`           | tmux config                       |
| `.wezterm.lua`         | `~/.wezterm.lua`         | WezTerm terminal config           |
| `.config/nvim`         | `~/.config/nvim`         | LazyVim-based Neovim config       |

Everything is symlinked (not copied) into `$HOME`, so edits under this repo take effect immediately and can be committed/pushed as usual.

## Setup on a new machine

```sh
git clone <this-repo-url> ~/git/dotfiles
cd ~/git/dotfiles
./setup.sh
```

`setup.sh` is idempotent — safe to re-run any time (e.g. after adding a new package). It will:

1. Install [Homebrew](https://brew.sh) if it isn't already present (may prompt for your password).
2. `brew install` the CLI tools the dotfiles depend on:
   - `tmux`, `starship`, `fzf`, `zoxide`, `thefuck`, `eza`, `fd`, `bat`, `lazygit`, `tlrc` (provides `tldr`), `neovim`, `ripgrep`
3. Clone [`fzf-git.sh`](https://github.com/junegunn/fzf-git.sh) to `~/fzf-git.sh` (git-aware fzf widgets sourced from `.zshrc`).
4. Symlink each file/directory above into `$HOME`. If a real file already exists at the destination (not already the correct symlink), it's backed up to `<name>.bak.<timestamp>` first rather than overwritten.

After it finishes, open a new terminal (or run `exec zsh`) to pick up everything. On its first launch, Neovim will automatically bootstrap its LazyVim plugins via `lazy.nvim`.

## Not automated

A few things referenced in `.zshrc` are personal/host-specific and intentionally left out of `setup.sh`:

- **nvm** (`$NVM_DIR`) — install per the [nvm docs](https://github.com/nvm-sh/nvm) if you need Node.
- **pyenv** — `brew install pyenv` if you need multiple Python versions.
- **Docker** — install Docker Desktop separately if you use the `dc*`/`docker compose` aliases.
- Work-specific `PATH` entries and `ssh-*` aliases (e.g. Sencha Cmd, internal hosts) — edit `.zshrc` directly if these no longer apply.
