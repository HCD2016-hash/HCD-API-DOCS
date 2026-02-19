# YoPrint - Hub City Design API Documentation & Tools

**Parent Repo:** `HCD-API-DOCS` (all version control handled at root level - no nested `.git` folders)
**Last Updated:** February 19, 2026

---

## What This Is

Everything related to YoPrint (order management system) for Hub City Design. API scripts, integrations, webhook handling, and reference documentation - all consolidated into one folder.

---

## Folder Structure

| Folder | What It Does | Tech |
|--------|-------------|------|
| `yoprint-api-scripts/` | 186 PowerShell scripts covering ~100% of YoPrint API endpoints. Includes launcher, testing framework, and API cookbook. | PowerShell 7 |
| `yoprint-mcp-server/` | Claude Code MCP server for YoPrint API access. Has its own OpenAPI spec (`yoprint-openapi.json`). | TypeScript, Node.js |
| `yoprint-webhook/` | Express server that receives YoPrint webhooks and generates AI summaries via OpenAI. | Node.js, Express 5 |
| `Yoprint Pythonista API/` | Python ports of the PowerShell scripts for iOS mobile access via Pythonista 3. | Python (Pythonista) |
| `Missive-Yoprint/` | Missive sidebar integration - displays quotes, sales orders, shipments, and POs from YoPrint. Single-file HTML app. | HTML/CSS/JS |
| `Webhook Payload Samples/` | Reference payloads for every YoPrint webhook event type. Available in JSON, JSONL, Markdown, and plain text formats. | Documentation |

## Root Files

| File | Purpose |
|------|---------|
| `status-configs-yoprint.md` | YoPrint status configuration reference |

---

## YoPrint API Quick Reference

**Base URLs:**
- v1: `https://secure.yoprint.com/v1/api/store/hub-city-design-inc/...`
- v2: `https://secure.yoprint.com/v2/api/store/hub-city-design-inc/v2/...`

**Auth:** `Authorization: {api_key}` (no Bearer/Basic prefix)

**Key Gotchas:**
- `/services` returns 404 - use `/service_location` instead
- v2 endpoints reject scoped_id - use UUID (search first via `scoped_id_search`)
- Empty arrays in request body (`filters: []`, `sort: []`) cause 422 - omit them entirely
- `/setting/message_template` only works on v2
- `/v1/.../user` returns 404 - use `/v1/.../setting/user`

---

## OpenAPI Spec

The authoritative OpenAPI spec lives at `yoprint-mcp-server/yoprint-openapi.json`. A second copy exists at `yoprint-api-scripts/api-reference/openapi_yoprint.json` (may differ in version). Do not create additional copies.

---

## Node.js Projects

Both `yoprint-mcp-server/` and `yoprint-webhook/` have `.gitignore` files excluding `node_modules/`. After cloning, run `npm install` in each to restore dependencies.

---

## Per-Folder CLAUDE.md

Each subfolder has its own `CLAUDE.md` with project-specific guidance. Read the relevant one before working in that folder.
