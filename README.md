# Cookiy Homebrew Tap

Homebrew tap for the macOS `cookiy` installer binary.

## Install

```bash
brew install cookiy-ai/tap/cookiy
```

The formula runs `cookiy -y` during `post_install`, which auto-configures Cookiy MCP for the default production environment.

## Switch Environments

```bash
cookiy dev -y
cookiy preview -y
cookiy staging -y
```
