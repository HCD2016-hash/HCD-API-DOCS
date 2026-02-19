import axios, { AxiosInstance } from "axios";
import dotenv from "dotenv";

// Load environment variables from .env
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

// YoPrint uses the Authorization header with the API Access Token
// per their API docs.
const http: AxiosInstance = axios.create({
  baseURL: baseUrl,
  headers: {
    Authorization: apiKey,
    "Content-Type": "application/json",
    Accept: "application/json",
  },
});

export interface ActivityFeedParams {
  notSeenYet?: boolean;
  showArchive?: boolean;
  page?: number;
}

export async function getActivityFeed(params: ActivityFeedParams = {}) {
  const { notSeenYet = false, showArchive = false, page = 1 } = params;

  const response = await http.get(
    `/v1/api/store/${teamSlug}/current_user_feed`,
    {
      params: {
        not_seen_yet: notSeenYet ? 1 : 0,
        show_archive: showArchive ? 1 : 0,
        page,
      },
    }
  );

  return response.data;
}
