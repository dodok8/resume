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
          #text(weight: 700)[#metadata.name.real-korean]
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
#set text(font: "Pretendard", fallback: true)
#show heading: set text(size: 16pt)

= #text(size: 32pt)[#metadata.name.real-korean#super[#upper[#metadata.name.real-english]]]
#text(size: 12pt)[
  #text(weight: 900, tracking: 2pt)[#metadata.role]
  // #text(weight: 600)[\@]
  // #text(weight: 700, tracking: 1pt)[#metadata.location]
]

#{
  set text(size: 10pt)
  grid(
    columns: (1fr, 1fr),
    grid(
      columns: (auto, 1fr),
      column-gutter: 16pt,
      row-gutter: 8pt,
      [#icon("lucide/mail") *전자 우편*], link("mailto:" + metadata.email)[#metadata.email],
      [#icon("lucide/phone") *전화*], link("tel:" + metadata.phone.join())[#metadata.phone.join(" ")],
    ),
    grid(
      columns: (auto, 1fr),
      column-gutter: 16pt,
      row-gutter: 8pt,
      // [#icon("lucide/house") *주소*], metadata.address,
      [#icon("lucide/calendar") *생년월일*], metadata.birthday,
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
  #text(size: 13pt, weight: 900, top-edge: 5pt, bottom-edge: 5pt)[
    자기소개
  ] \
  #metadata.bio.ko.title \ #text(size: 10pt)[#metadata.bio.ko.body]
]

#line(length: 100%, stroke: 0.75pt)

== 기술 및 역량
#grid(
  columns: (1fr, 1fr),
  [
    - React, React-Native
      - 다수의 웹 앱 제작 경험 및 모바일 앱 제작 경험
      - 운영 중인 레거시 앱의 TypeScript 마이그레이션 경험
      - Redux 를 통한 상태관리 설계 경험
    - Bun
      - Bun 테스트 러너 기반 테스트 스크립트 작성 경험
      - TypeScript 기반 앱 작성 및 배포 경험
    - Svelte
      - 라이브 서비스 중인 웹 앱 개발 경험
    - Git, Github, Github-actions
      - Git과 GitHub 을 이용한 프로젝트 관리에 능숙
      - GitHub Actions를 이용한 배포 자동화 경험
  ],
  [
    - TypeScript
      - 다수의 TypeScript 앱 작성 경험
      - 서비스 중인 앱 TypeScript 마이그레이션 경험
    - SQL
     - 시계열 데이터 관리를 위한 데이터 스키마 설계 경험
    - CI / CD
     - fly.io, Cloudflare Pages 를 통한 통한 배포 경험
     - 다수의 Dockerfile 검토 및 오류 수정 경험
    - 커뮤니케이션
     - 다년 간의 개발팀 운영 및 관리로 소통에 능숙
     - 개발 컨퍼런스 운영 및 발표 경험
     - 오픈소스 번역 및 코드 기여, 오픈소스 프로덕트 운영 경험
  ],
)

// 번 대신에 TDD 역량을 적는 식으로 변경
// 왜냐? 대부분 회사는 테스트를 원하지 번을 원하지 않음
// 코드 베이스 파악 능력 : 기존 레거시 코드에 대한 
// 테스트 능력
// 문서화 능력
// 프로토타입 제작 능력: 해커톤
// 또 빼먹은 능력 뭐 있지?
// AI 활용능력
// 커뮤니케이션 역량


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


// 개발 프로젝트들 통합하기


#activityList(
  header: [
    == 팀 개발 프로젝트
  ],
  (
    activityEntry(
      from: datetime(year: 2025, month: 4, day: 2),
      to: datetime.today(),
      title: pad(top: -1em / 4)[
        #link("https://play.google.com/store/apps/details?id=com.beside04.haruNyang&hl=ko")[#icon("lucide/earth") 하루냥] #h(1fr) Next.js, TanStack-Query, Flutter
      ],
    )[
      AI를 통한 위로 및 답변을 받을 수 있는 일기 어플리케이션.
      - Flutter 기반 앱에서 하이브리드 웹 앱 전환 담당
        - REST API 기반 OAuth 로그인(카카오, 애플, 구글)
        // 앱인 토스 내용으로 변경
    ],
    activityEntry(from: datetime(year: 2022, month: 12, day: 21), title: pad(top: -1em / 4)[
      gsainfoteam/Infoteam-frontend-template #h(1fr) React, Vite, Styled-Component
    ])[
      교내 개발팀 Infoteam 내부에 사용되는 프론트엔드 템플릿
      - 기존 프로젝트 안티 패턴(스타일 시트의 낮은 코드 응집성, i81n을 고려하지 않은 설계) 및 반복적인 세팅 분석 담당
      // 말 순서 좀 바꿔서 코드 분석 능력을 강조할 수 있을까?
    ],
    activityEntry(from: datetime(year: 2022, month: 8, day: 21), title: pad(top: -1em / 4)[
      #gh-repo("Regulus-JunctionXAsia2022/Widget") #h(1fr) React, Vite
    ])[
      Junction Asia 2022 해커톤 출품작. 메타버스 플랫폼 Zep 에서 돌아가는 가상 펫 플랫폼 Zepp을 제작함
      - Zep 클라이언트 내부에서 실행되는 웹 앱 제작 담당
    ],
    activityEntry(
      from: datetime(year: 2022, month: 3, day: 10),
      to: datetime(year: 2022, month: 7, day: 10),
      title: pad(top: -1em / 4)[
        #gh-repo("SmartX-Labs/SmartX-Mini") #h(1fr) GitHub, Docker
      ],
    )[
      IOT 웹 및 네트워크 인프라 실험 SmartX-Mini 조교
      - Kafka로 IoT 장비를 연결하는 InterConnect Lab 실험 자료 담당
      - 자료 및 예시 도커파일에서 버전 호환성으로 인한 버그 추적 및 버전 고정
      - 실험 수업 진행 단위별 스프린트 회의 진행, 교육 자료 개선
      - Git 과 markdown 으로 교육자료 변경 사항 추적 및 관리
    ],
    activityEntry(
      from: datetime(year: 2021, month: 7, day: 23),
      to: datetime(year: 2021, month: 12, day: 23),
      title: pad(top: -1em / 4)[
        Pedalers/wheelie-ts-android #h(1fr) React Native, TypeScript
      ],
    )[
      자전거 여행객을 위한 관광 플랫폼 Wheelie 제작 및 출시
      - React Navigation 을 통한 화면 설계 담당
      - Redux 기반 위치 및 계정 정보 저장 설계 담당
    ],
    activityEntry(from: datetime(year: 2021, month: 5, day: 30), title: pad(top: -1em / 4)[
      #gh-repo("JunctionX-Seoul-Caffeine/Calmmuter") #h(1fr) React
    ])[
      JunctionXSeoul 2021 수상작. 교통약자를 위한 맞춤 택시 플랫폼 Calmmuter 기획 #h(1fr) #link("https://velog.io/@dodok8/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%ED%9A%8C%EA%B3%A0%EB%A1%9D-JunctionXSeoul-2021-Team-Caffeine")[#icon("lucide/earth") #underline[참여후기]]
      - 팀 의사결정 기록 담당
      - 시연용 웹 앱 제작 담당
    ],
    activityEntry(
      from: datetime(year: 2020, month: 7, day: 10),
      to: datetime(year: 2021, month: 5, day: 30),
      title: pad(top: -1em / 4)[
        GISTORY #h(1fr) React, Vite, TypeScript
      ],
    )[
      GIST 학생을 위한 리액트 기반 BBS 커뮤니티
      - REST API 활용 및 상태관리 설계
      - Vite 마이그레이션을 통한 빌드 및 배포 시간 개선
      - TypeScript 마이그레이션 제안 및 리팩토링 주도
    ],
  ),
)

#activityList(
  header: [
    == 1인 개발 프로젝트
  ],
  (
    activityEntry(from: datetime(year: 2025, month: 2, day: 22), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/Ilots-log") #h(1fr) Bun, Svelte
    ])[
      리듬게임 Rotaeno를 위한 사용자 곡 기록 및 추천 시스템 #h(1fr) #link("https://Ilots-log.pages.dev")[#icon("lucide/earth") #underline[사이트]]
      - Bun을 통한 위키 크롤러 스크립트 코드 세팅 및 테스트 코드 작성 단순화
      - Class Rune 을 이용한 상태관리
        - 사용자 점수 데이터 및 레이팅 계산 로직 단순화
      - Google Drive 연동을 통한 정보 저장
      - AVIF 포맷 사용으로 앨범아트 용량 최적화

      // AI 활용 적어 보기
    ],
    activityEntry(from: datetime(year: 2023, month: 12, day: 24), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/discord-aladin") #h(1fr) Bun, TypeScript
    ])[
      알라딘 Open API를 활용한 도서 정보 공유 디스코드 챗봇
      - user install 형태로 서버에 상관없이 이용가능
    ],
  ),
)

