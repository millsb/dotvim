# Neovim Keybinding Cheatsheet

Leader key: `Space`

## General

 | Key         | Mode | Action                      |
 |-------------|------|-----------------------------|
 | `fd`        | i    | Escape to normal mode       |
 | `<leader>w` | n    | Save file                   |
 | `<leader>a` | n    | Select all                  |
 | `<leader>h` | n    | Jump to line start          |
 | `<leader>l` | n    | Jump to line end            |
 | `cp`        | n/v  | Copy to system clipboard    |
 | `cv`        | n/v  | Paste from system clipboard |
 | `x`         | n/v  | Delete without yanking      |

## File Navigation

 | Key               | Mode | Action                    |
 |-------------------|------|---------------------------|
 | `<leader>e`       | n    | Toggle NvimTree           |
 | `<leader>tf`      | n    | Find current file in tree |
 | `<leader>ff`      | n    | Find files                |
 | `<leader>fg`      | n    | Live grep (search text)   |
 | `<leader>fs`      | n    | Fuzzy find in buffer      |
 | `<leader>?`       | n    | Recent files              |
 | `<leader><space>` | n    | List buffers              |

## Buffers

 | Key          | Mode | Action                     |
 |--------------|------|----------------------------|
 | `<leader>bq` | n    | Delete buffer              |
 | `<leader>bc` | n    | Close buffer (keep split)  |
 | `<leader>bl` | n    | Switch to alternate buffer |

## LSP & Code

 | Key          | Mode | Action                |
 |--------------|------|-----------------------|
 | `K`          | n    | Hover doc             |
 | `gd`         | n    | Peek definition       |
 | `gD`         | n    | Go to definition      |
 | `gi`         | n    | Go to implementation  |
 | `go`         | n    | Go to type definition |
 | `gr`         | n    | Show references       |
 | `gh`         | n    | LSP finder            |
 | `gn`         | n    | Rename symbol         |
 | `<leader>ca` | n/v  | Code action           |
 | `<leader>f`  | n/v  | Format code           |
 | `<C-k>`      | n    | Signature help        |

## Diagnostics

| Key          | Mode | Action                  |
|--------------|------|-------------------------|
| `gl`         | n    | Show line diagnostics   |
| `<leader>cd` | n    | Show cursor diagnostics |
| `<leader>cl` | n    | Show line diagnostics   |
| `<leader>fd` | n    | Search all diagnostics  |
| `[d` / `]d`  | n    | Prev/next diagnostic    |
| `[e` / `]e`  | n    | Prev/next diagnostic    |
| `[E` / `]E`  | n    | Prev/next error only    |
| `<leader>o`  | n    | Toggle outline          |

## Testing (Neotest)

| Key          | Mode | Action              |
|--------------|------|---------------------|
| `<leader>mr` | n    | Run test at cursor  |
| `<leader>ms` | n    | Stop test           |
| `<leader>mo` | n    | Open test output    |
| `<leader>mi` | n    | Toggle test summary |
| `<leader>mf` | n    | Run file tests      |

## Notes (Zk)

| Key          | Mode | Action       |
|--------------|------|--------------|
| `<leader>zn` | n    | New note     |
| `<leader>zo` | n    | Open notes   |
| `<leader>zt` | n    | Open by tags |
| `<leader>zf` | n/v  | Search notes |

## Terminal

| Key     | Mode | Action                |
|---------|------|-----------------------|
| `<C-g>` | all  | Toggle terminal       |
| `<A-d>` | n/t  | Toggle float terminal |

## Completion (Insert Mode)

| Key               | Action                     |
|-------------------|----------------------------|
| `<Tab>`           | Next item / expand snippet |
| `<S-Tab>`         | Previous item              |
| `<CR>`            | Confirm selection          |
| `<C-e>`           | Cancel                     |
| `<C-u>` / `<C-f>` | Scroll docs                |
| `<C-J>`           | Accept Copilot suggestion  |

## Comment.nvim

| Key   | Mode | Action                   |
|-------|------|--------------------------|
| `gc`  | v    | Toggle comment selection |
| `gcc` | n    | Toggle comment line      |

## Text Objects (TreeSitter)

| Key         | Action               |
|-------------|----------------------|
| `af` / `if` | Outer/inner function |
| `ac` / `ic` | Outer/inner class    |
