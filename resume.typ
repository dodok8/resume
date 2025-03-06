#import "modules/util.typ": *
#import "modules/activity.typ": *
#import "modules/components.typ": *
#import "modules/github.typ": *
#import "modules/solved-ac.typ": *
#import "metadata.typ": metadata


#set page(
  paper: "a4",
  margin: (top: 1.5cm, left: 1.5cm, right: 1.5cm, bottom: 1.8cm),
  header: context {
    if here().page() != 1 {
      pad(left: -0.4cm)[
        #text(fill: color.rgb("#575049"))[
          #text(weight: 700)[#metadata.name.nickname / #metadata.name.real-korean]
          ---
          #text(weight: 600, tracking: 0.5pt)[#metadata.bio.ko.title]
        ]
      ]
    }
  },
  footer-descent: 0pt,
  footer: [
    #pad(left: -0.4cm, top: 0.6cm, bottom: -0.01cm)[
      #text(size: 10pt, fill: color.rgb("#575049"))[
        상기 이력은
        #datetime.today().display("[year]년 [month]월 [day]일")
        기준입니다
      ]
    ]
    #align(right)[
      #pad(
        top: -1cm,
        right: -0.5cm,
      )[
        #square(
          size: 24pt,
          // fill: color.rgb("#000000"),
          stroke: none,
          radius: (top-left: 25%, top-right: 25%, bottom-left: 25%, bottom-right: 25%),
        )[
          #place(horizon + center)[
            #text(fill: color.rgb("#222222"), weight: 900, number-width: "tabular")[
              #context {
                counter(page).display("1")
              }
            ]
          ]
        ]
      ]
    ]
  ],
)
#set text(font: "Pretendard", features: ("ss06",), fallback: true)
#show heading: set text(size: 16pt)

= #text(size: 32pt)[#metadata.name.nickname / #metadata.name.real-korean#super[#upper[#metadata.name.real-english]]]
#text(size: 12pt)[
  #text(weight: 900, tracking: 2pt)[#metadata.role]
  #text(weight: 600)[\@]
  #text(weight: 700, tracking: 1pt)[#metadata.location]
]

#{
  set text(size: 10pt)
  grid(
    columns: (1fr, 1.5fr),
    grid(
      columns: (auto, 1fr),
      column-gutter: 16pt,
      row-gutter: 8pt,
      [#icon("lucide/mail") *전자 우편#super[Mailbox]*], link("mailto:" + metadata.email)[#metadata.email],
      [#icon("lucide/phone") *전화#super[Phone]*], link("tel:" + metadata.phone.join())[#metadata.phone.join(" ")],
    ),
    grid(
      columns: (auto, 1fr),
      column-gutter: 16pt,
      row-gutter: 8pt,
      [#icon("devicon/github") *GitHub*],
      link("https://github.com/" + metadata.social.github)[\@#metadata.social.github],

      // [#icon("logos/twitter") *Twitter*],
      // link("https://twitter.com/" + metadata.social.twitter)[\@#metadata.social.twitter],

      // [#icon-solved-ac() *solved.ac*],
      // link("https://solved.ac/profile/" + metadata.social.solved-ac)[
      //   #solved-ac-profile(metadata.social.solved-ac)
      // ],
    ),
  )
}


#text(size: 14pt, weight: 400)[
  #set par(leading: 8pt)
  #text(size: 8pt, weight: 900, top-edge: -0pt, bottom-edge: 0pt)[
    자기소개 #sym.dash.em #text(tracking: 2pt)[INTRODUCTION]
  ] \
  #metadata.bio.ko.title \ #text(size: 10pt)[#metadata.bio.ko.body]
]

#line(length: 100%, stroke: 0.75pt)

== 기술#super[Skills]

#box(inset: (left: 8pt, top: 4pt))[
  #align(center)[
    #for row in (
      (
        tech-list.typescript--short,
        tech-list.javascript--short,
        tech-list.html,
        tech-list.css,
        tech-list.react-and-react-native,
        tech-list.svelte,
        tech-list.vite,
        tech-list.bun,
      ),
      (
        tech-list.rust,
        tech-list.python,
        tech-list.docker,
        tech-list.wasm,
        tech-list.git,
        tech-list.github,
        tech-list.github-actions,
      ),
    ) {
      set text(size: 8pt)
      enumerate(row.map(tech => (icon(tech.icon, size: 16pt, bottom: 0pt), tech.label)))
    }
  ]
]