#activityList(
  header: [
    == 커뮤니티 프로젝트
  ],
  (
    activityEntry(from: datetime(year: 2022, month: 10, day: 14), title: belonging([스태프], [GIST DEV NIGHT]))[
      GIST 내 개발자를 위한 컨퍼런스 GIST DEV NIGHT 파일럿 프로그램을 기획 및 운영 #h(1fr) #link("https://gistnews.co.kr/?p=5929")[#icon("lucide/earth") #underline[교내 기사]]
      - Code of Conduct 작성, 발표자 선정, 네트워킹 세션 진행을 담당
      - CRA에서 Vite 전환 과정을 발표 #h(1fr) #link("https://github.com/dodok8/vite-migrate")[#underline[#icon("lucide/earth") 발표자료]]
    ],
  ),
)

== 오픈 소스 코드 기여

// - #gh-pull-rich(gh-pull("https://github.com/fabian-hiller/valibot/pull/429"))
//   #pad(left: 1em)[Schema 검증 라이브러리]

#gh-repo("httptoolkit/brotli-wasm") #link("https://github.com/httptoolkit/brotli-wasm/pull/29")[
  PR \#29 Fix Error(#28) in exports field in package.json
]
#pad(left: 1em)[
  - package.json의 더 이상 지원되지 않는 type 필드로 인한 타입 인식 에러
  - 지원되지 않는 types 필드 대신, exports 내에 types 필드를 추가하여 해결
]

