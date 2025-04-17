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
#set text(font: "Pretendard", features: ("ss06",), fallback: true)
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

== 기술

- *React*, React-Native
  - 다수의 웹 앱 제작 경험 및 모바일 앱 제작 경험
  - 운영 중인 앱 *TypeScript* 마이그레이션 경험
  - Redux 를 통한 상태관리에 능숙함
- Bun
  - Bun 테스트 러너 기반 *테스트 스크립트 작성* 경험
  - *TypeScript* 기반 앱 작성 및 배포 경험
// - Svelte
//   - 라이브 서비스 중인 웹 앱 개발 경험
//   - Svelte 5에 도입된 Rune 에 능숙
// - Python
//   - Tkinter를 통한 GUI 앱 제작 가능
//   - Streamlit, Gradio 를 통한 AI 모델을 위한 웹 앱 작성에 능숙
- Git, Github, Github-actions
  - Git과 GitHub 을 이용한 *프로젝트 관리*에 능숙
  - *GitHub Actions*를 이용한 *배포 자동화 경험*


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
      교내 개발팀 Infoteam 내부에 사용되는 프론트엔드 템플릿
      - 기존 프로젝트 *안티 패턴(스타일 시트의 낮은 코드 응집성, i81n을 고려하지 않은 설계) 및 반복적인 세팅 분석* 담당
    ],
    activityEntry(
      from: datetime(year: 2022, month: 8, day: 21),
      title: pad(top: -1em / 4)[
        #gh-repo("Regulus-JunctionXAsia2022/Widget") #h(1fr) React, Vite
      ],
    )[
      Junction Asia 2022 해커톤 출품작. 메타버스 플랫폼 Zep 에서 돌아가는 가상 펫 플랫폼 Zepp을 제작함
      - Zep *클라이언트 내부에서 실행되는 웹 앱* 제작 담당
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
      - 자료 및 예시 도커파일에서 버전 호환성으로 인한 *버그 추적 및 버전 고정*
      - 실험 수업 진행 단위별 *스프린트 회의* 진행, 교육 자료 개선
      - Git 과 markdown 으로 교육자료 *변경 사항 추적 및 관리*

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
    activityEntry(
      from: datetime(year: 2021, month: 5, day: 30),
      title: pad(top: -1em / 4)[
        #gh-repo("JunctionX-Seoul-Caffeine/Calmmuter") #h(1fr) React
      ],
    )[
      JunctionXSeoul 2021 수상작. 교통약자를 위한 맞춤 택시 플랫폼 Calmmuter 기획 #h(1fr) #link("https://velog.io/@dodok8/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%ED%9A%8C%EA%B3%A0%EB%A1%9D-JunctionXSeoul-2021-Team-Caffeine")[#icon("lucide/earth") #underline[참여후기]]
      - *팀 의사결정 기록* 담당
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
      - Vite 마이그레이션을 통한 *빌드 및 배포 시간 개선*
      - *TypeScript 마이그레이션* 제안 및 리팩토링 주도
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
      - Bun을 통한 위키 크롤러 스크립트 코드 세팅 및 *테스트 코드 작성* 단순화
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

#activityList(
  header: [
    == 커뮤니티 프로젝트
  ],
  (
    activityEntry(
      from: datetime(year: 2022, month: 10, day: 14),
      title: belonging([스태프], [GIST DEV NIGHT]),
    )[
      GIST 내 개발자를 위한 컨퍼런스 GIST DEV NIGHT 파일럿 프로그램을 기획 및 운영 #h(1fr) #link("https://gistnews.co.kr/?p=5929")[#icon("lucide/earth") #underline[교내 기사]]
      - *Code of Conduct 작성*, 발표자 선정, 네트워킹 세션 진행을 담당
      - CRA에서 Vite 전환 과정을 발표 #h(1fr) #link("https://github.com/dodok8/vite-migrate")[#underline[#icon("lucide/earth") 발표자료]]
    ],
  ),
)

== 오픈소스 기여

// - #gh-pull-rich(gh-pull("https://github.com/fabian-hiller/valibot/pull/429"))
//   #pad(left: 1em)[Schema 검증 라이브러리]

#gh-repo("httptoolkit/brotli-wasm") #link("https://github.com/httptoolkit/brotli-wasm/pull/29")[
  PR \#29 Fix Error(#28) in exports field in package.json
]
#pad(left: 1em)[
  - package.json의 더 이상 지원되지 않는 type field 로 인한 타입 인식 에러
  - 지원 안되는 types 필드 대신, exports 내에 types 필드를 추가하여 해결
]

