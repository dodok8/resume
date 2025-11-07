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
#set par(leading: 0.8em)
#show heading: set text(size: 16pt)

= #text(size: 32pt)[#metadata.name.real-korean#super[#upper[#metadata.name.real-english]]]
#text(size: 12pt)[
  #text(weight: 900, tracking: 2pt)[#metadata.role]
]

#set text(size: 10pt)
  #grid(
    columns: (1fr, 1fr),
    grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      row-gutter: 8pt,
      [#icon("lucide/mail") *전자 우편*], link("mailto:" + metadata.email)[#metadata.email],
      [#icon("lucide/phone") *전화*], link("tel:" + metadata.phone.join())[#metadata.phone.join(" ")],
      [#icon("lucide/calendar") *생년월일*], metadata.birthday,
    ),
    grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      row-gutter: 8pt,
      
      [#icon("devicon/github") *GitHub*],
      link("https://github.com/" + metadata.social.github)[\@#metadata.social.github],
      
      [#icon("lucide/cat") *Hackers' pub*],
      link("https://hackers.pub/" + metadata.social.hackerspub)[#metadata.social.hackerspub\@hackerspub],
      
      [#icon("lucide/earth") *Portfolio*],
      link("https://dodok8.github.io/resume/portfolio.pdf")[dodok8.github.io/resume/portfolio.pdf],
    ),
  )

#line(length: 100%, stroke: 0.75pt)

== 기술 및 역량
- React, React-Native
  - 다수의 웹 앱 및 모바일 앱 제작
  - Redux 및 TanStack-Query 를 통한 상태 관리
- Svelte
  - Svelte 5를 활용한 웹 앱 개발
- Git, Github
  - 오픈소스 프로젝트 및 프로젝트 경험 기반 Git과 GitHub 을 이용한 협업 능력
- TypeScript / JavaScript
  - Node.js / Deno / Bun 다양한 런타임 사용 가능
  - JavaScript로 구성된 레거시 앱 TypeScript 마이그레이션
- CI / CD
  // - fly.io, Cloudflare Pages 를 통한 통한 배포
  - Dockerfile 검토 및 오류 수정
  - GitHub Actions를 통한 배포 제어 및 최적화
- 테스트 코드 작성 능력
  - Bun, Deno, Jest 등 다양한 환경에서 테스트 코드 작성 가능
- 협업 능력
  - 국제적으로 운영되는 오픈소스 프로젝트 참여로 영어 작문 / 독해에 능숙
  - 교육용 문서 작성 / 개선 작업 바탕으로 한 문서화 역량
  - 다년 간의 개발팀 관리 경험으로 협업에 익숙
  - 개발 컨퍼런스 운영 및 발표 경험
  - 오픈소스 프로덕트 운영


#activityList(
  header: [
    == 개발 경험
  ],
  (
    activityEntry(
      from: datetime(year: 2025, month: 7, day: 4),
      to: datetime.today(),
      title: pad(top: -1em / 4)[
        2025 오픈소스 소프웨어 컨트티뷰션 아카데미 Fedify 트랙 #h(1fr) TypeScript, ActivityPub#footnote("W3C에서 제정한 소셜 미디어 서비스들이 서로 소통할 수 있도록 하는 프로토콜 표준")
      ],
    )[
      2025 OSSCA Fedify 트랙에 참가하여 ActivityPub과 관련된 다음 프로젝트에 기여 중
      - ActivityPub 구현 프레임워크 #gh-repo("fedify-dev/fedify")
      - ActivityPub 기반 1인 SNS #gh-repo("fedify-dev/hollo")
      - ActivityPub 자동화 봇 프레임워크 #gh-repo("fedify-dev/botkit")
      \
      기여 내역
      - Fedify CLI nodeInfo 커맨드 개선
        - 색상 깨짐 오류, 아스키 아트 변환 및 컬러 코드 변환 점검 테스트 코드 추가, 명령어 이름 변경 및 리팩토링 진행 (#link("https://github.com/fedify-dev/fedify/pull/282")[#icon("devicon/github") PR \#282], #link("https://github.com/fedify-dev/fedify/pull/299")[#icon("devicon/github") PR \#299], #link("https://github.com/fedify-dev/fedify/pull/327")[#icon("devicon/github") PR \#327], #link("https://github.com/fedify-dev/fedify/pull/331")[#icon("devicon/github") PR \#331], #link("https://github.com/fedify-dev/fedify/pull/414")[#icon("devicon/github") PR \#414])
      - \@fedify/elysia 패키지 제작
        - Bun에서 작동하는 백엔드 프레임워크 Elysia와 Fedify 의 통합 플러그인 (#link("https://github.com/fedify-dev/fedify/pull/414")[#icon("devicon/github") PR \#339])
        \
      - BotKit 팔로잉 관련 기능 개선 및 Fedify Webfinger 확장 API 추가
        - BotKit의 기본 봇 페이지 팔로우 목록 제공 프론트엔드 제작. (#link("https://github.com/fedify-dev/botkit/pull/13")[#icon("devicon/github") PR \#13])
        - BotKit의 봇의 Remote Follow 구현 (#link("https://github.com/fedify-dev/botkit/pull/14")[#icon("devicon/github") PR \#14])
        - `fedify`에서 Remote Follow를 지원할 수 있도록 API를 확장함. (#link("https://github.com/fedify-dev/fedify/pull/404")[#icon("devicon/github") PR \#404], #link("https://github.com/fedify-dev/fedify/pull/407")[#icon("devicon/github") PR \#407])
      - Hollo 타임라인 오류 개선
        - Hollo의 타임라인에 게시물의 작성시간이 미래로 되어 있는 경우, 타임라인의 최상단에 고정되어 버리는 \ 문제가 존재하였음. 작성 시점을 서버시간과 비교하여 필터링 하는 것으로 해결함.(#link("https://github.com/fedify-dev/hollo/pull/201")[#icon("devicon/github") PR \#201])

      - Fedify CI/CD 워크플로우 개선
        - 스폰서 목록을 업데이트 하는 GitHub actions workflow가 포크된 저장소에서도 작동하는 문제를 해결함
        - 해당 워크플로우를 수동으로 전환한 다음, REST API 를 통해 메인 저장소의 액션만 매시간 호출하도록 \ 별도의 저장소와 워크플로우 작성.(#gh-repo("fedify-dev/sponsor-automation"))

      - Fedify NodeInfo 타입 변경
        - Fediverse Instance의 서버 정보를 담는 NodeInfo Protocol 2.1의 스펙과 실제 Fedify의 구현이 software version 필드의 타입이 차이가 났음. 해당 문제를 클라이언트 측(#link("https://github.com/fedify-dev/fedify/pull/365")[#icon("devicon/github") PR \#365])과 서버 측 \ 구현체에서 해결함(#link("https://github.com/fedify-dev/fedify/pull/433")[#icon("devicon/github") PR \#433])
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
      - 앱인토스 미니앱 제작
        - 앱인토스 입점을 위해, 기존 Flutter로 구성된 앱 어플리케이션 로직 리액트로 재작성 및 API 연동
    ],
    activityEntry(from: datetime(year: 2025, month: 2, day: 22), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/Ilots-log") #h(1fr) SvelteKit
    ])[
      리듬게임 Rotaeno를 위한 사용자 곡 기록 및 추천 시스템 #h(1fr) #link("https://Ilots-log.pages.dev")[#icon("lucide/earth") #underline[사이트]]\
      1인 개발 과정에서 Claude 및 GitHub copilot의 적극적인 사용으로 개발 기간을 단축시킬 수 있었음
      - #gh-repo("dodok8/rotaeno-ch-wiki-crawler") #h(1fr) *Bun*
        - Bun기반 TypeScript 위키 크롤러 코드
        - TDD로 엣지 케이스 관리 및 리팩토링 과정 단순화
      - 유저 점수 데이터 저장 및 관리
        - Class Rune 을 이용한 상태관리로 사용자 점수 데이터 및 레이팅 계산 로직 단순화
        - Google Drive 연동을 통한 다른 기기간 정보 연동
      - AVIF 포맷 사용으로 앨범아트 용량 최적화 (#link("https://github.com/dodok8/Ilots-log/pull/26")[#icon("devicon/github") PR \#26])
    ],
    activityEntry(from: datetime(year: 2024, month: 12, day: 29), title: pad(top: -1em / 4)[
      #gh-repo("velopert/velog-client") #h(1fr) GraphQL
    ])[
      블로그 서비스 Velog 에서 2023.12.26 - 2023.12.29. 기간 동안 글 등록 불가 오류 발생
      - 게시물 수정시 수정 완료된 게시물을 불러오는 Graph QL 댓글 관련 쿼리문의 버그 수정(#link("https://github.com/velopert/velog-client/pull/477")[#icon("devicon/github") PR \#477])
    ],
    activityEntry(from: datetime(year: 2023, month: 12, day: 24), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/discord-aladin") #h(1fr) Bun, Discord.js
    ])[
      알라딘 Open API를 활용한, user install 형태로 서버에 상관없이 이용가능한 도서 정보 공유 디스코드 챗봇
      - Bun 기반으로 제작하여 TypeScript 세팅에 별도 절차가 필요 없었으며, 빌드 과정을 단순화 할 수 있었음. Fly.io를 통한 배포로 GitHub 과 연동하여 배포 라인 구축.
      - 요금 제한과 인스턴스 성능을 감안하여 홈 서버로 이동. git HEAD의 해쉬를 비교하여 자동으로 업데이트를 하는 systemd 서비스를 작성함.
      \
      \
    ],
    activityEntry(from: datetime(year: 2022, month: 12, day: 21), title: pad(top: -1em / 4)[
      gsainfoteam/Infoteam-frontend-template #h(1fr) React, Vite, Styled-Component
    ])[
      교내 개발팀 Infoteam 내부에 사용되는 프론트엔드 템플릿
      - 안티 패턴 분석: 기존 프로젝트들의 코드 베이스 분석 후, 스타일 시트의 낮은 코드 응집성, i81n을 고려하지 않은 설계 문제 발견 및 문서화
      - Yarn berry 설정: Yarn Plugin 설정을 통한 `@types` 설치 자동화
    ],
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

#activityList(
  header: [
    == 커뮤니티 발표 경험
  ],
  (
    activityEntry(from: datetime(year: 2022, month: 10, day: 14), title: belonging([스태프], [GIST DEV NIGHT]))[
      GIST 내 개발자를 위한 컨퍼런스 GIST DEV NIGHT 파일럿 프로그램을 기획 및 운영 #h(1fr) #link("https://gistnews.co.kr/?p=5929")[#icon("lucide/earth") #underline[교내 기사]]
      - Code of Conduct 작성, 발표자 선정, 네트워킹 세션 진행을 담당
      - CRA에서 Vite 전환 과정을 발표 #h(1fr) #link("https://github.com/dodok8/vite-migrate")[#underline[#icon("lucide/earth") 발표자료]]
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
      Python IDE PyCharm의 한국어 번역 프로젝트, UI 및 에디터 한국어 번역
      \
      (#link("https://github.com/IntelliJ-Localization/pycharm-kr/pull/2")[#icon("devicon/github") PR \#2], #link("https://github.com/IntelliJ-Localization/pycharm-kr/pull/8")[#icon("devicon/github") PR \#8], #link("https://github.com/IntelliJ-Localization/pycharm-kr/pull/18")[#icon("devicon/github") PR \#18])
    ],
    activityEntry(from: datetime(year: 2024, month: 2, day: 9), title: pad(top: -1em / 4)[
      #gh-repo("fabian-hiller/valibot")
    ])[
      스키마 검증용 라이브러리 valibot, 국제화 패키지 한국어 번역 (#link("https://github.com/fabian-hiller/valibot/pull/429")[#icon("devicon/github") PR \#429])
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
      외부 소프트웨어가 제한 된 환경에서 직접 기하 알고리즘 구현 및 활용 \
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
        \
        \
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

#workExpList(
  header: [
    == 교육
  ],
  (
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
