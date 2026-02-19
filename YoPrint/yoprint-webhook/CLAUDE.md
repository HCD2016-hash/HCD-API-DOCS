# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

YoPrint webhook receiver that processes incoming webhooks from YoPrint (order management system) and uses OpenAI to generate summaries and customer messages.

## Commands

```bash
# Start server
node server.js

# Start with environment variables
OPENAI_API_KEY=xxx YOPRINT_WEBHOOK_TOKEN=xxx PORT=3000 node server.js
```

## Environment Variables

- `OPENAI_API_KEY` - Required. OpenAI API key for GPT calls
- `YOPRINT_WEBHOOK_TOKEN` - Required. Shared secret for authenticating inbound webhooks (passed via `?token=` query param)
- `PORT` - Optional. Server port (default: 3000)

## Architecture

Single-file Express server (`server.js`) with two endpoints:

- `POST /yoprint/webhook?token=xxx` - Main webhook endpoint. Validates token, sends payload to OpenAI, returns structured JSON with `internal_summary`, `customer_message`, and `columns` for logging
- `GET /healthz` - Health check

Uses ES modules (`"type": "module"` in package.json).

## Key Dependencies

- Express 5.x (note: major version, some APIs differ from Express 4)
- OpenAI SDK - uses `client.responses.create()` with model `gpt-5`