#gh-repo("velopert/velog-client") #link("https://github.com/velopert/velog-client/pull/477")[PR \#477 Fix post.ts 쿼리 오타]
#pad(left: 1em)[
  - 블로그 서비스 Velog 에서 2023.12.26 - 2023.12.29. 기간 동안 글 등록 불가 오류 발생
  - 게시물 수정시 수정 완료된 게시물을 불러오는 Graph QL 댓글 관련 쿼리문에서 오타 발견, 이를 수정하여 해결함
]


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
      군 복무 중 수행한 프로젝트 \
      - 감정 분석 결과 활용을 위한 챗봇형 Streamlit 웹 클라이언트 #h(1fr) Python, HTML, CSS
      - openpyxl을 이용하여 엑셀로 입출력이 가능하도록 웹 클라이언트 개선 #h(1fr) Python
      - Tkinter 를 이용하여 간단한 물리 시뮬레이션 구현 #h(1fr) Python
    ],
    workExpEntry(
      from: datetime(year: 2021, month: 12, day: 18),
      to: datetime(year: 2023, month: 2, day: 17),
      role: "학부 인턴",
      organization: "GIST NetAI Lab",
      homepage: link("https://netai.smartx.kr/")[netai.smartx.kr],
    )[
      NetAI 랩 학부 인턴으로서 진행한 프로젝트
      - #icon("lucide/book") #link("https://www.dbpia.co.kr/journal/articleDetail?nodeId=NODE11224575")[교통 CCTV 엣지에서 비식별화를 위한 wasm 앱 구현 및 논문 출판] #h(1fr) Rust, Wasm
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
      GIST 내부의 문제를 개발로서 해결하는 인포팀 소속으로서 진행한 프로젝트
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
        [#link("https://kto.visitkorea.or.kr/upload/flexer/upload/ktobiz/20211118/73f1fa76-480f-11ec-83c5-df9c32bb7038.hwp.files/Sections1.html")[제품/서비스 개발 부분 우수상]],
        [2021 관광데이터 활용 공모전],
      ),
    )[
      - 자전거 여행객 플랫폼 Wheelie
    ],
    activityEntry(
      from: datetime(year: 2021, month: 7, day: 23),
      title: belonging([AutoCrypt Track 2#super("nd") Winner], [JunctionXSeoul 2021]),
    )[
      - 교통 약자를 위한 택시앱 Calmmuter
    ],
  ),
)


#pagebreak()
#set par(
  first-line-indent: (
    amount: 0.75em,
    all: true,
  ),
)


== 자기소개서
이력서에 못 담은 제가 거쳐온 행동들에 담겨있는 자세한 스토리를 자기 소개서에 담았습니다.

=== 지원 동기: 왜 프론트엔드 개발자인가?

프론트엔드는 문자 그대로 제품의 제일 앞을 담당하는 분야입니다. 즉, 제품이 고객에게 닿으려면 프론트엔드 개발이 필수적이며, 제품이 개발되는 과정에서 일어나는 여러 소통과 논의 과정을 명확히 파악하고 이를 제품의 코드에 반영해야 한다는 의미입니다.

이러한 소통 과정에는 다양한 사람이 참여합니다. PO, 디자이너, 백엔드 개발자가 프론트엔드 개발자와 함께 제품의 기획에 관해 이야기하기도 하며, 디자인적 요소가 사용자에게 어떻게 영향을 끼칠지, 어떤 방법으로 이를 파악할지, 어떤 데이터가 필요하며 어느 형태로 주고받아야 하는지 논의하기도 합니다. 이러한 과정에서 제일 중요한 점은 자신을 포함한 팀원의 의견과 의도를 알고 반영하는 것입니다. 서로 다른 의견이 나오는 경우에도, 상대방의 의견과 의도, 맥락을 정확히 파악하면 더 좋은 하나의 답을 찾아 나설 수 있습니다.

