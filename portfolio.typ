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
#set text(font: "Pretendard", fallback: true)
#show heading: set text(size: 16pt)

= #text(size: 32pt)[#metadata.name.real-korean#super[#upper[#metadata.name.real-english]]]


#activityList(
  header: [
    == 포트폴리오
    #line(length: 100%, stroke: 0.75pt)
  ],
  (
    activityEntry(from: datetime(year: 2025, month: 7, day: 4), to: datetime.today(), title: pad(top: -1em / 4)[
      2025 OSSCA Fedify #h(1fr) TypeScript, ActivityPub
    ])[
      *소개*

      - 2025년 오픈 소스 소프트웨어 컨트리뷰션 아케데미에 참가해서, ActivityPub과 관련된 다음 프로젝트에 기여 하였음
        - ActivityPub 구현 프레임워크 #gh-repo("fedify-dev/fedify")
        - ActivityPub 기반 1인 SNS #gh-repo("fedify-dev/hollo")
        - ActivityPub 자동화 봇 프레임 워크 #gh-repo("fedify-dev/botkit")


      *해결 문제*
      - *Fedify CLI nodeInfo 커맨드 개선*
        - *문제점*: Fediverse 인스턴스의 nodeInfo를 출력해주는 `fedify nodeInfo` 명령어에서 터미널 에뮬레이터의 24bit 컬러 지원 여부에 따라 색상 출력이 붕괴되는 현상이 있었음.(#link("https://github.com/fedify-dev/fedify/issues/168")[#icon("devicon/github") issue \#168 ]) 이 이슈에서 출발하여 점진적으로 커맨드를 개선함.
        - *개선 과정*
          - #link("https://github.com/fedify-dev/fedify/pull/282")[#icon("devicon/github") PR \#282]: 터미널 에뮬레이터의 256 색상 지원 여부를 감지해 미지원 하는 터미널의 경우 ANSI 256 색상을 출력하도록 변경.
          - #link("https://github.com/fedify-dev/fedify/pull/299")[#icon("devicon/github") PR \#299]: 해당 기능을 포함한 nodeInfo 명령어의 구성 요소들의 유닛 테스트를 작성함. 이 과정에서 실제 ANSI 컬러값이 해당값과 매치되도록 색상 비교 로직을 재설계함.
          - #link("https://github.com/fedify-dev/fedify/pull/327")[#icon("devicon/github") PR \#327]: 테스트 작성 과정에서, `--raw` 옵션이 실제로 존재함에도 불구하고 문서에는 누락되어 있는 것을 발견함. 이를 반영하여 문서를 업데이트함.
          - #link("https://github.com/fedify-dev/fedify/pull/331")[#icon("devicon/github") PR \#331]: NodeInfo 를 가져오는 명령어 임에도 불구하고, 기존에는 `node` 여서 혼동을 주는 이슈가 있었음. 이를 `nodeinfo`로 명령어를 변경함으로서 해결함.
          - #link("https://github.com/fedify-dev/fedify/pull/414")[#icon("devicon/github") PR \#414]: 호환성을 위해 전체적으로 CLI를 재작성 하는 과정에서, nodeInfo를 담당하여 CLI를 재작성함.

      - *Fedify CI/CD 워크플로우 개선*
        - *문제점*: 스폰서 목록을 업데이트 하는 GitHub actions workflow가 포크된 저장소에서도 작동하여, 매시간 마다 알림이 가는 문제가 있었음.
        - *해결책*: 해당 워크플로우를 수동으로 전환한 다음, REST API 를 통해 메인 저장소의 액션만 매시간 호출하도록 별도의 저장소와 워크플로우 작성.(#gh-repo("fedify-dev/sponsor-automation"))

      - *\@fedify/elysia 패키지 제작*
        - Bun에서 작동하는 백엔드 프레임워크 Elysia와 Fedify 의 통합 플러그인 제작.

      - *Hollo 타임라인 오류 수정*
      - *BotKit 팔로워 목록 구현*
      - *BotKit Remote 팔로워 구현 및 Fedify Webfinger 확장 API 추가*
    ],
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
        caption: "Ilots-log의 주요 기능 베스트 차트 / 점수 입력 / 구글 드라이브 백업",
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
          - #link("https://github.com/dodok8/Ilots-log/pull/13")[#icon("devicon/github") PR\#13 Dodok8/issue10 ] 사용자가 제보한 구글 로그인 관련 오류를 해결하는 과정에서 중복된 파일 탐색 로직을 발견, 반복된 로그인 UI를 거치지 않아도 되도록 개선하였음.
      - *이미지 소스 문제: AVIF 포맷 사용*
        - *문제점*: 외부 이미지에 의존한 초기 버전에서, 소스 사이트의 문제로 이미지가 안 불러와지는 문제 발생
        - *해결책*: 사이트 내부에 이미지를 저장하도록 해서 외부 사이트 의존 문제를 해결. 이 과정에서 앨범아트로 AVIF를 사용함으로서 용량을 효율적으로 줄일 수 있었음.
    ],
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
        - 배포에는 무료 인스턴스와 단순한 CLI 인터페이스를 제공하는 fly.io를 통해서 배포
    ],
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
        - 오타가 없는 수업자료가 제공됨으로서 수업 시 실험 성공률이 올라감
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
        - 분업 후 Kafka와 flume으 로 IoT 장비를 연결 실습을 담당하는 InterConnect Lab랩 담당.
        - 해당 수업에 사용되는 지원이 끊긴 flume 버전 1.6.0의 설치 소스를 archive 저장소 옮기도록 Dockerfile 수정
    ],
    activityEntry(
      from: datetime(year: 2020, month: 7, day: 10),
      to: datetime(year: 2021, month: 5, day: 30),
      title: pad(top: -1em / 4)[
        GISTORY #h(1fr) React, Vite, TypeScript
      ],
    )[
      *제품 소개*

      GIST 학생을 위한 리액트 기반 BBS 커뮤니티. React 프론트엔드 개발자로 참여

      *제품 목표*

      - GIST 내부 학생들을 위한 온라인 커뮤니티 공간의 부재

      *결과*
      - 이후 시장 조사 결과, 사용자가 원하는 것은 쌍방 소통 형태의 BBS 보다는 정보글만 선택해서 볼 수 있는 모아보기 형태의 앱이라는 결론이 나옴
        - GISTORY의 서비스 종료 후, 시장 조사 결과를 반영한 공지 전달 플랫폼 Ziggle 제작
      - GISOTRY 개발 및 그 외 SPA 개발 과정에 있었던 반복된 세팅 및 안티 패턴 문제를 해결하기 위해 gsainfoteam/Infoteam-frontend-template 제작

      #figure(
        grid(
          columns: 2,
          // 2 means 2 auto-sized columns
          gutter: 2mm,
          // space between columns
          image("./images/gistory_main.png"), image("./images/gistory_article.png", width: 65%),
        ),
        caption: "Gistory 메인 페이지 및 게시물 페이지",
        supplement: none,
      )

      *해결 문제*

      // - *REST API 연동 및 Redux 상태관리 설계*
      //   - 게시물 목록 불러오기 / 게시물 보기 / 게시물 작성 / 첨부 파일 업로드 API 연동
      //   - 첨부 파일 용량 파악 및 정보 파악을 위한 차트 컴포넌트(chart.js 기반)
      // - *RBAC 기반의 권한 관리를 위한 어드민 페이지 설계*
      //   - 현재 유저에게 부여된 룰 목록 및 룰에 부여된 액션 목록을 쉽게 보기 위한 컴포넌트 설계
      - *배포 솔루션 변경*
        - Jenkins에서 Cloudflare Pages 및 github-actions로 전환
        - 비용 절감, 배포 파이프라인 단순화 및 배포 시간 절감
      - *TypeScript 마이그레이션*
        - 버그의 주요 원인인 타입 불일치를 해결하기 위하여 진행
        - `boolean | undefined` 로 관리되던 로딩 상태를 안전하게 다루기 위한 헬퍼 함수 추가
          - `undefined` 와 `true`에서는 폴백 컴포넌트가 보여야 했고, `false` 에서는 본래 컴포넌트가 보여야 했음 이를 다루는 `loadComponent()` 함수 추가
        - 대형 컴포넌트 타입 작성으로 자식 컴포넌트와 타입 불일치가 발생하는 부분 발견, 버그 수정
      - *CRA 에서 Vite 마이그레이션*
        - 컴포넌트 증가로 인해 느려지는 빌드 및 개발서버 실행 속도를 해결하기 위해 Vite로 마이그레이션
        - 빌드 시간을 4분의 1로 단축
    ],
  ),
)
