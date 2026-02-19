"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getActivityFeed = getActivityFeed;
const axios_1 = __importDefault(require("axios"));
const dotenv_1 = __importDefault(require("dotenv"));
// Load environment variables from .env
dotenv_1.default.config();
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
const http = axios_1.default.create({
    baseURL: baseUrl,
    headers: {
        Authorization: apiKey,
        "Content-Type": "application/json",
        Accept: "application/json",
    },
});
async function getActivityFeed(params = {}) {
    const { notSeenYet = false, showArchive = false, page = 1 } = params;
    const response = await http.get(`/v1/api/store/${teamSlug}/current_user_feed`, {
        params: {
            not_seen_yet: notSeenYet ? 1 : 0,
            show_archive: showArchive ? 1 : 0,
            page,
        },
    });
    return response.data;
}
