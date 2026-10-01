#!/usr/bin/env node
import { chdirRoot, commandJson, ensureDir, writeJson } from "./util.ts";

chdirRoot();
await ensureDir("assets/.automatic/solved/");

const users: Array<string> = await commandJson("typst", [
  "query",
  "resume.typ",
  "<solved-ac-user>",
  "--field",
  "value",
]);

const { userCount } = users.length
  ? await (await fetch("https://solved.ac/api/v3/site/stats")).json()
  : { userCount: 0 };

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
