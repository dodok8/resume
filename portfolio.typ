#import "modules/util.typ": *
#import "modules/activity.typ": *
#import "modules/components.typ": *
#import "modules/github.typ": *
#import "modules/solved-ac.typ": *
#import "metadata.typ": metadata
#import "modules/information.typ": *

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
#set text(font: "RIDIBatang", fallback: true)
#show heading: set text(size: 16pt)

= #text(size: 32pt)[#metadata.name.real-korean#super[#upper[#metadata.name.real-english]]]

== 포트폴리오
#line(length: 100%, stroke: 0.75pt)

#activityList(
  header: [],
  (
    activityEntry(from: datetime(year: 2026, month: 2, day: 11), to: datetime.today(), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/gaji") #h(1fr) TypeScript, GitHub Actions, Rust
    ])[
      *소개*
      - GitHub Actions 워크플로우를 TypeScript로 타입 안전하게 작성 후 YAML로 컴파일하는 CLI 도구

        - #link("https://hackers.pub/@gaebalgom/2026/%EC%99%9C-gaji%EC%9D%B8%EA%B0%80-ts%EB%A1%9C-%EC%95%88%EC%A0%84%ED%95%98%EA%B2%8C-github-actions-%EC%9E%91%EC%84%B1%ED%95%98%EA%B8%B0")[#icon("lucide/earth") #underline[제작기 및 제작이유]]
        - #link("https://gaji.gaebalgom.work")[#icon("lucide/earth") #underline[문서]]

      *해결 문제*

      - YAML은 데이터 표현 언어로, CI/CD 동작(behavior)을 표현하기에 부적절함.
      - 액션 입력값에 대한 IDE 자동완성 및 타입 검증이 불가능하여, 필수 입력 누락이나 잘못된 값을 사전에 감지할 수 없음.

      GitHub Actions의 위와 같은 단점을 TS를 이용해 워크플로우 작성시에 해결하는 것을 목적으로 삼음.

      *주요 기능*
    
      - *action.yml 기반 자동 타입 생성*
        - action.yml 정의에서 TypeScript 타입을 자동 생성하여, `getAction()` 함수를 통해 액션 입력값의 IDE 자동완성 및 컴파일 시점 타입 체크 제공
        - `gaji dev --watch` 로 파일 변경 감시 시, 새로운 액션 참조를 자동 감지하여 타입 생성
      - *빌더 패턴 API*
        - `Workflow` → `Job` → `Step` 구조의 빌더 패턴으로 워크플로우를 구성하고, `.build()`로 YAML 컴파일
        - `CompositeAction`, `JavaScriptAction`, `DockerAction` 등 다양한 액션 타입 정의 지원
        - `CallJob`으로 재사용 가능한 워크플로우 호출, `CompositeJob`으로 매개변수화된 작업 패턴 구현
      - *Rust + QuickJS 아키텍처*
        - Rust 단일 바이너리에 QuickJS를 내장하여 Node.js 런타임 의존 없이 동작
      - *기존 워크플로우 마이그레이션*
        - 기존 YAML 워크플로우를 `Workflow.fromObject()`로 TypeScript로 변환 가능
     

      *현황*
      - gaji 그 자체의 워크플로우를 gaji로 작성하여, 이를 통해 더 효울적인 배포 과정 작성이 가능해짐.
    ],
  ),
)

#pagebreak()

