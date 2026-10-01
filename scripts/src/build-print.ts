#!/usr/bin/env node
import { readdir, readFile, rm, writeFile } from "node:fs/promises";
import { chdirRoot, documents, ensureDir, run, writeJson } from "./util.ts";

chdirRoot();
const manifest: Record<string, { pages: string[]; pdf: string }> = {};
for (const source of documents) {
  const id = source.slice(0, -4);
  const directory = `www/print/${id}`;
  await rm(directory, { recursive: true, force: true });
  await ensureDir(directory);
  await run("typst", ["compile", "--font-path", "fonts", "--format", "svg", source, `${directory}/page-{p}.svg`]);
  const pages = (await readdir(directory)).filter(file => /^page-\d+\.svg$/.test(file))
    .sort((a, b) => a.localeCompare(b, "en", { numeric: true }));
  if (!pages.length) throw new Error(`No print pages for ${source}`);
  for (const page of pages) {
    // ponytail: Typst 0.14.0 leaves URL ampersands unescaped; remove this when the compiler fixes SVG escaping.
    const svg = (await readFile(`${directory}/${page}`, "utf8"))
      .replace(/&(?!(?:amp|lt|gt|quot|apos|#[0-9]+|#x[0-9a-fA-F]+);)/g, "&amp;");
    await writeFile(`${directory}/${page}`, svg);
    const dimensions = svg.match(/viewBox="0 0 ([\d.]+) ([\d.]+)"/);
    if (!dimensions || Math.abs(Number(dimensions[1]) - 210 * 72 / 25.4) > 0.01
      || Math.abs(Number(dimensions[2]) - 297 * 72 / 25.4) > 0.01) {
      throw new Error(`Expected an A4 portrait page: ${directory}/${page}`);
    }
  }
  manifest[id] = {
    pages: pages.map(page => `print/${id}/${page}`),
    pdf: id === "resume" ? "index.pdf" : `${id}.pdf`,
  };
  console.log(`${source}: ${pages.length} A4 print pages`);
}
await writeJson("www/print/manifest.json", manifest);
