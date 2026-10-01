#!/usr/bin/env node
import { cp, readFile } from "node:fs/promises";
import { chdirRoot, documents, ensureDir, writeJson } from "./util.ts";

chdirRoot();
await ensureDir("web/src/generated");
await ensureDir("web/public");
const print = JSON.parse(await readFile("www/print/manifest.json", "utf8"));
const content: Record<string, unknown> = {};
for (const source of documents) {
  const id = source.slice(0, -4);
  content[id] = {
    ...JSON.parse(await readFile(`assets/.automatic/web/${id}.json`, "utf8")),
    print: print[id],
  };
  await cp(`www/${print[id].pdf}`, `web/public/${print[id].pdf}`);
}
await writeJson("web/src/generated/site.json", content);
for (const [source, target] of [
  ["www/print", "print"],
  ["fonts", "fonts"],
  ["images", "images"],
  ["assets/.automatic/icon", "icons"],
]) {
  await cp(source, `web/public/${target}`, { recursive: true });
}
