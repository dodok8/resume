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
          #text(weight: 600, tracking: 1pt)[#metadata.role]
          \@
          #text(weight: 600, tracking: 0.5pt)[#metadata.location]
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
      [#icon("lucide/mail") *전자 우편#super[Mailbox]*], link("mailto:" + metadata.email)[#metadata.email],
      [#icon("lucide/phone") *전화#super[Phone]*], link("tel:" + metadata.phone.join())[#metadata.phone.join(" ")],
    ),
    grid(
      columns: (auto, 1fr),
      column-gutter: 16pt,
      row-gutter: 8pt,
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

#text(size: 16pt, weight: 400)[
  #text(size: 16pt, weight: 900)[
    포트폴리오 #sym.dash.em #text(tracking: 2pt)[Portfolio]
  ]
]


#show heading: it => {
  set text(size: 20pt - ((it.level - 1) * 2pt))
  it
}
#show figure: it => pad(y: 10pt, it)

== #pad(top: -1em / 4)[
  #gh-repo("dodok8/Ilots-log")#super[제작기간: 2025.02] #h(1fr) #tech-chips.bun #tech-chips.typescript #tech-chips.svelte
]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #figure(
      image("./images/ilots-log_main.png", height: 20%),
      caption: [
        이로의 로그 메인 페이지\ (https://ilots-log.pages.dev)
      ],
    )
  ],
  [
    이로의 로그(ilot's log)는 리듬게임 로테이노(Rotaeno) 유저를 위한 웹 서비스입니다. 1인 개발로 진행되었으며, 다음 기능을 제공합니다.

    + 곡 난이도 상세 정보 위키 크롤러 (#gh-repo("dodok8/rotaeno-toolkit"))
    + 유저 곡 점수 입력 후 레이팅 계산 #link("https://ilots-log.pages.dev/scores")[`/scores`]
    + 레이팅 최고 곡 Best 30 관리 및 차트 제공 및 차트 이미지 다운로드 #link("https://ilots-log.pages.dev/best")[`/best`]
    + Best 30 기록에 기반한 레이팅 갱신을 위한 곡 추천 #link("https://ilots-log.pages.dev/report")[`/report`]
    + 구글 드라이브 및 브라우저 로컬 스토리지 점수 백업 기능 #link("https://ilots-log.pages.dev/backup")[`/backup`]

  ],
)

=== 곡 난이도 상세 정보 위키 크롤러(#gh-repo("dodok8/rotaeno-toolkit"))
==== 위키 데이터 크롤링의 문제점
리듬게임 레이팅 정보를 정확하게 계산하기 위해 필요한 데이터를 위키에서 크롤링 하였습니다. 이 과정에서 많은 예외 케이스를 발견하였습니다.

- 일반적으로 곡당 4개 난이도 제공, 하지만 5개 난이도 제공 곡들도 존재
- 여러 언어로 제목 지원하는 경우 다양한 변형 발생
- 일관되지 않은 표 구조와 형식

==== 해결책: TDD, #tech-chips.typescript, #tech-chips.bun

- TDD 도입
  - 엣지 케이스 별로 테스트 먼저 작성: 점진적으로 파서 확장 가능
    - 소스 코드를 확장한 이후 기존 기능에 미치는 영향 확인 가능
    - 테스트 결과를 통해 누락된 데이터를 확인하며 단계적으로 구현, 지속적인 피드백 가능.
- TypeScript 도입
  - 만들어진 웹 앱에 동일한 스키마를 활용 가능
  - 데이터가 정해진 스키마를 벗어날 경우 IDE 경고 활용 가능
- Bun 도입
  - Test 세팅이 별도로 필요 없고, TypeScript 이 별도로 필요 없으며, 빠른 fetch를 제공 및 node.js 모듈과 호환되기 때문에 가장 최적의 런타임이었음.
  - 가장 단순한 세팅으로 구현에만 집중 가능.

=== 웹 앱 곡 상태 관리(`/scores`)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #image("./images/ilots-log_songcard.png", width: 100%)
    #align(center)[#text(size: 9pt)[유저의 점수 입력 컴포넌트]]
  ],
  [
    로테이노에는 약 260 곡이 있으며, 각 곡마다 최소 4개의 난이도가 존재합니다. 이 값들은 아래 과정을 거쳐서 최종적으로 유저 레이팅으로 계산됩니다.

    - 유저가 입력한 점수 데이터와 상수 데이터를 이용해 곡별 레이팅 점수를 계산
    - 상위 레이팅 30 곡을 `getBest30()`를 통해 선정
    - 상위 10곡에 가중치를 더 주는 평균을 계산해서(`getBest30Average()`) 유저 종합 레이팅 계산

    이 상태 관리에서 아래와 같은 문제점이 있었습니다.
  ],
)

