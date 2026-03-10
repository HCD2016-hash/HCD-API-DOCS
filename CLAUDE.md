# HCD-API-DOCS - Hub City Design API Documentation Monorepo

**Owner:** Dillon White / Hub City Design Inc.

---

## What This Is

Monorepo containing API documentation, scripts, integrations, and tools for all third-party services used by Hub City Design. Each service gets its own top-level folder.

## Repository Structure

| Folder | Service | What's Inside |
|--------|---------|---------------|
| `YoPrint/` | YoPrint (order management) | API scripts, MCP server, webhooks, Missive integration, Pythonista mobile scripts |
| `QuickBooks/` | QuickBooks (accounting) | TBD |
| `Square/` | Square (payments) | TBD |
| `Shopify/` | Shopify (e-commerce) | TBD |
| `Missive Email/` | Missive (email client) | TBD |
| `N8N/` | N8N (automation) | TBD |
| `Sanmar/` | SanMar (apparel supplier) | TBD |
| `JotForm/` | JotForm (forms) | TBD |
| `QUO/` | QUO/OpenPhone (business phone) | TBD |
| `Microsoft365/` | Microsoft 365 (email, files) | TBD |
| `Limitless/` | Limitless AI (audio logging) | TBD |
| `Zapier/` | Zapier (automation - migrating to N8N) | TBD |
| `Context7/` | Context7 | TBD |
| `TODOIST/` | Todoist | TBD |

## Git Workflow

- All version control happens at this root level
- **No nested `.git` folders** inside service folders
- Branch from `main` for feature work

## Per-Folder CLAUDE.md

Each service folder should have its own `CLAUDE.md` with service-specific guidance. Read the relevant one before working in that folder.

## Conventions

- PowerShell scripts use `$env:*_API_KEY` from the PowerShell profile
- Node.js projects use `.env` files (gitignored)
- API keys are never committed - use environment variables
