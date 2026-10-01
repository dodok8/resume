#let export-web = sys.inputs.at("export-web", default: "false") == "true"

// Semantic nodes only; page layout and visual styles remain in the PDF renderer.
#let web-content(body) = {
  if body == none { return () }
  if type(body) == str { return ((type: "text", text: body),) }
  let kind = repr(body.func())
  if kind in ("sequence", "grid") and body.has("children") {
    return body.children.map(web-content).flatten()
  }
  if kind == "metadata" {
    return if type(body.value) == dictionary and body.value.at("type", default: none) == "icon" {
      (body.value,)
    } else { () }
  }
  if kind in ("text", "symbol") and body.has("text") {
    return ((type: "text", text: body.text),)
  }
  if kind == "space" { return ((type: "text", text: " "),) }
  if kind == "smartquote" {
    return ((type: "text", text: if body.at("double", default: true) { "\"" } else { "'" }),)
  }
  if kind in ("parbreak", "linebreak") { return ((type: kind),) }
  if kind in ("h", "v", "pagebreak") {
    return if kind == "h" { ((type: "text", text: " "),) } else { () }
  }
  if kind == "raw" {
    return ((type: "code", text: body.text, block: body.at("block", default: false), language: body.at("lang", default: none)),)
  }
  if kind == "image" {
    assert(type(body.source) == str, message: "Web images must use file paths")
    return ((type: "image", src: body.source, alt: body.at("alt", default: none)),)
  }
  if kind == "figure" {
    return ((type: "figure", children: web-content(body.body), caption: web-content(body.caption)),)
  }
  if kind == "link" {
    assert(type(body.dest) == str, message: "Web links must use URL destinations")
    return ((type: "link", href: body.dest, children: web-content(body.body)),)
  }
  if kind == "heading" {
    return ((type: "heading", level: body.at("depth", default: 1), children: web-content(body.body)),)
  }
  if kind in ("strong", "emph", "super", "sub", "footnote", "item") {
    let node-type = if body.func() == list.item { "list-item" }
      else if body.func() == enum.item { "ordered-item" }
      else { kind }
    return ((type: node-type, children: web-content(body.body)),)
  }
  if body.func() == grid.cell { return web-content(body.body) }
  if kind in ("text", "pad", "align", "block", "box", "underline", "caption") and body.has("body") {
    return web-content(body.body)
  }
  if kind == "styled" { return web-content(body.child) }
  panic("Unsupported web content: " + kind + " " + repr(body.fields()))
}

#let web-date(value) = if type(value) == datetime {
  value.display("[year]-[month]-[day]")
} else { none }

#let web-document(id, title, profile) = if export-web {
  [#metadata((
    type: "document",
    schemaVersion: 1,
    id: id,
    title: title,
    route: "/" + id + "/",
    updated: web-date(datetime.today()),
    profile: (
      name: profile.name,
      role: profile.role,
      website: profile.website,
      tagline: web-content(profile.bio.ko.title),
      email: profile.email,
      phone: profile.phone,
      birthday: profile.birthday,
      social: profile.social,
    ),
  )) <web-data>]
}