==== 문제점

- 1000여 개의 유저의 점수 입력 정보를 저장해야함. (새로고침에서도 값이 유지되어야 함.)
- 해당 정보에서 유도되는 상황이 존재하여 로직이 복잡함
- 위의 정보들은 웹 앱 전체에서 쓰이는 정보임.
- Svelte 4 에서는 store를 통해 해결이 가능하지만, 값을 업데이트하는 코드가 복잡해짐.

==== 해결책: #tech-chips.svelte Rune

- Sevlte 5에 도입된 Rune 사용
  - 여러 파일에서 사용 가능
  - 값 변화시 그 값이 사용되는 곳에서만 갱신 되며, store와 달리 일반적인 값처럼 사용 가능
  - 원래 값(`$state`)와 유도되는 값(`$derived`)도 클래스를 통해 하나로 묶어서 관리가 가능
    - 로컬스토리지 저장 같은 관련 로직을 메소드로 정리 가능하여 응집성 증가.

=== 레이팅 최고 곡 Best 30 관리 및 차트 제공 및 차트 이미지 다운로드 (`/best`)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #align(center)[#image("./images/ilots-log_best30.png", width: 80%)]
    #align(center)[#text(size: 9pt)[유저의 점수 입력 컴포넌트]]
  ],
  [
    저장된 정보를 바탕으로 한 Best30 차트 컴포넌트 및 해당 컴포넌트를 이미지로 저장하는 기능이 있습니다. html2Canvas를 활용하여 이미를 저장하는 과정에서 다음과 같은 문제가 있었습니다.

    ==== 문제점

    - 곡 재킷이 사이트에서는 보이나 html2Canvas를 통해 생성된 이미지에서는 보이지 않음.
      - 원인: 이미지 원본 사이트의 CORS 설정으로 인해 외부에서 이미지 이용 불가.
  ],
)

==== 해결책: 프록시 서버

해결 방법으로 생각한 것은 두 가지 였습니다.

- 앨범 아트 애셋을 웹 앱에 포함 : 전체 260여 곡 중에서 이미지 차트에 활용되는 것은 최대 30 곡이므로 용량에 낭비 발생
- *프록시 서버 사용*: 필요한 이미지에 대해서만 적용 가능. 무료 서비스를 제공하는 https://images.weserv.nl/ 를 사용하기로 결정.

이미지 프록시 서버 적용 이후에 html2Canvas에서 만들어진 이미지에서도 곡 재킷이 정상적으로 표시되었습니다.

=== Google Drive 코드의 문제

이로의 로그에서는 안정적인 점수 정보 저장 및 공유를 위해 구글 드라이브와 연동을 제공했습니다. 구글 드라이브와 연동을 위한 라이브러리는 CDN을 사용해야 했습니다.

==== 문제점

- 컴포넌트가 CDN 로드 후 작동하도록 하기 위해 컴포넌트의 마운트 시점에 해당 CDN 태그를 작성하는 하도록 함.
  - CDN을 통한 구글 드라이브 클라이언트 초기화 과정이 복잡해짐
  - 클라이언트 객체 생성을 페이지 렌더링마다 반복하는 비효율성

==== 해결책: #tech-chips.svelte Rune

- 클라이언트 객체는 `$state` 를 통해 하나만 생성하고, 클래스로 묶어서 관리하며 한 객체와 그 메소드를 통해서만 접근할 것
- 위 객체의 `isInitialized`를 확인하여 해당 컴포넌트 및 로딩 컴포넌트 렌더링을 결정할 것
- CDN 코드의 로드는 `onload` 이벤트와 그와 연동되는 상태를 통해 확인하고, `<svelte:head />` 태그를 이용해 필요한 페이지에서만 CDN 태그를 불러올 것.

이렇게 함으로서 구글 드라이브와 관련된 코드의 위치를 하나로 통일해 응집성을 높였으며, 불필요한 페이지에서 해당 CDN에 로드되지 않도록 하였고, 백업 버튼 컴포넌트의 안전한 실행을 보장하도록 하였습니다.

