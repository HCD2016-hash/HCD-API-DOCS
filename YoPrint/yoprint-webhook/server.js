// server.js — FULL FILE

import express from "express";
import OpenAI from "openai";

const app = express();
app.use(express.json({ type: ["application/json", "application/*+json"] }));

// ===== Config =====
const client = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });
// Shared secret for inbound YoPrint webhooks (provided via URL query ?token=...):
const SHARED_TOKEN = process.env.YOPRINT_WEBHOOK_TOKEN || "";

// ===== Helper: build model input for ANY YoPrint event =====
function buildInputForEvent(evt, eventName) {
  return [
    {
      role: "user",
      content: [
        {
          type: "input_text",
          text:
`You are Hub City Design's ops assistant.
YoPrint webhook event: ${eventName ?? "unknown"}.

TASK:
1) internal_summary: concise bullet list of what changed (use fields present).
2) customer_message: 2–3 friendly sentences if this event should notify a customer (otherwise "N/A").
3) columns: flat key/value object for logging. Always include:
   - event_name
   - object_type (infer: order, quote, job, shipment, payment, etc. or null)
   - object_id (best guess from payload or null)
   - customer_name (if present, else null)
   - status_label and previous_status_label (if present, else null)
   - amount/total fields if this is a payment (else null)
   - order_id, job_id, shipment_id, quote_id if identifiable (else null)

Rules:
- Use null for any unknown/missing values.
- Do not include prices or internal IDs in the customer_message.
Return STRICT JSON: {"internal_summary": "...", "customer_message": "...", "columns": {...}}`
        },
        { type: "input_text", text: JSON.stringify(evt) }
      ]
    }
  ];
}

// ===== Routes =====
app.post("/yoprint/webhook", async (req, res) => {
  try {
    // 1) Verify shared secret from query string (?token=...)
    //    We intentionally use a simple shared token check for now. No token = 401.
    const token = req.query.token;
    if (!SHARED_TOKEN || token !== SHARED_TOKEN) {
      return res.status(401).json({ error: "Unauthorized" });
    }

    // 2) Basic payload + event name
    const evt = req.body;
    const eventName = req.headers["x-yoprint-event"] || evt?.event || null;

    if (!evt || Object.keys(evt).length === 0) {
      return res.status(400).json({ error: "Empty payload" });
    }

    // 3) Build model input & call OpenAI
    const input = buildInputForEvent(evt, eventName);
    const resp = await client.responses.create({
      model: "gpt-5",
      input
    });

    // 4) Output text from model (strict JSON text per our instructions)
    const out = resp.output_text || "";

    return res.status(200).json({
      ok: true,
      event: eventName,
      model_output: out
    });
  } catch (err) {
    console.error("[webhook error]", err);
    return res.status(500).json({ error: String(err) });
  }
});

app.get("/healthz", (_, res) => res.send("ok"));

// ===== Start =====
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Listening on port ${PORT}`));
