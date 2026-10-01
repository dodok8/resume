#!/usr/bin/env node
import { access } from "node:fs/promises";
import { chdirRoot, documents, download, ensureDir, run } from "./util.ts";

chdirRoot();
await ensureDir("fonts");
await ensureDir("www");

const font = "fonts/RIDIBatang.otf";
try {
  await access(font);
} catch (error) {
  if (!(error instanceof Error && "code" in error && error.code === "ENOENT")) {
    throw error;
  }
  await download("https://ridicorp.com/wp-content/themes/ridicorp/css/font/RIDIBatang.otf", font);
}

for (const source of documents) {
  const output = source === "resume.typ" ? "index.pdf" : source.replace(/\.typ$/, ".pdf");
  await run("typst", ["compile", "--font-path", "fonts", source, `www/${output}`]);
}
