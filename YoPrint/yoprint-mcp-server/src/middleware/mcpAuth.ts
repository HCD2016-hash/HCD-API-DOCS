// src/middleware/mcpAuth.ts
import { Request, Response, NextFunction } from "express";

export function mcpAuth(req: Request, res: Response, next: NextFunction) {
  const secret = process.env.MCP_SECRET;
  if (!secret) {
    console.error("MCP_SECRET not set");
    return res.status(500).json({ error: "Server misconfigured" });
  }

  // 1) Authorization: Bearer <secret>
  const auth = (req.headers["authorization"] || "") as string;
  if (auth && auth.startsWith("Bearer ")) {
    const token = auth.slice(7).trim();
    if (token === secret) return next();
  }

  // 2) X-MCP-SECRET header
  const headerToken = (req.headers["x-mcp-secret"] || req.headers["X-MCP-SECRET"]) as string | undefined;
  if (headerToken && headerToken === secret) return next();

  // 3) ?token= fallback
  const qp = (req.query?.token as string | undefined) ?? undefined;
  if (qp && qp === secret) return next();

  return res.status(401).json({ error: "Unauthorized" });
}
