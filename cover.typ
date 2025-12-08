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
  font: "RIDIBatang",
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

== 기술 및 역량
- React, React-Native, Svelte 사용 능력
- Git, Github 을 통한 협업
- TypeScript / JavaScript
- CI / CD 개선 경험
- 테스트 코드 작성 능력
- 문서화를 통한 협업 능력


#workExpList(
  header: [
    == 경력
  ],
  (
    workExpEntry(
      from: datetime(year: 2021, month: 12, day: 18),
      role: "학부 인턴",
      organization: "GIST NetAI Lab",
      homepage: link("https://netai.smartx.kr/")[netai.smartx.kr],
    )[],
  ),
)

#activityList(
  header: [
    == 개발 경험
  ],
  (
    activityEntry(
      from: datetime(year: 2025, month: 7, day: 4),
      title: pad(top: -1em / 4)[
        2025 OSSCA Fedify 트랙 #h(1fr) TypeScript, ActivityPub
      ],
    )[],
    activityEntry(
      from: datetime(year: 2025, month: 4, day: 2),
      title: pad(top: -1em / 4)[
        #link("https://play.google.com/store/apps/details?id=com.beside04.haruNyang&hl=ko")[#icon("lucide/earth") 하루냥] #h(1fr) React-Router, TanStack-Query, Flutter
      ],
    )[],
    activityEntry(from: datetime(year: 2025, month: 2, day: 22), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/Ilots-log") #h(1fr) SvelteKit
    ])[],
    activityEntry(from: datetime(year: 2024, month: 12, day: 29), title: pad(top: -1em / 4)[
      #gh-repo("velopert/velog-client") #h(1fr) GraphQL
    ])[],
    activityEntry(from: datetime(year: 2023, month: 12, day: 24), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/discord-aladin") #h(1fr) Bun, Discord.js
    ])[],
    activityEntry(from: datetime(year: 2022, month: 12, day: 21), title: pad(top: -1em / 4)[
      gsainfoteam/Infoteam-frontend-template #h(1fr) React, Vite, Styled-Component
    ])[],
    activityEntry(
      from: datetime(year: 2022, month: 3, day: 10),
      title: pad(top: -1em / 4)[
        #gh-repo("SmartX-Labs/SmartX-Mini") #h(1fr) GitHub, Docker
      ],
    )[],
  ),
)


#align(center)[
  #text(size: 10pt, fill: palette.foreground2)[
    상기 이력은
    #datetime.today().display("[year]년 [month]월 [day]일")
    기준입니다
  ]
]
