#import "modules/util.typ": *
#import "modules/activity.typ": *
#import "modules/components.typ": *
#import "modules/github.typ": *
#import "modules/solved-ac.typ": *
#import "metadata.typ": metadata

#set page(
  paper: "a4",
  margin: (top: 1.5cm, left: 1.5cm, right: 1.5cm, bottom: 2cm),
  header: locate(
    loc =>
    if loc.page() != 1 {
      pad(
        left: -0.4cm,
      )[
        #text(
          fill: color.rgb("#575049"),
        )[
          #text(weight: 700)[#metadata.name.nickname / #metadata.name.real-korean]
          ---
          #text(weight: 600, tracking: 1pt)[#metadata.role]
          \@
          #text(weight: 600, tracking: 0.5pt)[#metadata.location]
        ]
      ]
    },
  ),
  footer-descent: 0pt,
  footer: [
    #pad(left: -0.4cm, bottom: -0.4pt)[
      #text(size: 10pt, fill: color.rgb("#575049"))[
        상기 이력은
        #datetime.today().display("[year]년 [month]월 [day]일")
        기준입니다
      ]
    ]
    #align(
      right,
    )[
      #pad(
        top: -1cm,
        right: -0.5cm,
      )[
        #square(
          size: 24pt,
          fill: none,
          stroke: none,
          radius: (top-left: 25%, top-right: 25%, bottom-left: 25%, bottom-right: 25%),
        )[
          #place(
            horizon + center,
          )[
            #text(fill: color.rgb("#04041B"), weight: 900, number-width: "tabular")[
              #counter(page).display("1")
            ]
          ]
        ]
      ]
    ]
  ],
)
#set text(font: "Pretendard", features: ("ss06",), fallback: true)
#show heading: set text(size: 16pt)

= #text(
  size: 32pt,
)[#metadata.name.nickname / #metadata.name.real-korean#super[#upper[#metadata.name.real-english]]]
#text(size: 12pt)[
  #text(weight: 900, tracking: 2pt)[#metadata.role]
  #text(weight: 600)[\@]
  #text(weight: 700, tracking: 1pt)[#metadata.location]
]

#text(size: 16pt, weight: 600)[
  #set par(leading: 8pt)
  #metadata.bio.ko \ #text(size: 13pt)[#metadata.bio.en]
]

