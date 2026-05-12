#!/usr/bin/env -S deno run --allow-read --allow-write --allow-run --allow-net=solved.ac
import { chdirRoot, commandJson, ensureDir, writeJson } from "./util.ts";

chdirRoot();
await ensureDir("assets/.automatic/solved/");

// stat

const { userCount } = await (await fetch("https://solved.ac/api/v3/site/stats")).json();

// user

const users: Array<string> = await commandJson("typst", [
  "query",
  "resume.typ",
  "<solved-ac-user>",
  "--field",
  "value",
]);

const userData: Record<string, unknown> = {};
for (const user of users) {
  console.log(`Loading solved.ac user ${user}`);
  const { tier, rating, solvedCount, arenaTier, arenaRating, rank } =
    await (await fetch(`https://solved.ac/api/v3/user/show?handle=${user}`)).json();
  userData[user] = {
    solveTier: tier,
    solveRating: rating,
    solvedCount,
    arenaTier,
    arenaRating,
    rank,
    topPercent: (100 * rank) / userCount,
  };
}
await writeJson("assets/.automatic/solved/user.json", userData);
