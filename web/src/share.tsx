import { Button } from "@kobalte/core/button";
import styles from "./controls.module.css";
import { notify } from "./toast";

export function ShareButton(props: { title: string; url: string; class?: string }) {
  async function share() {
    try {
      if (navigator.share) await navigator.share({ title: props.title, url: props.url });
      else {
        await navigator.clipboard.writeText(props.url);
        notify("페이지 주소를 복사했습니다.");
      }
    } catch (error) {
      if (error instanceof DOMException && error.name === "AbortError") return;
      notify("공유하지 못했습니다. 아래 주소를 이용해 주세요.", props.url);
    }
  }
  return (
    <Button
      class={`${styles.action} ${props.class ?? ""}`}
      onClick={share}
      aria-label="공유하기"
      title="공유하기"
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
        <circle cx="18" cy="5" r="3" />
        <circle cx="6" cy="12" r="3" />
        <circle cx="18" cy="19" r="3" />
        <path d="m8.6 10.5 6.8-4M8.6 13.5l6.8 4" />
      </svg>
    </Button>
  );
}
