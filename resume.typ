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
          #text(weight: 600, tracking: 1pt)[소프트웨어 엔지니어]
          \@
          #text(weight: 600, tracking: 0.5pt)[#metadata.location]
        ]
      ]
    },
  ),
  footer-descent: 0pt,
  footer: [
    #pad(left: -0.4cm)[
      #text(size: 10pt, fill: color.rgb("#575049"))[
        상기 이력은 #datetime.today().display("[year]년 [month]월 [day]일 기준입니다")
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
          fill: color.rgb("#000000"),
          stroke: none,
          radius: (top-left: 25%, top-right: 25%, bottom-left: 25%, bottom-right: 25%),
        )[
          #place(
            horizon + center,
          )[
            #text(fill: color.rgb("#ffffff"), weight: 900, number-width: "tabular")[
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
  #text(weight: 900, tracking: 2pt)[소프트웨어 엔지니어]
  #text(weight: 600)[\@]
  #text(weight: 700, tracking: 1pt)[#metadata.location]
]

#text(
  size: 16pt,
  weight: 600,
)[
  #set par(leading: 8pt)
  사람과 컴퓨터 사이를 *이어주는* 소프트웨어를 만듭니다 \
  #text(size: 13pt)[Building Softwares *Connecting* People with Computers]
]

