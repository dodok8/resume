#let base-icon(url, size: 1em, width: none, height: none, bottom: -1em / 8) = {
  box[
    #pad(bottom: bottom)[
      #image(
        url,
        format: "svg",
        width: if width == none { size } else { width },
        height: if height == none { size } else { height },
      )
    ]
  ]
}

#let icon(query, size: 1em, width: none, height: none, bottom: -1em / 8) = {
  [#metadata(query) <icon>]
  let icon-db = json("../assets/.automatic/icon/manifest.json")
  if icon-db.at(query, default: none) != none {
    base-icon(
      "../assets/.automatic/icon/" + icon-db.at(query),
      size: size,
      width: width,
      height: height,
      bottom: bottom,
    )
  } else {
    text(fill: color.rgb("#ff0000"))[\#NO\_ICON: "#query"\#]
  }
}

#let icon-solved-ac(size: 1em, bottom: -1em / 4) = {
  base-icon("../assets/brand/solved-ac.svg", size: size, bottom: bottom)
}

#let chip(body, background: color.rgb("#d2d2d2")) = [
  #box[
    #pad(bottom: -3pt)[
      #rect(
        radius: 50%,
        fill: background,
        inset: (left: 5pt, top: 3pt, bottom: 3pt, right: 5pt),
      )[
        #body
      ]
    ]
  ]
]

#let tech-list = (
  rust: (icon: "devicon/rust", label: "Rust"),
  wasm: (icon: "devicon/wasm", label: "WebAssembly"),
  typescript: (icon: "devicon/typescript", label: "TypeScript"),
  typescript--short: (icon: "devicon/typescript", label: "TS"),
  javascript: (icon: "devicon/javascript", label: "JavaScript"),
  javascript--short: (icon: "devicon/javascript", label: "JS"),
  react-and-react-native: (icon: "devicon/react", label: [React #sym.and React Native]),
  react: (icon: "devicon/react", label: "React"),
  html: (icon: "devicon/html5", label: "HTML"),
  css: (icon: "devicon/css3", label: "CSS"),
  vite: (icon: "devicon/vitejs", label: "Vite"),
  svelte: (icon: "devicon/svelte", label: "Svelte"),
  git: (icon: "devicon/git", label: "Git"),
  github: (icon: "devicon/github", label: "GitHub"),
  github-actions: (icon: "devicon/githubactions", label: "GitHub Actions"),
  docker: (icon: "devicon/docker", label: "Docker"),
  bun: (icon: "devicon/bun", label: "Bun"),
  python: (icon: "devicon/python", label: "Python")
)

#let tech-chips = for (k, v) in tech-list {
  ((k): chip[
    #set text(size: 8pt, weight: 600)
    #icon(v.icon) #v.label
  ])
}
