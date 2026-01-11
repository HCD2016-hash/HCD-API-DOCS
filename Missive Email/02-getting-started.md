# Missive REST API - Getting Started

## Overview

The Missive API lets you enrich Missive conversations with content from anywhere on the web. You can also automate tasks such as creating and sending drafts, syncing contacts and more.

---

## API Basics

### Base URL
```
https://public.missiveapp.com/v1/:endpoint_name
```

### Methods
Standard HTTP methods: `GET`, `POST`, `PATCH`, `DELETE`

---

## Authentication

### Getting Your API Token

1. Open Missive preferences
2. Click the **API** tab
3. Click **Create a new token**

> **Note:** You need to be part of an organization subscribed to the **Productive plan** to generate API tokens.

### Using the Token

Transmit your token as a `Bearer` token in the `Authorization` HTTP header:

```http
POST /v1/drafts
Host: public.missiveapp.com
Authorization: Bearer missive_pat-26pApm_QTmyhLLbA...FwoFGmJ6x-6fikpQ
Content-Type: application/json
```

---

## Request Format

### POST Bodies

You must explicitly send POST requests with `Content-Type: application/json`:

```http
POST /v1/drafts
Host: public.missiveapp.com
Authorization: Bearer missive_pat-26pApm_QTmyhLLbA...FwoFGmJ6x-6fikpQ
Content-Type: application/json

{"drafts":{}}
```

---

## Response Format

### JSON Responses

All API responses are formatted as JSON, including errors.

### Status Codes

| Code | Meaning |
|------|---------|
| `200` | Successful request |
| `201` | Successful POST request (may have no body) |
| `429` | Rate limit exceeded |
| `4xx` | Client error |
| `5xx` | Server error |

Evaluate success based on HTTP status code, not response body.

---

## Resource IDs

To interact with resources via the API, you need resource IDs.

### Finding Resource IDs

1. Open **Settings** > **API**
2. Click the **Resource IDs** tab
3. Find IDs for labels, teams, users, etc.

### Common Resource Types

| Resource | Example Use |
|----------|-------------|
| Label ID | Apply label to conversation when creating a post |
| Team ID | Assign conversation to a team |
| User ID | Add users to conversation or assign tasks |
| Organization ID | Scope operations to an organization |
| Conversation ID | Reference existing conversation |
| Contact Book ID | Create contacts in specific book |

---

## Quick Example: Create a Draft

```bash
curl -X POST https://public.missiveapp.com/v1/drafts \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "drafts": {
      "subject": "Hello",
      "body": "World!",
      "to_fields": [{"address": "user@example.com"}],
      "from_field": {"address": "you@yourdomain.com"}
    }
  }'
```

---

## Key Concepts

### Conversations
- Container for messages, drafts, posts, comments
- Can be shared with teams/organizations
- Have assignees, labels, colors

### Posts
- Inject data into conversations from external sources
- Can include attachments, notifications
- Useful for integrations (GitHub, Stripe, etc.)

### Drafts
- Email, SMS, or WhatsApp messages
- Can be sent immediately or saved for editing
- Support attachments, scheduling, templates

### Contacts
- Stored in contact books
- Include email, phone, organization info
- Can be synced with external CRMs

---

## Next Steps

| Topic | Link |
|-------|------|
| Rate Limits | See rate-limits documentation |
| All Endpoints | See endpoints documentation |
| Webhooks | See webhooks documentation |
