import { createHandler, StartServer } from "@solidjs/start/server";
import site from "./generated/site.json";

export default createHandler(() => (
  <StartServer document={(props) => (
    <html lang="ko">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>{site.resume.profile.name["real-korean"]} — 이력서와 포트폴리오</title>
        {props.assets}
      </head>
      <body><div id="app">{props.children}</div>{props.scripts}</body>
    </html>
  )} />
));
