#!/usr/bin/env node
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