짧은 프로젝트에서도, 긴 프로젝트에서도 저는 프론트엔드 엔지니어라는 역할 외에도 팀원과 제 의도와 의견을 기록하는 일 또한 해왔습니다. 해커톤에서 토론이 길을 잃고 길어질 때마다 각자가 이때까지 한 발언을 정리해서 올리는 것으로 의도와 의견을 모아서 정리했습니다. 장기 개발 프로젝트에서는 정기적인 코드 리뷰 시간을 운영하고 팀원 간의 논의와 결과를 회의록에 작성했습니다.

이를 통해 프론트엔드 엔지니어라는 본래의 역할에서도 팀의 의견과 의도를 반영한 코드를 작성할 수 있었습니다. 이러한 과정을 즐기면서 개발을 해왔기에, PO, 디자이너, 백엔드, 인프라 등 여러 분야의 팀원들과 소통하며 개발하는 프론트엔드 개발자를 지향하게 되었습니다. 

=== 지원 동기: 왜 토스플레이스인가?

토스플레이스에서의 사업이, 고객과 점주를 편안하게 한다는 성공의 필요조건을 지원하기 때문이며, 이 지원을 개발하기 위해 필요한 과정에서 마주하게 될 수많은 변수를 해결하는 과정이 여러 분야의 팀원과 소통하면서 개발하는 프론트엔드 개발자라는 제 목표와도 닿아있기 때문입니다.

저희 부모님은 수십년 간 의류 소매업을 하고 계십니다. 그 오랜 시간, 옆에서 수많은 가게들이 들어왔다 사라지는 광경 또한 보았습니다. 사라지는 가게들은 다양한 이유로 사라져 가지만, 살아남는 가게들의 공통점으로는 고객에게 만족을 주는 사용 경험이 있었습니다. 이용 과정에서 혼잡하지 않고, 좋은 상품을 제공하고, 결제 과정이 버벅이지 않는 경험을 제공하는 가게들이 살아남았습니다. 이러한 경험을 어떻게 제공할 수 있을까라는 고민은 점주에게 있어서 제일 중요한 요소입니다. 인력이 부족한 상황을 대응하기 위해 키오스크를 사용하고, 더 많은 결제 수단을 지원하는 것 또한 그 이유입니다. 이를 한 단어로 표현하면, '만족스러운 경험' 이라는 단어가 될 것입니다.

토스플레이스의 사업은 이 '만족스러운 경험'을 보편화합니다. 점주에게 필요한 정보와 도움을 기술을 통해 제공합니다. 키오스크 모드, 배달 플랫폼 일원화 등 동선 최적화를 위한 기술 뿐만이 아닙니다. 재고관리, 고객 현황 파악과 관련된 기술은 오랜 시간 장사를 해온 저희 부모님도 토스플레이스에 관심을 가지게 만드셨습니다. 여기에 토스플레이스는 B2B 대상인 점주를 넘어, 점주의 대상인 고객을 만족시키는 사업을 합니다. 안정적인 결제와 다양한 플랫폼을 통한 결제 수단을 제공해서 편안함을을 제공합니다. 이러한 요소들이 결합되어서 '만족스러운 경험'이라는 요소가 됩니다.

또한 토스플레이스는 점주와 고객을 잇는 오프라인 플랫폼입니다. 그리고 다른 토스의 사업에 비해서 초기 사업에 속해 있습니다. 그래서 변수가 많을 수밖에 없고, 그런 변수를 검증하기 위하여여 카나리 릴리즈 같은 방식도 사용하고 있습니다. 이런 환경이면 의견과 의도 교환이 더 자주 일어나기 마련입니다. 이런 환경에서 그 의견과 의도를 코드에 반영하는 것, 그것이 프론트엔드 개발자로서 제 목표입니다. 그렇기에 저는 토스플레이스에서 오프라인과 온라인, 점주와 고객을 연결하는 개발을 하고 싶습니다.

=== 가장 큰 성장: 실패에서 배우자.

가장 중요한 성장은 GIST 재학 시절, 교내 개발자 조직인 인포팀에 합류한 시기였습니다. 이때 만들었던 제품들 자체는 제각기 다른 이유로 성공하지 못했습니다. 그렇기에 제각기 다른 교훈을 얻을 수 있었고, 다음 제품들에는 이 교훈들을 반영할 수 있게 되었습니다.

이 경험이 반복되며 실패를 두려워하지 않게 되었습니다. 제가 특별히 두려움이 없는 사람이어서가 아니라, 실패를 통해 배울 수 있고, 혼자서는 해결 못 하는 실패더라도 여러 사람에게 도움을 받을 수 있다는 사실을 배웠기 때문입니다.

