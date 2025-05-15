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
#set text(font: "Pretendard", fallback: true)
#show heading: set text(size: 16pt)

= #text(size: 32pt)[#metadata.name.nickname / #metadata.name.real-korean#super[#upper[#metadata.name.real-english]]]
#text(size: 12pt)[
  #text(weight: 900, tracking: 2pt)[#metadata.role]
  // #text(weight: 600)[\@]
  // #text(weight: 700, tracking: 1pt)[#metadata.location]
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

// #text(size: 14pt, weight: 400)[
//   #set par(leading: 8pt)
//   #text(size: 8pt, weight: 900, top-edge: -0pt, bottom-edge: 0pt)[
//     자기소개 #sym.dash.em #text(tracking: 2pt)[INTRODUCTION]
//   ] \
//   #metadata.bio.ko.title \ #text(size: 10pt)[#metadata.bio.ko.body]
// ]

#line(length: 100%, stroke: 0.75pt)

#activityList(
  header: [
    == 프로젝트 목록
  ],
  (
    activityEntry(
      from: datetime(year: 2025, month: 2, day: 22),
      to: datetime.today(),
      title: pad(top: -1em / 4)[
        #gh-repo("dodok8/Ilots-log") #h(1fr) Bun, Svelte
      ],
    )[

      *제품 소개*

      리듬게임 Rotaeno를 위한 사용자 곡 기록 및 레이팅 계산 시스템, 1인 개발 #h(1fr) #link("https://Ilots-log.pages.dev")[#icon("lucide/earth") #underline[사이트]]

      *해결 문제*

      - 유명 리듬게임의 경우 #link("https://chunithm-net-eng.com")[#icon("lucide/earth") #underline[chunithm-net]] 같은 공식 기록 공유 사이트 및 #link("https://v-archive.net/")[#icon("lucide/earth") #underline[V-ARCHIVE]]와 같은 비공식 기록 공유 사이트가 존재함.
      - Rotaeno 에는 업데이트가 종료된 #link("https://rotaeno.imgg.dev/")[#icon("lucide/earth") #underline[RotaenoKit]] 만 존재하며, 사용자의 브라우저에 정보를 저장하기에 여러 기기에서 기록관리가 불가능함.

      #figure(
        grid(
          columns: 3,
          gutter: 2mm, // space between columns
          image("./images/ilots-log_best30.png"),
          image("./images/ilots-log_songcard.png"),
          image("./images/ilots-log_backup.png"),
        ),
        caption: "Ilots-log의 주요 기능 베스트 차트 / 점수 입력 / 구글 드라이브 백업",
        supplement: none,
      )

      *주요 기여*

      - *Bun 기반 위키 크롤러 #h(1fr)* #gh-repo("dodok8/rotaeno-ch-wiki-crawler")
        - 레이팅 계산에 필요한 곡 세부 정보를 구하는 과정을 테스트 코드로 표현
        - 크롤러 스크립트의 동작을 보장 및 엣지 케이스 코드화
        - Bun을 사용함으로서 추가적인 세팅 없이 타입스크립트 코드 작성 및 타입 관리, 테스트 코드 작성이 가능해짐
      - *점수 레이팅 계산 로직*
        - 260여 곡의 점수를 Class Rune을 통해 여러 페이지에서 상태 공유를 진행하고, 파생 상태로 베스트 스코어 점수와 이를 기반으로 한 레이팅 점수를 계산함
      - *Google Drive 연동*
        - Rotaeno Kit 비교해서 개선점으로, 클라우드 및 로컬 파일 저장 기능 제공
        - 구글 API 연동을 통해 구글 드라이브에 점수 정보를 저장함으로서 여러 기기에서 점수 정보 관리 가능
      - *Best 차트*
        - 상위 기록을 공유하기 쉬운 차트 및 이미지 형태로 저장하는 기능 제공
        - 기기의 뷰포트와 상관없이 일관된 이미지 크기 제공을 위해 html2Canvas를 사용

      *제품 결과*
      - 오픈소스 개발 진행 중
        - #link("https://github.com/dodok8/Ilots-log/pull/12")[#icon("devicon/github") PR\#12 Orb-H/issue11 ]
          - 사용자가 기여한 레이팅 알고리즘 개선
        - #link("https://github.com/dodok8/Ilots-log/pull/13")[#icon("devicon/github") PR\#13 Dodok8/issue10 ]
          - 사용자가 제보한 구글 드라이브 파일을 제대로 못 찾는 버그
          - 수정 과정에서 중복된 파일 탐색 로직 제거, 반복해서 구글 로그인 창을 거치지 않아도 되도록 개선
        - #link("https://github.com/dodok8/Ilots-log/pull/26")[#icon("devicon/github") PR\#26 Dodok8/issue26 ]
          - 이미지 용량 최적화 및 외부 사이트 의존 해결을 위한한 AVIF 포맷 교체

    ],
    activityEntry(
      from: datetime(year: 2023, month: 12, day: 24),
      title: pad(top: -1em / 4)[
        #gh-repo("dodok8/discord-aladin") #h(1fr) Bun, TypeScript
      ],
    )[
      *제품 소개*

      알라딘 Open API를 활용한 도서 정보 공유 디스코드 챗봇, 1인 개발

      *해결 문제*

      - 디스코드에서 도서 정보를 공유하기 위해서 디스코드에 올라온 링크를 접속, 확인한 다음에 다시 디스코드로 돌아와야 하는 불편함이 존재했음

        #figure(
          grid(
            columns: 2, // 2 means 2 auto-sized columns
            gutter: 2mm, // space between columns
            image("./images/discord-aladin_search.png", width: 85%),
            image("./images/discord-aladin_show.png", width: 85%),
          ),
          caption: "discord-aladin 사용 예시(search / show 커맨드 결과)",
          supplement: none,
        )


      *주요 기여*

      - *주요 커맨드*
        - `search` : 디스코드 내에서 알라딘 검색 결과 보여주기. 페이지네이션 제공
        - `show` : 알라딘 검색 결과에서 한 책을 골라 상세 정보 임베딩 제공
        - user install 형태로 제공되어 서버에 상관없이 사용자가 이용 가능
      - *알라딘 Open API*
        - 국내외 자료를 다루는 알라딘에서 도서 정보 및 음반 정보 Open API 제공
        - 해당 API를 활용, 국내 도서 / 외국 도서 / 음반 / DVD / 중고책 정보를 받아옴
        - 응답 정보는 TypeScript 타입을 통해 통일된 스키마로 코드 내에서 활용
      - *Bun, fly.io*
        - 개발 환경(군대) 상 빌드 및 배포 과정을 단순하게 할 필요가 존재
        - 이와 동시에 입력 타입을 검증할 필요 또한 존재
        - 따라서 TypeScript를 지원하며 빌드 과정이 단순한 Bun을 채택함
        - 배포에는 무료 인스턴스와 단순한 CLI 인터페이스를 제공하는 fly.io를 통해서 배포

      *제품 결과*
      - 2025년 5월 기준 8개의 서버와 9명의 개인 사용자가 사용 중
        - 이 중 두 서버에서 도서 정보 교환에 활발하게 이용됨
    ],
    activityEntry(
      from: datetime(year: 2022, month: 12, day: 21),
      title: pad(top: -1em / 4)[
        gsainfoteam/Infoteam-frontend-template #h(1fr) React, Vite, Styled-Component
      ],
    )[

      *제품 소개*

      - 교내 개발팀 Infoteam 내부에 사용되는 프론트엔드 템플릿

      *해결 문제*

      - 리액트 기반 SPA를 만들 때마다 진행되는 반복적인 세팅(i18n, CSS-in-JS)
      - 기존 안티패턴에 대비되는 예시 코드의 정리

      *주요 기여*

      - *안티패턴 발견*
        - 낮은 스타일 코드 응집성: 기존 코드의 경우 스타일 시트 파일과 스타일 시트와 연관된 리액트 컴포넌트 코드가 멀리 떨어진 폴더에서 보관됨. 응집성이 낮아서 연관된 코드 수정에 불편함을 줌
      - *응집성 개선*
        - CSS-in-JS: 도입으로 스타일 시트 응집성 문제 해결
      - *반복 작업 세팅*
        - 패키지 설치시, 반복적으로 `@types` 또한 설치를 진행해야 했음
        - yarn TypeScript 플러그인 적용으로 해당 작업 자동화
      - *문서화*
        - 적용된 린터, 포맷터 세팅 문서화
        - 사용되는 환경 변수 이름 및 사용 상황 문서화
        - cli 를 통한 해당 템플릿 사용 방법 문서화

      *제품 결과*

      - 팀 내에서 리액트 기반 SPA 만들 때 표준이 됨
        - 팀 내에서 사용중인 리액트 관련 기술 스택을 정리하는 부가적인 효과도 나타남
      - 교내 팀 외부 작업에서도 SPA 리액트 앱 제작에 자주 사용됨
    ],
    activityEntry(
      from: datetime(year: 2022, month: 3, day: 10),
      to: datetime(year: 2022, month: 7, day: 10),
      title: pad(top: -1em / 4)[
        #gh-repo("SmartX-Labs/SmartX-Mini") #h(1fr) GitHub, Docker
      ],
    )[
      *제품 소개*

      - GIST 전공 필수 IOT 웹 및 네트워크 인프라 실험 SmartX-Mini 실습 교재

      *해결 문제*

      - 기존 PPT 파일의 경우, 업무 분업 및 변경 사항 추적 불가
      - 오타 및 사용되는 파일 및 명령어의 버전 차이로 인한 진행 불가

      #figure(
        grid(
          columns: 2, // 2 means 2 auto-sized columns
          gutter: 2mm, // space between columns
          image("./images/smartx_mini_old.png", width: 80%),
          image("./images/smartx_mini_new.png", width: 90%),
        ),
        caption: "SmartX Mini InterConnect Lab 실습 교재(좌: 개선 전 PPT, 우: 개선 후 마크다운)",
        supplement: none,
      )

      *주요 기여*

      - *1차 오타 수정*
        - 기존 PPT에 존재하는 오타를 수정한 버전을 제작. 이 버전을 기준으로 다시 실습을 진행하면서 발생하는 버전 충돌 과정을 탐색
        - 오타가 수정된 PPT를 기준으로, 원할한 분업 작업 및 변경사항 추적을 위해 Git 과 markdown 조합을 사용하도록 변경
      - *버전 오류 수정*
        - 분업 후 Kafka와 flume으 로 IoT 장비를 연결 실습을 담당하는
        - 해당 수업에 사용되는 지원이 끊긴 flume 버전 1.6.0의 설치 소스를 archive 저장소 옮기도록 Dockerfile 수정.
      - *실험 후 스프린트*
        - 매주 첫 실험이 끝난 다음, 스프린트를 진행하여 교육자료의 개선점 / 발생한 버그의 해결책을 의논함

      *제품 결과*

      - *원할한 수업 진행*
        - 오타가 없는 수업자료가 제공됨으로서 수업 시 실험 성공률이 올라감.
        - 매주 스프린트 진행 후, 발생하는 오류들에 대한 경고 및 해결 방식을 메뉴얼에 반영함으로서 다음 수업에서는 같은 오류를 막을 수 있었음.
      - *원할한 인수인계*
        - 2022년 수정 당시는 마크다운으로 옮기고 현행 버전으로 옮기는 것을 목표로 진행되었음.
        - 2023년 부터는 지원이 끊긴 버전을 최신 버전으로 올리는 마이그레이션을 진행.
          - 이전 과정에서는 매년 반복되는 오류를 수정하느라 낭비되었을 인력이 버전 마이그레이션 위주로 투자 되었음.
    ],
    activityEntry(
      from: datetime(year: 2021, month: 7, day: 23),
      to: datetime(year: 2021, month: 12, day: 23),
      title: pad(top: -1em / 4)[
        Pedalers/wheelie-ts-android #h(1fr) React Native, TypeScript
      ],
    )[
      *제품 소개*

      - 자전거 여행객을 위한 관광 어플리케이션(안드로이드) Wheelie.

      *해결 문제*

      - 당시 존재하는 자전거 여행 보조 앱들은 코스 설계 및 운동 기록 측정에 기반을 둔 스포츠 앱
      - 자전거를 운동수단으로 활용하는 것이 아니라 관광수단으로 활용하는 경우(에시) 자전거 여행 중 주변 관광지 나들이)를 위한 앱의 부재

      #figure(
        grid(
          columns: 3,
          gutter: 2mm, // space between columns
          image("./images/wheelie_home.png", width: 75%),
          image("./images/wheelie_path.png", width: 75%),
          image("./images/wheelie_location.png", width: 75%),
        ),
        caption: "Wheelie 주요 기능 디자인 묵업(홈 페이지 / 장소 상세 소개 / 위치 지정)",
        supplement: none,
      )


      *주요 기여*

      - *React Navigation* 을 통한 화면 설계 및 전체 레이아웃 구현
      - *Redux 기반 위치 및 계정 정보 저장 설계*
        - 카카오 API 와의 연동으로 현재 법정동 위치 파악
        - 유저가 선택한 법정동 정보를 기반으로 주변 지역에 위치한 관광지 목록 정보 제공
      - *관광지 세부 정보 제공*
        - 한국관광공사에서 제공하는 관광지 세부 내용 설명 소개글 및 사진 목록 제공
        - 인 앱 내부 지도 웹 앱에 URL 쿼리 형태로 관광지 위치 정보 전달

      *제품 결과*

      - 한국관광공사 2021 관광데이터 활용 공모전 우수상 수상 #h(1fr) #link("https://kto.visitkorea.or.kr/upload/flexer/upload/ktobiz/20211118/73f1fa76-480f-11ec-83c5-df9c32bb7038.hwp.files/Sections1.html")[#underline[#icon("lucide/earth") 보도자료]]
    ],
    activityEntry(
      from: datetime(year: 2020, month: 7, day: 10),
      to: datetime(year: 2021, month: 5, day: 30),
      title: pad(top: -1em / 4)[
        GISTORY #h(1fr) React, Vite, TypeScript
      ],
    )[
      *제품 소개*

      GIST 학생을 위한 리액트 기반 BBS 커뮤니티

      *해결 문제*

      - GIST 내부 학생들을 위한 온라인 커뮤니티 공간의 부재

      #figure(
        grid(
          columns: 2, // 2 means 2 auto-sized columns
          gutter: 2mm, // space between columns
          image("./images/gistory_main.png"),
          image("./images/gistory_article.png", width: 65%),
        ),
        caption: "Gistory 메인 페이지 및 게시물 페이지",
        supplement: none,
      )

      *주요 기여*

      - *REST API 연동 및 Redux 상태관리 설계*
        - 게시물 목록 불러오기 / 게시물 보기 / 게시물 작성 / 첨부 파일 업로드 API 연동
        - 첨부 파일 용량 파악 및 정보 파악을 위한 차트 컴포넌트(chart.js 기반)
      - *RBAC 기반의 권한 관리를 위한 어드민 페이지 설계*
        - 현재 유저에게 부여된 룰 목록 및 룰에 부여된 액션 목록을 쉽게 보기 위한 컴포넌트 설계
      - *배포 솔루션 변경*
        - Jenkins에서 Cloudflare Pages 및 github-actions로 전환
        - 비용 절감, 배포 파이프라인 단순화 및 배포 시간 절감
      - *TypeScript 마이그레이션*
        - 버그의 주요 원인인 타입 불일치를 해결하기 위하여 진행
        - `boolean | undefined` 로 관리되던 로딩 상태를 안전하게 다루기 위한 헬퍼 함수 추가
          - `undefined` 와 `true`에서는 폴백 컴포넌트가 보여야 했고, `false` 에서는 본래 컴포넌트가 보여야 했음 이를 다루는 `loadComponent()` 함수 추가
        - 대형 컴포넌트 타입 작성으로 자식 컴포넌트와 타입 불일치가 발생하는 부분 발견, 버그 수정
      - CRA 에서 Vite 마이그레이션
        - 컴포넌트 증가로 인해 느려지는 빌드 및 개발서버 실행 속도를 해결하기 위해 Vite로 마이그레이션
        - 빌드 시간을 4분의 1로 단축

      *제품 결과*
      - 이후 시장 조사 결과, 사용자가 원하는 것은 쌍방 소통 형태의 BBS 보다는 정보글만 선택해서 볼 수 있는 모아보기 형태의 앱이라는 결론이 나옴
        - GISTORY의 서비스 종료 후, 시장 조사 결과를 반영한 공지 전달 플랫폼 Ziggle 제작작
      - GISOTRY 개발 및 그 외 SPA 개발 과정에 있었던 반복된 세팅 및 안티 패턴 문제를 해결하기 위해 gsainfoteam/Infoteam-frontend-template 제작
    ],
  ),
)
