export const root = new URL("../../", import.meta.url);

export function chdirRoot() {
  Deno.chdir(root);
}

export async function ensureDir(path: string) {
  await Deno.mkdir(path, { recursive: true });
}

export async function readJsonOr<T>(path: string, fallback: T): Promise<T> {
  try {
    return JSON.parse(await Deno.readTextFile(path)) as T;
  } catch {
    return fallback;
  }
}

export async function writeJson(path: string, data: unknown) {
  await Deno.writeTextFile(path, JSON.stringify(data));
}

export async function commandText(command: string, args: string[]) {
  const output = await new Deno.Command(command, {
    args,
    stdout: "piped",
    stderr: "piped",
  }).output();

  if (!output.success) {
    const stderr = new TextDecoder().decode(output.stderr);
    throw new Error(`${command} ${args.join(" ")} failed\n${stderr}`);
  }

  return new TextDecoder().decode(output.stdout);
}

export async function commandJson<T>(command: string, args: string[]): Promise<T> {
  return JSON.parse(await commandText(command, args)) as T;
}

export async function run(command: string, args: string[], options?: { allowFailure?: boolean }) {
  const child = new Deno.Command(command, {
    args,
    stdin: "inherit",
    stdout: "inherit",
    stderr: "inherit",
  });
  const status = await child.output();

  if (!status.success && !options?.allowFailure) {
    throw new Error(`${command} ${args.join(" ")} failed with code ${status.code}`);
  }
}

export async function download(url: string, file: string) {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to download ${url}: ${response.status} ${response.statusText}`);
  }

  await Deno.writeFile(file, new Uint8Array(await response.arrayBuffer()));
}
