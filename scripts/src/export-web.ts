#!/usr/bin/env node
import { chdirRoot, commandJson, documents, ensureDir, writeJson } from "./util.ts";

chdirRoot();
await ensureDir("assets/.automatic/web");

for (const file of documents) {
  const id = file.slice(0, -4);
  const records = await commandJson<Array<Record<string, unknown>>>("typst", [
    "query", "--input", "export-web=true", file, "<web-data>", "--field", "value",
  ]);
  const headers = records.filter(record => record.type === "document");
  if (headers.length !== 1 || headers[0].id !== id) {
    throw new Error(`Expected one web document for ${id}`);
  }
  const { type, ...document } = headers[0];
  await writeJson(`assets/.automatic/web/${id}.json`, {
    ...document,
    sections: records.filter(record => record.type === "section").map(({ type, ...section }) => section),
  });
  console.log(`Exported ${id}.typ to assets/.automatic/web/${id}.json`);
}
