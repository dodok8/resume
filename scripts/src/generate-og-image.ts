#!/usr/bin/env node
import { preview } from "vite";
import { chromium } from "playwright";
import { chdirRoot } from "./util.ts";

chdirRoot();
process.chdir("web");
const server = await preview({ preview: { host: "127.0.0.1", port: 0 } });
try {
  const browser = await chromium.launch();
  try {
    const page = await browser.newPage({
      viewport: { width: 1200, height: 800 },
      deviceScaleFactor: 1,
      colorScheme: "light",
      locale: "ko-KR",
    });
    await page.goto(server.resolvedUrls!.local[0]);
    const card = page.locator('#content > section[aria-labelledby="name"]');
    await card.evaluate(async (element) => {
      await document.fonts.ready;
      await Promise.all(Array.from(element.querySelectorAll("img")).map((image) => image.decode()));
    });
    await card.screenshot({ path: ".output/public/og-card.png", animations: "disabled" });
    console.log("Generated og-card.png from the home page business card.");
  } finally {
    await browser.close();
  }
} finally {
  await new Promise<void>((resolve, reject) => {
    server.httpServer.close((error) => (error ? reject(error) : resolve()));
  });
}
