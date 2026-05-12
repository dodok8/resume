#!/usr/bin/env -S deno run --allow-read --allow-write --allow-run --allow-net
import { chdirRoot, run } from "./util.ts";

chdirRoot();
const deno = Deno.execPath();
const permissions = ["--allow-read", "--allow-write", "--allow-run", "--allow-net"];

for (
  const script of [
    "scripts/src/reset.ts",
    "scripts/src/fetch-github-metadata.ts",
    "scripts/src/fetch-solved-metadata.ts",
    "scripts/src/download-icons.ts",
  ]
) {
  await run(deno, ["run", ...permissions, script]);
}