#line(length: 100%, stroke: 0.75pt)

#workExpList(
  header: [
    == 경력#super[Work Experiences]
  ],
  (
    workExpEntry(
      from: datetime(year: 2023, month: 6, day: 5),
      to: datetime(year: 2025, month: 2, day: 4),
      role: "해군 빅데이터 분석병",
      organization: "계근단 본부대대",
    )[
      군 복무 중 해군 빅데이터 분석병으로서 다음과 같은 프로그래밍 업무를 수행했습니다. \
      - #pad(top: -1em / 4)[
          감정 분석 결과 활용을 위한 챗봇형 웹 클라이언트 #h(1fr) #tech-chips.python #tech-chips.html #tech-chips.css
        ]
      - #pad(top: -1em / 4)[
          데이터셋 감정 분석 결과 엑셀 입출력력 #h(1fr) #tech-chips.python
        ]
      - #pad(top: -1em / 4)[
          Tkinter를 이용한 GUI 구성 #h(1fr) #tech-chips.python
        ]
    ],
    //   workExpEntry(
    //     from: datetime(year: 2021, month: 12, day: 18),
    //     to: datetime(year: 2023, month: 2, day: 17),
    //     role: "학부 인턴",
    //     organization: "GIST NetAI Lab",
    //     homepage: link("https://netai.smartx.kr/")[netai.smartx.kr],
    //   )[
    //     NetAI 랩 학부 인턴으로서 다음과 같은 업무를 진행하였습니다.
    //     - #pad(top: -1em / 4)[
    //         #icon("lucide/book") #link("https://www.dbpia.co.kr/journal/articleDetail?nodeId=NODE11224575")[교통 CCTV 엣지에서 비식별화를 위한 wasm 앱 구현 및 논문 출판] #h(1fr) #tech-chips.rust #tech-chips.wasm--short
    //       ]
    //     - #pad(top: -1em / 4, bottom: -1em / 4)[
    //         #gh-repo("SmartX-Labs/SmartX-Mini") #h(1fr) #tech-chips.github #tech-chips.docker
    //       ]
    //       - 웹 및 네트워크 인프라 실험 SmartX-Mini 조교.
    //       - IOT 랩 자료 버그 수정 및 형식 최신화. 실습 진행 및 오류 수정 스프린트 담당.
    //     - #pad(top: -1em / 4, bottom: -1em / 4)[
    //         #gh-repo("dodok8/AI_SUMMER_2022") #h(1fr) #tech-chips.python
    //       ]
    //       - 기존 자료 버그 수정 및 고등학생을 대상으로 한 비전 AI 및 IOT 실습 진행
    //   ],
  ),
)

#v(10pt)
#workExpList(
  header: [
    == 학력#super[Educations]
  ],
  (
    workExpEntry(
      from: datetime(year: 2018, month: 2, day: 27),
      to: datetime(year: 2023, month: 2, day: 17),
      role: "전기전자컴퓨터공학부",
      organization: "광주과학기술원",
    )[
      - GIST 전기전자컴퓨터공학부 학사
        - 심리학 부전공 과정 진행
    ],
  ),
)

