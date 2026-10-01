import { Link } from "@kobalte/core/link";
import { A } from "@solidjs/router";
import { For } from "solid-js";
import type site from "./generated/site.json";
import { InlineContent, RichContent } from "./content";
import { PrintButton, PrintPages } from "./print";
import { PageMetadata } from "./metadata";
import styles from "./document.module.css";
import toolbar from "./toolbar.module.css";
import controls from "./controls.module.css";
import entryStyles from "./entry.module.css";
import { ShareButton } from "./share";

type DocumentData = (typeof site)[keyof typeof site];

export function Document(props: { document: DocumentData }) {
  const base = import.meta.env.BASE_URL;
  return (
    <div class={`document document--${props.document.id}`}>
      <PageMetadata document={props.document.id as keyof typeof site} />
      <header class={`site-header ${toolbar.toolbar}`}>
        <nav class={toolbar.navigation} aria-label="문서">
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
        </nav>
        <div class={toolbar.actions}>
          <Link
            class={controls.action}
            href={`${base}${props.document.print.pdf}`}
            download={`${props.document.id}.pdf`}
          >
            다운로드
          </Link>
          <ShareButton
            class={controls.action}
            title={`${props.document.title} — ${props.document.profile.name["real-korean"]}`}
            url={new URL(props.document.route.slice(1), props.document.profile.website).href}
          />
          <PrintButton />
        </div>
      </header>
      <main id="content" class={`screen-content ${styles.paper}`}>
        <header class={styles.title}>
          <h1>{props.document.title}</h1>
          <p>
            <time datetime={props.document.updated}>{props.document.updated}</time> 기준
          </p>
        </header>
        <For each={props.document.sections}>
          {(section) => (
            <section class={styles.section}>
              <div class={styles.sectionHeading}>
                <RichContent nodes={section.heading} />
              </div>
              <For each={section.entries}>
                {(entry) => (
                  <article class={entryStyles.entry}>
                    <p class={entryStyles.period}>
                      <time datetime={entry.from ?? undefined}>
                        {entry.from?.slice(0, 7).replace("-", ".")}
                      </time>
                      {entry.to && (
                        <>
                          <span aria-hidden="true">—</span>
                          {entry.ongoing ? (
                            <span>현재</span>
                          ) : (
                            <time datetime={entry.to}>
                              {entry.to.slice(0, 7).replace("-", ".")}
                            </time>
                          )}
                        </>
                      )}
                    </p>
                    <div class={entryStyles.entryBody}>
                      <h3 class={entryStyles.entryTitle}>
                        <InlineContent nodes={entry.title} />
                      </h3>
                      <RichContent nodes={entry.body} />
                    </div>
                  </article>
                )}
              </For>
            </section>
          )}
        </For>
      </main>
      <PrintPages pages={props.document.print.pages} />
    </div>
  );
}
