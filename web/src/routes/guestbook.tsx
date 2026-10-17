import { clientOnly } from "@solidjs/start";
import { PageMetadata } from "../metadata";
import styles from "../document.module.css";
import { SiteHeader } from "../site-header";

const Giscus = clientOnly(() => import("@giscus/solid"));

export default function Guestbook() {
  return (
    <>
      <PageMetadata title="방명록" route="/guestbook/" />
      <SiteHeader />
      <main id="content" class={styles.paper}>
        <header class={styles.title}>
          <h1>방명록</h1>
          <p>GitHub 계정으로 로그인하고 자유롭게 인사를 남겨주세요.</p>
        </header>
        <Giscus
          repo="dodok8/resume"
          repoId="R_kgDOLahHmA"
          category="Announcements"
          categoryId="DIC_kwDOLahHmM4DItx_"
          mapping="pathname"
          strict="0"
          reactionsEnabled="1"
          emitMetadata="0"
          inputPosition="bottom"
          theme="preferred_color_scheme"
          lang="ko"
        />
      </main>
    </>
  );
}
