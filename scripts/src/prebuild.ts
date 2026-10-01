#!/usr/bin/env node
import { chdirRoot, run } from "./util.ts";

chdirRoot();

for (const script of [
  "scripts/src/reset.ts",
  "scripts/src/fetch-github-metadata.ts",
  "scripts/src/fetch-solved-metadata.ts",
  "scripts/src/download-icons.ts",
]) {
  await run(process.execPath, [script]);
}
