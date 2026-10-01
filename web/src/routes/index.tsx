import site from "../generated/site.json";

export default function Home() {
  return (
    <main id="content" class="home-page">
      <h1>{site.resume.profile.name["real-korean"]}</h1>
      <p>이력서와 포트폴리오 문서를 살펴보세요.</p>
    </main>
  );
}
