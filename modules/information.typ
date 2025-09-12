#import "../metadata.typ": metadata
#import "components.typ": *

#let information = {
  set text(size: 10pt)
  grid(
    columns: (1fr, 1fr),
    grid(
      columns: (auto, 1fr),
      column-gutter: 16pt,
      row-gutter: 8pt,
      [#icon("lucide/mail") *전자 우편*], link("mailto:" + metadata.email)[#metadata.email],
      [#icon("lucide/phone") *전화*], link("tel:" + metadata.phone.join())[#metadata.phone.join(" ")],
      [#icon("lucide/calendar") *생년월일*], metadata.birthday,
    ),
    grid(
      columns: (auto, 1fr),
      column-gutter: 16pt,
      row-gutter: 8pt,
      // [#icon("lucide/house") *주소*], metadata.address,

      [#icon("devicon/github") *GitHub*],
      link("https://github.com/" + metadata.social.github)[\@#metadata.social.github],

      [#icon("lucide/earth") *Hackers' pub*],
      link("https://hackers.pub/" + metadata.social.hackerspub)[#metadata.social.hackerspub\@hackerspub],

      // [#icon-solved-ac() *solved.ac*],
      // link("https://solved.ac/profile/" + metadata.social.solved-ac)[
      //   #solved-ac-profile(metadata.social.solved-ac)
      // ],
    ),
  )
}
