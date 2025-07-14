
#let init(
  headingFont: "KoPubWorldDotum",
  bodyFont: "KoPubWorldDotum",
  fontSize: 11pt,
  lineSpacing: 6pt,
  accentColor: black,
  doc,
) = {

  set page(
    paper: "a4",
    margin: 1.2cm
  )

  set text(
    font: headingFont,
    size: fontSize,
    hyphenate: false,
  )

  set list(
    spacing: lineSpacing
  )

  set par(
    leading: lineSpacing
  )

  show heading.where(
    level: 1,
  ): it => block(width: 100%)[
    #set align(center)
    #set text(font: headingFont, size: 1.5em, weight: "bold", fill: accentColor)
    #smallcaps(it.body)
  ]

  show heading.where(
    level: 2,
  ): it => block(width: 100%)[
    #set align(left)
    #set text(font: headingFont, size: 1em, weight: "semibold", fill: accentColor)
    #smallcaps(it.body)
    #v(-0.75em)
    #line(length: 100%, stroke: 1pt + accentColor)
  ]

  doc
}