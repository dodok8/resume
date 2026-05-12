#!/usr/bin/env -S deno run --allow-read --allow-write --allow-run
import { chdirRoot, ensureDir, run } from "./util.ts";

chdirRoot();
await ensureDir("cover");
await run("typst", [
  "compile",
  "cover.typ",
  "cover/page-dark-{n}.svg",
  "--input",
  "theme=dark",
  "-f",
  "svg",
]);
await run("typst", [
  "compile",
  "cover.typ",
  "cover/page-light-{n}.svg",
  "--input",
  "theme=light",
  "-f",
  "svg",
]);
