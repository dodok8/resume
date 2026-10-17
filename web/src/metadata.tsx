import { Link, Meta, Title } from "@solidjs/meta";
import site from "./generated/site.json";

const profile = site.resume.profile;
const name = `${profile.name["real-korean"]} · ${profile.name.nickname}`;
const tagline = profile.tagline.map((node) => node.text ?? "").join("");

export function PageMetadata(props: {
  document?: keyof typeof site;
  title?: string;
  route?: string;
}) {
  const document = () => (props.document ? site[props.document] : undefined);
  const pageTitle = () => props.title ?? document()?.title;
  const title = () => (pageTitle() ? `${pageTitle()} — ${name}` : name);
  const description = () =>
    pageTitle()
      ? `${profile.name["real-korean"]}의 ${pageTitle()}. ${tagline}`
      : `${profile.role} ${profile.name["real-korean"]}(${profile.name.nickname}). ${tagline}`;
  const url = () =>
    new URL((props.route ?? document()?.route ?? "/").slice(1), profile.website).href;
  const image = new URL("og-card.png", profile.website).href;
  return (
    <>
      <Title>{title()}</Title>
      <Meta name="description" content={description()} />
      <Meta name="author" content={profile.name["real-korean"]} />
      <Link rel="canonical" href={url()} />
      <Link rel="icon" type="image/png" href={`${import.meta.env.BASE_URL}profile.png`} />
      <Meta property="og:type" content="website" />
      <Meta property="og:locale" content="ko_KR" />
      <Meta property="og:site_name" content={name} />
      <Meta property="og:title" content={title()} />
      <Meta property="og:description" content={description()} />
      <Meta property="og:url" content={url()} />
      <Meta property="og:image" content={image} />
      <Meta property="og:image:type" content="image/png" />
      <Meta property="og:image:alt" content={`${profile.name["real-korean"]}의 명함`} />
      <Meta name="twitter:card" content="summary_large_image" />
      <Meta name="twitter:title" content={title()} />
      <Meta name="twitter:description" content={description()} />
      <Meta name="twitter:image" content={image} />
      <Meta name="twitter:image:alt" content={`${profile.name["real-korean"]}의 명함`} />
    </>
  );
}
