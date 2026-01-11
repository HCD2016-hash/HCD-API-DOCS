# Missive REST API - Rate Limits

## Overview

To maintain the performance and reliability of the API, Missive enforces rate limits on all API requests.

---

## Rate Limit Thresholds

| Limit | Value |
|-------|-------|
| Maximum concurrent requests | 5 at any given time |
| Requests per minute | 300 (≈ 5/second) |
| Requests per 15 minutes | 900 (≈ 1/second sustained) |

---

## Rate Limit Response

When a rate limit is reached, the API returns:

### HTTP Status
```
429 Too Many Requests
```

### Response Headers

| Header | Description |
|--------|-------------|
| `Retry-After` | Seconds to wait before retrying |
| `X-RateLimit-Limit` | Rate limit ceiling for current request |
| `X-RateLimit-Remaining` | Requests left in current window |
| `X-RateLimit-Reset` | UTC epoch time when limit resets |

---

## Usage Scenarios

### Scenario 1: Continuous Polling (24/7)

**Best Practice:** Send at most 1 request per second

```python
import time

while True:
    make_api_request()
    time.sleep(1)  # 1-second delay between requests
```

### Scenario 2: Periodic Bursts

**Best Practice:** Send at most 5 requests per second in bursts

| Pattern | Burst Size | Duration | Interval |
|---------|------------|----------|----------|
| Option A | 900 requests | 3 minutes | Every 15 minutes |
| Option B | 600 requests | 2 minutes | Every 10 minutes |
| Option C | 300 requests | 1 minute | Every 5 minutes |

---

## Implementation Tips

### Handling 429 Errors

```python
import time
import requests

def api_request_with_retry(url, headers, max_retries=3):
    for attempt in range(max_retries):
        response = requests.get(url, headers=headers)
        
        if response.status_code == 429:
            retry_after = int(response.headers.get('Retry-After', 5))
            print(f"Rate limited. Waiting {retry_after} seconds...")
            time.sleep(retry_after)
            continue
        
        return response
    
    raise Exception("Max retries exceeded")
```

### N8N / Automation Considerations

When building automations:
- Add delays between API calls
- Use batch operations when available
- Monitor `X-RateLimit-Remaining` header
- Implement exponential backoff for retries

---

## Rate Limit Quick Reference

| Use Case | Max Rate | Notes |
|----------|----------|-------|
| Real-time sync | 1 req/sec | Sustainable 24/7 |
| Batch processing | 5 req/sec | Burst up to 900 per 15 min |
| Concurrent calls | 5 max | Parallel request limit |
