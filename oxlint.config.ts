import { defineConfig } from "oxlint";
import solid from "eslint-plugin-solid/configs/typescript";

export default defineConfig({
  jsPlugins: ["eslint-plugin-solid"],
  overrides: [{ files: ["web/**/*.tsx"], rules: solid.rules }],
});
