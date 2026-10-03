# Stampdrill Homebrew tap

```bash
brew install stampdrill/tap/stampdrill
```

That installs the command under two names, `stamp` and `stampdrill`. They are the
same program, and it answers to whichever one you call it by.

```bash
stamp check .                 # parse everything, send nothing
stamp run api/orders.stamp    # send a request
stamp test . --tags smoke     # run test plans
stamp load .                  # run load tests against their thresholds
stamp mcp .                   # serve the workspace to an AI agent
```

| Formula | |
|---|---|
| `stampdrill` | API requests, assertions, test plans, load tests and MCP checks as plain text `.stamp` files. [stampdrill.com](https://stampdrill.com) |

The engine and the command line tool are open source under MPL-2.0 at
[stampdrill/stampdrill](https://github.com/stampdrill/stampdrill). The Mac app is a
separate, paid product.
