import { Toast, toaster } from "@kobalte/core/toast";
import { Portal } from "solid-js/web";
import styles from "./toast.module.css";
import controls from "./controls.module.css";

export function notify(title: string, description?: string) {
  toaster.show((props) => (
    <Toast toastId={props.toastId} class={styles.toast} duration={description ? 10000 : 4000}>
      <div>
        <Toast.Title class={styles.title}>{title}</Toast.Title>
        {description && (
          <Toast.Description class={styles.description}>{description}</Toast.Description>
        )}
      </div>
      <Toast.CloseButton class={controls.action} aria-label="알림 닫기">
        닫기
      </Toast.CloseButton>
    </Toast>
  ));
}

export function Notifications() {
  return (
    <Portal>
      <Toast.Region class={styles.region} aria-label="알림" limit={3}>
        <Toast.List class={styles.list} />
      </Toast.Region>
    </Portal>
  );
}
