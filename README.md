# dotfiles

Personal configuration backups for my Linux development environment.

This repository keeps copies of application configuration files organized by application. Each application continues using its own configuration under `~/.config/`. Nothing in this repository is automatically installed, linked, or applied to the system.

## Structure

```text
dotfiles/
├── fish/
│   ├── config.fish
│   ├── auto-Hypr.fish
│   └── conf.d/
├── herdr/
│   └── config.toml
├── nvim/
│   ├── init.lua
│   ├── lazy-lock.json
│   ├── lua/
│   └── stylua.toml
├── opencode/
│   └── opencode.json
├── starship/
│   └── starship.toml
└── wezterm/
    └── .wezterm.lua
```

## Applications

- **Fish:** Shell configuration and custom functions.
- **Neovim:** Editor configuration, plugins, and formatting settings.
- **Starship:** Shell prompt configuration.
- **OpenCode:** AI coding assistant configuration.
- **Herdr:** Application configuration.
- **WezTerm:** Terminal emulator configuration.

## Usage

These files are maintained as backups. To apply a configuration, copy the corresponding files manually to the application's configuration directory after reviewing them.

No installation scripts or automatic symlinks are provided.
