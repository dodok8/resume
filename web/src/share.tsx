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
    <Button class={`${styles.action} ${props.class ?? ""}`} onClick={share}>
      공유하기
    </Button>
  );
}
