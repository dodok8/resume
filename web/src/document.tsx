import { For } from "solid-js";
import type site from "./generated/site.json";
import { InlineContent, RichContent } from "./content";
import { PrintButton, PrintPages } from "./print";
import { PageMetadata } from "./metadata";

type DocumentData = (typeof site)[keyof typeof site];

export function Document(props: { document: DocumentData }) {
  const base = import.meta.env.BASE_URL;
  return (
    <div class={`document document--${props.document.id}`}>
      <PageMetadata document={props.document.id as keyof typeof site} />
      <main id="content" class="screen-content">
        <header>
          <h1>
            {props.document.title} — {props.document.profile.name["real-korean"]}
          </h1>
          <p>{props.document.profile.role}</p>
          <p>
            <InlineContent nodes={props.document.profile.tagline} />
          </p>
          <For each={props.document.profile.email}>
            {(email) => (
              <div>
                <a href={`mailto:${email}`}>{email}</a>
              </div>
            )}
          </For>
          <dl>
            <dt>전화</dt>
            <dd>
              <a href={`tel:${props.document.profile.phone.join("")}`}>
                {props.document.profile.phone.join(" ")}
              </a>
            </dd>
            <dt>생년월일</dt>
            <dd>{props.document.profile.birthday}</dd>
            <dt>GitHub</dt>
            <dd>
              <a href={`https://github.com/${props.document.profile.social.github}`}>
                @{props.document.profile.social.github}
              </a>
            </dd>
            <dt>Hackers' Pub</dt>
            <dd>
              <a href={`https://hackers.pub/${props.document.profile.social.hackerspub}`}>
                {props.document.profile.social.hackerspub}
              </a>
            </dd>
          </dl>
          <div class="document-actions">
            <a href={`${base}${props.document.print.pdf}`} download={`${props.document.id}.pdf`}>
              PDF 다운로드
            </a>
            <PrintButton pages={props.document.print.pages} />
          </div>
        </header>
        <For each={props.document.sections}>
          {(section) => (
            <section>
              <RichContent nodes={section.heading} />
              <For each={section.entries}>
                {(entry) => (
                  <article>
                    <h3>
                      <InlineContent nodes={entry.title} />
                    </h3>
                    <p>
                      <time datetime={entry.from ?? undefined}>{entry.from}</time>
                      {entry.to && (
                        <>
                          {" "}
                          — {entry.ongoing ? "현재" : <time datetime={entry.to}>{entry.to}</time>}
                        </>
                      )}
                    </p>
                    <RichContent nodes={entry.body} />
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
