# homebrew-agenteval

Homebrew tap for [agenteval](https://github.com/lukasmetzler/agenteval) — lint, benchmark, and CI gate for AI coding instructions.

## Install

```bash
brew tap lukasmetzler/agenteval
brew install agenteval
```

## Update

```bash
brew upgrade agenteval
```

## Usage

```bash
agenteval lint              # Lint your CLAUDE.md, AGENTS.md, etc.
agenteval harvest --dry-run # See what AI commits are in your history
agenteval ci                # Run all tasks, fail on regressions
```

See the [full documentation](https://github.com/lukasmetzler/agenteval#readme) for all commands.
