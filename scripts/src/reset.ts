#!/usr/bin/env node
import { chdirRoot, ensureDir, readJsonOr, writeJson } from "./util.ts";

chdirRoot();
await ensureDir("assets/.automatic/icon/");
await ensureDir("assets/.automatic/github/");
await ensureDir("assets/.automatic/solved/");
for (
  const file of [
    "icon/manifest.json",
    "github/pull.json",
    "github/issue.json",
    "solved/user.json",
  ]
) {
  const path = `assets/.automatic/${file}`;
  const data = await readJsonOr(path, {});
  await writeJson(path, data);
}
