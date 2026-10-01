import { Link } from "@kobalte/core/link";
import { A } from "@solidjs/router";
import { For } from "solid-js";
import site from "../generated/site.json";
import styles from "./index.module.css";
import identity from "./profile.module.css";
import { PageMetadata } from "../metadata";
import { ShareButton } from "../share";

export default function Home() {
  const profile = site.resume.profile;
  const base = import.meta.env.BASE_URL;
  return (
    <main id="content" class={styles.page}>
      <PageMetadata />
      <section class={styles.card} aria-labelledby="name">
        <Link class={styles.portrait} href={`https://github.com/${profile.social.github}`}>
          <img
            src={`${base}profile.png`}
            width="480"
            height="480"
            alt={`${profile.name["real-korean"]}의 GitHub 프로필 사진`}
          />
          <span>
            GitHub <span aria-hidden="true">↗</span>
          </span>
        </Link>
        <header class={identity.identity}>
          <p class={identity.role}>{profile.role}</p>
          <div class={identity.nameRow}>
            <h1 id="name">
              <span>
                {profile.name["real-korean"]}
                <span>==</span> {profile.name.nickname}
              </span>
            </h1>
            <ShareButton
              title={`${profile.name["real-korean"]} · ${profile.name.nickname}`}
              url={profile.website}
            />
          </div>
          <p class={identity.englishName}>
            {profile.name["real-english"]} / {profile.name["nickname-eng"]}
          </p>
          <address class={identity.contacts}>
            <div class={identity.emails}>
              <For each={profile.email}>
                {(email) => (
                  <Link href={`mailto:${email}`} aria-label={`이메일: ${email}`}>
                    <span
                      class={identity.contactIcon}
                      style={{ "--contact-icon": `url(${base}icons/lucide/mail.svg)` }}
                      aria-hidden="true"
                    />
                    <span>{email}</span>
                  </Link>
                )}
              </For>
            </div>
            <Link
              rel="me"
              href={`https://hackers.pub/${profile.social.hackerspub}`}
              aria-label={`Hackers' Pub: ${profile.social.hackerspub}`}
            >
              <span
                class={identity.contactIcon}
                style={{ "--contact-icon": `url(${base}icons/lucide/cat.svg)` }}
                aria-hidden="true"
              />
              <span>{profile.social.hackerspub}@hackers.pub</span>
            </Link>
            <Link
              href={`tel:${profile.phone.join("")}`}
              aria-label={`전화: ${profile.phone.join(" ")}`}
            >
              <span
                class={identity.contactIcon}
                style={{ "--contact-icon": `url(${base}icons/lucide/phone.svg)` }}
                aria-hidden="true"
              />
              <span>{profile.phone.join(" ")}</span>
            </Link>
          </address>
        </header>
        <div class={styles.qr}>
          <Link href={profile.website} aria-label="gaebalgom.work 홈페이지">
            <img
              src={`${base}site-qr.svg`}
              width="116"
              height="116"
              alt="이 홈페이지로 연결되는 QR 코드"
            />
          </Link>
          <div class={styles.siteDetails}>
            <Link class={styles.siteAddress} href={profile.website}>
              {new URL(profile.website).host}
            </Link>
          </div>
        </div>
        <nav class={styles.documents} aria-label="문서">
          <Link as={A} class={styles.documentLink} href="/resume/">
            resume <span aria-hidden="true">↗</span>
          </Link>
          <Link as={A} class={styles.documentLink} href="/portfolio/">
            portfolio <span aria-hidden="true">↗</span>
          </Link>
          <Link
            as={A}
            class={styles.graveyard}
            href="/graveyard/"
            aria-label="Graveyard — 종료된 프로젝트"
          >
            <svg
              width="28"
              height="32"
              viewBox="0 0 28 32"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              aria-hidden="true"
            >
              <path d="M6 27V12a8 8 0 0 1 16 0v15M3 27h22M10 13h8M14 9v8" />
            </svg>
            <span>graveyard</span>
          </Link>
        </nav>
      </section>
    </main>
  );
}
