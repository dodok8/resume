import { defineConfig } from "vite";
import { solidStart } from "@solidjs/start/config";
import { nitro } from "nitro/vite";

const base = process.env.SITE_BASE ?? "/";
if (!/^\/(?:[a-zA-Z0-9_-]+\/)*$/.test(base)) {
  throw new Error("SITE_BASE must have leading and trailing slashes.");
}

export default defineConfig({
  base,
  plugins: [solidStart(), nitro()],
  nitro: {
    preset: "static",
    baseURL: base,
    prerender: { routes: ["/", "/resume/", "/portfolio/", "/graveyard/"], failOnError: true },
  },
});
