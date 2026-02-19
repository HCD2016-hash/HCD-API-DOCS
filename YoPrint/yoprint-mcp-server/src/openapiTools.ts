import fs from "fs";
import path from "path";
import axios, { AxiosInstance } from "axios";
import dotenv from "dotenv";
import { z } from "zod";

// Load env
dotenv.config();

const baseUrl = process.env.YOPRINT_BASE_URL || "https://secure.yoprint.com";
const teamSlug = process.env.YOPRINT_TEAM_SLUG;
const apiKey = process.env.YOPRINT_API_KEY;

if (!teamSlug) {
  throw new Error("YOPRINT_TEAM_SLUG is not set in .env");
}

if (!apiKey) {
  throw new Error("YOPRINT_API_KEY is not set in .env");
}

// Basic axios client for YoPrint
const http: AxiosInstance = axios.create({
  baseURL: baseUrl,
  headers: {
    Authorization: apiKey,
    "Content-Type": "application/json",
    Accept: "application/json",
  },
});

// Load the OpenAPI spec from the project root
const openApiPath = path.join(process.cwd(), "yoprint-openapi.json");
const openApiRaw = fs.readFileSync(openApiPath, "utf8");
const openApi = JSON.parse(openApiRaw);

// Track which tool names we've already registered so we don't crash on duplicates
const registeredTools = new Set<string>();

/**
 * Register MCP tools for every YoPrint OpenAPI operation.
 *
 * Each tool name is "yoprint_<operationId>".
 * Inputs are generic but flexible:
 *  - query: query string parameters
 *  - pathParams: values for path params (except team_slug, which is auto-filled)
 *  - body: JSON body (for POST/PUT/PATCH)
 */
export function registerOpenApiTools(server: any) {
  const paths = openApi.paths || {};

  for (const [pathTemplate, methods] of Object.entries<any>(paths)) {
    for (const [method, operation] of Object.entries<any>(methods)) {
      const httpMethod = method.toLowerCase();

      if (!["get", "post", "put", "patch", "delete"].includes(httpMethod)) {
        continue;
      }

      const operationId: string =
        operation.operationId ||
        `${httpMethod}_${(pathTemplate as string).replace(/[\/{}]/g, "_")}`;

      const toolName = `yoprint_${operationId}`;

      // Avoid duplicate tool registration when multiple operations share the same operationId
      if (registeredTools.has(toolName)) {
        continue;
      }
      registeredTools.add(toolName);

      const title: string = operation.summary || toolName;
      const description: string =
        operation.description ||
        `YoPrint API call for ${httpMethod.toUpperCase()} ${pathTemplate}`;

      server.registerTool(
        toolName,
        {
          title,
          description,
          inputSchema: {
            query: z
              .record(z.any())
              .optional()
              .describe("Query string parameters for this operation."),
            pathParams: z
              .record(z.string())
              .optional()
              .describe(
                "Additional path parameters (except team_slug, which is auto-filled)."
              ),
            body: z
              .any()
              .optional()
              .describe("JSON request body for this operation."),
          },
        },
        async ({ query = {}, pathParams = {}, body = undefined }) => {
          // Build the URL by replacing {team_slug} and any other params
          let finalPath = pathTemplate as string;

          // Always auto-fill team_slug from env
          finalPath = finalPath.replace("{team_slug}", teamSlug as string);

          // Replace any other {param} with values from pathParams
          finalPath = finalPath.replace(/{([^}]+)}/g, (match, key) => {
            if (key === "team_slug") return teamSlug as string;
            const value = (pathParams as any)[key];
            if (value === undefined || value === null) {
              // leave placeholder unchanged if not provided
              return match;
            }
            return String(value);
          });

          const response = await http.request({
            method: httpMethod.toUpperCase(),
            url: finalPath,
            params: query,
            data: body,
          });

          const data = response.data;

          return {
            content: [
              {
                type: "text",
                text: JSON.stringify(data, null, 2),
              },
            ],
            structuredContent: data,
          };
        }
      );
    }
  }

  console.log("YoPrint OpenAPI tools registered from spec.");
}
