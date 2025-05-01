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
      
      교내 개발팀 Infoteam 내부에 사용되는 프론트엔드 템플릿
      
      *해결 문제*
      
      - 새로운 리액트 기반 SPA를 만들 때마다 진행되는 반복적인 세팅(i18n, CSS-in-JS)
      - 기존 안티패턴에 대비되는 예시 코드의 정리

      *주요 기여*

      - 스타일 코드 관리 방식 통일: 기존의 경우 컴포넌트 코드와 스타일 시트를 다른 폴더에서 관리. 이를 CSS-in-JS를 이용하여 같은 코드에서 관리, 응집성 증가.
      - yarn TypeScript 플러그인 적용: 패키지 설치시 `@types` 별도 설치를 해야 하는 반복작업 해소 
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
      
      GIST 전공 필수 IOT 웹 및 네트워크 인프라 실험 SmartX-Mini 실습 교재
      
      *해결 문제*
      // 기존 파일 사진 넣기
      - 기존 PPT 파일은 업무 분업 및 변경 사항 추적 불가
      - 오타 및 사용되는 파일 및 명령어의 버전 차이로 인한 진행 불가
      

      *주요 기여*
      
      // 새로운 파일 사진 넣기
      - 전반적인 자료 오타 수정: 전체 수업 자료에서 1차적인 오타 발견 및 수정
      - InterConnect Lab 메인 진행 담당:  Kafka로 IoT 장비를 연결 실습 담당 및 오류 수정 스프린트 회의 진행
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

      자전거 여행객을 위한 관광 플랫폼 Wheelie

      // 윌리 제품 디자인 사진 넣기
      *해결 문제*
      - 자전거 여행객을 위한 관광 정보 종합 수단의 부족

      *주요 기여*
      - React Navigation 을 통한 화면 설계 담당
      - Redux 기반 위치 및 계정 정보 저장 설계 담당
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
    activityEntry(
      from: datetime(year: 2025, month: 2, day: 22),
      title: pad(top: -1em / 4)[
        #gh-repo("dodok8/Ilots-log") #h(1fr) Bun, Svelte
      ],
    )[
      리듬게임 Rotaeno를 위한 사용자 곡 기록 및 추천 시스템 #h(1fr) #link("https://Ilots-log.pages.dev")[#icon("lucide/earth") #underline[사이트]]
      - Bun을 통한 위키 크롤러 스크립트 코드 세팅 및 테스트 코드 작성 단순화
      - Class Rune 을 이용한 상태관리
        - 사용자 점수 데이터 및 레이팅 계산 로직 단순화
        - Google Drive 연동 코드 단순화
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

== 오픈소스 기여

#gh-repo("httptoolkit/brotli-wasm") #link("https://github.com/httptoolkit/brotli-wasm/pull/29")[
  PR \#29 Fix Error(#28) in exports field in package.json
]
#pad(left: 1em)[
  - package.json의 더 이상 지원되지 않는 type 필드로 인한 타입 인식 에러
  - 지원되지 않는 types 필드 대신, exports 내에 types 필드를 추가하여 해결
]

#gh-repo("velopert/velog-client") #link("https://github.com/velopert/velog-client/pull/477")[PR \#477 Fix post.ts 쿼리 오타]
#pad(left: 1em)[
  - 블로그 서비스 Velog 에서 2023.12.26 - 2023.12.29. 기간 동안 글 등록 불가 오류 발생
  - 게시물 수정시 수정 완료된 게시물을 불러오는 Graph QL 댓글 관련 쿼리문에서 오타 발견, 이를 수정하여 해결함
]