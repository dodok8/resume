import { Button } from "@kobalte/core/button";
import { For, createSignal, onMount } from "solid-js";

export function PrintButton(props: { pages: string[] }) {
  const [status, setStatus] = createSignal<"loading" | "ready" | "failed">("loading");
  onMount(async () => {
    try {
      await Promise.all(Array.from(document.querySelectorAll<HTMLImageElement>(".print-page img"))
        .map(image => image.decode()));
      setStatus("ready");
    } catch {
      setStatus("failed");
    }
  });
  return <>
    <Button disabled={status() !== "ready"} onClick={() => window.print()}>인쇄</Button>
    <p role="status">{status() === "loading" ? "인쇄 페이지를 불러오는 중입니다."
      : status() === "failed" ? "인쇄 페이지를 불러오지 못했습니다. PDF를 이용해 주세요."
      : `A4 · ${props.pages.length}페이지`}</p>
    <p>원본 크기로 인쇄하려면 배율을 100%로 설정하고 브라우저 머리글과 바닥글을 꺼 주세요.</p>
  </>;
}

export function PrintPages(props: { pages: string[] }) {
  return <div class="print-pages" aria-hidden="true">
    <For each={props.pages}>{(page, index) =>
      <div class="print-page" data-page={index() + 1}>
        <img src={`${import.meta.env.BASE_URL}${page}`} alt="" loading="eager" decoding="sync" />
      </div>
    }</For>
  </div>;
}