#{
  set text(size: 10pt)
  grid(columns: (1fr, 1.5fr), grid(
    columns: (auto, 1fr),
    column-gutter: 16pt,
    row-gutter: 8pt,
    [#icon("lucide/mail") *전자 우편#super[Mailbox]*],
    link("mailto:" + metadata.email)[#metadata.email],
    [#icon("lucide/phone") *전화#super[Phone]*],
    link("tel:" + metadata.phone.join())[#metadata.phone.join(" ")],
  ), grid(
    columns: (auto, 1fr),
    column-gutter: 16pt,
    row-gutter: 8pt,
    [#icon("devicon/github") *GitHub*],
    link(
      "https://github.com/" + metadata.social.github,
    )[\@#metadata.social.github],
    [#icon("logos/twitter") *Twitter*],
    link(
      "https://twitter.com/" + metadata.social.twitter,
    )[\@#metadata.social.twitter],
    [#icon-solved-ac() *solved.ac*],
    link("https://solved.ac/profile/" + metadata.social.solved-ac)[
      #solved-ac-profile(metadata.social.solved-ac)
    ],
  ))
}

#line(length: 100%)

== 기술#super[Skills]

#box(
  inset: (left: 8pt, top: 4pt),
)[
  #align(
    center,
  )[
    #enumerate(
      (
        tech-list.typescript--short,
        tech-list.javascript--short,
        tech-list.html,
        tech-list.css,
        tech-list.react-and-react-native,
        tech-list.svelte,
        tech-list.rust,
        tech-list.wasm,
        tech-list.git,
        tech-list.github,
        tech-list.github-actions,
      ).map(
        tech => (icon(tech.icon, size: 16pt, bottom: 0pt), text(size: 8pt)[#tech.label]),
      ),
    )
  ]
]

#workExpList(header: [
  == 경력#super[Work Experiences]
], (workExpEntry(
  from: datetime(year: 2021, month: 12, day: 18),
  to: datetime(year: 2023, month: 2, day: 17),
  role: "학부 인턴",
  organization: "GIST NetAI Lab",
  homepage: link("https://netai.smartx.kr/")[netai.smartx.kr],
)[
  NetAI 랩 학부 인턴으로서 다음과 같은 업무를 진행하였습니다.
  - wasm을 이용한 엣지 컴퓨팅에서 AI 학습 데이터 수집 및 이용 검증
  - 웹 및 네트워크 인프라 실험 강의 SmartX-Mini 문서 업데이트 및 버그 수정
  - 고등학생을 위한 비전 AI 및 IOT 실습 자료 제작
], 
// workExpEntry(
//   from: datetime(year: 2023, month: 6, day: 5),
//   to: datetime.today(),
//   role: "해군 빅데이터분석병",
//   organization: "계룡대 근무지원단 본부대대",
// )[
//   해군 빅데이터분석병으로서 텍스트 데이터 감정 분석 업무를 수행했습니다.
// ],
))

#activityList(
  header: [
    == 기타 활동#super[Other Activities]
  ],
  (
    activityEntry(
      from: datetime(year: 2022, month: 10, day: 14),
      title: belonging([스태프], [GIST DEV NIGHT]),
    )[
      #link(
        "https://gistnews.co.kr/?p=5929",
      )[GIST 내 개발자를 위한 컨퍼런스 GIST DEV NIGHT 파일럿 프로그램]을 기획 및 운영하였습니다. 운영자로서 Code of Conduct 작성, 발표자 선정, 네트워킹 세션 진행을 담당하였고, 발표자로서 #link("https://github.com/dodok8/vite-migrate")[CRA에서 Vite 전환 과정]을 소개하였습니다.
    ],
    activityEntry(
      from: datetime(year: 2018, month: 10, day: 14),
      to: datetime(year: 2024, month: 2, day: 24),
      title: belonging([프론트엔드 엔지니어], [GIST 학생회 Infoteam]),
    )[
      GIST 학생회 산하 개발팀 Infoteam에서 프론트엔드 엔지니어로서 문서화 및 기획, 디자인, 프론트엔드 개발 템플릿 제작,
      SPA 제작, 교육 및 단체 스터디 활동을 진행하였습니다.
    ],
    activityEntry(
      from: datetime(year: 2021, month: 11, day: 18), 
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          belonging([제품/서비스 개발 부분 우수상], [2021 관광데이터 활용 공모전]),
          [ #tech-chips.react-and-react-native ],
        )
      ],
    )[
      한국관광공사 2021 관광데이터 활용 공모전에서, 자전거 여행객을 위한 어플리케이션 Wheelie를 제작하여 #link("https://kto.visitkorea.or.kr/upload/flexer/upload/ktobiz/20211118/73f1fa76-480f-11ec-83c5-df9c32bb7038.hwp.files/Sections1.html")[우수상]을 받았습니다.
    ],
    activityEntry(
      from: datetime(year: 2021, month: 7, day: 23),
      title: belonging([AutoCrypt Track 2#super("nd") Winner], [JunctionXSeoul 2021]),
    )[
      JunctionXSeoul 2021 해커톤에서 Team Caffeine의 프론트엔드 개발자로 참가하여, 교통약자를 위한 택시 플랫폼 #link(
        "https://github.com/JunctionX-Seoul-Caffeine/Calmmuter-PPT/blob/main/0AUTO_Caffeine_PPT.pdf",
      )[#text(fill: color.rgb("#1c7ed6"))[#underline[Calmmuter]]]를 고안, 트랙 2#super("nd") Winner를 수상하였습니다.
    ],

  ),
)

#activityList(
  header: [
    == 프로젝트#super[Projects]
  ],
  (
    activityEntry(
      from: datetime(year: 2024, month: 2, day: 3),
      to: datetime.today(),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          gh-repo("Svelte-Korea/learn.svelte.kr"),
          [ #tech-chips.svelte ],
        )
      ],
    )[
      스벨트 공식 튜토리얼의 한국어 커뮤니티 번역본 #link("https://learn.svelte.kr")[https://leanr.svelte.kr] 메인테이너로 참가하고 있습니다.
    ],
    activityEntry(
      from: datetime(year: 2024, month: 1, day: 24),
      title: pad(top: -1em / 4)[
          #gh-repo("dodok8/rhodes-theme")
      ],
    )[
      Visual Studio Code를 위한 에디터 테마입니다.
    ],
    activityEntry(
      from: datetime(year: 2023, month: 12, day: 17),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          gh-repo("dodok8/discord-aladin"),
          [ #tech-chips.typescript ],
        )
      ],
    )[ Discord.js 와 bun을 이용해 알라딘 도서 검색 결과 및 상세 정보를 Discord에서 간단히 공유할 수 있는 봇을 만들었습니다.],
    activityEntry(
      from: datetime(year: 2023, month: 12, day: 17),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          gh-repo("dodok8/discord-aladin"),
          [ #tech-chips.typescript ],
        )
      ],
    )[ Discord.js 와 bun을 이용해 알라딘 도서 검색 결과 및 상세 정보를 Discord에서 간단히 공유할 수 있는 봇을 만들었습니다.],
    activityEntry(
      from: datetime(year: 2022, month: 10, day: 23),
      title: pad(
        top: -1em / 4,
      )[
        #grid(columns: (1fr, auto), link("https://gistory.me")[#icon("lucide/earth") GISTORY], [#tech-chips.react, #tech-chips.typescript, #tech-chips.vite ])
      ],
    )[ GIST 학생을 위한 커뮤티니 사이트. 프론트엔드 엔지니어로서 UI/UX 설계 및 Typescript 마이그레이션, Vite 마이그레이션, 문서화를 진행했습니다.],
    activityEntry(
      from: datetime(year: 2022, month: 5, day: 29),
      title: gh-repo("SmartX-Labs/SmartX-Mini"),
    )[ GIST 컴퓨터 시스템 및 실습 과목에 사용되는 네트워크 인프라 실습 실험 SmartX Mini 자료의 오류와 문제 사항을 수정하고 Git을 통해 문서 변경 사항을 추적할 수 있게 바꾸었습니다.],
  ),
)

== 오픈소스 기여#super[Open Source Contributions]

- #gh-repo("fabian-hiller/valibot")
  - #gh-pull("https://github.com/fabian-hiller/valibot/pull/429")
- #gh-repo("velopert/velog-client")
  - #gh-pull("https://github.com/velopert/velog-client/pull/477")
- #gh-repo("httptoolkit/brotli-wasm")
  - #gh-pull("https://github.com/httptoolkit/brotli-wasm/pull/29")
- #gh-repo("giscus/giscus")
  - #gh-pull("https://github.com/giscus/giscus/pull/1266")
  - #gh-pull("https://github.com/giscus/giscus/pull/253")