== #pad(top: -1em / 4)[
  #icon("lucide/earth") GISTORY #super[제작기간: 2020.07 - 2022.11] #h(1fr) #tech-chips.react #tech-chips.vite #tech-chips.typescript--short
]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #align(center)[#image("./images/gistory_main.png", width: 80%)]
    #align(center)[#text(size: 9pt)[지스토리 메인페이지]]
  ],
  [
    GISTORY는 GIST 학생을 위한 BBS 커뮤니티 사이트로, 현재는 유저수 감수를 이유로 폐쇄 되었습니다. 그러나 이때 얻은 기술적 교훈은 문서화 되어 프론트엔드 템플릿 저장소라는 후속 프로젝트로 이어지게 되었습니다.

    프론트엔드 3명, 백엔드 2명이 참여하여 진행된 팀 프로젝트 였습니다.

    해당 사이트의 기능은 다음과 같습니다.
    - RBAC 기반 유저 역할 제어
    - 유저 정보 수정 페이지
    - 전공 및 주제별 게시판 및 글쓰기 페이지
    - 게시물 검색
    - 학사일정
  ],
)



제작 과정 중에 제가 담당한 역할은 다음과 같습니다.
- 기본적인 디자인 및 UX 설계
- 개인정보 수정 페이지
- Vite 마이그레이션
- TypeScript 마이그레이션

=== Vite 마이그레이션

==== 문제점
지스토리는 처음에는 CRA로 제작되었던 앱이었습니다. 이에 따라 다음 문제점이 발생하였습니다.

- Webpack의 설정이 블랙박스여서 빌드 설정을 건드리기 힘듬
- 컴포넌트 수가 늘어남에 따라 개발 서버의 속도가 매우 느려짐.

==== 해결책

해당 문제점은 CRA 대신 Vite로 전환하면서 해결했습니다. 이 과정에서 다음 설정들을 적용하였습니다.

- `vite-plugin-svgr`: CRA에서 처럼 SVG 파일을 컴포넌트로 불러오게 하기
- `vite-plugin-checker`: eslint, tsc 경고를 vite 콘솔에 통합
- `vite-tsconfig-path` : tsconfig에 설정해 놓은 alias를 vite에서 인식하도록 함.

해당 경험은 자료를 정리한 후 지스트 내부 개발자 컨퍼런스에서 발표를 진행하였습니다. (발표자료 저장소: #gh-repo("dodok8/vite-migrate"))

=== 스타일시트 페이지 단위 관리

==== 문제점

스타일 시트를 효율적으로 구성하기 위해 SCSS를 사용했습니다. 그러나 nest 기능 및 일부 변수화를 제외하면 제대로 활용하지 못했습니다.

- 모든 스타일 시트를 페이지 및 커다란 컴포넌트 단위로 별도 폴더에서 관리
  - 작은 컴포넌트 하나의 스타일을 바꿀 때에도 수정 범위가 증가함.
  - 마크업 코드와 스타일 코드가 떨어져 있어 응집도가 낮아 수정하기 불편함.
  - 컴포넌트가 많은 회원정보 수정 페이지의 경우 페이지 시트의 길이가 엄청나게 길어짐.

==== 해결책

- 이후 프로젝트에서는 스타일 시트와 마크업 코드 사이의 응집도를 늘리기로 하였음.
  - 이를 위해 styled-component와 같은 CSS-in-JS 방식을 선택

=== 리덕스 스토어의 잘못된 연결

==== 문제점

공유되는 상태 관리를 위해 Redux와 Redux Saga를 사용하였으나, 다음과 같은 문제를 겪었습니다.

- `useSelector` 훅 대신 Connector 패턴 사용.
- 필요한 곳에서 스토어와 연결하는 대신 페이지 단위에서 스토어와 연결 후 prop으로 내려줌.
  - 결과적으로 컴포넌트가 복잡해지고 prop이 많아졌으며, 재렌더링이 빈번해짐.

==== 해결책

- 상태공유 라이브러리의 사용 줄이기: 단순한 비동기 처리 및 데이터 fetch의 경우 react-query(현 tanstack-query) 같은 라이브러리를 사용함
- 응집성 증가: Redux와 같은 상태 공유 라이브러리를 쓸 때도 해당 상태가 필요한 곳에서 불러오도록 변경

=== TypeScript 전환

==== 문제점

- 위의 잘못된 리덕스 사용문제와 맞물려 하나의 컴포넌트가 매우 많은 props을 요구했음.
  - 타입스크립트 타입으로 표현하는 데 어려움을 겪음.
- 데이터의 로드 상태를 boolean이나 Promise로 관리하는 대신에 string 값과 undefined로 관리함.
  - 체크하는 코드 작성도 길어졌으며, TypeScript 타입으로 해당 내용을 표현하는데 어려움을 겪었음.

==== 해결책

- 컴포넌트의 Prop이 무분별 하게 늘어나지 않도록 컴포넌트를 적당한 크기로 나누고, 합성 타입을 활용하도록 변경
- 데이터의 로딩 상태를 따로 값으로 알아야 할때는 boolean을 사용하도록 설계 변경