#{
  set text(size: 10pt)
  grid(columns: (1fr, 1.5fr), grid(
    columns: (auto, 1fr),
    column-gutter: 16pt,
    row-gutter: 8pt,
    [#icon("lucide/mail") *전자 우편#super[Mailbox]*],
    link("mailto:me@ranolp.dev")[me\@ranolp.dev],
    [#icon("lucide/phone") *전화#super[Phone]*],
    link("tel:+821095426545")[+82 10 9542 6545],
  ), grid(
    columns: (auto, 1fr),
    column-gutter: 16pt,
    row-gutter: 8pt,
    [#icon("devicon/github") *GitHub*],
    link("https://github.com/RanolP")[\@RanolP],
    [#icon("logos/twitter") *Twitter*],
    link("https://twitter.com/RanolP_777")[\@RanolP_777],
    [#icon-solved-ac() *solved.ac*],
    link("https://solved.ac/profile/asdhugh1")[
      #solved-ac-profile("asdhugh1")
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
        ("devicon/typescript", "TS"),
        ("devicon/javascript", "JS"),
        ("devicon/css3", "CSS"),
        ("devicon/react", [React #sym.and React Native]),
        ("skill-icons/nextjs-light", "Next.js"),
        ("devicon/solidjs", "Solid.js"),
        ("devicon/tailwindcss", "Tailwind CSS"),
        ("logos/unocss", "UnoCSS"),
        ("devicon/eslint", "ESLint"),
      ).map(
        ((icon-name, caption)) => (icon(icon-name, size: 16pt, bottom: 0pt), text(size: 8pt)[#caption]),
      ),
    )
    #enumerate(
      (
        ("devicon/rust", "Rust"),
        ("devicon/kotlin", "Kotlin"),
        ("devicon/swift", "Swift"),
        ("devicon/bash", "Bash"),
        ("devicon/gradle", "Gradle"),
        ("devicon/git", "Git"),
        ("devicon/github", "GitHub"),
        ("devicon/githubactions", "GitHub Actions"),
      ).map(
        ((icon-name, caption)) => (icon(icon-name, size: 16pt, bottom: 0pt), text(size: 8pt)[#caption]),
      ),
    )
  ]
]

== 경력#super[Work Experiences]

#workExpList(
  (
    workExpEntry(
      from: datetime(year: 2023, month: 3, day: 20),
      to: datetime.today(),
      role: "프론트엔드 엔지니어",
      organization: "주식회사 라프텔(Laftel)",
      homepage: link("https://laftel.oopy.io")[laftel.oopy.io],
    )[
      애니메이션 OTT 서비스 라프텔에서 React와 React Native를 활용한 웹/앱 개발을 맡았습니다. 수행한 주요 업무는 다음과 같습니다.
      - Firebase를 활용한 A/B 테스트
      - react-email과 tailwindcss를 활용한 이메일 템플릿 생성 및 관리, CI 연동 작업
    ],
  ),
)

#activityList(
  header: [
    == 기타 활동#super[Other Activities]
  ],
  (
    activityEntry(
      from: datetime(year: 2023, month: 11, day: 17),
      title: belonging([해커톤 멘토 #sym.and 심사위원], [쿠씨톤]),
    )[
      #link("https://kucc.co.kr/")[#text(
          fill: color.rgb("#1c7ed6"),
        )[#underline[KUCC]#sub[Korea University Computer Club]]]에서 주최한 2023년 쿠씨톤에서 해커톤
      멘토 및 심사위원을 맡아 Django, React, Pygame 등을 사용하는 멘티들을 서포트하고, 작품을 심사했습니다.
    ],
    activityEntry(
      from: datetime(year: 2022, month: 9, day: 20),
      title: "NYPC 2022 특별상",
    )[],
  ),
)

#activityList(
  header: [
    == 프로젝트#super[Projects]
  ],
  (
    activityEntry(
      from: datetime(year: 2023, month: 10, day: 29),
      title: pad(top: -1em / 4)[
        #grid(columns: (1fr, auto), link(
          "https://github.com/psl-lang/psl",
        )[#icon("devicon/github", bottom: -1em / 6) psl-lang/psl], [
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/rust") Rust
          ]
        ])
      ],
    )[ 알고리즘 문제 해결에 활용하기 좋은 프로그래밍 언어를 설계하고 만들었습니다. 간단한 입출력과 사칙 연산, 반복문 및 조건문을 사용할 수
      있습니다. 컴파일 결과물로는 백준 온라인 저지 및 CodeForces에 제출할 수 있는 C 코드를 생성해냅니다. ],
    activityEntry(
      from: datetime(year: 2022, month: 8, day: 21),
      title: pad(top: -1em / 4)[
        #grid(columns: (1fr, auto), link(
          "https://github.com/RanolP/crowdin-strife",
        )[#icon("devicon/github", bottom: -1em / 6) RanolP/crowdin-strife], [
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/rust") Rust
          ]
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/mysql") MySQL
          ]
        ])
      ],
    )[ Minecraft 번역 커뮤니티 사용자들이 기존 번역례 및 외전 게임 텍스트를 쉽게 찾아볼 수 있도록 봇을 제작했습니다 ],
    activityEntry(
      from: datetime(year: 2022, month: 1, day: 9),
      title: pad(top: -1em / 4)[
        #grid(columns: (1fr, auto), link(
          "https://github.com/RanolP/measurrred",
        )[#icon("devicon/github", bottom: -1em / 6) RanolP/measurrred], [
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/rust") Rust
          ]
        ])
      ],
    )[ WinAPI를 활용해 작업 표시줄에 CPU 사용량, 남은 배터리 등의 정보를 보여줄 수 있도록 커스텀 위젯을 제작할 수 있는 프로그램을
      만들었습니다\
      \ ],
    activityEntry(
      from: datetime(year: 2021, month: 12, day: 10),
      title: pad(top: -1em / 4)[
        #grid(columns: (1fr, auto), link(
          "https://github.com/RanolP/bojodog",
        )[#icon("devicon/github", bottom: -1em / 6) RanolP/bojodog], [
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/typescript") TypeScript
          ]
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/webpack") Webpack
          ]
        ])
      ],
    )[ VS Code 안에서 백준 온라인 저지 문제를 확인할 수 있는 간단한 VS Code 확장을 만들었습니다 ],
    activityEntry(
      from: datetime(year: 2021, month: 11, day: 27),
      title: pad(top: -1em / 4)[
        #grid(columns: (1fr, auto), link(
          "https://github.com/RanolP/bojoke",
        )[#icon("devicon/github", bottom: -1em / 6) RanolP/bojoke], [
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/typescript") TypeScript
          ]
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/vitejs") Vite
          ]
        ])
      ],
    )[ prosemirror를 활용해 백준 온라인 저지의 양식으로 문제 본문을 편집할 수 있는 WYSIWYG 에디터를 구현했습니다 ],
    activityEntry(
      from: datetime(year: 2021, month: 1, day: 4),
      title: pad(top: -1em / 4)[
        #grid(columns: (1fr, auto), link(
          "https://github.com/RanolP/rano-lang",
        )[#icon("devicon/github", bottom: -1em / 6) RanolP/rano-lang], [
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/rust") Rust
          ]
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/wasm") WebAssembly
          ]
        ])
      ],
    )[ WebAssembly로 컴파일되는 작은 프로그래밍 언어를 만들어 함수 선언 및 호출, if ~ else 문 등을 구현했습니다. ],
    activityEntry(
      from: datetime(year: 2020, month: 10, day: 9),
      title: pad(top: -1em / 4)[
        #grid(columns: (1fr, auto), link(
          "https://github.com/RanolP/dalmoori-font",
        )[#icon("devicon/github", bottom: -1em / 6) RanolP/dalmoori-font], [
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/nodejs") Node.js
          ]
        ])
      ],
    )[ 한글날을 기념해 현대 한글 11,172자를 전부 지원하는 8 #sym.times 8 도트풍 한글 글꼴 '달무리'를 만들었습니다. 현재 산돌
      무료 폰트 중 하나로 등재되어 있습니다. ],
    activityEntry(
      from: datetime(year: 2020, month: 6, day: 21),
      title: pad(
        top: -1em / 4,
      )[
        #grid(
          columns: (1fr, auto),
          link(
            "https://github.com/solvedac/unofficial-documentation",
          )[#icon("devicon/github", bottom: -1em / 6) solvedac/unofficial-documentation],
          [
            #chip[
              #set text(size: 8pt, weight: 600)
              #icon("devicon/openapi") OpenAPI
            ]
          ],
        )
      ],
    )[ 알고리즘 문제풀이 커뮤니티, #link(
        "https://solved.ac/",
      )[#icon-solved-ac() #underline[#text(fill: color.rgb("#1c7ed6"))[solved.ac]]]의
      API를 비공식적으로 OpenAPI 규격에 맞게 문서화했습니다 ],
    activityEntry(
      from: datetime(year: 2020, month: 5, day: 13),
      title: pad(top: -1em / 4)[
        #grid(columns: (1fr, auto), link(
          "https://github.com/hanzzok",
        )[#icon("devicon/github", bottom: -1em / 6) hanzzok], [
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/rust") Rust
          ]
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/wasm") WebAssembly
          ]
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/typescript") TypeScript
          ]
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/nextjs") Next.js
          ]
        ])
      ],
    )[ Markdown의 대안으로 쓸 수 있는 마크업 언어를 설계해 HTML로 컴파일하는 Rust 구현체를 작성했습니다. 이후, 해당 구현을
      WebAssembly로 컴파일해 웹페이지에서 실행하는 놀이터를 만들었습니다. ],
    activityEntry(
      from: datetime(year: 2020, month: 4, day: 8),
      title: pad(top: -1em / 4)[
        #grid(columns: (1fr, auto), link(
          "https://github.com/RanolP/boj",
        )[#icon("devicon/github", bottom: -1em / 6) RanolP/boj], [
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/typescript") TypeScript
          ]
          #chip[
            #set text(size: 8pt, weight: 600)
            #icon("devicon/playwright") Playwright
          ]
        ])
      ],
    )[ 백준 온라인 저지에 문제를 제출하고, 성공 여부를 바탕으로 특정일에 푼 문제 및 사용 언어 통계들을 제공하는 툴체인을 개발했습니다 ],
  ),
)

== 오픈소스 기여#super[Open Source Contributions]

- *motiondivision/motionone*
  - #gh-pull("https://github.com/motiondivision/motionone/pull/244")
- *resend/react-email*
  - #gh-pull("https://github.com/resend/react-email/pull/884")
- *daangn/stackflow*
  - #gh-pull("https://github.com/daangn/stackflow/pull/274")
- *solved-ac/ui-react*
  - #gh-pull("https://github.com/solved-ac/ui-react/pull/5")
