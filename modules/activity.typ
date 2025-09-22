#import "util.typ": *

#let formatDuration(duration) = {
  let duration-in-weeks = if type(duration) == "duration" {
    duration.weeks()
  } else {
    duration
  }
  let year = calc.floor(duration-in-weeks / 4 / 12)
  let month = calc.rem(calc.floor(duration-in-weeks / 4), 12)
  [
    #if year > 0 {
      str(year) + "년"
    }
    #if month != 0 {
      str(month) + "개월"
    }
  ]
}

#let activityList(entries, body-header: none, header: none) = {
  let total-duration-in-weeks = 0
  for (from, to, ..) in entries {
    if type(to) != "datetime" {
      continue
    }
    total-duration-in-weeks += (to - from).weeks()
  }

  if body-header != none {
    body-header(formatDuration(total-duration-in-weeks))
  }
  show table: set block(breakable: true)
  table(
    columns: (auto, 1fr),
    inset: 0pt,
    gutter: 17pt,
    stroke: none,
    table.header(table.cell(colspan: 2)[#header]),
    ..(
      entries.map(((from, to, title, body)) => {
        let row = (
          align(center)[
            #block()[
              #text(size: 10pt, weight: 600)[
                #{
                  from.display("[year].[month]")
                }
                #if type(to) == datetime {
                  [
                    #text(size: 6pt, weight: 600)[
                      \
                      \~
                      \
                    ]
                    #if to != datetime.today() {
                      to.display("[year].[month]")
                    } else {
                      "Present"
                    } \
                    #text(size: 8pt)[#formatDuration(to - from)]
                  ]
                }
              ]
            ]
          ],
          block()[
            #pad(bottom: -4pt)[
              #set text(size: 12pt, weight: 600)
              #set par(leading: 0.8em)
              #title
            ]
            #set text(size: 10.5pt)
            #body
          ],
        )

        return row
      }),
    ).flatten(),
  )
}

#let activityEntry(body, from: "#INVALID#", to: "", title: "#INVALID_TITLE#") = (from, to, title, body)

#let workExpList(entries, body-header: none, header: none) = activityList(
  entries,
  body-header: body-header,
  header: header,
)

#let workExpEntry(
  body,
  from: "#INVALID#",
  to: "",
  role: "#INVALID_ROLE#",
  organization: "#INVALID_COMPANY#",
  homepage: "",
) = activityEntry(body, from: from, to: to, title: [
  #belonging(role, organization)
  #h(1fr)
  #if homepage != "" {
    show link: set text(fill: color.rgb("#1c7ed6"))
    show link: underline
    homepage
  }
])
