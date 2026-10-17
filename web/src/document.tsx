import { Link } from "@kobalte/core/link";
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
import { SiteHeader } from "./site-header";

type DocumentData = (typeof site)[keyof typeof site];

export function Document(props: { document: DocumentData }) {
  const base = import.meta.env.BASE_URL;
  return (
    <div class={`document document--${props.document.id}`}>
      <PageMetadata document={props.document.id as keyof typeof site} />
      <SiteHeader>
        <div class={toolbar.actions}>
          <Link
            class={controls.action}
            href={`${base}${props.document.print.pdf}`}
            download={`${props.document.id}.pdf`}
            aria-label="PDF 다운로드"
            title="PDF 다운로드"
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
              <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4M7 10l5 5 5-5M12 15V3" />
            </svg>
          </Link>
          <ShareButton
            class={controls.action}
            title={`${props.document.title} — ${props.document.profile.name["real-korean"]}`}
            url={new URL(props.document.route.slice(1), props.document.profile.website).href}
          />
          <PrintButton />
        </div>
      </SiteHeader>
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
                        <span class={entryStyles.entryName}>
                          <InlineContent nodes={entry.title} />
                        </span>
                        {entry.details.length > 0 && (
                          <span class={entryStyles.entryDetails}>
                            <InlineContent nodes={entry.details} />
                          </span>
                        )}
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
