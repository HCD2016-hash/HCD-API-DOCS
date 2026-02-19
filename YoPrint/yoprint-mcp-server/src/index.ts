import express, { Request, Response } from "express";
import dotenv from "dotenv";
import axios, { AxiosInstance } from "axios";

dotenv.config();

const app = express();
app.use(express.json());

// ---------------- YoPrint HTTP client setup ---------------- //

const baseUrl = process.env.YOPRINT_BASE_URL || "https://secure.yoprint.com";
const teamSlug = process.env.YOPRINT_TEAM_SLUG || "hub-city-design-inc";
const apiKey = process.env.YOPRINT_API_KEY;

if (!teamSlug) throw new Error("YOPRINT_TEAM_SLUG is not set in env");
if (!apiKey) throw new Error("YOPRINT_API_KEY is not set in env");

const http: AxiosInstance = axios.create({
  baseURL: baseUrl,
  headers: {
    Authorization: apiKey, // ✅ YoPrint expects the key directly
    "Content-Type": "application/json",
    Accept: "application/json",
  },
});

// ---------------- Health endpoints ---------------- //

app.get("/", (_req: Request, res: Response) => {
  res.send("YoPrint MCP Server Running");
});

app.get("/health", (_req: Request, res: Response) => {
  res.status(200).send("OK");
});

// ---------------- YoPrint proxy endpoint for Custom GPT ---------------- //

/**
 * POST /yo
 * Body:
 * {
 *   "method": "GET" | "POST" | "PUT" | "PATCH" | "DELETE",
 *   "path": string,        // e.g. "/v2/api/store/{team_slug}/sales_order/filter"
 *   "query"?: object,      // query string params
 *   "body"?: any           // JSON body for non-GET
 * }
 */
app.post("/yo", async (req: Request, res: Response) => {
  try {
    const { method, path: pathTemplate, query = {}, body = undefined } = req.body || {};

    const allowedMethods = ["GET", "POST", "PUT", "PATCH", "DELETE"];
    if (!method || !allowedMethods.includes(method.toUpperCase())) {
      return res.status(400).json({ success: false, error: "Invalid or missing method" });
    }

    if (!pathTemplate || typeof pathTemplate !== "string") {
      return res.status(400).json({ success: false, error: "Invalid or missing path" });
    }

    // ✅ Replace {team_slug} placeholder
    const path = pathTemplate.replace("{team_slug}", teamSlug);

    // ✅ Perform the YoPrint API request
    const response = await http.request({
      method,
      url: path,
      params: query,
      data: method !== "GET" ? body : undefined,
    });

    // ✅ Add light debugging output to see where requests go
    console.log(`[YoPrint Proxy] ${method} ${path} → ${response.status}`);

    res.status(response.status).json({
      success: true,
      status: response.status,
      data: response.data,
    });
  } catch (error: any) {
    const status = error.response?.status || 500;
    const message = error.response?.data || error.message;

    console.error("[YoPrint Proxy Error]", status, message);

    res.status(status).json({
      success: false,
      status,
      error: message,
    });
  }
});

// ---------------- Start Server ---------------- //

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`✅ YoPrint MCP Server running on port ${port}`);
});
