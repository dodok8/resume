#import "modules/util.typ": *
#import "modules/activity.typ": *
#import "modules/components.typ": *
#import "modules/github.typ": *
#import "modules/solved-ac.typ": *
#import "metadata.typ": metadata

#set page(fill: color.rgb(0, 0, 0, 0))

#let theme = sys.inputs.at("theme", default: "light")
#let palette = if theme == "light" {
  (
    foreground1: color.rgb("#1f2328"),
    foreground2: color.rgb("#495057"),
    background1: color.rgb("#e6edf3"),
    link: color.rgb("#1c7ed6"),
  )
} else {
  (
    foreground1: color.rgb("#e6edf3"),
    foreground2: color.rgb("#ced4da"),
    background1: color.rgb("#1f2328"),
    link: color.rgb("#74c0fc"),
  )
}

#set text(
  font: "Pretendard",
  fill: palette.foreground1,
  features: ("ss06",),
  fallback: true,
)
#show heading: set text(size: 16pt)

#align(center)[
  = #text(size: 24pt)[#metadata.name.real-korean#super[#upper[#metadata.name.real-english]]]

  #text(size: 12pt)[
    #text(weight: 900, tracking: 2pt)[#metadata.role]
  ] \
  #icon("lucide/mail?color=" + palette.foreground1.to-hex())
  #link("mailto:" + metadata.email)[#metadata.email]
  $bar$
  #icon("lucide/phone?color=" + palette.foreground1.to-hex())
  #link("tel:" + metadata.phone.join())[#metadata.phone.join(" ")]
  $bar$
  #icon(if theme == "dark" {
    "skill-icons/github-dark"
  } else {
    "skill-icons/github-light"
  })
  #link("https://github.com/" + metadata.social.github)[\@#metadata.social.github]
  #text(size: 16pt, weight: 600)[
    #set par(leading: 8pt)
    #metadata.bio.ko.title
  ]


  // $bar$
  // #icon("logos/twitter") #link("https://twitter.com/" + metadata.social.twitter)[\@#metadata.social.twitter]
  // $bar$
  // #icon-solved-ac() #link("https://solved.ac/profile/" + metadata.social.solved-ac)[
  // #solved-ac-profile-short(metadata.social.solved-ac)
  // ]
  // $bar$
]

// #line(length: 100%, stroke: 1pt + palette.foreground1)

== 기술

- React, React-Native
  - 다수의 웹 앱 제작 경험 및 모바일 앱 제작 경험
  - 운영 중인 앱 TypeScript 마이그레이션 경험
  - Redux 를 통한 상태관리에 능숙함
- Bun
  - Bun 테스트 러너 기반 테스트 스크립트 작성 경험
  - TypeScript 기반 앱 작성 및 배포 경험
- Svelte
  - 라이브 서비스 중인 웹 앱 개발 경험
// - Svelte 5에 도입된 Rune 에 능숙
// - Python
//   - Tkinter를 통한 GUI 앱 제작 가능
//   - Streamlit, Gradio 를 통한 AI 모델을 위한 웹 앱 작성에 능숙
- Git, Github, Github-actions
  - Git과 GitHub 을 이용한 프로젝트 관리에 능숙
  - GitHub Actions를 이용한 배포 자동화 경험



#activityList(
  header: [
    == 팀 프로젝트
  ],
  (
    activityEntry(
      from: datetime(year: 2025, month: 4, day: 2),
      title: pad(top: -1em / 4)[
        #link("https://play.google.com/store/apps/details?id=com.beside04.haruNyang&hl=ko")[#icon("lucide/earth") 하루냥] #h(1fr) Next.js, TanStack-Query, Flutter
      ],
    )[],
    activityEntry(
      from: datetime(year: 2022, month: 12, day: 21),
      title: pad(top: -1em / 4)[
        gsainfoteam/Infoteam-frontend-template #h(1fr) React, Vite, Styled-Component
      ],
    )[ ],
    activityEntry(
      from: datetime(year: 2022, month: 8, day: 21),
      title: pad(top: -1em / 4)[
        #gh-repo("Regulus-JunctionXAsia2022/Widget") #h(1fr) React, Vite
      ],
    )[ ],
    activityEntry(
      from: datetime(year: 2022, month: 3, day: 10),
      // to: datetime(year: 2022, month: 7, day: 10),
      title: pad(top: -1em / 4)[
        #gh-repo("SmartX-Labs/SmartX-Mini") #h(1fr) GitHub, Docker
      ],
    )[ ],
    activityEntry(
      from: datetime(year: 2021, month: 7, day: 23),
      // to: datetime(year: 2021, month: 12, day: 23),
      title: pad(top: -1em / 4)[
        Pedalers/wheelie-ts-android #h(1fr) React Native, TypeScript
      ],
    )[ ],
    activityEntry(
      from: datetime(year: 2021, month: 5, day: 30),
      title: pad(top: -1em / 4)[
        #gh-repo("JunctionX-Seoul-Caffeine/Calmmuter") #h(1fr) React
      ],
    )[ ],
    activityEntry(
      from: datetime(year: 2020, month: 7, day: 10),
      // to: datetime(year: 2021, month: 5, day: 30),
      title: pad(top: -1em / 4)[
        GISTORY #h(1fr) React, Vite, TypeScript
      ],
    )[ ],
  ),
)

#activityList(
  header: [
    == 1인 개발 프로젝트
  ],
  (
    activityEntry(
      from: datetime(year: 2025, month: 2, day: 22),
      title: pad(top: -1em / 4)[
        #gh-repo("dodok8/Ilots-log") #h(1fr) Bun, Svelte
      ],
    )[ ],
    activityEntry(
      from: datetime(year: 2023, month: 12, day: 24),
      title: pad(top: -1em / 4)[
        #gh-repo("dodok8/discord-aladin") #h(1fr) Bun, TypeScript
      ],
    )[ ],
  ),
)

#activityList(
  header: [
    == 커뮤니티 프로젝트
  ],
  (
    activityEntry(
      from: datetime(year: 2022, month: 10, day: 14),
      title: belonging([스태프], [GIST DEV NIGHT]),
    )[ ],
  ),
)

#align(center)[
  #text(size: 10pt, fill: palette.foreground2)[
    상기 이력은
    #datetime.today().display("[year]년 [month]월 [day]일")
    기준입니다
  ]
]
