#import "modules/util.typ": *
#import "modules/activity.typ": *
#import "modules/components.typ": *
#import "modules/github.typ": *
#import "modules/solved-ac.typ": *
#import "metadata.typ": metadata
#import "modules/information.typ": *
#import "modules/document.typ": pdf-document
#import "modules/web.typ": web-document

#show: pdf-document
#web-document("graveyard", "Graveyard", metadata)

= #text(size: 32pt)[#metadata.name.real-korean#super[#upper[#metadata.name.real-english]]]

== 그래이브야드 - 종료된 프로젝트들
#line(length: 100%, stroke: 0.75pt)

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
