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
#set text(font: "RIDIBatang", fallback: true)
#set par(leading: 0.8em)
#show heading: set text(size: 16pt)

= #text(size: 32pt)[#metadata.name.real-korean#super[#upper[#metadata.name.real-english]]]
#text(size: 12pt)[
  #text(weight: 900, tracking: 2pt)[#metadata.role]
]

#set text(size: 10pt)
#grid(
  columns: (0.5fr, 1fr),
  grid(
    columns: (auto, 1fr),
    column-gutter: 10pt,
    row-gutter: 8pt,
    [#icon("lucide/mail") *전자 우편*], pad(top: +1em / 4)[#link("mailto:" + metadata.email)[#metadata.email]],
    [#icon("lucide/phone") *전화*],
    pad(top: +1em / 4)[#link("tel:" + metadata.phone.join())[#metadata.phone.join(" ")]],

    [#icon("lucide/calendar") *생년월일*], pad(top: +1em / 4)[#metadata.birthday],
  ),
  grid(
    columns: (auto, 1fr),
    column-gutter: 10pt,
    row-gutter: 8pt,

    [#icon("devicon/github") *GitHub*],
    pad(top: +1em / 4)[#link("https://github.com/" + metadata.social.github)[\@#metadata.social.github]],

    [#icon("lucide/cat") *Hackers' pub*],
    pad(top: +1em / 4)[#link(
      "https://hackers.pub/" + metadata.social.hackerspub,
    )[#metadata.social.hackerspub\@hackers.pub]],

    [#icon("lucide/earth") *Portfolio*],
    pad(top: +1em / 4)[#link("https://dodok8.github.io/resume/portfolio.pdf")[dodok8.github.io/resume/portfolio.pdf]],
  ),
)

#line(length: 100%, stroke: 0.75pt)

#activityList(
  header: [
    == 개발 경험
  ],
  (
    activityEntry(
      from: datetime(year: 2026, month: 2, day: 11),
      to: datetime.today(),
      title: pad(top: -1em / 4)[
        #gh-repo("dodok8/gaji") #h(1fr) TypeScript, GitHub Actions, Rust
      ],
    )[
      GitHub Actions 워크플로우를 타입 안전하게 작성 후 YAML로 컴파일하는 CLI 도구 #h(1fr) #link("https://gaji.gaebalgom.work")[#icon("lucide/earth") #underline[문서]]
      - 사용되는 액션 목록을 파싱 후, action.yml 정의에서 TypeScript 타입을 자동 생성하여 IDE 자동완성 및 컴파일 시점 타입 체크 제공
      - Rust 단일 바이너리에 QuickJS를 내장하여 외부 런타임 없이 동작
      - 복합 액션(Composite Action) 및 재사용 가능한 워크플로우(Reusable Workflow) 등 다양한 기능 지원
    ],
    activityEntry(
      from: datetime(year: 2025, month: 7, day: 4),
      to: datetime.today(),
      title: pad(top: -1em / 4)[
        #gh-repo("fedify-dev/fedify") #h(1fr) TypeScript, ActivityPub#footnote("W3C에서 제정한 소셜 미디어 서비스들이 서로 소통할 수 있도록 하는 프로토콜 표준")
      ],
    )[
      ActivityPub 구현 및 테스트를 돕는 라이브러리
      - Fedify CLI nodeInfo 커맨드 개선
        - 색상 깨짐 오류, 아스키 아트 및 컬러 변환 테스트 코드 추가, 커맨드 이름 변경 및 리팩토링 \ (#link("https://github.com/fedify-dev/fedify/pull/282")[#icon("devicon/github") PR \#282], #link("https://github.com/fedify-dev/fedify/pull/299")[#icon("devicon/github") PR \#299], #link("https://github.com/fedify-dev/fedify/pull/327")[#icon("devicon/github") PR \#327], #link("https://github.com/fedify-dev/fedify/pull/331")[#icon("devicon/github") PR \#331], #link("https://github.com/fedify-dev/fedify/pull/414")[#icon("devicon/github") PR \#414])
      - \@fedify/elysia 패키지 제작
        - Bun 기반 백엔드 프레임워크 Elysia와 Fedify 의 통합 패키지 (#link("https://github.com/fedify-dev/fedify/pull/339")[#icon("devicon/github") PR \#339])
      - \@fedify/fresh 패키지 제작
        - Deno 기반 백엔드 프레임워크 Fresh와 Fedify 의 통합 패키지 (#link("https://github.com/fedify-dev/fedify/pull/478")[#icon("devicon/github") PR \#478])
      - Fedify NodeInfo 타입 변경
        - Fediverse Instance의 서버 정보를 담는 NodeInfo Protocol 2.1의 스펙과 실제 Fedify의 구현 차이를 해결함 (#link("https://github.com/fedify-dev/fedify/pull/365")[#icon("devicon/github") PR \#365], #link("https://github.com/fedify-dev/fedify/pull/433")[#icon("devicon/github") PR \#433])
      - Fedify 에서 Webfinger 커스텀이 가능하도록 API 확장 (#link("https://github.com/fedify-dev/fedify/pull/407")[#icon("devicon/github") PR \#407], #link("https://github.com/fedify-dev/fedify/pull/404")[#icon("devicon/github") PR \#404])
      - Fedify CI/CD 저장소 워크플로우 개선
        - 스폰서 목록 업데이트 workflow를 upstream에서만 작동하도록 변경 \ (#gh-repo("fedify-dev/sponsor-automation"))
    ],
    activityEntry(
      from: datetime(year: 2025, month: 7, day: 4),
      to: datetime.today(),
      title: pad(top: -1em / 4)[
        #gh-repo("fedify-dev/hollo") #h(1fr) TypeScript, Fedify
      ],
    )[
      Fedify 기반 1인 사용에 특화된 ActivityPub SNS
      - 타임라인에 작성시간이 미래인 게시물이 있는 경우, 최상단에 고정되는 문제를 해결함 (#link("https://github.com/fedify-dev/hollo/pull/201")[#icon("devicon/github") PR \#201])
      - Public이 아닌 리플이 공개되는 문제를 해결함. (#link("https://github.com/fedify-dev/hollo/pull/248")[#icon("devicon/github") PR \#248])
      - 로그인만 되어 있으면, 멘션되지 않은 사용자도 DM을 볼 수 있었던 문제를 해결함. (#link("https://github.com/fedify-dev/hollo/pull/255")[#icon("devicon/github") PR \#255])
    ],
    activityEntry(
      from: datetime(year: 2025, month: 7, day: 4),
      to: datetime.today(),
      title: pad(top: -1em / 4)[
        #gh-repo("fedify-dev/botkit") #h(1fr) TypeScript, Fedify
      ],
    )[
      Fedify 기반 ActivityPub 자동화 봇 프레임워크
      - BotKit 봇의 팔로우 목록 제공 프론트엔드 제작. (#link("https://github.com/fedify-dev/botkit/pull/13")[#icon("devicon/github") PR \#13])
      - BotKit 봇의 Remote Follow 구현 (#link("https://github.com/fedify-dev/botkit/pull/14")[#icon("devicon/github") PR \#14])
      \
    ],
    activityEntry(
      from: datetime(year: 2025, month: 11, day: 22),
      to: datetime.today(),
      title: pad(top: -1em / 4)[
        #gh-repo("hackers-pub/hackerspub") #h(1fr) Fedify, Solid, GraphQL
      ],
    )[
      Fedify 기반 IT 전문 오픈소스 SNS
      - 해쉬태그 탐색 로직 오류 해결 및 해쉬 태그 페이지 제작 (#link("https://github.com/hackers-pub/hackerspub/pull/171")[#icon("devicon/github") PR \#171])
    ],
    activityEntry(
      from: datetime(year: 2025, month: 4, day: 2),
      to: datetime.today(),
      title: pad(top: -1em / 4)[
        #link("https://play.google.com/store/apps/details?id=com.beside04.haruNyang&hl=ko")[#icon("lucide/earth") 하루냥] #h(1fr) React-Router, TanStack-Query, Flutter
      ],
    )[
      AI를 통한 위로 및 답변을 받을 수 있는 일기 어플리케이션 \
      웹뷰 전환 작업을 위한 웹 프론트엔드 담당 개발자로 기여 중
      - 앱인토스 미니앱 제작 : 기존 Flutter로 구성된 앱을 리액트로 재작성 및 API 연동
    ],
    activityEntry(from: datetime(year: 2025, month: 2, day: 22), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/Ilots-log") #h(1fr) SvelteKit
    ])[
      리듬게임 Rotaeno를 위한 사용자 곡 기록 및 추천 시스템 #h(1fr) #link("https://Ilots-log.pages.dev")[#icon("lucide/earth") #underline[사이트]]\
      - #gh-repo("dodok8/rotaeno-ch-wiki-crawler") #h(1fr) *Bun*
        - Bun기반 TypeScript 위키 크롤러
        - TDD로 엣지 케이스 관리 및 리팩토링 과정 단순화
      - Class Rune을 이용한 상태관리로 사용자 점수 데이터 및 레이팅 계산 로직 단순화
      - Google Drive 연동을 통한 다른 기기간 정보 연동
      - AVIF 포맷 사용으로 앨범아트 용량 최적화 (#link("https://github.com/dodok8/Ilots-log/pull/26")[#icon("devicon/github") PR \#26])
    ],
    activityEntry(from: datetime(year: 2023, month: 12, day: 29), title: pad(top: -1em / 4)[
      #gh-repo("velopert/velog-client") #h(1fr) GraphQL
    ])[
      블로그 서비스 Velog 에서 2023.12.26 - 2023.12.29. 기간 동안 글 수정 불가 오류 발생
      - 게시물 수정시 수정 완료된 게시물을 불러오는 Graph QL 댓글 관련 쿼리문의 버그 수정(#link("https://github.com/velopert/velog-client/pull/477")[#icon("devicon/github") PR \#477])
    ],
    activityEntry(from: datetime(year: 2023, month: 12, day: 24), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/discord-aladin") #h(1fr) Bun, Discord.js
    ])[
      알라딘 Open API를 활용한, user install 형태로 서버에 상관없이 이용 가능한 도서 정보 공유 디스코드 챗봇
      - Bun 기반으로 제작하여 빌드 및 TS 세팅 과정 단순화. Fly.io를 통한 GitHub 과 연동 배포 라인 구축.
      - 홈 서버로 이전 후 git HEAD의 해쉬를 비교하여 자동으로 업데이트를 하는 systemd 서비스를 작성.
    ],
    // activityEntry(from: datetime(year: 2022, month: 12, day: 21), title: pad(top: -1em / 4)[
    //   gsainfoteam/Infoteam-frontend-template #h(1fr) React, Vite, Styled-Component
    // ])[
    //   교내 개발팀 Infoteam 내부에 사용되는 프론트엔드 템플릿
    //   - 안티 패턴 분석: 기존 프로젝트들의 코드 베이스 분석 후, 스타일 시트의 낮은 코드 응집성, i18n을 고려하지 않은 설계 문제 발견 및 문서화
    //   - Yarn berry 설정: Yarn Plugin 설정을 통한 `@types` 설치 자동화
    // ],
    activityEntry(
      from: datetime(year: 2022, month: 3, day: 10),
      to: datetime(year: 2022, month: 7, day: 10),
      title: pad(top: -1em / 4)[
        #gh-repo("SmartX-Labs/SmartX-Mini") #h(1fr) GitHub, Docker
      ],
    )[
      GIST 전공 필수 웹 및 네트워크 인프라 실험 SmartX-Mini 조교
      - 버전 고정 및 수정
        - 자료 및 예시 도커파일에서 버전 호환성으로 인한 버그 추적 및 버전 고정
      - 문서 버전 관리
        - Git 과 markdown으로 교육자료 마이그레이션
        - 실험 수업 진행 단위별 스프린트 회의 진행, 교육 자료 개선
    ],
  ),
)

#workExpList(
  header: [
    == 경력
  ],
  (
    workExpEntry(
      from: datetime(year: 2026, month: 1, day: 5),
      to: datetime(year: 2026, month: 2, day: 27),
      role: "Frontend Platform Assistant",
      organization: "Toss Client DevOps팀",
    )[
      - 대규모 CI / CD 개선 작업
        - 더 효율적인 토큰 관리를 위한 Hashicorp Vault GitHub Actions에 적용
        - 의존성 관리를 위한 Snyk Test 재사용 가능한 작업 제작 및 적용
        - Circle CI로 구성된 기존 필수 CI 작업들을 GitHub Actions로 마이그레이션
      - 서비스 배포 상황을 체크하기 위한 명령어 제작 및 메세지 핸들러 제작
    ],
    workExpEntry(
      from: datetime(year: 2023, month: 6, day: 5),
      to: datetime(year: 2025, month: 2, day: 4),
      role: "해군 빅데이터 분석병",
      organization: "계근단 본부대대",
    )[
      외부 소프트웨어가 제한된 환경에서 직접 기하 알고리즘 구현 및 활용 \
      JS 가 없는 환경에서의 UI 구성 경험을 해볼 수 있었음.
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
      organization: "GIST 학생회 Infoteam",
    )[
      GIST 내부의 문제를 개발로서 해결하는 학생 개발팀, Infoteam 소속으로서 진행한 프로젝트
      - 리액트 팀 스터디 진행 및 팀 회의록 작성
      - 커뮤니티 사이트 GISTORY #h(1fr) React, Vite, TypeScript
      - 프론트엔드 템플릿 저장소 #h(1fr) React, Vite, TypeScript
    ],
  ),
)

#activityList(
  header: [
    == 커뮤니티 발표 경험
  ],
  (
    activityEntry(from: datetime(year: 2022, month: 10, day: 14), title: belonging([스태프], [GIST DEV NIGHT]))[
      GIST 내 개발자를 위한 컨퍼런스 GIST DEV NIGHT 파일럿 프로그램을 기획 및 운영 #h(1fr) #link("https://gistnews.co.kr/?p=5929")[#icon("lucide/earth") #underline[교내 기사]]
      - Code of Conduct 작성, 발표자 선정, 네트워킹 세션 진행을 담당
      - CRA에서 Vite 전환 과정을 발표 #h(1fr) #link("https://github.com/dodok8/vite-migrate")[#underline[#icon("devicon/github") 발표자료]]
    ],
  ),
)

#activityList(
  header: [
    == 오픈소스 번역 기여
  ],
  (
    activityEntry(from: datetime(year: 2018, month: 8, day: 9), title: pad(top: -1em / 4)[
      #gh-repo("IntelliJ-Localization/pycharm-kr ")
    ])[
      PyCharm의 한국어 번역 프로젝트, UI 및 에디터 한국어 번역
      (#link("https://github.com/IntelliJ-Localization/pycharm-kr/pull/2")[#icon("devicon/github") PR \#2], #link("https://github.com/IntelliJ-Localization/pycharm-kr/pull/8")[#icon("devicon/github") PR \#8], #link("https://github.com/IntelliJ-Localization/pycharm-kr/pull/18")[#icon("devicon/github") PR \#18])
    ],
    activityEntry(from: datetime(year: 2024, month: 2, day: 9), title: pad(top: -1em / 4)[
      #gh-repo("fabian-hiller/valibot")
    ])[
      스키마 검증용 라이브러리 valibot, i18n 패키지 한국어 번역 (#link("https://github.com/fabian-hiller/valibot/pull/429")[#icon("devicon/github") PR \#429])
    ],
  ),
)


#workExpList(
  header: [
    == 교육
  ],
  (
    workExpEntry(
      from: datetime(year: 2025, month: 7, day: 4),
      to: datetime(year: 2025, month: 11, day: 7),
      role: "Fedify 트랙",
      organization: "2025 오픈소스 소프트웨어 컨트리뷰션 아카데미",
    )[
      - Fedify 및 Hollo, Botkit에 기여
    ],
    workExpEntry(
      from: datetime(year: 2018, month: 2, day: 12),
      to: datetime(year: 2023, month: 2, day: 20),
      role: "전기전자컴퓨터공학부 학사 졸업",
      organization: "광주과학기술원(GIST)",
    )[
      - 컴퓨터 네트워크, 컴퓨터 시스템 이론 및 실습, 프로그래밍 언어와 컴파일러 등 CS 과목 수강
      - 심리학 부전공 과정 수료
      - 전체 학점: 3.31 / 4.5
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
      - 교통약자를 위한 맞춤 택시 플랫폼 Calmmuter 기획 #h(1fr) #link("https://velog.io/@dodok8/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%ED%9A%8C%EA%B3%A0%EB%A1%9D-JunctionXSeoul-2021-Team-Caffeine")[#icon("lucide/earth") #underline[참여후기]]
    ],
  ),
)
