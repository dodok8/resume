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

== 기술

- React, React-Native
  - 다수의 웹 앱 제작 경험 및 모바일 앱 제작 경험
  - 운영 중인 앱 *TypeScript* 마이그레이션 경험
  - Redux 를 통한 상태관리 경험
- Bun
  - Bun 테스트 러너 기반 *테스트 스크립트 작성* 경험
  - *TypeScript* 기반 앱 작성 및 배포 경험
- Svelte
  - 라이브 서비스 중인 웹 앱 개발 경험
// - Svelte 5에 도입된 Rune 에 능숙
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
      - 기존 프로젝트 안티 패턴(스타일 시트의 낮은 코드 응집성, i81n을 고려하지 않은 설계) 및 반복적인 세팅 분석 담당
    ],
    activityEntry(
      from: datetime(year: 2022, month: 8, day: 21),
      title: pad(top: -1em / 4)[
        #gh-repo("Regulus-JunctionXAsia2022/Widget") #h(1fr) React, Vite
      ],
    )[
      Junction Asia 2022 해커톤 출품작. 메타버스 플랫폼 Zep 에서 돌아가는 가상 펫 플랫폼 Zepp을 제작함
      - Zep 클라이언트 내부에서 실행되는 웹 앱 제작 담당
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
      - 자료 및 예시 도커파일에서 버전 호환성으로 인한 버그 추적 및 버전 고정
      - 실험 수업 진행 단위별 스프린트 회의 진행, 교육 자료 개선
      - Git 과 markdown 으로 교육자료 변경 사항 추적 및 관리

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
      - 팀 의사결정 기록 담당
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
      - Google Drive 연동을 통한 정보 저장
      - AVIF 포맷 사용으로 앨범아트 용량 최적화
    ],
    activityEntry(
      from: datetime(year: 2023, month: 12, day: 24),
      title: pad(top: -1em / 4)[
        #gh-repo("dodok8/discord-aladin") #h(1fr) Bun, TypeScript
      ],
    )[
      알라딘 Open API를 활용한 도서 정보 공유 디스코드 챗봇
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
      - Code of Conduct 작성, 발표자 선정, 네트워킹 세션 진행을 담당
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
  - package.json의 더 이상 지원되지 않는 type 필드로 인한 타입 인식 에러
  - 지원되지 않는 types 필드 대신, exports 내에 types 필드를 추가하여 해결
]

#gh-repo("velopert/velog-client") #link("https://github.com/velopert/velog-client/pull/477")[PR \#477 Fix post.ts 쿼리 오타]
#pad(left: 1em)[
  - 블로그 서비스 Velog 에서 2023.12.26 - 2023.12.29. 기간 동안 글 등록 불가 오류 발생
  - 게시물 수정시 수정 완료된 게시물을 불러오는 Graph QL 댓글 관련 쿼리문에서 오타 발견, 이를 수정하여 해결함
]

