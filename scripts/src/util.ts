import { execFile, spawn } from "node:child_process";
import { once } from "node:events";
import { mkdir, readFile, writeFile } from "node:fs/promises";
import { fileURLToPath } from "node:url";
import { promisify } from "node:util";

export const root = new URL("../../", import.meta.url);
export const documents = ["resume.typ", "portfolio.typ", "graveyard.typ"];
const execFileAsync = promisify(execFile);

export function chdirRoot() {
  process.chdir(fileURLToPath(root));
}

export async function ensureDir(path: string) {
  await mkdir(path, { recursive: true });
}

export async function readJsonOr<T>(path: string, fallback: T): Promise<T> {
  try {
    return JSON.parse(await readFile(path, "utf8")) as T;
  } catch {
    return fallback;
  }
}

export async function writeJson(path: string, data: unknown) {
  await writeFile(path, JSON.stringify(data));
}

export async function commandText(command: string, args: string[]) {
  const { stdout } = await execFileAsync(command, args, { encoding: "utf8" });
  return stdout;
}

export async function commandJson<T>(command: string, args: string[]): Promise<T> {
  return JSON.parse(await commandText(command, args)) as T;
}

export async function queryMetadata(selector: string): Promise<string[]> {
  const values = await Promise.all(
    documents.map((file) =>
      commandJson<string[]>("typst", ["query", file, selector, "--field", "value"]),
    ),
  );
  return [...new Set(values.flat())];
}

export async function run(command: string, args: string[]) {
  const child = spawn(command, args, { stdio: "inherit" });
  const [code, signal] = await once(child, "close");
  if (code !== 0) {
    throw new Error(`${command} ${args.join(" ")} failed with ${signal ?? `code ${code}`}`);
  }
}

export async function download(url: string, file: string) {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to download ${url}: ${response.status} ${response.statusText}`);
  }

  await writeFile(file, new Uint8Array(await response.arrayBuffer()));
}
