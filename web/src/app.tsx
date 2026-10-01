import { A, Router } from "@solidjs/router";
import { FileRoutes } from "@solidjs/start/router";
import { For, Suspense } from "solid-js";
import site from "./generated/site.json";
import "./app.css";

export default function App() {
  return <Router base={import.meta.env.BASE_URL.replace(/\/$/, "")} root={props => <>
    <header class="site-header">
      <a href="#content">본문으로 이동</a>
      <nav aria-label="문서">
        <A href="/" end>홈</A>
        <For each={Object.values(site)}>{item => <A href={item.route}>{item.title}</A>}</For>
      </nav>
    </header>
    <Suspense>{props.children}</Suspense>
  </>}>
    <FileRoutes />
  </Router>;
}
