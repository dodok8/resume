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
      [#icon("lucide/mail") *전자 우편*], link("mailto:" + metadata.email)[#metadata.email],
      [#icon("lucide/phone") *전화*], link("tel:" + metadata.phone.join())[#metadata.phone.join(" ")],
      [#icon("devicon/github") *GitHub*],
      link("https://github.com/" + metadata.social.github)[\@#metadata.social.github],
    ),
    grid(
      columns: (auto, 1fr),
      column-gutter: 16pt,
      row-gutter: 8pt,
      [#icon("lucide/house") *주소*], metadata.address,
      [#icon("lucide/calendar") *생년월일*], metadata.birthday
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

== 기술

- #tech-chips.react-and-react-native
  - 다수의 웹 앱 제작 경험 및 모바일 앱 제작 경험
  - Redux 를 통한 상태관리에 능숙함
- #tech-chips.svelte
  - 라이브 서비스 중인 웹 앱 개발 경험
  - Svelte 5에 도입된 Rune 에 능숙
- #tech-chips.bun
  - Bun 테스트 러너 기반 테스트 스크립트 작성 경험
  - TS 기반 앱 작성 및 배포 경험
- #tech-chips.python
  - Tkinter를 통한 GUI 앱 제작 가능
  - Streamlit, Gradio 를 통한 AI 모델을 위한 웹 앱 작성에 능숙
- #tech-chips.git #tech-chips.github #tech-chips.github-actions
  - Git과 GitHub 을 이용한 프로젝트 관리에 능숙
  - GitHub Actions를 이용한 배포 자동화 경험


// #box(inset: (left: 8pt, top: 4pt))[
//   #align(center)[
//     #for row in (
//       (
//         tech-list.typescript--short,
//         tech-list.javascript--short,
//         tech-list.html,
//         tech-list.css,
//         tech-list.react-and-react-native,
//         tech-list.svelte,
//         tech-list.vite,
//         tech-list.bun,
//       ),
//       (
//         tech-list.rust,
//         tech-list.python,
//         tech-list.docker,
//         tech-list.wasm,
//         tech-list.git,
//         tech-list.github,
//         tech-list.github-actions,
//       ),
//     ) {
//       set text(size: 8pt)
//       enumerate(row.map(tech => (icon(tech.icon, size: 16pt, bottom: 0pt), tech.label)))
//     }
//   ]
// ]

#line(length: 100%, stroke: 0.75pt)

#workExpList(
  header: [
    == 경력

    특정 집단 소속으로 진행한 그 외 프로젝트들입니다.
  ],
  (
    workExpEntry(
      from: datetime(year: 2023, month: 6, day: 5),
      to: datetime(year: 2025, month: 2, day: 4),
      role: "해군 빅데이터 분석병",
      organization: "계근단 본부대대",
    )[
      군 복무 중 수행한 프로젝트입니다. \
      - 감정 분석 결과 활용을 위한 챗봇형 웹 클라이언트 #h(1fr) Python, HTML, CSS
        - 감정 분석 결과를 사용자가 다루기 익숙한 UI인 챗봇 형태로 Streamlit 을 이용하여 구현
      - 데이터셋 감정 분석 결과 엑셀 입출력 #h(1fr) Python
        - openpyxl을 이용하여 엑셀로 입출력이 가능하도록 웹 클라이언트 개선
      - Tkinter를 이용한 GUI 구성 #h(1fr) Python
        - Tkinter 를 이용하여 간단한 물리 시뮬레이션 구현
    ],
    workExpEntry(
      from: datetime(year: 2021, month: 12, day: 18),
      to: datetime(year: 2023, month: 2, day: 17),
      role: "학부 인턴",
      organization: "GIST NetAI Lab",
      homepage: link("https://netai.smartx.kr/")[netai.smartx.kr],
    )[
      NetAI 랩 학부 인턴으로서 진행한 프로젝트입니다.
      - #icon("lucide/book") #link("https://www.dbpia.co.kr/journal/articleDetail?nodeId=NODE11224575")[교통 CCTV 엣지에서 비식별화를 위한 wasm 앱 구현 및 논문 출판] #h(1fr) Rust, Wasm

        - 엣지 컴퓨팅 환경에서 스냅샷 전송
        - Rust 로 작성된 wasm 앱을 이용하여 엣지 단에서 일부 자료를 삭제하는 비식별화 구현

      - #gh-repo("SmartX-Labs/SmartX-Mini") #h(1fr) GitHub, Docker

        - IOT 웹 및 네트워크 인프라 실험 SmartX-Mini 조교
        - Inter Connect Lab 메인 조교 담당
          - 라즈베리 파이와 본 PC 사이에 Kafka 를 이용한 연결을 만드는 InterConnect Lab 실습 진행
        - 자료 버그 수정 및 Git 과 markdown 으로 교육자료 변경 사항 추적 및 관리
        - deprecated 될 내용은 미리 표시하여 다음 년도 교육자료 제작과 연계

      - #gh-repo("dodok8/AI_SUMMER_2022") #h(1fr) Python

        - 고등학생을 대상으로 한 비전 AI 및 IOT 실습 진행
    ],
    workExpEntry(
      from: datetime(year: 2018, month: 4, day: 14),
      to: datetime(year: 2023, month: 2, day: 24),
      role: "프론트엔드 엔지니어",
      organization: "GIST 학생회 인포팀",
    )[
      GIST 내부의 문제를 개발로서 해결하는 인포팀 소속으로서 진행한 프로젝트입니다.
      - GISTORY #h(1fr) React, Vite, TypeScript
        - GIST 학생을 위한 리액트 기반 BBS 커뮤니티
        - 주요 기여
          - UI/UX 설계
          - Vite 마이그레이션
          - Redux 기반 상태 관리
          - TypeScript 마이그레이션

      - 프론트엔드 템플릿 저장소 #h(1fr) React, Vite, TypeScript
        - GISTORY 제작 이후, GISTORY를 반면교사 삼아 최적의 세팅을 공유하기 위한 저장소
        - 주요 기여
          - GISTORY 문제점 분석 및 템플릿 방향 조율
          - Yarn TS 플러그인 세팅
    ],
  ),
)

#activityList(
  header: [
    == 프로그래밍 프로젝트
  ],
  (
    activityEntry(
      from: datetime(year: 2025, month: 2, day: 22),
      title: pad(top: -1em / 4)[
        [1인 개발] #gh-repo("dodok8/Ilots-log") #h(1fr) Bun, Svelte
      ],
    )[
      리듬게임 Rotaeno를 위한 사용자 곡 기록 및 추천 시스템. 1인 개발.

      - URL: https://Ilots-log.pages.dev
      - 주요 기능
        - 유저 점수 입력 후 레이팅 계산
        - Best 30 차트 및 차트 이미지 다운로드
        - 기록 갱신 곡 추천 기능
        - 구글 드라이브 백업 기능
      - Class Rune 을 이용한 상태관리
        - 사용자 점수 데이터 및 레이팅 계산 로직 단순화
        - Google Drive 연동 코드 단순화
      - 이미지 프록시 사용으로 베스트30 차트 제작 단순화 및 용량 최적화.
    ],
    activityEntry(
      from: datetime(year: 2023, month: 12, day: 24),
      title: pad(top: -1em / 4)[
        [1인 개발]#gh-repo("dodok8/discord-aladin") #h(1fr) Bun, TypeScript
      ],
    )[
      알라딘 Open API를 활용한 도서 정보 공유 디스코드 챗봇. 1인 개발.

      - 주요 기능
        - `search` : 디스코드 내에서 알라딘 검색 결과 보여주기. 페이지네이션 가능
        - `show` : 알라딘 검색 결과에서 한 책을 골라 상세 정보 임베딩 제공
        - user install 형태로 서버에 상관없이 이용가능
    ],
    activityEntry(
      from: datetime(year: 2022, month: 8, day: 21),
      title: pad(top: -1em / 4)[
        [팀 프로젝트]#gh-repo("Regulus-JunctionXAsia2022/Widget") #h(1fr) React, Vite
      ],
    )[
      Junction Asia 2022 해커톤 출품작. 메타버스 플랫폼 Zep 에서 돌아가는 가상 펫 플랫폼 Zepp을 제작함
      - 내부 웹앱 제작 담당
    ],
    activityEntry(
      from: datetime(year: 2021, month: 7, day: 23),
      title: pad(top: -1em / 4)[
        [팀 프로젝트]#gh-repo("Pedalers/wheelie-ts-android") #h(1fr) React Native, TypeScript
      ],
    )[
      - 자전거 여행객을 위한 관광 플랫폼 Wheelie 제작.

      - 주요 기능
        - 자전거 여행에 적합한 여행지 정보 제공
        - 여행지 주변 지도 및 관광정보 제공

      - 주요 기여
        - React Navigation 을 통한 화면 설계
        - Redux 기반 상태 관리
    ],
  ),
)

#v(10pt)
#activityList(
  header: [
    == 커뮤니티 프로젝트
  ],
  (
    activityEntry(
      from: datetime(year: 2022, month: 10, day: 14),
      title: belonging([스태프], [GIST DEV NIGHT]),
    )[
      GIST 내 개발자를 위한 컨퍼런스 #link(
        "https://gistnews.co.kr/?p=5929",
      )[#underline[GIST DEV NIGHT 파일럿 프로그램]]을 기획 및 운영.
      - Code of Conduct 작성, 발표자 선정, 네트워킹 세션 진행을 담당
      - #link("https://github.com/dodok8/vite-migrate")[#underline[CRA에서 Vite 전환 과정]]을 발표
    ],
  ),
)

#activityList(
  header: [
    == 수상
  ],
  (
    activityEntry(
      from: datetime(year: 2021, month: 11, day: 18),
      title: belonging(
        [#link("https://kto.visitkorea.or.kr/upload/flexer/upload/ktobiz/20211118/73f1fa76-480f-11ec-83c5-df9c32bb7038.hwp.files/Sections1.html")[제품/서비스 개발 부분 우수상]],
        [2021 관광데이터 활용 공모전],
      ),
    )[
      - 자전거 여행객 플랫폼 Wheelie
    ],
    activityEntry(
      from: datetime(year: 2021, month: 7, day: 23),
      title: belonging([AutoCrypt Track 2#super("nd") Winner], [JunctionXSeoul 2021]),
    )[
      - 교통 약자를 위한 택시앱 Calmmuter
    ],
  ),
)

== 오픈소스 기여

// - #gh-pull-rich(gh-pull("https://github.com/fabian-hiller/valibot/pull/429"))
//   #pad(left: 1em)[Schema 검증 라이브러리]

- #gh-repo("httptoolkit/brotli-wasm") #link("https://github.com/httptoolkit/brotli-wasm/pull/29")[
    PR \#29 Fix Error(#28) in exports field in package.json
  ]
  #pad(left: 1em)[
    - package.json의 더 이상 지원되지 않는 type field 로 인한 타입 인식 에러
    - 지원 안되는 타입 필드 대신, 새 형식에 맞춘 타입 필드를 추가하여 해결
  ]

- #gh-repo("velopert/velog-client") #link("https://github.com/velopert/velog-client/pull/477")[PR \#477 Fix post.ts 쿼리 오타]
  #pad(left: 1em)[
    - 블로그 서비스 Velog 에서 2023.12.26 - 2023.12.29. 기간 동안 글 등록 불가 오류 발생
    - 해당 원인인 잘못된 쿼리를 찾아 수정
  ]
