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
      from: datetime(year: 2018, month: 10, day: 14),
      to: datetime(year: 2024, month: 2, day: 24),
      title: belonging([프론트엔드 엔지니어], [GIST 학생회 Infoteam]),
    )[
      GIST 학생회 산하 정보국 소속 개발팀 Infoteam에서 프론트엔드 엔지니어로서 문서화, 업무 프로세스 개선, 프로젝트 관리, 디자인,
      SPA 제작, 교육 및 단체 스터디 활동을 진행하였습니다.
    ],
    activityEntry(
      from: datetime(year: 2021, month: 7, day: 23),
      title: belonging([AutoCrypt Track 2#super("nd") Winner], [Team Caffeine]),
    )[
      JunctionXSeoul 2021 해커톤에서 Team Caffeine의 프론트엔드 개발자로 참고, 교통약자를 위한 택시 플랫폼 #link(
        "https://github.com/JunctionX-Seoul-Caffeine/Calmmuter-PPT/blob/main/0AUTO_Caffeine_PPT.pdf",
      )[#text(fill: color.rgb("#1c7ed6"))[#underline[Calmmuter]]]를 고안하였습니다.
    ],
    activityEntry(
      from: datetime(year: 2022, month: 10, day: 14),
      title: belonging([리드 스태프], [GIST DEV NIGHT]),
    )[
      #link(
        "https://gistnews.co.kr/?p=5929",
      )[GIST 내 개발자를 위한 컨퍼런스 GIST DEV NIGHT 파일럿 프로그램 기획 및 운영.] Code of Conduct 작성, #link("https://github.com/dodok8/vite-migrate")[CRA에서 Vite 전환]을
      주제로 발표 진행하였습니다.
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
    )[ 지스트 학생을 위한 커뮤티니 사이트. 프론트엔드 엔지니어로서 UI/UX 설계 및 Typescript 마이그레이션, Vite 마이그레이션, 문서화 진행했습니다.],
    activityEntry(
      from: datetime(year: 2021, month: 12, day: 10),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          gh-repo("RanolP/bojodog"),
          [ #tech-chips.typescript ],
        )
      ],
    )[ VS Code 안에서 백준 온라인 저지 문제를 확인할 수 있는 간단한 VS Code 확장을 만들었습니다 ],
    activityEntry(
      from: datetime(year: 2021, month: 11, day: 27),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          gh-repo("RanolP/bojoke"),
          [ #tech-chips.typescript #tech-chips.vite ],
        )
      ],
    )[ prosemirror를 활용해 백준 온라인 저지의 양식으로 문제 본문을 편집할 수 있는 WYSIWYG 에디터를 구현했습니다 ],
    activityEntry(
      from: datetime(year: 2021, month: 1, day: 4),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          gh-repo("RanolP/rano-lang"),
          [ #tech-chips.rust #tech-chips.wasm ],
        )
      ],
    )[ WebAssembly로 컴파일되는 작은 프로그래밍 언어를 만들어 함수 선언 및 호출, if ~ else 문 등을 구현했습니다. ],
    activityEntry(
      from: datetime(year: 2020, month: 10, day: 9),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          gh-repo("RanolP/dalmoori-font"),
          [ #tech-chips.typescript ],
        )
      ],
    )[ 한글날을 기념해 현대 한글 11,172자를 전부 지원하는 8 #sym.times 8 도트풍 한글 글꼴 '달무리'를 만들었습니다. 현재 산돌
      무료 폰트 중 하나로 등재되어 있습니다. ],
    activityEntry(
      from: datetime(year: 2020, month: 5, day: 13),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          link(
            "https://github.com/hanzzok",
          )[#icon("devicon/github", bottom: -1em / 6) hanzzok],
          [ #tech-chips.rust #tech-chips.wasm #tech-chips.typescript ],
        )
      ],
    )[ Markdown의 대안으로 쓸 수 있는 마크업 언어를 설계해 HTML로 컴파일하는 Rust 구현체를 작성했습니다. 이후, 해당 구현을
      WebAssembly로 컴파일해 웹페이지에서 실행하는 놀이터를 만들었습니다. ],
    activityEntry(
      from: datetime(year: 2020, month: 4, day: 8),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          gh-repo("RanolP/boj"),
          [ #tech-chips.typescript ],
        )
      ],
    )[ 백준 온라인 저지에 문제를 제출하고, 성공 여부를 바탕으로 특정일에 푼 문제 및 사용 언어 통계들을 제공하는 툴체인을 개발했습니다 ],
  ),
)

== 오픈소스 기여#super[Open Source Contributions]

- #gh-repo("typst/typst")
  - #gh-pull("https://github.com/typst/typst/pull/3522")
- #gh-repo("motiondivision/motionone")
  - #gh-pull("https://github.com/motiondivision/motionone/pull/244")
- #gh-repo("resend/react-email")
  - #gh-pull("https://github.com/resend/react-email/pull/884")
- #gh-repo("daangn/stackflow")
  - #gh-pull("https://github.com/daangn/stackflow/pull/274")
- #gh-repo("solved-ac/ui-react")
  - #gh-pull("https://github.com/solved-ac/ui-react/pull/5")
