#!/usr/bin/env -S deno run --allow-read --allow-write --allow-run --allow-net=api.iconify.design,static.solved.ac
import { chdirRoot, commandJson, download, ensureDir, writeJson } from "./util.ts";

function dirname(path: string) {
  return path.slice(0, path.lastIndexOf("/"));
}

chdirRoot();
await ensureDir("assets/.automatic/icon/");

const icons: string[] = (
  await Promise.all(
    [
      ["resume.typ"],
    ].map(([file]) =>
      commandJson<string[]>("typst", ["query", file, "<icon>", "--field", "value"])
    ),
  )
).flat();

const data: Record<string, string> = {};
for (const icon of icons) {
  const {
    prefix,
    name,
    query: rawQuery,
  } = /(?<prefix>[\w-]+)\/(?<name>[\w-]+)(\?(?<query>\w+\=[\w#-]+(&\w+\=[\w#-]+)*))?/
    .exec(
      icon,
    )?.groups ?? {};
  const query = new URLSearchParams(rawQuery ?? "");
  const color = query.get("color");

  const filename = `${prefix}/${name}${color ? `-${color}` : ""}.svg`;
  const file = `assets/.automatic/icon/${filename}`;
  data[icon] = filename;
  try {
    await Deno.stat(file);
    continue;
  } catch (error) {
    if (!(error instanceof Deno.errors.NotFound)) {
      throw error;
    }
  }

  const source = {
    "solved-ac": {
      get url() {
        const solveTier = /^solve-tier-(\d+)$/.exec(name);
        if (solveTier) {
          return `https://static.solved.ac/tier_small/${solveTier[1]}.svg`;
        }
        const arenaTier = /^arena-tier-(\d+)$/.exec(name);
        if (arenaTier) {
          return `https://static.solved.ac/tier_arena/${arenaTier[1]}.svg`;
        }

        throw new Error(`no icon found: ${icon}`);
      },
      name: "solvedac",
    },
  }[prefix ?? ""] ?? {
    url: `https://api.iconify.design/${prefix}/${name}.svg${query.size ? `?${query}` : ""}`,
    name: "iconify",
  };

  console.log(`Downloading ${icon} from ${source.name}`);

  await ensureDir(dirname(file));
  await download(source.url, file);
}

await writeJson("assets/.automatic/icon/manifest.json", data);
