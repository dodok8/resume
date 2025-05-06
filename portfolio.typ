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

#text(size: 14pt, weight: 400)[
  #set par(leading: 8pt)
  #text(size: 8pt, weight: 900, top-edge: -0pt, bottom-edge: 0pt)[
    자기소개 #sym.dash.em #text(tracking: 2pt)[INTRODUCTION]
  ] \
  #metadata.bio.ko.title \ #text(size: 10pt)[#metadata.bio.ko.body]
]

#line(length: 100%, stroke: 0.75pt)

#activityList(
  header: [
    == 팀 개발 프로젝트
  ],
  (
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

      - 스타일 코드 관리 방식 통일: CSS-in-JS를 이용하여 스타일 시트와 컴포넌트 코를 같은 코드에서 관리하도록 변경, 응집성 증가.
      - yarn TypeScript 플러그인 적용: 패키지 설치시 `@types` 패키지를 별도 설치를 해야 하는 반복작업 해소
      - 템플릿 저장소 지정 및 degit 명령어 활용을 통한 템플릿 사용 방법 문서화
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

      - 전반적인 자료 오타 수정: 전체 수업 자료에서 1차적인 오타 발견 및 수정
      - InterConnect Lab 메인 진행 담당: Kafka로 IoT 장비를 연결 실습 담당 및 오류 수정 스프린트 회의 진행
      - Git 과 markdown 으로 교육자료 변경 사항 추적 및 관리

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

      - React Navigation 을 통한 화면 설계 및 전체 레이아웃 구현
      - Redux 기반 위치 및 계정 정보 저장 설계
        - 카카오 API 와의 연동으로 현재 법정동 위치 파악
        - 유저가 선택한 법정동 정보를 기반으로 주변 지역에 위치한 관광지 목록 정보 제공
      - 관광지 세부 정보 제공
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

      - RBAC 기반의 권한 관리를 위한 어드민 페이지 설계
        - 현재 유저에게 부여된 룰 목록 및 룰에 부여된 액션 목록을 쉽게 보기 위한 컴포넌트 설계
      - REST API 활용 및 상태관리 설계
        - 게시물 목록 불러오기 / 게시물 보기 / 게시물 작성 / 첨부 파일 업로드 API 연동
        - 첨부 파일 용량 파악 및 정보 파악을 위한 차트 컴포넌트(chart.js 기반)
      - 배포 솔루션 변경: 젠킨스에서 Cloudflare Pages 및 github-actions로 전환
        - 비용 절감, 배포 파이프라인 단순화 및 배포 시간 절감.
      - TypeScript 마이그레이션 제안 및 리팩토링 주도
        - 버그의 주요 원인인 타입 불일치를 해결하기 위하여 진행
        - `boolean | undefined` 로 관리되던 로딩 상태를 안전하게 다루기 위한 헬퍼 함수 추가
        - 대형 컴포넌트의 prop 타입 작성으로 자식 컴포넌트의 prop과 타입 불일치가 발생하는 부분 발견 및 버그 수정
      - CRA 에서 Vite 마이그레이션
        - 컴포넌트 증가로 인해 느려지는 빌드 및 개발서버 실행 속도를 해결하기 위해 Vite로 마이그레이션
        - 빌드 시간을 4분의 1로 단축

      *제품 결과*
      - 이후 시장 조사 결과, 사용자가 원하는 것은 쌍방 소통 형태의 BBS 보다는 정보글만 선택해서 볼 수 있는 모아보기 형태의 앱이라는 결론이 나옴.
        - GISTORY의 서비스 종료 후, 시장 조사 결과를 반영한 공지 전달 플랫폼 Ziggle 출시
      - GISOTRY 개발 및 그 외 SPA 개발 과정에 있었던 반복된 세팅 및 안티 패턴 문제를 해결하기 위해 gsainfoteam/Infoteam-frontend-template 제작.
    ],
  ),
)

#pagebreak()

#activityList(
  header: [
    == 1인 개발 프로젝트
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

      리듬게임 Rotaeno를 위한 사용자 곡 기록 및 추천 시스템 #h(1fr) #link("https://Ilots-log.pages.dev")[#icon("lucide/earth") #underline[사이트]]

      *해결 문제*

      - 유명 리듬게임의 경우 #link("https://chunithm-net-eng.com")[#icon("lucide/earth") #underline[chunithm-net]] 같은 공식 기록 공유 사이트 및 #link("https://v-archive.net/")[#icon("lucide/earth") #underline[V-archive]]와 같은 비공식 기록 공유 사이트가 존재함.
      - Rotaeno 에는 업데이트가 종료된 #link("https://rotaeno.imgg.dev/")[#icon("lucide/earth") #underline[RotaenoKit]] 밖에 존재하지 않았음.
      - 해당 사이트의 경우, 로컬에 정보를 저장하기에 다른 기기에서 같은 기록을 관리하지 못함.

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

      - Bun을 통한 위키 크롤러 스크립트 코드 세팅 및 테스트 코드 작성 단순화
        - 레이팅 계산에 필요한 곡 세부 정보를 구하는 과정을 테스트 코드로 표현
        - 이후 테스트 코드에 맞춰서 작성함으로서 복잡한 사이트를 처리하면서 필요한 곡 별 세부 정도 데이터를 얻을 수 있었음.
        - 이 과정에서 Bun을 사용함으로서 추가적인 세팅 없이 단순하게 테스트 코드와 데이터 페칭을 위한 코드를 관리할 수 있었음.
      - 사용자 점수 데이터 및 레이팅 계산 로직 단순화
        - 
      - Google Drive 연동을 통한 점수 저장
      - 이미지 프록시 사용으로 베스트 40 차트 제작 단순화 및 용량 최적화
    ],
    activityEntry(
      from: datetime(year: 2023, month: 12, day: 24),
      title: pad(top: -1em / 4)[
        #gh-repo("dodok8/discord-aladin") #h(1fr) Bun, TypeScript
      ],
    )[
      알라딘 Open API를 활용한 도서 정보 공유 디스코드 챗봇
      - `search` : 디스코드 내에서 알라딘 검색 결과 보여주기. 페이지네이션 제공
      - `show` : 알라딘 검색 결과에서 한 책을 골라 상세 정보 임베딩 제공
      - user install 형태로 서버에 상관없이 이용가능
    ],
  ),
)
