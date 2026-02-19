# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

QUO is an API documentation repository for OpenPhone's communication platform (also known as "Quo"). This is a **documentation-only project** containing technical reference materials for the OpenPhone REST API—there is no source code, build system, or test suite.

## Repository Context

This folder is part of a larger documentation collection at `HCD-API-DOCS/` containing API docs for multiple third-party services used by Hub City Design (YoPrint, Missive, QuickBooks, Shopify, etc.).

## Documentation Format

- **Format:** Markdown with MDX components
- **Components used:** `<CardGroup>`, `<Card>`, `<Steps>`, `<Step>`, `<Note>`, `<Warning>`, `<Tip>`, `<AccordionGroup>`, `<Accordion>`
- **Likely platform:** Mintlify or similar modern documentation generator

## API Reference Summary

| Property | Value |
|----------|-------|
| Base URL | `https://api.openphone.com/v1/` |
| Auth | API Key via `Authorization` header (no Bearer prefix) |
| Rate Limit | 10 requests/second per API key |
| Response Format | JSON |
| Current Version | 1.2.0 |

## File Structure

| File | Purpose |
|------|---------|
| `introduction.md` | API overview, features, getting started |
| `authentication.md` | API key generation and security practices |
| `send-your-first-message.md` | Quick start with curl examples |
| `changelog.md` | Version history and release notes |
| `error-codes.md` | HTTP status codes reference |
| `rate-limits.md` | Rate limiting policy |
| `tech-partner.md` | Integration partner information |
| `partner-directory.md` | Partner directory resources |

## Key API Details

- Phone numbers must use **E.164 format** (e.g., `+18005551234`)
- US messaging requires **carrier registration** before production use
- API keys are workspace-specific and can be revoked immediately if compromised
- Supports: text messaging (US/Canada), phone number management, call/message history, contact management with custom fields

## When Editing Documentation

- Maintain consistent MDX component usage across files
- Keep curl examples functional and tested
- Update `changelog.md` when documenting API changes
- Use Warning callouts for critical requirements (carrier registration, rate limits)