#workExpList(
  header: [
    == 교육
  ],
  (
    workExpEntry(
      from: datetime(year: 2018, month: 2, day: 12,),
      to: datetime(year: 2023, month: 2, day: 20),
      role: "전기전자컴퓨터공학부 학사",
      organization: "광주과학기술원(GIST)",
    )[
      - 컴퓨터 네트워크, 컴퓨터 시스템 이론 및 실습, 프로그래밍 언어와 컴파일러 등 전공과목 수강
      - 심리학 부전공 과정 수료
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
      군 복무 중 수행한 프로젝트 \
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
      GIST 내부의 문제를 개발로서 해결하는 학생 개발팀, 인포팀 소속으로서 진행한 프로젝트
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
이력서에 못 담은 제가 거쳐온 행동들에 담겨있는 자세한 스토리를 자기소개서에 담았습니다.

=== 지원 동기: 왜 프론트엔드 개발자인가?

프론트엔드는 문자 그대로 제품의 제일 앞을 담당하는 분야입니다. 즉, 제품이 최종적으로 고객에게 닿으려면 프론트엔드 개발이 필수적이며, 제품이 개발되는 과정에서 일어나는 여러 소통과 논의 과정을 명확히 파악하고 이를 제품의 코드에 반영해야 합니다.

이러한 소통 과정에서는 다양한 사람이 참여합니다. 같은 개발자 들끼리도 이야기 하기도 하지만,  PO, 디자이너, 백엔드 개발자가 프론트엔드 개발자와 함께 제품의 기획에 관해 이야기하기도 하며, 제품의 디자인적 요소가 어떻게 사용자에게 영향을 끼칠지, 이를 파악하기 위해 어떤 방법을 사용할 것, 필요한 데이터는 무엇이며 어떤 형태로 주고받아야 하는지 논의하기도 합니다. 이러한 과정에서 제일 중요한 점은 자신을 포함한 팀원의 의견과 의도를 알고 반영하는 것입니다. 서로 다른 의견이 나오는 경우에도, 상대방의 의견과 의도, 맥락을 정확히 파악하면 더 좋은 하나의 답을 찾아 나설 수 있었습니다.

짧은 프로젝트에서도, 긴 프로젝트에서도 저는 프론트엔드 엔지니어라는 역할 외에도 팀원과 제 의도와 의견을 기록하는 일 또한 꾸준히 해왔습니다. 해커톤에서는 토론이 길을 잃고 길어질 때마다 각자가 이때까지 한 발언을 정리해서 올리는 것으로 의도와 의견을 모아서 정리했습니다. 장기 개발 프로젝트에서는 정기적인 코드 리뷰 시간을 운영하고 팀원 간의 논의와 결과를 회의록에 작성했습니다.

같은 일에 속해 있는 팀원이 아니라도, 오픈 소스 프로젝트를 통해 여러 사람들이랑 협력해 왔습니다. 이력서에 언급된 오픈 소스 버그 수정 기여 및 개인 프로젝트 뿐만 아니라, #link("https://github.com/IntelliJ-Localization/pycharm-kr/pulls?q=is%3Apr+is%3Aclosed+author%3Adodok8")[#icon("lucide/earth") #underline[PyCharm]], 스키마 검증용 라이브러리 #link("https://github.com/fabian-hiller/valibot/pull/429")[#icon("lucide/earth") #underline[valibot]], GitHub Discussion 기반 댓글 플랫폼 #link("https://github.com/giscus/giscus/pull/253")[#icon("lucide/earth") #underline[giscus]]와 같은 여러 번역 프로젝트에도 참여해 왔고, 제가 알고리즘 공부에 사용했던 프로그램, basm-rs의 문서화에 #underline[#icon("lucide/earth") #link("https://github.com/boj-rs/basm-rs/pull/94")[기여하기도]] 했습니다. 이런 과정을 통해 저는 개발 뿐만이 아니라 여러 형태의 소통에 대해 배우고 겪어오게 되었습니다.

이렇듯 저는 여러 소통의 과정을 거쳐왔고, 소통 경험을 통해 팀의 의견과 의도를 반영한 코드를 작성할 수 있게 되었습니다. 이러한 과정을 즐기면서 개발을 해왔기에, PO, 디자이너, 백엔드, 프론트엔드, 인프라 등 여러 분야의 팀원들과 소통하며 개발하는 프론트엔드 개발자를 지향하게 되었습니다.

=== 가장 큰 성장: 실패에서 배우자.

가장 중요한 성장은 GIST 재학 시절, 교내 개발자 조직인 인포팀에 있을 때였습니다. 이 시기에 저는 개발에 대한 중요한 교훈을 배웠습니다. 바로 "실패에서 배우자"라는 교훈이었습니다. 사실, 인포팀에서 만든 제품들은 제각기 다른 이유로 성공하지 못했습니다. 그렇지만 그 실패의 교훈을 기록으로 남겼고, 다른 사람의 도움을 받아서 정리하는 과정에서 실패에서 배우게 되었습니다.

첫 번째 제품은 장고 기반의 교내 커뮤니티 사이트, 지스토리였습니다. 당시 가장 큰 문제는 main 브랜치에 머지를 하면 다시 나타나는 버그들이었습니다. 문제의 근본 원인은 잘못된 브랜치 사용이었습니다. 해결책으로 GitHub-flow에 기반한 이슈 관리 및 브랜치 관리를 도입하였습니다. 또한 develop 브랜치를 별도로 운영 및 배포하여, main을 통해 배포하기 전에 나타날 문제점 들을 미리 확인하는 용도로 사용했습니다. 이렇게 Git 브랜치 관리가 명확해지자 업무 분담도 쉬워졌으며, 이후에 대규모 작업을 할 수 있는 기반이 되었습니다.

두 번째 제품은 해당 사이트를 리액트로 만드는 프로젝트였습니다. 개발이 길어지면서 이탈자가 학교와 개인의 일정에 따라 프로젝트 참가 인원이 변동되는 일이 많아지자, 각자 자신이 맡은 부분만 이해하고 다른 부분을 이해하지 못하는 일이 증가하여 추후 작업 분배에 악영향을 끼치게 되었습니다. 이런 상황이 지속되는 것을 막기 위해, PR 시 진행하는 코드 리뷰와 별개의 코드 리뷰를 진행하기로 했습니다. 또한 의사 결정 과정을 노션으로 남겨서 언제라도 명확히 따라 잡을 수 있게 했습니다.

이런 어려움이 해결되며 커다란 기술적 문제 해결에 도전할 수 있게 되었습니다. 당시 버그의 대부분이었던 타입 불일치를 해결하기 위해 타입스크립트 마이그레이션을 주도하여 진행하였습니다. 정기적인 리뷰 타임과 브랜치 전략 덕분에 큰 문제 없이 진행할 수 있었습니다. 타입의 불일치가 왜 자주 발생하는지 그 이유를 찾고 오류가 자주 발생하는 부분을 리팩토링할 수 있었습니다.

그렇지만 최종 런칭한 사이트의 이용자는 매우 적었습니다. 애초에 목표 사용자가 원하는 형태가 BBS가 아니었기 때문이었습니다. 기획 파트 팀원의 이러한 조사와 의견을 인정하고 실패 원인과 사용자의 요구사항은 명확히 정리하였습니다. 이 기획 자료를 전달 받은 후배 팀원들은 공지사항 전달에 집중한 형태의 서비스를 만들어서 더 많은 사용자를 모을 수 있었습니다.

이렇게 저는 다양한 종류의 실패를 경험했었습니다. 그렇지만 그 실패에서 교훈을 얻었습니다. 바로 이 교훈들 덕분에 저는 실패를 두려워하기 보다, 실패에서 배울 수 있는 개발자로 성장 할 수 있게 되었습니다.
