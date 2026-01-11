# Missive REST API - Endpoints Reference

## Base URL
```
https://public.missiveapp.com/v1/
```

---

## Endpoint Index

| Category | Endpoints |
|----------|-----------|
| Analytics | Create report, Get report |
| Contacts | Create, Update, List, Get |
| Contact Books | List |
| Contact Groups | List |
| Conversations | List, Get, Messages, Drafts, Comments, Posts |
| Drafts | Create, Send, Delete |
| Messages | Create, Get by ID, Find by Message-ID |
| Organizations | List |
| Responses | Create, Update, Delete, List, Get |
| Posts | Create, Delete |
| Shared Labels | Create, Update, List |
| Teams | List, Create, Update |
| Users | List |
| Tasks | List, Get, Create, Update |
| Hooks (Webhooks) | Create, Delete |

---

## Analytics Endpoints

### Create Analytics Report
`POST /v1/analytics/reports`

```json
{
  "reports": {
    "organization": "0d9bab85-a74f-4ece-9142-0f9b9f36ff92",
    "start": 1691812800,
    "end": 1692371867,
    "time_zone": "America/Montreal"
  }
}
```

**Optional Filters:**
- `teams`: Array of team IDs
- `users`: Array of user IDs
- `accounts`: Array of account IDs
- `account_types`: `["email", "sms", "whatsapp", "messenger", "instagram", "live_chat", "custom"]`
- `shared_labels`: Array of label IDs

**Response:**
```json
{
  "reports": {
    "id": "8441d4a0-a0ad-4f0f-aa9c-1cc881057e42"
  }
}
```

### Get Analytics Report
`GET /v1/analytics/reports/:id`

Reports complete within 2-3 seconds, max 30 seconds. Expire 60 seconds after completion.

---

## Contact Endpoints

### Create Contact(s)
`POST /v1/contacts`

```json
{
  "contacts": [{
    "contact_book": "551b8675-11e9-49c3-aac0-01fb8510d862",
    "first_name": "Philippe",
    "last_name": "Lehoux",
    "starred": true,
    "infos": [
      {"kind": "phone_number", "label": "mobile", "value": "+1 518 777-7777"},
      {"kind": "email", "label": "work", "value": "philippe@missiveapp.com"}
    ],
    "memberships": [
      {"group": {"kind": "group", "name": "VIPs"}},
      {"title": "CEO", "location": "Quebec City", "group": {"kind": "organization", "name": "Missive"}}
    ]
  }]
}
```

**Info Kinds:**
- `email`: address, label (home/work/personal/other)
- `phone_number`: value, label (main/mobile/home/work/etc)
- `twitter`: value (username), label
- `facebook`: name, label
- `physical_address`: street, city, region, postal_code, country, label
- `url`: value, label (homepage/profile/blog/etc)
- `custom`: value, custom_label

### Update Contact(s)
`PATCH /v1/contacts/id1,id2,id3,...`

### List Contacts
`GET /v1/contacts`

| Param | Default | Description |
|-------|---------|-------------|
| `contact_book` | required | Contact book ID |
| `order` | `last_name` | `last_name` or `last_modified` |
| `limit` | 50 | Max 200 |
| `offset` | 0 | Pagination offset |
| `modified_since` | null | Unix timestamp filter |
| `include_deleted` | false | Include deleted contacts |
| `search` | null | Search term |

### Get Contact
`GET /v1/contacts/:id`

---

## Contact Books Endpoints

### List Contact Books
`GET /v1/contact_books`

---

## Contact Groups Endpoints

### List Contact Groups
`GET /v1/contact_groups`

| Param | Description |
|-------|-------------|
| `contact_book` | Required - Contact book ID |
| `kind` | Required - `group` or `organization` |

---

## Conversation Endpoints

### List Conversations
`GET /v1/conversations`

**Filter Parameters (use one):**
- `inbox`: true (Inbox)
- `all`: true (All mailbox)
- `assigned`: true (Assigned to user)
- `closed`: true
- `snoozed`: true
- `flagged`: true (Starred)
- `trashed`: true
- `junked`: true (Spam)
- `drafts`: true
- `shared_label`: Label ID
- `team_inbox`: Team ID
- `team_closed`: Team ID
- `team_all`: Team ID

**Optional:**
- `organization`: Filter to organization
- `email`: Filter by email address
- `domain`: Filter by domain
- `limit`: Max 50
- `until`: Pagination timestamp (use `last_activity_at`)

### Get Conversation
`GET /v1/conversations/:id`

### List Conversation Messages
`GET /v1/conversations/:id/messages`

### List Conversation Drafts
`GET /v1/conversations/:id/drafts`

### List Conversation Comments
`GET /v1/conversations/:id/comments`

### List Conversation Posts
`GET /v1/conversations/:id/posts`

---

## Draft Endpoints

### Create Draft
`POST /v1/drafts`

```json
{
  "drafts": {
    "subject": "Hello",
    "body": "World!",
    "to_fields": [{"address": "paul@acme.com"}],
    "from_field": {"address": "philippe@missiveapp.com", "name": "Philippe"}
  }
}
```

**Key Fields:**