#v(10pt)
#activityList(
  header: [
    == 수상 및 기타 활동#super[Award & Other Activities]
  ],
  (
    // activityEntry(
    //   from: datetime(year: 2022, month: 9, day: 28),
    //   title: belonging([스피커], [GIST DEV NIGHT]),
    // )[
    //   GIST 내 개발자를 위한 컨퍼런스 GIST DEV NIGHT 에서 발표하였습니다.
    //   - #link("https://onedrive.live.com/personal/26d5f0494768fc4b/_layouts/15/Doc.aspx?sourcedoc=%7B6cfb09d6-974c-4702-931d-0ed9845fc60f%7D&action=default&redeem=aHR0cHM6Ly8xZHJ2Lm1zL3AvYy8yNmQ1ZjA0OTQ3NjhmYzRiL0VkWUotMnhNbHdKSGt4ME8yWVJmeGc4Ql95YmRVT3kwV1B4UExXNnJCd3J5Q2c_ZT1kYzJiOWY&slrid=05e385a1-a040-8000-2d28-52e66d036627&originalPath=aHR0cHM6Ly8xZHJ2Lm1zL3AvYy8yNmQ1ZjA0OTQ3NjhmYzRiL0VkWUotMnhNbHdKSGt4ME8yWVJmeGc4Ql95YmRVT3kwV1B4UExXNnJCd3J5Q2c_cnRpbWU9al91VFFOOVgzVWc&CID=c0a6d1fa-d799-4ed3-9d1d-d6aaf85d13e0&_SRM=0:G:36&file=%ec%82%ac%ec%9a%a9%ec%9e%90%eb%a5%bc%20%ec%84%a4%eb%93%9d%ed%95%98%ea%b8%b0_ver2.pptx")[#underline[사용자를 기만하고 조종하기 - 기만적 디자인]]
    // ],
    workExpEntry(
      from: datetime(year: 2021, month: 12, day: 18),
      to: datetime(year: 2023, month: 2, day: 17),
      role: "학부 인턴",
      organization: "GIST NetAI Lab",
      homepage: link("https://netai.smartx.kr/")[netai.smartx.kr],
    )[
      NetAI 랩 학부 인턴으로서 다음과 같은 업무를 진행하였습니다.
      - #pad(top: -1em / 4)[
          #icon("lucide/book") #link("https://www.dbpia.co.kr/journal/articleDetail?nodeId=NODE11224575")[교통 CCTV 엣지에서 비식별화를 위한 wasm 앱 구현 및 논문 출판] #h(1fr) #tech-chips.rust #tech-chips.wasm--short
        ]
      - #pad(top: -1em / 4, bottom: -1em / 4)[
          #gh-repo("SmartX-Labs/SmartX-Mini") #h(1fr) #tech-chips.github #tech-chips.docker
        ]
        - IOT 웹 및 네트워크 인프라 실험 SmartX-Mini 조교.
        - 자료 버그 수정 및 형식 최신화. 실습 진행 및 오류 수정 스프린트 담당.
      - #pad(top: -1em / 4, bottom: -1em / 4)[
          #gh-repo("dodok8/AI_SUMMER_2022") #h(1fr) #tech-chips.python
        ]
        - 기존 자료 버그 수정 및 고등학생을 대상으로 한 비전 AI 및 IOT 실습 진행
    ],
    workExpEntry(
      from: datetime(year: 2018, month: 4, day: 14),
      to: datetime(year: 2024, month: 2, day: 24),
      role: "프론트엔드 엔지니어",
      organization: "GIST 학생회 인포팀",
    )[
      지스트 내부의 문제를 개발로서 해결하는 인포팀 소속 프론트엔드 엔지니어로서 다음과 같은 일을 진행하였습니다.
      - 내부 문서화 담당 및 스프린트 진행 담당
      - React 및 프론트엔드 자체 스터디
      - #pad(top: -1em / 4)[
          #icon("lucide/earth") GISTORY #h(1fr) #tech-chips.react #tech-chips.vite #tech-chips.typescript--short
        ]
        - GIST 학생을 위한 BBS 커뮤니티. UI / UX 설계, TypeScript, Vite 마이그레이션 진행
    ],
    activityEntry(
      from: datetime(year: 2022, month: 10, day: 14),
      title: belonging([스태프], [GIST DEV NIGHT]),
    )[
      GIST 내 개발자를 위한 컨퍼런스 #link(
        "https://gistnews.co.kr/?p=5929",
      )[#underline[GIST DEV NIGHT 파일럿 프로그램]]을 기획 및 운영하였습니다.
      - Code of Conduct 작성, 발표자 선정, 네트워킹 세션 진행을 담당
      - #pad(top: -1em / 4, bottom: -1em / 4)[
          #link("https://github.com/dodok8/vite-migrate")[#underline[CRA에서 Vite 전환 과정]]을 발표 #h(1fr) #tech-chips.vite
        ]
    ],
    activityEntry(
      from: datetime(year: 2021, month: 11, day: 18),
      title: belonging(
        [#link("https://kto.visitkorea.or.kr/upload/flexer/upload/ktobiz/20211118/73f1fa76-480f-11ec-83c5-df9c32bb7038.hwp.files/Sections1.html")[제품/서비스 개발 부분 우수상]],
        [2021 관광데이터 활용 공모전],
      ),
    )[
      자전거 여행객을 위한 어플리케이션 Wheelie 제작
      - #pad(top: -1em / 4, bottom: -1em / 4)[
          안드로이드 앱, 내부 지도 웹앱 제작 담당 #h(1fr) #tech-chips.react-and-react-native
        ]
    ],
    activityEntry(
      from: datetime(year: 2021, month: 7, day: 23),
      title: belonging([AutoCrypt Track 2#super("nd") Winner], [JunctionXSeoul 2021]),
    )[
      교통약자를 위한 택시 맞춤 앱 #link(
        "https://github.com/JunctionX-Seoul-Caffeine/Calmmuter-PPT/blob/main/0AUTO_Caffeine_PPT.pdf",
      )[#text(fill: color.rgb("#1c7ed6"))[#underline[Calmmuter]]]를 기획
      - #pad(top: -1em / 4, bottom: -1em / 4)[
          시연용 앱 제작 및 회의록 담당 #h(1fr) #tech-chips.react
        ]
    ],
  ),
)

