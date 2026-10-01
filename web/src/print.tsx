import { Button } from "@kobalte/core/button";
import { For, createSignal, onMount } from "solid-js";
import styles from "./controls.module.css";

export function PrintButton(props: { pages: string[] }) {
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
        aria-describedby="print-status"
        title="A4 · 배율 100% · 브라우저 머리글과 바닥글 끄기"
      >
        인쇄하기
      </Button>
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