#gh-repo("velopert/velog-client") #link(
  "https://github.com/velopert/velog-client/pull/477",
)[PR \#477 Fix post.ts 쿼리 오타]
#pad(left: 1em)[
  - 블로그 서비스 Velog 에서 2023.12.26 - 2023.12.29. 기간 동안 글 등록 불가 오류 발생
  - 게시물 수정시 수정 완료된 게시물을 불러오는 Graph QL 댓글 관련 쿼리문에서 오타 발견, 이를 수정하여 해결함
]
// 과정에서 느낀 걸 적어라. 유닛 테스트의 중요성, 문서화의 중요성, 로그의 중요성

#workExpList(
  header: [
    == 교육
  ],
  (
    workExpEntry(
      from: datetime(year: 2018, month: 2, day: 12),
      to: datetime(year: 2023, month: 2, day: 20),
      role: "전기전자컴퓨터공학부 학사",
      organization: "광주과학기술원(GIST)",
    )[
      - 컴퓨터 네트워크, 컴퓨터 시스템 이론 및 실습, 프로그래밍 언어와 컴파일러 등 전공과목 수강
      - 심리학 부전공 과정 수료
    ],
  ),
)

#workExpList(
  header: [
    == 경력
  ],
  (
    workExpEntry(
      from: datetime(year: 2023, month: 6, day: 5),
      to: datetime(year: 2025, month: 2, day: 4),
      role: "해군 빅데이터 분석병",
      organization: "계근단 본부대대",
    )[
      군 복무 중 수행한 프로젝트, 이를 통해 외부 소프트웨어가 제한 된 환경에서 직접 기하 알고리즘 구현 및 활용 / JS 가 없는 환경에서의 UI 구성 경험을 해볼 수 있었음.
      - 감정 분석 결과 활용을 위한 챗봇형 Streamlit 웹 클라이언트 #h(1fr) Python, HTML, CSS
      - openpyxl을 이용한 엑셀로 입출력이 가능하도록 웹 클라이언트 개선 #h(1fr) Python
      - Tkinter 를 이용한 물리 시뮬레이션 구현 #h(1fr) Python
    ],
    workExpEntry(
      from: datetime(year: 2021, month: 12, day: 18),
      to: datetime(year: 2023, month: 2, day: 17),
      role: "학부 인턴",
      organization: "GIST NetAI Lab",
      homepage: link("https://netai.smartx.kr/")[netai.smartx.kr],
    )[
      NetAI 랩 학부 인턴으로서 진행한 프로젝트
      - #icon("lucide/book") #link("https://www.dbpia.co.kr/journal/articleDetail?nodeId=NODE11224575")[교통 CCTV 엣지에서 비식별화를 위한 wasm 앱 구현 및 논문 출판] #h(1fr) Rust, wasm
        - Rust 로 작성된 wasm 앱을 이용하여 엣지 단에서 일부 자료를 삭제하는 비식별화 구현
      - #gh-repo("SmartX-Labs/SmartX-Mini") #h(1fr) GitHub, Docker
      - #gh-repo("dodok8/AI_SUMMER_2022") #h(1fr) Python
        - Kafka를 이용한 메세지 전송, YoLo를 이용한 객체 검출 실습 진행
    ],
    workExpEntry(
      from: datetime(year: 2018, month: 4, day: 14),
      to: datetime(year: 2023, month: 2, day: 24),
      role: "프론트엔드 엔지니어",
      organization: "GIST 학생회 인포팀",
    )[
      GIST 내부의 문제를 개발로서 해결하는 학생 개발팀, 인포팀 소속으로서 진행한 프로젝트
      - 리액트 팀 스터디 진행 및 팀 회의록 작성
      - GISTORY #h(1fr) React, Vite, TypeScript
      - 프론트엔드 템플릿 저장소 #h(1fr) React, Vite, TypeScript
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
        [#link(
            "https://kto.visitkorea.or.kr/upload/flexer/upload/ktobiz/20211118/73f1fa76-480f-11ec-83c5-df9c32bb7038.hwp.files/Sections1.html",
          )[제품/서비스 개발 부분 우수상]],
        [2021 관광데이터 활용 공모전],
      ),
    )[
      - 자전거 여행객 플랫폼 Wheelie
    ],
    activityEntry(from: datetime(year: 2021, month: 7, day: 23), title: belonging(
      [AutoCrypt Track 2#super("nd") Winner],
      [JunctionXSeoul 2021],
    ))[
      - 교통 약자를 위한 택시앱 Calmmuter
    ],
  ),
)


// #pagebreak()
// #set par(first-line-indent: (
//   amount: 0.75em,
//   all: true,
// ))

// == 자기소개서
// 이력서에 못 담은 제가 거쳐온 행동들에 담겨있는 자세한 스토리를 자기소개서에 담았습니다.

// === 지원 동기: 왜 프론트엔드 개발자인가?

// === 가장 큰 깨달음: 개발자는 협력을 해야 한다.

// === 협력의 여정: 오픈소스

// 여러 개 해봤자 정신없어서 못 본다. 내 역량을 강조할 수 있는 그런 부분에 대해 집중해서 느낀 거, 성장한 거를 강조한다.