import { Link } from "@kobalte/core/link";
import { A } from "@solidjs/router";
import type { JSX } from "solid-js";
import styles from "./toolbar.module.css";

export function SiteHeader(props: { children?: JSX.Element }) {
  return (
    <header class={`site-header ${styles.toolbar}`}>
      <nav class={styles.navigation} aria-label="사이트">
        <Link as={A} href="/" end>
          홈
        </Link>
        <Link as={A} href="/resume/">
          레쥬메
        </Link>
        <Link as={A} href="/portfolio/">
          포트폴리오
        </Link>
        <Link as={A} href="/graveyard/">
          무덤
        </Link>
        <Link as={A} href="/guestbook/">
          방명록
        </Link>
      </nav>
      {props.children}
    </header>
  );
}
