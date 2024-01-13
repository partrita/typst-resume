#import "./utils/resume.typ": resume

#let data = yaml("./data.yml")
#resume(
  data, 
  // accentColor: rgb("#764BA2")
  accentColor: rgb("#9554C8")
)
// #resume(data, accentColor: black)
