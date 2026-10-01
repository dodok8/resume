import { Link, Meta, Title } from "@solidjs/meta";
import site from "./generated/site.json";

const profile = site.resume.profile;
const name = `${profile.name["real-korean"]} · ${profile.name.nickname}`;
const tagline = profile.tagline.map((node) => node.text ?? "").join("");

export function PageMetadata(props: { document?: keyof typeof site }) {
  const document = () => (props.document ? site[props.document] : undefined);
  const title = () => (document() ? `${document()!.title} — ${name}` : name);
  const description = () =>
    document()
      ? `${profile.name["real-korean"]}의 ${document()!.title}. ${tagline}`
      : `${profile.role} ${profile.name["real-korean"]}(${profile.name.nickname}). ${tagline}`;
  const url = () => new URL((document()?.route ?? "/").slice(1), profile.website).href;
  const image = new URL("profile.png", profile.website).href;
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
      <Meta property="og:image:alt" content={`${profile.name["real-korean"]}의 프로필 사진`} />
      <Meta name="twitter:card" content="summary" />
      <Meta name="twitter:title" content={title()} />
      <Meta name="twitter:description" content={description()} />
      <Meta name="twitter:image" content={image} />
    </>
  );
}
