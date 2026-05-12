#!/usr/bin/env -S deno run --allow-read --allow-write --allow-run
import { chdirRoot, commandJson, ensureDir, writeJson } from "./util.ts";

chdirRoot();
await ensureDir("assets/.automatic/github/");

// pull

const pulls: Array<string> = await commandJson("typst", [
  "query",
  "resume.typ",
  "<github-pull>",
  "--field",
  "value",
]);
const pullData: Record<string, unknown> = {};
for (const pull of pulls) {
  console.log(`Loading PR ${pull}`);
  const {
    number,
    state,
    title,
    updatedAt: updatedAtString,
  } = await commandJson<{
    number: number;
    state: string;
    title: string;
    updatedAt: string;
  }>("gh", ["pr", "view", pull, "--json", "number,state,title,updatedAt"]);
  const updatedAt = new Date(updatedAtString);
  pullData[pull] = {
    number,
    state,
    title,
    nameWithOwner: /\/([^/]+\/[^/]+)\/pull\/\d+$/.exec(pull)![1],
    updatedAt: {
      year: updatedAt.getUTCFullYear(),
      month: updatedAt.getUTCMonth() + 1,
      day: updatedAt.getUTCDate(),
    },
  };
}
await writeJson("assets/.automatic/github/pull.json", pullData);

// issue

const issues: Array<string> = await commandJson("typst", [
  "query",
  "resume.typ",
  "<github-issue>",
  "--field",
  "value",
]);
const issueData: Record<string, unknown> = {};
for (const issue of issues) {
  console.log(`Loading Issue ${issue}`);
  const {
    number,
    state,
    title,
    updatedAt: updatedAtString,
  } = await commandJson<{
    number: number;
    state: string;
    title: string;
    updatedAt: string;
  }>("gh", ["issue", "view", issue, "--json", "number,state,title,updatedAt"]);
  const updatedAt = new Date(updatedAtString);
  issueData[issue] = {
    number,
    state,
    title,
    nameWithOwner: /\/([^/]+\/[^/]+)\/issues\/\d+$/.exec(issue)![1],
    updatedAt: {
      year: updatedAt.getUTCFullYear(),
      month: updatedAt.getUTCMonth() + 1,
      day: updatedAt.getUTCDate(),
    },
  };
}
await writeJson("assets/.automatic/github/issue.json", issueData);
