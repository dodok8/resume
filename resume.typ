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
], workExpEntry(
  from: datetime(year: 2024, month: 6, day: 5),
  to: datetime.today(),
  role: "해군 빅데이터분석병",
  organization: "계룡대 근무지원단 본부대대",
)[
  해군 빅데이터분석병으로서 데이터 분석업무에 아래와 같이 참여하였습니다.
  - 텍스트 데이터 분석
  - 데모 페이지 제작
],))

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
      title: pad(
        top: -1em / 4,
      )[
        #grid(columns: (1fr, auto), gh-repo("psl-lang/psl"), [ #tech-chips.rust ])
      ],
    )[ 알고리즘 문제 해결에 활용하기 좋은 프로그래밍 언어를 설계하고 만들었습니다. 간단한 입출력과 사칙 연산, 반복문 및 조건문을 사용할 수
      있습니다. 컴파일 결과물로는 백준 온라인 저지 및 CodeForces에 제출할 수 있는 C 코드를 생성해냅니다. ],
    activityEntry(
      from: datetime(year: 2022, month: 8, day: 21),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          gh-repo("RanolP/crowdin-strife"),
          [ #tech-chips.rust ],
        )
      ],
    )[ Minecraft 번역 커뮤니티 사용자들이 기존 번역례 및 외전 게임 텍스트를 쉽게 찾아볼 수 있도록 봇을 제작했습니다 ],
    activityEntry(
      from: datetime(year: 2022, month: 1, day: 9),
      title: pad(top: -1em / 4)[
        #grid(
          columns: (1fr, auto),
          gh-repo("RanolP/measurrred"),
          [ #tech-chips.rust ],
        )
      ],
    )[
      WinAPI를 활용해 작업 표시줄에 CPU 사용량, 남은 배터리 등의 정보를 보여줄 수 있도록 커스텀 위젯을 제작할 수 있는 프로그램을
      만들었습니다
    ],
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