#activityList(
  header: [],
  (
    activityEntry(from: datetime(year: 2025, month: 7, day: 4), to: datetime.today(), title: pad(top: -1em / 4)[
      Fedify #h(1fr) TypeScript, ActivityPub
    ])[
      *소개*

      - 2025년 오픈 소스 소프트웨어 컨트리뷰션 아카데미가 계기가 되어, 다음 프로젝트에 기여 중
        - ActivityPub 구현 프레임워크 #gh-repo("fedify-dev/fedify") #h(1fr) Typescript, ActivityPub
        - Fedify 기반 1인 SNS #gh-repo("fedify-dev/hollo") #h(1fr) Fedify
        - Fedify 기반 Fediverse 자동 봇 프레임워크 #gh-repo("fedify-dev/botkit") #h(1fr) Fedify
        - Fedify 기반 IT 전문 오픈소스 SNS #gh-repo("hackers-pub/hackerspub") #h(1fr) Fedify, Solid, GraphQL

      *해결 문제*
      - *Fedify CLI nodeInfo 커맨드 개선*
        - *문제점*: Fediverse 인스턴스의 nodeInfo를 출력해주는 `fedify nodeInfo` 명령어에서 터미널 에뮬레이터의 24bit 컬러 지원 여부에 따라 색상 출력이 붕괴되는 현상이 있었음. (#link("https://github.com/fedify-dev/fedify/issues/168")[#icon("devicon/github") issue \#168 ]) \ 이 이슈에서 출발하여 점진적으로 커맨드를 개선함.
          #figure(
            image("./images/fedify_nodeinfo_color.png", width: 80%),
            caption: "fedify nodeinfo 색상 개선 결과",
            supplement: none,
          )
        - *개선 과정*
          - #link("https://github.com/fedify-dev/fedify/pull/282")[#icon("devicon/github") PR \#282]: 터미널 에뮬레이터의 24 bit 색상 지원 여부를 감지해 미지원하는 터미널의 경우 ANSI 256 색상을 출력하도록 변경.
          - #link("https://github.com/fedify-dev/fedify/pull/299")[#icon("devicon/github") PR \#299]: 해당 기능을 포함한 nodeInfo 명령어의 구성 요소들의 유닛 테스트를 작성. 이 과정에서 실제 ANSI 컬러값이 해당값과 매치되도록 색상 비교 로직을 재설계함.
          - #link("https://github.com/fedify-dev/fedify/pull/327")[#icon("devicon/github") PR \#327]: 테스트 작성 과정에서, `--raw` 옵션이 실제로 존재함에도 불구하고 문서에는 누락되어 있는 것을 발견함. 이를 반영하여 문서를 업데이트함.
          - #link("https://github.com/fedify-dev/fedify/pull/331")[#icon("devicon/github") PR \#331]: NodeInfo 를 가져오는 명령어 임에도 불구하고, 기존에는 `node` 여서 혼동을 주는 이슈가 있었음. 이를 `nodeinfo`로 명령어를 변경함으로서 해결함.
          - #link("https://github.com/fedify-dev/fedify/pull/414")[#icon("devicon/github") PR \#414]: 호환성을 위해 전체적으로 CLI를 재작성 하는 과정에서, nodeInfo를 담당하여 CLI를 재작성.
    \ \ \ \ \ \ \ \
      - *\@fedify/elysia 패키지 제작 (#link("https://github.com/fedify-dev/fedify/pull/414")[#icon("devicon/github") PR \#339])*
        - Bun 기반 백엔드 프레임워크 Elysia와 Fedify 의 통합 패키지. Elysia의 `onRequest` 라이프 사이클에서 `fedify`의 `federation.fetch`를 호출하여 ActivityPub 요청인지 구별하도록 구현.
        #figure(
          image("images/fedify_elysia.png", width: 85%),
          caption: "@fedify/elysia 패키지 작동 원리",
          supplement: none,
        )
        - Bun이 Fedify의 jsr 의존성을 지원하지 않아서 오류가 발생했음. 플러그인의 빌드 과정에 있어서 Bun 의존성은 없었기에 기존 빌드 체인인 tsdown을 사용하고, 빌드된 패키지만 Bun에서 사용하도록 하는 방식으로 해결함.
      - *\@fedify/fresh 패키지 제작 (#link("https://github.com/fedify-dev/fedify/pull/478")[#icon("devicon/github") PR \#478])*
        - Deno 기반 웹 프레임워크 Fresh 2 와 Fedify 의 통합 플러그인. 기존 Fresh 연동과 유사한 구조를 가지도록 설계하였음.
        - Fresh 2에서 사용 중인 Vite 서비스와 Fedify의 의존성 사이에 오류가 발생하여, 이를 해결 하는 Vite 설정을 문서화함.
        - 더 이상 사용되지 않은 Preact 의존성으로 인한 오류를 해결함.
      - *BotKit, Hackers' Pub 팔로잉 관련 기능 개선 및 Fedify Webfinger 확장 API 추가*
        - *문제점*
          - BotKit의 기본 봇 페이지는 팔로워 목록을 제공하지 않았음. (#link("https://github.com/fedify-dev/botkit/issues/2")[#icon("devicon/github") issue \#2 ])
          - BotKit의 봇을 팔로우 하기 위해서는 사용자가 자신의 인스턴스로 돌아가서 BotKit의 핸들을 검색해야하는 불편함이 존재하였음. 이를 해결하기 위해 Remote Follow 가 제안 됨. (#link("https://github.com/fedify-dev/botkit/issues/10")[#icon("devicon/github") issue \#10 ])
        - *개선 과정*
          - #link("https://github.com/fedify-dev/botkit/pull/13")[#icon("devicon/github") PR \#13]: 팔로우 목록 제공 프론트엔드 제작.
          - #link("https://github.com/fedify-dev/botkit/pull/14")[#icon("devicon/github") PR \#14]: Remote Follow 구현
            - 유저로부터 핸들 입력 받음
            - 유저 핸들 정보로 부터 webfinger 정보 수집
            - OStatus 1.0 따른 subscribe 항목이 있을 경우, 그에 해당하는 봇 팔로우 url로 리다이렉트
          - 본 프로젝트인 `fedify`와 이를 기반으로 하는 앱에서 OStatus 1.0을 지원하지 않았기에 이를 확장하는 PR들을 작성함.
            - #link("https://github.com/fedify-dev/fedify/pull/404")[#icon("devicon/github") PR \#404] Fedify의 Link의 타입을 확장하여, OStatus 1.0 을 지원하는 mastodon 과 같은 인스턴스의 webfinger를 받을 수 있도록 확장함.
            - #link("https://github.com/fedify-dev/fedify/pull/407")[#icon("devicon/github") PR \#407] Fedify에서 Webfinger 커스텀을 보다 더 쉽게 할 수 있도록, `setWebFingerLinksDispatcher(dispatcher)` 추가. OStatus 1.0 과 같은 추가적인 정보를 사용자가 손쉽게 지정할 수 있게 되었음.
          - BotKit에서 구현한 Remote Follow를 Hackers' Pub에도 적용 (#link("https://github.com/hackers-pub/hackerspub/issues/173")[#icon("devicon/github") issue \#173], #link("https://github.com/hackers-pub/hackerspub/pull/180")[#icon("devicon/github") PR \#180])

      - *Hollo 타임라인 오류 개선*
        - *문제점*: Hollo의 타임라인에 게시물의 작성시간이 미래로 되어 있는 경우, 타임라인의 최상단에 고정되어 버리는 문제가 존재하였음. (#link("https://github.com/fedify-dev/hollo/issues/199")[#icon("devicon/github") issue \#199 ])
        - *해결책* : #link("https://github.com/fedify-dev/hollo/pull/201")[#icon("devicon/github") PR \#201] 게시물의 생성 시간과 서버시간을 비교하여, 5분 이후의 미래 게시물의 경우 타임라인에서 숨겨지도록 하였음.

      - *Fedify CI/CD 워크플로우 개선*
        - *문제점*: 스폰서 목록을 업데이트 하는 GitHub actions workflow가 포크된 저장소에서도 작동하여, 매시간 마다 알림이 가는 문제가 있었음.
        - *해결책*: 해당 워크플로우를 수동으로 전환한 다음, REST API 를 통해 메인 저장소의 액션만 매시간 호출하도록 별도의 저장소와 워크플로우 작성.(#gh-repo("fedify-dev/sponsor-automation"))

      - *Fedify NodeInfo 타입 변경*
        - *문제점*: Fediverse Instance의 서버 정보를 담는 NodeInfo Protocol 2.1의 스펙과 실제 Fedify의 구현이 software version 필드의 타입이 차이가 났음.
        - *개선과정*:
          - #link("https://github.com/fedify-dev/fedify/pull/365")[#icon("devicon/github") PR \#365]: Fedify client 측에서 nodeInfo를 가져올 때, Semver가 아니더라도 파싱할 수 있도록 fallback 을 변경함.
          - #link("https://github.com/fedify-dev/fedify/pull/433")[#icon("devicon/github") PR \#433]: Fedify의 NodeInfo 구현체의 타입의 software version 필드를 Semver에서 String 으로 변경하고, 관련된 테스트들을 수정함.
      - *Hackers' Pub 해쉬태그 관련 오류 수정*
        - *문제점*: 알파벳 및 숫자가 아닌 문자가 포함된 해쉬태그 검색이 제대로 되지 않았음.
        - *개선과정*:
          - #link("https://github.com/hackers-pub/hackerspub/pull/171")[#icon("devicon/github") PR \#171]: 검색 쿼리에서 알파벳과 숫자가 아닌 문자도 지원하도록 정규식 수정. 이를 반영하여 해쉬 태그 페이지 구현
    ],
  ),
)

#pagebreak()

#activityList(
  header: [],
  (
    activityEntry(from: datetime(year: 2025, month: 2, day: 22), to: datetime.today(), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/Ilots-log") #h(1fr) Bun, Svelte
    ])[

      *소개*

      - #link("https://Ilots-log.pages.dev")[#icon("lucide/earth") #underline[https://Ilots-log.pages.dev]]
      - 리듬게임 Rotaeno를 위한 사용자 곡 기록 및 레이팅 계산 시스템, 1인 개발 #h(1fr)

      *목표*

      - 유명 리듬게임의 경우 #link("https://chunithm-net-eng.com")[#icon("lucide/earth") #underline[chunithm-net]] 같은 공식 기록 공유 사이트 및 #link("https://v-archive.net/")[#icon("lucide/earth") #underline[V-ARCHIVE]]와 같은 비공식 기록 공유 사이트가 존재함
      - Rotaeno 에는 업데이트가 종료된 #link("https://rotaeno.imgg.dev/")[#icon("lucide/earth") #underline[RotaenoKit]] 만 존재하며, 사용자의 브라우저에 정보를 저장하기에 여러 기기에서 기록관리가 불가능함

      *현황*
      - 오픈소스 개발 진행 중 (ver 2.13.0까지 반영)

      #figure(
        grid(
          columns: 3,
          gutter: 2mm,
          // space between columns
          image("./images/ilots-log_best30.png"),
          image("./images/ilots-log_songcard.png"),
          image("./images/ilots-log_backup.png"),
        ),
        caption: "Ilots-log의 주요 기능: 베스트 차트 / 점수 입력 / 구글 드라이브 백업",
        supplement: none,
      )

      *해결 문제*

      - *레이팅 세부 정보 수집의 문제: 위키 크롤러 #h(1fr)* #gh-repo("dodok8/rotaeno-ch-wiki-crawler")
        - *문제점*: 각 곡별로 레이팅 정보 수집을 자동화 하는 과정에서 여러 엣지 케이스를 만났고, 코드를 수정할 때마다 다른 케이스가 작동 안하는 문제를 만남.
        - *해결책*:  케이스들을 테스트 코드로 표현하여, 코드 수정의 과정에도 엣지 케이스의 작동을 보장하는 코드를 작성할 수 있었음. Bun을 사용함으로서 추가적인 세팅 없이 타입 관리, 테스트 코드 작성이 가능해짐
      - *클라우드 점수 연동: Google Drive 연동*
        - *문제점*: 사용자의 localstorage 말고도, 보편적인 사용자가 존재하고 점수가 저장 가능한 공간이 필요했음.
        - *해결책*
          - 구글 API 연동을 통해 구글 드라이브에 점수 정보를 저장함으로서, 여러사용자가 여러 기기에서 점수 정보 관리 가능하도록 제공.
          - #link("https://github.com/dodok8/Ilots-log/pull/13")[#icon("devicon/github") PR \#13 Dodok8/issue10 ] 사용자가 제보한 구글 로그인 관련 오류를 해결하는 과정에서 중복된 파일 탐색 로직을 발견, 반복된 로그인 UI를 거치지 않아도 되도록 개선하였음.
      - *이미지 소스 문제: AVIF 포맷 사용*
        - *문제점*: 외부 이미지에 의존한 초기 버전에서, 소스 사이트의 문제로 이미지가 안 불러와지는 문제 발생
        - *해결책*: 사이트 내부에 이미지를 저장하도록 해서 외부 사이트 의존 문제를 해결. 이 과정에서 앨범아트로 AVIF를 사용함으로서 용량을 효율적으로 줄일 수 있었음.
    ],
  ),
)

#pagebreak()

#activityList(
  header: [],
  (
    activityEntry(from: datetime(year: 2023, month: 12, day: 24), title: pad(top: -1em / 4)[
      #gh-repo("dodok8/discord-aladin") #h(1fr) Bun, TypeScript
    ])[
      *소개*

      알라딘 Open API를 활용한 도서 정보 공유 디스코드 챗봇, 1인 개발.

      *목표*

      - 디스코드에서 도서 정보를 공유하기 위해서 디스코드에 올라온 링크를 접속, 확인한 다음에 다시 디스코드로 돌아와야 하는 불편함이 존재했음

      *현황*
      - 알라딘 Link에 상세 설명 달아주기 기능, 검색 목록 기능(search), 세부 정보 보기 기능(show) 을 제공함.
      - 2025년 5월 기준 8개의 서버와 9명의 개인 사용자가 사용 중

        #figure(
          grid(
            columns: 2,
            // 2 means 2 auto-sized columns
            gutter: 2mm,
            // space between columns
            image("./images/discord-aladin_search.png", width: 85%),
            image("./images/discord-aladin_show.png", width: 85%),
          ),
          caption: "discord-aladin 사용 예시(search / show 커맨드 결과)",
          supplement: none,
        )

      *해결 문제*
      - *한국어 도서 정보 가져오기*
        - 국내외 자료를 다루는 알라딘에서 도서 정보 및 음반 정보 Open API 제공
        - 해당 API를 활용, 국내 도서 / 외국 도서 / 음반 / DVD / 중고책 정보를 받아옴
        - 응답 정보는 TypeScript 타입을 통해 통일된 스키마로 코드 내에서 활용
      - *세부 항목 선택 UI 개선*
      - *리다이렉트 URL 해석*
      - *점진적 배포 개선*
        - 개발 환경(군대) 상 빌드 및 배포 과정을 단순하게 할 필요가 존재
        - 이와 동시에 입력 타입을 검증할 필요 또한 존재
        - 따라서 TypeScript를 지원하며 빌드 과정이 단순한 Bun을 채택함
        - 첫 배포에는 무료 인스턴스와 단순한 CLI 인터페이스를 제공하는 fly.io를 통해서 배포
        - 이후, 요금 제한과 인스턴스 성능을 감안하여 홈 서버로 이동하였음. 이 과정에서 git HEAD의 해쉬를 비교하여 자동으로 업데이트를 하는 systemd 서비스를 작성함.
    ],
  ),
)

