#!/usr/bin/env node
import { cp } from "node:fs/promises";
import { chdirRoot, documents, ensureDir, run } from "./util.ts";

chdirRoot();
await ensureDir("www");
await cp("fonts", "www/fonts", { recursive: true });

for (const source of documents) {
  const output = source === "resume.typ" ? "index.pdf" : source.replace(/\.typ$/, ".pdf");
  await run("typst", ["compile", "--font-path", "fonts", source, `www/${output}`]);
}
