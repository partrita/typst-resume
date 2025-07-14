#import "./icons.typ": iconUnicode
#import "./init.typ": init

#let contactInfo(data, accentColor) = {
  let parsed = data.contact.map(c => {
    let blockContent
    if ("link" in c) {
      blockContent = link(c.link)[#c.text]
    } else {
      blockContent = text(c.text)
    }
    box([#if ("icon" in c) {iconUnicode(c.icon.unicode, size: 8pt, color: accentColor)} else { none } #blockContent])
  })
  block(width: 100%)[
    #align(center)[
      #pad(x: 0em)[
        #parsed.join([#sym.space.en #sym.space.en])
      ]
    ]
  ]
}

#let createLocation(content) = {
  let location = ()
  if ("location" in content) {
    if ("city" in content.location) { location.push(content.location.city)}
    if ("region" in content.location) { location.push(content.location.region)}
    if ("country" in content.location) { location.push(content.location.country)}
  }
  location.join(", ")
}

#let createDate(start, end: none) = {
  let date = [
    #start.month #start.year #sym.dash.en #if (end != none) [ #end.month #end.year] else [ Present]
  ]
  date
}

#let experienceContent(content, accentColor) = {
  block()[
    #text(weight: "semibold", fill: accentColor, if ("link" in content.org) { link(content.org.link)[#content.org.name]} else { content.org.name}) #h(1fr) *#createLocation(content)*\
    #text(weight: "semibold", content.position) | #text(style: "italic", content.skills.join(", ")) #h(1fr) #createDate(content.start, end: content.end) \
    #list(indent: 0.5em, ..content.info.map(i => [#eval(i, mode: "markup")]))
  ]
}

#let projectContent(content, accentColor) = {
  block()[
    #text(weight: "semibold", fill: accentColor, if ("link" in content)  { link(content.link)[#content.name #iconUnicode(symbol("\u{f0c1}"), size: 8pt, color: accentColor)]} else { content.name }) | #text(style: "italic", content.skills.join(", ")) #h(1fr) [#content.date.month #content.date.year] \
    #list(indent: 0.5em, ..content.info.map(i => eval(i, mode: "markup")))
  ]
}

#let educationContent(content, accentColor) = {
  block()[
    #text(weight: "semibold", content.institution) #h(1fr) *#createLocation(content)* \
    #content.degree #h(1fr) #createDate(content.start, end: content.end)
  ]
}

#let skillsContent(content, accentColor) = {
  block()[
    #text(weight: "semibold", fill: accentColor, content.name): #content.skills.join(", ") #v(-0.5em)
  ]
}

#let awardContent(content, accentColor) = {
  block()[
    #text(weight: "semibold", fill: accentColor, content.name) | #text(style: "italic", content.org) #h(1fr) [#content.date.month #content.date.year] \
    #list(indent: 0.5em, ..content.info.map(i => eval(i, mode: "markup")))
  ]
}

#let sectionContent(section, accentColor) = {
  if (section.type == "Experience") {
    for content in section.content {
      experienceContent(content, accentColor)
    }
  } else if (section.type == "Education") {
    for content in section.content {
      educationContent(content, accentColor)
    }
  } else if (section.type == "Project") {
    for content in section.content {
      projectContent(content, accentColor)
    }
  } else if (section.type == "Skills") {
    for content in section.content {
      skillsContent(content, accentColor)
    }
  } else if (section.type == "Awards") {
    for content in section.content {
      awardContent(content, accentColor)
    }
  }
}

#let resume(data, accentColor: black) = {
  show: doc => init(doc, accentColor: accentColor, fontSize: 10pt)
  heading(level: 1, data.name)
  block()[
    #contactInfo(data, accentColor)
    #for section in data.sections {
      heading(level: 2, section.name)
      sectionContent(section, accentColor)
    }
  ]
}
