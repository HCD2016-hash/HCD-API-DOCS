# Missive UI/iFrame Integrations - Getting Started

## Overview

You can develop custom integrations that are injected into Missive via an iframe. These integrations can interact with the Missive application through a JavaScript library.

---

## Quick Setup

### 1. Include the JavaScript Library

```html
<script src="https://integrations.missiveapp.com/missive.js"></script>
```

### 2. Include the Stylesheet (Optional)

Matches Missive themes automatically:

```html
<link href="https://integrations.missiveapp.com/missive.css" rel="stylesheet">
```

CSS Styleguide: https://integrations.missiveapp.com/styleguide/

---

## Development Requirements

### HTTPS Required

All custom integrations must use HTTPS.

**Local Development Tools:**
- [Caddy](https://caddyserver.com) - Local HTTPS server
- [Ngrok](https://ngrok.com) - Secure tunnel to localhost

---

## Security Options

### Option 1: In-iFrame Authentication (Most Secure)

Implement login within your iframe:

```javascript
// Check for stored auth token
const token = await Missive.storeGet('auth_token');

if (!token) {
  // Show login form
  showLoginForm();
} else {
  // Validate and show content
  validateAndShowContent(token);
}

// After successful login
async function onLoginSuccess(userToken) {
  await Missive.storeSet('auth_token', userToken);
  showContent();
}
```

**Notes:**
- Values stored per-integration, per-user
- Persists across page/app reloads
- Cleared on user logout

### Option 2: URL Token (Easiest)

Pass authentication token in URL:

```
https://your-app.com/missive-integration?auth=12345abcde
```

In Missive, enter URL with auth parameter. Your server validates before serving content.

### Option 3: OAuth via initiateCallback (Best for OAuth)

```javascript
async function authenticateWithOAuth() {
  try {
    // 1. Initiate OAuth flow (opens in new tab)
    const response = await Missive.initiateCallback('https://your-auth-endpoint');

    // 2. Response contains query params from OAuth redirect
    const { access_token } = response;

    // 3. Store token for future use
    await Missive.storeSet('oauth_token', access_token);
    
    showAuthenticatedContent();
  } catch (error) {
    console.error('OAuth failed:', error);
  }
}
```

**How it works:**
1. Missive opens auth URL in new browser tab
2. Adds `redirectTo` parameter to your URL
3. After OAuth, redirect to `redirectTo` with tokens as query params
4. Tab closes automatically
5. Integration receives data in response object

---

## Basic Integration Example

```html
<!DOCTYPE html>
<html>
<head>
  <link href="https://integrations.missiveapp.com/missive.css" rel="stylesheet">
  <script src="https://integrations.missiveapp.com/missive.js"></script>
</head>
<body>
  <div id="content">Loading...</div>

  <script>
    // React to conversation selection
    Missive.on('change:conversations', async (ids) => {
      if (ids.length !== 1) {
        document.getElementById('content').innerHTML = 'Select one conversation';
        return;
      }

      // Fetch conversation details
      const conversations = await Missive.fetchConversations(ids);
      const conversation = conversations[0];
      
      // Get sender info
      const message = conversation.latest_message;
      if (message && message.from_field) {
        document.getElementById('content').innerHTML = `
          <h3>From: ${message.from_field.name || message.from_field.address}</h3>
          <p>Subject: ${message.subject}</p>
        `;
      }
    });
  </script>
</body>
</html>
```

---

## Adding Your Integration to Missive

1. Go to **Settings** > **Integrations**
2. Click **Add Custom Integration**
3. Enter your HTTPS URL
4. Configure display options

---

## Integration Types

### Sidebar Integration (Default)
- Displays in right sidebar
- Reacts to conversation selection
- Full JavaScript API access

### Utility Integration
- No sidebar display
- Only provides actions in context menus
- Mark with `Missive.setAsUtility()`

```javascript
Missive.setAsUtility();

Missive.setActions([{
  label: 'My Custom Action',
  contexts: ['conversation'],
  callback: (data) => {
    // Handle action
    console.log(data.conversation);
  }
}]);
```

---

## Key Concepts

### Events
- `change:conversations` - User selects conversation(s)
- `change:users` - Users list changes
- `message_sent` - User sends a message
- `main_action` - User triggers integration shortcut

### Storage
- `Missive.storeGet(key)` - Retrieve stored data
- `Missive.storeSet(key, data)` - Store data persistently

### Actions
- Add custom actions to context menus
- Available in various contexts (conversation, message, composer, etc.)

---

## Permissions (macOS)

Request media permissions for camera/microphone:

```javascript
Missive.setPermissions({
  camera: true,
  microphone: true
});
```

---

## Next Steps

See the full **JavaScript API** documentation for:
- All available methods
- Conversation manipulation
- Composer control
- Form popups
- Helper functions
