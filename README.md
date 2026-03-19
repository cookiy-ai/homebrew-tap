# Cookiy Homebrew Tap

Homebrew tap for the macOS `cookiy` installer binary.

## Install

```bash
brew install cookiy-ai/tap/cookiy
```

The formula runs `cookiy -y` during `post_install`, which bootstraps the default production environment automatically.

On supported clients, Cookiy installs a local skill copy first and then configures MCP.
On unsupported clients, it falls back to MCP-only setup.

## Switch Environments

```bash
cookiy --help
```