첫 번째 프로젝트는 서비스 중이었던 장고 기반의 교내 커뮤니티 사이트, 지스토리의 관리와 개발이었습니다. 당시 마스터로 머지하면 이전에 해결했던 버그가 다시 생기는 문제점이 있었습니다. 그래서 버그를 다시 해결하기도 했고, 같은 버그를 해결하기 위한 다른 방법이 꼬여서 다른 버그를 만들기도 했습니다. 문제의 원인은 잘못된 Git 정책이었습니다. Git을 커밋의 용도로만 사용했을 뿐, 브랜치 별로 작업을 나눠서 관리한다는 개념이 제대로 반영되어 있지 않았습니다. 이미 작업이 끝나서 마스터로 머지한 브랜치를 여러 번 재사용하는 경우도 있었습니다.

이 이후엔 GitHub-flow에 기반한 브랜치 관리 전략을 일괄적으로 도입했습니다. 또한 이슈에 따라 브랜치와 일을 분배하기 시작했습니다. 일반적인 GitHub-flow와 차이점은 메인과 구별되는 디벨롭 브랜치의 운영이었습니다. 디벨롭 브랜치의 용도는 메인과 별도로 배포를 진행하여 최종적인 문제점을 확인하는 용도였습니다. 그 이후에 메인에 머지하여 배포를 진행했습니다. 이를 통해 배포 시의 문제점을 더욱 명확하게 파악할 수 있었고, 다른 프로젝트에서 타입스크립트 마이그레이션 같은 대규모 작업을 시도할 수 있는 계기가 되었습니다.

그 다음으로는 지스토리를 리액트 기반으로 새로 만드는 프로젝트가 있었습니다. 개발이 길어지자, 학교와 개인의 일정에 따라 프로젝트에 참여하는 인원이 변동되게 되었습니다. 변동이 반복되자, 각자 자신이 맡은 부분만 이해하고 다른 사람의 코드에 대해 이해하지 못해서 추후 작업 분배에 악영향을 끼치게 되었습니다.

이런 상황이 지속되는 것을 막기 위해, PR 시 진행하는 코드 리뷰와 별개의 코드 리뷰를 진행하기로 했습니다. 이를 통해 팀원끼리 코드의 작동에 대한 이해도를 비슷하게 맞출 수 있었습니다. 그리고 그전까지는 메신저로만 기록되던 회의 기록을 노션과 같은 별도 형태로도 남겨서 다음에 작업에 참여하는 사람들이 프로젝트의 의도를 이해할 수 있도록 도왔습니다.

첫 번째 프로젝트의 Git 관리 문제를 해결하고, 두 번째 프로젝트의 인사 관리 문제를 해결하면서, 보다 더 커다란 기술적 문제 해결에 도전할 수 있게 되었습니다. 당시 컴포넌트 갯수가 늘어남에 따라 프롭 관리에 어려움이 늘어났고, 대부분의 버그는 프롭으로 넘겨주는 데이터의 타입이 잘못되어서 일어나는 일이었습니다. 이를 해결하기 위해 타입스크립트 마이그레이션을 주도하여 진행하였습니다. 정기적인 리뷰 타임과 브랜치 전략 덕분에 큰 문제없이 진행할 수 있었습니다. 그렇게 타입 불일치를 찾아서 관련 오류를 해결할 수 있었으며, 서버와 데이터 스키마를 명확하게 공유할 수 있게 되었습니다.

그렇게 해서 런칭한 사이트의 이용자는 매우 소수였습니다. 애초에 목표 사용자가 원하는 형태가 BBS가 아니었기 때문이었습니다. 기획 파트 팀원의 이러한 의견을 인정하고 실패 원인과 목표 사용자를 더 집중적으로 정리할 수 있었습니다. 이 기획 자료를 전달 받은 후배 팀원들은 공지사항 전달에 집중한 형태의 서비스를 만들어서 더 많은 사용자를 모을 수 있었습니다.

 이렇게 저는 다양한 종류의 실패를 했었습니다. 그렇지만 그 실패에서 끝난게 아니라, 각기 다른 종류의 실패에서 교훈을 얻고 이를 활용할 수 있었습니다. 이 경험이 모여 저를 실패를 두려워하지 않는 개발자로 만들었습니다.