| Field | Type | Description |
|-------|------|-------------|
| `subject` | string | Email subject |
| `body` | HTML/text | Message body |
| `to_fields` | array | Recipients |
| `cc_fields` | array | CC recipients |
| `bcc_fields` | array | BCC recipients |
| `from_field` | object | Sender (email: address/name, SMS: phone_number) |
| `attachments` | array | `[{base64_data, filename}]` |
| `send` | boolean | Send immediately |
| `send_at` | timestamp | Schedule send |
| `auto_followup` | boolean | Cancel if reply received |
| `conversation` | string | Existing conversation ID |
| `references` | array | Message-ID references |
| `team` | string | Team ID |
| `organization` | string | Organization ID |
| `add_shared_labels` | array | Label IDs to add |
| `add_to_inbox` | boolean | Move to inbox |
| `close` | boolean | Close conversation |

**For SMS/WhatsApp:**
```json
{
  "drafts": {
    "from_field": {"phone_number": "+18005550199", "type": "whatsapp"},
    "to_fields": [{"phone_number": "+18005550100"}],
    "body": "Hello!",
    "account": "fbf74c47-d0a0-4d77-bf3c-2118025d8102"
  }
}
```

### Send Message
Use Create Draft with `"send": true`

### Delete Draft
`DELETE /v1/drafts/:id`

---

## Message Endpoints

### Create Message (Custom Channel)
`POST /v1/messages`

```json
{
  "messages": {
    "account": "fbf74c47-d0a0-4d77-bf3c-2118025d8102",
    "from_field": {"id": "12345", "username": "@philippe", "name": "Philippe"},
    "to_fields": [{"id": "54321", "username": "@missiveapp", "name": "Missive"}],
    "body": "Hello <b>world</b>!"
  }
}
```

### Get Message(s) by ID
`GET /v1/messages/:id` (comma-separated, up to 25)

### Find Messages by Message-ID
`GET /v1/messages?email_message_id=<Message-ID>`

---

## Post Endpoints

### Create Post
`POST /v1/posts`

```json
{
  "posts": {
    "conversation": "00f78fe9-f11a-4b4e-a502-67e6138d3b0f",
    "notification": {"title": "New Event", "body": "Details here"},
    "username": "MyApp",
    "username_icon": "https://example.com/icon.png",
    "text": "Main message content",
    "attachments": [{
      "author_name": "User Name",
      "color": "#2266ED",
      "text": "Attachment text",
      "timestamp": 1511540318,
      "fields": [{"title": "Status", "value": "Active", "short": true}]
    }]
  }
}
```

**Attachment Options:**
- `color`: HEX or "good"/"warning"/"danger"
- `pretext`, `text`, `markdown`
- `author_name`, `author_link`, `author_icon`
- `title`, `title_link`
- `image_url`
- `footer`, `footer_icon`
- `timestamp`
- `fields`: `[{title, value, short}]`

### Delete Post
`DELETE /v1/posts/:id`

---

## Responses Endpoints

### Create Response(s)
`POST /v1/responses`

```json
{
  "responses": [{
    "title": "Welcome email",
    "body": "<p>Welcome!</p>",
    "organization": "0d9bab85-a74f-4ece-9142-0f9b9f36ff92",
    "subject": "Welcome!",
    "external_id": "template-001",
    "external_source": "knowledge-base"
  }]
}
```

### Update Response(s)
`PATCH /v1/responses/id1,id2,...`

### Delete Response(s)
`DELETE /v1/responses/id1,id2,...`

### List Responses
`GET /v1/responses`

### Get Response
`GET /v1/responses/:id`

---

## Shared Label Endpoints

### Create Shared Label(s)
`POST /v1/shared_labels`

```json
{
  "shared_labels": [{
    "name": "Important",
    "color": "#430098",
    "organization": "0d9bab85-a74f-4ece-9142-0f9b9f36ff92",
    "parent": "optional-parent-label-id"
  }]
}
```

### Update Shared Label(s)
`PATCH /v1/shared_labels/id1,id2,...`

### List Shared Labels
`GET /v1/shared_labels`

---

## Team Endpoints

### List Teams
`GET /v1/teams`

### Create Team(s)
`POST /v1/teams`

```json
{
  "teams": [{
    "name": "Support",
    "organization": "0d9bab85-a74f-4ece-9142-0f9b9f36ff92",
    "active_members": ["user-id-1", "user-id-2"],
    "observers": ["user-id-3"]
  }]
}
```

### Update Team(s)
`PATCH /v1/teams/id1,id2,...`

---

## User Endpoints

### List Users
`GET /v1/users`

---

## Task Endpoints

### List Tasks
`GET /v1/tasks`

| Param | Description |
|-------|-------------|
| `organization` | Filter by org ID |
| `team` | Filter by team ID |
| `assignee` | Filter by user ID |
| `state` | `todo`, `in_progress`, `closed` |
| `type` | `task`, `conversation`, `all` |
| `conversation` | Parent conversation ID |

### Get Task
`GET /v1/tasks/:id`

### Create Task
`POST /v1/tasks`

```json
{
  "tasks": {
    "organization": "org-id",
    "title": "Review PR",
    "description": "Details here",
    "team": "team-id",
    "assignees": ["user-id"],
    "due_at": 1692371867
  }
}
```

### Update Task
`PATCH /v1/tasks/:id`

---

## Webhook Endpoints

### Create Webhook
`POST /v1/hooks`

```json
{
  "hooks": {
    "type": "new_comment",
    "url": "https://hooks.example.com/callback",
    "organization": "0d9bab85-a74f-4ece-9142-0f9b9f36ff92"
  }
}
```

### Delete Webhook
`DELETE /v1/hooks/:id`
