# Missive UI/iFrame Integrations - JavaScript API Reference

## Library Include

```html
<script src="https://integrations.missiveapp.com/missive.js"></script>
```

---

## App Methods

### reload()
Reloads the iframe.

### search(text)
Initiates a search in Missive.

```javascript
Missive.search('customer inquiry');
```

### alert(options)
Displays an error modal.

```javascript
Missive.alert({
  title: 'Error',
  message: 'Something went wrong',
  note: 'Please try again'
});
```

### navigate(options)
Navigate to a conversation.

```javascript
Missive.navigate({
  conversationId: 'conversation-uuid'
});
```

### on(event, callback, options)
Register event callback.

```javascript
Missive.on('change:conversations', (ids) => {
  console.log('Selected:', ids);
}, { retroactive: true });
```

### openForm(data)
Display a form popup. Returns Promise with field values.

```javascript
const result = await Missive.openForm({
  name: 'Create Task',
  fields: [
    { type: 'input', data: { name: 'title', placeholder: 'Task title', required: true }},
    { type: 'textarea', data: { name: 'description', rows: 4 }},
    { type: 'select', data: { name: 'priority', options: [
      { label: 'Low', value: 'low' },
      { label: 'High', value: 'high' }
    ]}},
    { type: 'calendar', data: { name: 'due_date', allow_all_day: true }}
  ],
  buttons: [
    { type: 'cancel', label: 'Cancel' },
    { type: 'submit', label: 'Create' }
  ]
});
```

**Field Types:**
- `input` (text/number/hidden)
- `textarea`
- `select` (with options array)
- `calendar` (date picker)
- `duration` (HH:MM)
- `progress` (steps)
- `html`

### closeForm()
Close the last open form popup.

### openSelf()
Open integration sidebar and select this integration.

### closeSelf()
Close integration sidebar.

### openURL(url)
Open URL in new tab.

```javascript
Missive.openURL('https://example.com');
```

### openContextMenu(data)
Display a context menu.

```javascript
Missive.openContextMenu({
  top: 100,
  left: 200,
  options: [
    { label: 'Option 1', callback: () => console.log('1') },
    { label: 'Option 2', callback: () => console.log('2') }
  ]
});
```

### setActions(actions)
Add actions to context menus.

```javascript
Missive.setActions([
  {
    label: 'Create Issue',
    emoji: ':bug:',
    contexts: ['conversation', 'message'],
    callback: (data) => {
      console.log(data.conversation || data.message);
    }
  }
]);
```

**Contexts:**
- `draft`, `conversations`, `conversation`, `message`
- `tel`, `comment`, `comment_box`, `swipe`, `command_bar`, `setting`

### setAsUtility()
Mark as utility (no sidebar display, actions only).

```javascript
Missive.setAsUtility();
```

### setPermissions(permissions)
Request media permissions (macOS).

```javascript
Missive.setPermissions({ camera: true, microphone: true });
```

### storeGet(key)
Retrieve stored data.

```javascript
const token = await Missive.storeGet('auth_token');
```

### storeSet(key, data)
Store data persistently.

```javascript
await Missive.storeSet('settings', { theme: 'dark' });
```

### respondToMessage(messageId, data)
Send commands to Command Bar.

```javascript
Missive.respondToMessage(messageId, {
  commands: [
    { id: 'cmd-1', iconUrl: 'https://...', label: 'Command', payload: {} }
  ]
});
```

### initiateCallback(url)
Start OAuth flow in new tab.

```javascript
const response = await Missive.initiateCallback('https://your-auth-endpoint');
const { access_token } = response;
```

---

## Fetch Methods

### fetchConversations(ids)
Get conversation details.

```javascript
const conversations = await Missive.fetchConversations(['conv-id-1', 'conv-id-2']);

// Returns:
{
  id: 'conv-id',
  subject: 'Subject line',
  color: '#ff0000',
  users: [/* User objects */],
  assignees: [/* User objects */],
  authors: [/* AddressField objects */],
  messages_count: 5,
  latest_message: {
    id: 'msg-id',
    subject: 'Re: Subject',
    preview: 'Message preview...',
    body: '<p>HTML body</p>',
    delivered_at: 1550698870,
    from_field: { address: 'email@example.com', name: 'Name' },
    to_fields: [/* AddressField objects */],
    cc_fields: [],
    bcc_fields: []
  },
  link: 'https://mail.missiveapp.com/#...'
}
```

### fetchMessages(ids)
Get message details.

```javascript
const messages = await Missive.fetchMessages(['msg-id-1']);
```

### fetchUsers()
Get all users.

```javascript
const users = await Missive.fetchUsers();

// Returns:
{
  id: 'user-id',
  email: 'user@example.com',
  first_name: 'John',
  last_name: 'Doe',
  avatar_url: 'https://...',
  me: true  // Current user
}
```

### fetchLabels()
Get all shared labels.

```javascript
const labels = await Missive.fetchLabels();
```

---

## Conversation Methods

### createConversation(options)
```javascript
Missive.createConversation({ select: true, count: 1 });
```

### archive()
Archive current conversation.

### trash()
Trash current conversation.

### moveToInbox()
Move to inbox.

### comment(body)
Add comment to current conversation.

```javascript
Missive.comment('This is a comment');
```

### createTask(body, completed)
Create task in conversation.

```javascript
Missive.createTask('Follow up with client', false);
```

### addLabels(labelIds)
```javascript
Missive.addLabels(['label-id-1', 'label-id-2']);
```

### removeLabels(labelIds)
```javascript
Missive.removeLabels(['label-id-1']);
```

### close()
Close conversation.

### reopen()
Reopen conversation.

### assign(userIds)
Assign users (empty array removes all).

