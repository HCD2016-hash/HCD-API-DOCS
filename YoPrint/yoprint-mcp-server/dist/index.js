"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const dotenv_1 = __importDefault(require("dotenv"));
const server_1 = require("@modelcontextprotocol/sdk/server");
dotenv_1.default.config();
const app = (0, express_1.default)();
app.use(express_1.default.json());
// ----- Initialize MCP server ----- //
const server = new server_1.Server({
    name: "yoprint-mcp-server",
    version: "1.0.0"
});
// Example tool/command – adjust the YoPrint call later if needed
server.tool("getOrder", {
    description: "Fetch an order from YoPrint by ID",
    inputSchema: {
        type: "object",
        properties: {
            orderId: { type: "string" }
        },
        required: ["orderId"]
    },
    // Explicit type so TS doesn't complain
    handler: async (input) => {
        const { orderId } = input;
        const apiKey = process.env.YOPRINT_API_KEY;
        const baseUrl = process.env.YOPRINT_BASE_URL;
        if (!apiKey || !baseUrl) {
            throw new Error("YOPRINT_API_KEY or YOPRINT_BASE_URL env vars are not set");
        }
        const url = `${baseUrl}/orders/${orderId}`;
        const resp = await fetch(url, {
            headers: {
                "X-API-KEY": apiKey
            }
        });
        if (!resp.ok) {
            throw new Error(`YoPrint API error: ${resp.status} ${resp.statusText}`);
        }
        const data = await resp.json();
        // MCP expects { content: ... }
        return { content: data };
    }
});
// ----- MCP HTTP endpoint ----- //
app.post("/mcp", async (req, res) => {
    try {
        const result = await server.handleRequest(req.body);
        res.json(result);
    }
    catch (err) {
        console.error("MCP error:", err);
        res.status(500).json({ error: "MCP server error" });
    }
});
// Health check
app.get("/", (_req, res) => {
    res.send("YoPrint MCP Server Running");
});
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`YoPrint MCP listening on port ${port}`);
});
