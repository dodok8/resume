#!/usr/bin/env node
import { cp, readFile } from "node:fs/promises";
import QRCode from "qrcode";
import { chdirRoot, documents, download, ensureDir, writeJson } from "./util.ts";

chdirRoot();
await ensureDir("web/src/generated");
await ensureDir("web/public");
const print = JSON.parse(await readFile("www/print/manifest.json", "utf8"));
const content: Record<string, unknown> = {};
for (const source of documents) {
  const id = source.slice(0, -4);
  const document = JSON.parse(await readFile(`assets/.automatic/web/${id}.json`, "utf8"));
  content[id] = {
    ...document,
    print: print[id],
  };
  if (id === "resume") {
    await QRCode.toFile("web/public/site-qr.svg", document.profile.website, {
      type: "svg",
      margin: 4,
      color: { dark: "#20163b", light: "#ffffff" },
    });
    await download(
      `https://github.com/${document.profile.social.github}.png?size=480`,
      "web/public/profile.png",
    );
  }
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