#pagebreak()

#activityList(
  header: [],
  (
    activityEntry(
      from: datetime(year: 2022, month: 3, day: 10),
      to: datetime(year: 2022, month: 7, day: 10),
      title: pad(top: -1em / 4)[
        #gh-repo("SmartX-Labs/SmartX-Mini") #h(1fr) GitHub, Docker
      ],
    )[
      *소개*

      - GIST 전공 필수 IOT 웹 및 네트워크 인프라 실험 SmartX-Mini 실습 교재, 실험 조교로 참여

      *목표*

      - 기존 PPT 파일의 문제였던 업무 분업 및 변경 사항 추적 불가 개선
      - 년도가 변경되며 생긴 오타 및 사용되는 파일 및 명령어의 버전 차이로 인한 진행 불가 개선

      *현황*

      - *원할한 수업 진행*
        - 오타가 없는 수업자료가 제공됨으로써 수업 시 실험 성공률이 올라감
        - 매주 스프린트 진행 후, 발생하는 오류들에 대한 경고 및 해결 방식을 메뉴얼에 반영함으로서 다음 수업에서는 같은 오류를 막을 수 있었음
      - *원할한 인수인계*
        - 2022년 수정 당시는 마크다운 이전 및 버전 변경없는 버그 해결을 목표로 진행되었음
        - 2023년 부터는 지원이 끊긴 버전을 최신 버전으로 올리는 마이그레이션을 진행.
          - 반복되는 오류를 수정하느라 낭비되었을 인력이 버전 마이그레이션 위주로 투자 되었음

      #figure(
        grid(
          columns: 2,
          // 2 means 2 auto-sized columns
          gutter: 2mm,
          // space between columns
          image("./images/smartx_mini_old.png", width: 80%), image("./images/smartx_mini_new.png", width: 90%),
        ),
        caption: "SmartX Mini InterConnect Lab 실습 교재(좌: 개선 전 PPT, 우: 개선 후 마크다운)",
        supplement: none,
      )

      *해결 문제*

      - *1차 개선*
        - 기존 PPT에 존재하는 오타를 수정한 버전을 제작. 이 버전을 기준으로 다시 실습을 진행하면서 발생하는 버전 충돌 과정을 탐색
        - 오타가 수정된 PPT를 기준으로, 원할한 분업 작업 및 변경사항 추적을 위해 Git 과 markdown 조합을 사용하도록 변경
      - *버전 오류 수정*
        - 분업 후 Kafka와 flume으로 IoT 장비를 연결 실습을 담당하는 InterConnect Lab랩 담당.
        - 해당 수업에 사용되는 지원이 끊긴 flume 버전 1.6.0의 설치 소스를 archive 저장소 옮기도록 Dockerfile 수정
    ],
  ),
)