```javascript
Missive.assign(['user-id-1']);
```

### addAssignees(userIds)
Add assignees.

### removeAssignees(userIds)
Remove assignees.

### setColor(color)
Set conversation color.

```javascript
Missive.setColor('#ff0000');
```

### setDescription(description)
Set conversation description.

### setSubject(subject)
Set conversation subject.

---

## Composer Methods

### compose(options)
Create new draft in new conversation.

```javascript
Missive.compose({
  deliver: false,  // true to send immediately
  mailto: {
    subject: 'Hello',
    body: 'Message body',
    to_fields: [{ address: 'user@example.com', name: 'User' }],
    cc_fields: [],
    bcc_fields: []
  }
});
```

### composeInConversation(options)
Create draft in current conversation (same params as compose).

### reply(options)
Reply to latest message.

```javascript
Missive.reply({
  deliver: false,
  mailto: { body: 'Thanks for your message!' }
});
```

### forward(options)
Forward latest message.

```javascript
Missive.forward({
  private: false,  // true for new private conversation
  deliver: false,
  mailto: { to_fields: [{ address: 'forward@example.com' }] }
});
```

### insertText(text)
Insert text in current composer.

### insertHtml(html)
Insert HTML in current composer.

---

## Helper Methods

### isToday(date)
```javascript
Missive.isToday(new Date()); // true
```

### isTomorrow(date)
### isPast(date)

### isInLessThan(date, options)
```javascript
Missive.isInLessThan(date, { hours: 2, minutes: 30 });
```

### getMonth(index, options)
```javascript
Missive.getMonth(0); // "January"
Missive.getMonth(0, { short: true }); // "Jan"
```

### getEmailAddresses(conversations)
Extract all email addresses from conversations.

### getPhoneNumbers(conversations)
Extract all phone numbers from conversations.

### formatTimestamp(timestamp, options)
```javascript
Missive.formatTimestamp(1550586350, {
  today: true,
  time: true,
  year: false
});
```

### formatDate(string, options)
### formatContact(contact)
### capitalize(string)
### classNames(classes)

```javascript
Missive.classNames({ active: true, disabled: false }); // "active"
```

### writeToClipboard(text)
Copy text to clipboard.

---

## Events

### main_action
User pressed integration shortcut.

```javascript
Missive.on('main_action', () => {
  console.log('Shortcut triggered');
});
```

### message_sent
User sent a message.

```javascript
Missive.on('message_sent', (id) => {
  Missive.fetchMessages([id]).then(msgs => console.log(msgs));
});
```

### change:conversations
Conversation selection changed.

```javascript
Missive.on('change:conversations', async (ids) => {
  const convos = await Missive.fetchConversations(ids);
  console.log('Selected:', convos);
}, { retroactive: true });
```

### change:users
Users list changed.

```javascript
Missive.on('change:users', async () => {
  const users = await Missive.fetchUsers();
});
```

---

## Object Types

### AddressField
```javascript
{ address: 'email@example.com', name: 'Display Name' }
```

### PhoneField
```javascript
{ phoneNumber: '+1234567890', name: 'Contact Name' }
```

### Option (for selects/menus)
```javascript
{
  label: 'Option Label',
  value: 'option_value',
  color: '#ff0000',  // optional
  disabled: false,   // optional
  callback: () => {} // optional (for context menus)
}
```

### Action
```javascript
{
  label: 'Action Name',
  emoji: ':rocket:',
  contexts: ['conversation', 'message'],
  swipe_id: 'unique-swipe-id',  // for swipe context
  swipe_color: '#aaa',
  callback: (data) => {}
}
```

### FormField
```javascript
{
  type: 'input',  // input, textarea, select, calendar, duration, progress, html
  scope: {},      // optional filter
  data: {
    name: 'field_name',
    value: 'default',
    placeholder: 'Enter value',
    required: true
  }
}
```

---

## Complete Example

```html
<!DOCTYPE html>
<html>
<head>
  <link href="https://integrations.missiveapp.com/missive.css" rel="stylesheet">
  <script src="https://integrations.missiveapp.com/missive.js"></script>
</head>
<body>
  <div class="m-panel">
    <div class="m-panel-header">
      <h2>My Integration</h2>
    </div>
    <div id="content" class="m-panel-body"></div>
  </div>

  <script>
    // Add custom action
    Missive.setActions([{
      label: 'Create Task',
      emoji: ':clipboard:',
      contexts: ['conversation'],
      callback: async (data) => {
        const result = await Missive.openForm({
          name: 'New Task',
          fields: [
            { type: 'input', data: { name: 'title', placeholder: 'Task title', required: true }}
          ],
          buttons: [
            { type: 'cancel', label: 'Cancel' },
            { type: 'submit', label: 'Create' }
          ]
        });
        
        if (result) {
          Missive.createTask(result.title, false);
        }
      }
    }]);

    // React to conversation changes
    Missive.on('change:conversations', async (ids) => {
      const content = document.getElementById('content');
      
      if (ids.length !== 1) {
        content.innerHTML = '<p class="m-text-muted">Select one conversation</p>';
        return;
      }

      const [conversation] = await Missive.fetchConversations(ids);
      const msg = conversation.latest_message;
      
      content.innerHTML = `
        <div class="m-card">
          <p><strong>From:</strong> ${msg?.from_field?.name || msg?.from_field?.address || 'Unknown'}</p>
          <p><strong>Subject:</strong> ${msg?.subject || 'No subject'}</p>
          <p><strong>Assignees:</strong> ${conversation.assignees?.map(a => a.name).join(', ') || 'None'}</p>
        </div>
      `;
    }, { retroactive: true });
  </script>
</body>
</html>
```
