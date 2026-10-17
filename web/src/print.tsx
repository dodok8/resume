import { Button } from "@kobalte/core/button";
import { For, createSignal, onMount } from "solid-js";
import styles from "./controls.module.css";

export function PrintButton() {
  const [status, setStatus] = createSignal<"loading" | "ready" | "failed">("loading");
  onMount(async () => {
    try {
      await Promise.all(
        Array.from(document.querySelectorAll<HTMLImageElement>(".print-page img")).map((image) =>
          image.decode(),
        ),
      );
      setStatus("ready");
    } catch {
      setStatus("failed");
    }
  });
  return (
    <>
      <Button
        class={styles.action}
        disabled={status() !== "ready"}
        onClick={() => window.print()}
        aria-label="인쇄하기"
        aria-describedby="print-status"
        title="A4 · 배율 100% · 브라우저 머리글과 바닥글 끄기"
      >
        <svg
          width="20"
          height="20"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="1.5"
          stroke-linecap="round"
          stroke-linejoin="round"
          aria-hidden="true"
        >
          <path d="M6 9V3h12v6M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2" />
          <path d="M6 14h12v8H6zM18 12h.01" />
        </svg>
      </Button>
      <span id="print-status" class={styles.srOnly} role="status">
        {status() === "loading"
          ? "인쇄용 문서를 준비하고 있습니다."
          : status() === "failed"
            ? "인쇄용 문서를 불러오지 못했습니다. 페이지를 새로고침해 주세요."
            : "A4 · 배율 100% · 브라우저 머리글과 바닥글 끄기"}
      </span>
    </>
  );
}

export function PrintPages(props: { pages: string[] }) {
  return (
    <div class="print-pages" aria-hidden="true">
      <For each={props.pages}>
        {(page, index) => (
          <div class="print-page" data-page={index() + 1}>
            <img
              src={`${import.meta.env.BASE_URL}${page}`}
              alt=""
              loading="eager"
              decoding="sync"
            />
          </div>
        )}
      </For>
    </div>
  );
}
