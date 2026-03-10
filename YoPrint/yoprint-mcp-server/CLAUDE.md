# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

YoPrint MCP proxy server - an Express app that accepts API requests and forwards them to the YoPrint API with proper authentication. Originally built as a Custom GPT integration, also usable as a generic YoPrint API proxy.

## Commands

```bash
# Install dependencies
npm install

# Build TypeScript
npm run build

# Start server
npm start

# Start with environment variables
YOPRINT_API_KEY=xxx YOPRINT_TEAM_SLUG=hub-city-design-inc PORT=3000 npm start
```

## Environment Variables

- `YOPRINT_API_KEY` - Required. YoPrint API key (no Bearer/Basic prefix)
- `YOPRINT_TEAM_SLUG` - Optional. Defaults to `hub-city-design-inc`
- `YOPRINT_BASE_URL` - Optional. Defaults to `https://secure.yoprint.com`
- `PORT` - Optional. Server port (default: 3000)

## Architecture

Single Express server (`src/index.ts`) with one proxy endpoint:

- `POST /yo` - Proxy endpoint. Accepts `{ method, path, query?, body? }`, replaces `{team_slug}` in path, forwards to YoPrint API, returns response.
- `GET /` - Server status
- `GET /health` - Health check

## Key Files

| File | Purpose |
|------|---------|
| `src/index.ts` | Main server - Express app with `/yo` proxy endpoint |
| `src/openapiTools.ts` | OpenAPI tooling utilities |
| `src/yoprintClient.ts` | YoPrint API client |
| `src/middleware/mcpAuth.ts` | Authentication middleware |
| `yoprint-openapi.json` | **Authoritative** OpenAPI spec for YoPrint API |
| `generated/` | Auto-generated TypeScript clients from OpenAPI spec |
| `tsconfig.json` | TypeScript config |

## OpenAPI Spec

`yoprint-openapi.json` is the **authoritative** OpenAPI spec for the entire YoPrint API. Do not create copies elsewhere. A secondary copy exists at `../yoprint-api-scripts/api-reference/openapi_yoprint.json` (may differ).

## Generated Code

The `generated/` folder contains auto-generated TypeScript service clients from the OpenAPI spec. Do not manually edit these files.

## Dependencies

- `@modelcontextprotocol/sdk` - MCP protocol SDK
- `axios` - HTTP client for YoPrint API calls
- `express` 5.x - Web server
- `dotenv` - Environment variable loading
- TypeScript for build