#activityList(
  header: [
    == 프로젝트#super[Projects]
  ],
  (
    activityEntry(
      from: datetime(year: 2025, month: 2, day: 22),
      title: pad(top: -1em / 4)[
        #gh-repo("dodok8/Ilots-log") #h(1fr) #tech-chips.bun #tech-chips.svelte
      ],
    )[
      리듬게임 Rotaeno를 위한 사용자 곡 기록 및 추천 시스템
      - Bun으로 작성된 위키 크롤러와 Svelte 5로 작성된 웹 앱
    ],
    activityEntry(
      from: datetime(year: 2023, month: 12, day: 24),
      title: pad(top: -1em / 4)[
        #gh-repo("dodok8/discord-aladin") #h(1fr) #tech-chips.bun #tech-chips.typescript--short
      ],
    )[
      알라딘 Open API를 활용한 도서 정보 공유 디스코드 챗봇
    ],
    activityEntry(
      from: datetime(year: 2022, month: 8, day: 21),
      title: pad(top: -1em / 4)[
        #gh-repo("Regulus-JunctionXAsia2022/Widget") #h(1fr) #tech-chips.react #tech-chips.vite
      ],
    )[
      Junction Asia 2022 해커톤 출품작. 메타버스 플랫폼 Zep 에서 돌아가는 가상 펫 플랫폼 Zepp을 제작함
      - 내부 웹앱 제작 담당
    ],
  ),
)

== 오픈소스 기여#super[Open Source Contributions]

#for (url,) in metadata.oss-contribs {
  gh-pull-req(url)
}
#{
  let pulls = metadata.oss-contribs.map(((url,)) => gh-pull(url))
  let groups = pulls.map(pull => pull.nameWithOwner).dedup()
  for group in groups.filter(group => group != none) {
    [
      - #gh-repo(group)
        #for pull in pulls.filter(pull => pull.nameWithOwner == group) {
          [
            - #gh-pull-rich(pull)
          ]
        }
    ]
  }
}
