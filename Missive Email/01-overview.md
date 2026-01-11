# Missive API Documentation - Overview

## Summary

Missive provides a comprehensive suite of developer tools designed to empower businesses to fully customize and enhance their experience.

## Developer Documentation Structure

| Section | Description |
|---------|-------------|
| **REST API** | Enrich conversations, automate tasks, manage contacts |
| **Webhooks** | Receive notifications for actions (emails, labels, etc.) |
| **UI/iFrame Integrations** | Customize interface with embedded apps |
| **Custom Channels** | Integrate custom message sources |

---

## REST API

The REST API allows you to enrich Missive conversations with content from various sources: commits from GitHub, transactions from Stripe, exceptions from Rollbar, events from your own servers.

### Key Capabilities
- Create and send drafts
- Synchronize contacts
- Manage conversations
- Create posts in conversations
- Handle tasks and assignments

### Example Use Cases
- GitHub and Heroku notifications merged in a single conversation
- Developer notifications automatically added to Missive via the API
- CRM integration for customer context
- Automated workflow triggers

---

## UI/iFrame Integrations

UI/iFrame integrations let you customize the interface and connect your own data or backend systems.

### Features
- Embed custom web apps in Missive sidebar
- React to conversation changes
- Access conversation and message data
- Create actions available in context menus
- Compose and send messages programmatically

### Example Use Cases
- Custom CRM integration showing customer data
- E-commerce platform order details
- Project management tool integration
- Custom workflow triggers

---

## Requirements

- **Plan Required**: Productive plan subscription
- **Authentication**: API token (Bearer token)
- **Protocol**: HTTPS required for all integrations

---

## Quick Links

| Resource | URL |
|----------|-----|
| REST API Getting Started | https://learn.missiveapp.com/api-documentation/getting-started |
| REST API Endpoints | https://learn.missiveapp.com/api-documentation/rest-endpoints |
| Webhooks Setup | https://learn.missiveapp.com/api-documentation/webhooks |
| iFrame Integrations | https://learn.missiveapp.com/api-documentation/iframe-integrations |
| JavaScript API | https://learn.missiveapp.com/api-documentation/iframe-integrations-api |
| Custom Channels | https://learn.missiveapp.com/custom-channels/overview |
