# Missive Webhooks - Setup Guide

## Overview

Missive allows applications to be notified of certain actions (incoming emails, outgoing emails, label changes, etc.) via HTTP POST payloads sent to your URL.

> **Note:** Missive offers a native Zapier integration that can trigger on new contacts, new comments, new messages (email, SMS), etc.

---

## Requirements

- **Plan**: Admin or owner of organization on Productive plan
- **Protocol**: HTTPS required for webhook URLs

---

## Setup Process

### Creating a Webhook via Rules

1. Open **Missive Settings**
2. Go to **Rules** tab
3. Create a new rule
4. Select **Webhook** as the action
5. Enter your endpoint URL
6. Save (validation request sent immediately)

### Creating a Webhook via API

`POST /v1/hooks`

```json
{
  "hooks": {
    "type": "new_comment",
    "url": "https://hooks.example.com/callback",
    "organization": "0d9bab85-a74f-4ece-9142-0f9b9f36ff92",
    "is_task": true,
    "author": "user_id",
    "mention": "mentioned_user_id",
    "content_contains": "search text",
    "content_starts_with": "prefix",
    "content_ends_with": "suffix"
  }
}
```

---

## Webhook Payload Structure

```json
{
  "rule": {
    "id": "45408b30-aa3a-45n1-bh67-0a0cb8da9080",
    "description": "Notify team",
    "type": "label_change"
  },
  "conversation": {
    "id": "47a57b76-df42-4d8k-927x-80dbe5d87191",
    "subject": "Support Request",
    "latest_message_subject": "Re: Support Request",
    "organization": {
      "id": "93e5e5d5-11a2-4c9b-80b8-94f3c08068cf",
      "name": "Acme Corp"
    },
    "team": {
      "id": "2f618f9e-d3d4-4a01-b7d5-57124ab366b8",
      "name": "Support",
      "organization": "93e5e5d5-11a2-4c9b-80b8-94f3c08068cf"
    },
    "color": null,
    "assignees": [{
      "id": "6b52b6b9-9b51-46ad-a4e3-82ef3c45512c",
      "name": "John Doe",
      "email": "john@example.com",
      "assigned": true,
      "closed": false,
      "snoozed": false
    }],
    "users": [/* array of user objects */],
    "attachments_count": 0,
    "messages_count": 1,
    "authors": [{"name": "Customer", "address": "customer@example.com"}],
    "drafts_count": 0,
    "tasks_count": 0,
    "shared_labels": [{"id": "label-id", "name": "Priority"}],
    "app_url": "missive://...",
    "web_url": "https://mail.missiveapp.com/#..."
  },
  "latest_message": {
    "id": "86ef8bb8-269c-4959-a4f0-213db4e67844",
    "subject": "Re: Support Request",
    "preview": "Thanks for reaching out...",
    "type": "email",
    "delivered_at": 1548415828,
    "email_message_id": "<message-id@mail.net>",
    "from_field": {"name": "Customer", "address": "customer@example.com"},
    "to_fields": [{"address": "support@example.com"}],
    "cc_fields": [],
    "bcc_fields": [],
    "reply_to_fields": []
  }
}
```

---

## Error Handling & Retries

### Retry Policy

| Condition | Behavior |
|-----------|----------|
| Error status code | Retry up to 5 times |
| No response in 15 seconds | Retry up to 5 times |
| Retry window | 8 minutes total |
| 50+ consecutive failures | Rule auto-disabled |

### Best Practices

1. **Return 200 quickly** - Acknowledge receipt immediately
2. **Use background jobs** - Process heavy work asynchronously
3. **Handle retries** - Implement idempotency

```python
# Example: Quick acknowledgment
@app.route('/webhook', methods=['POST'])
def webhook():
    data = request.json
    # Queue for async processing
    background_queue.enqueue(process_webhook, data)
    return '', 200  # Return immediately
```

---

## Request Validation

### Signature Verification

If you set a validation secret in your rule action, all webhooks include `X-Hook-Signature` header.

**Signature Format:**
```
sha256=<HMAC-SHA256-hexdigest>
```

### Ruby Example

```ruby
# Compute signature
computed_signature = 'sha256=' + OpenSSL::HMAC.hexdigest(
  OpenSSL::Digest.new('sha256'),
  secret,           # Your validation secret
  request_body      # Full HTTP request body
)

# Compare securely (prevents timing attacks)
valid = Rack::Utils.secure_compare(x_hook_signature, computed_signature)
```

### Python Example

```python
import hmac
import hashlib

def verify_signature(secret, body, signature):
    computed = 'sha256=' + hmac.new(
        secret.encode(),
        body,
        hashlib.sha256
    ).hexdigest()
    return hmac.compare_digest(computed, signature)
```

### Node.js Example

```javascript
const crypto = require('crypto');

function verifySignature(secret, body, signature) {
    const computed = 'sha256=' + crypto
        .createHmac('sha256', secret)
        .update(body)
        .digest('hex');
    return crypto.timingSafeEqual(
        Buffer.from(computed),
        Buffer.from(signature)
    );
}
```

---

## Webhook Types

Common webhook trigger types:
- `new_message` - New email/SMS received
- `new_comment` - New comment added
- `label_change` - Label added/removed
- `assignment_change` - Assignee changed
- `conversation_opened` - Conversation opened
- `conversation_closed` - Conversation closed

---

## N8N Integration Example

```javascript
// N8N Webhook Node Configuration
{
  "httpMethod": "POST",
  "path": "missive-webhook",
  "responseMode": "onReceived",
  "responseCode": 200
}

// Access data in subsequent nodes
const conversation = $input.first().json.conversation;
const message = $input.first().json.latest_message;
const senderEmail = message.from_field.address;
```

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Webhook not triggering | Check rule conditions and filters |
| Rule auto-disabled | Check endpoint availability, fix errors, re-enable |
| Timeout errors | Process asynchronously, return 200 immediately |
| Signature mismatch | Verify secret, check body encoding |
| HTTPS errors | Ensure valid SSL certificate |
