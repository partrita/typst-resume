#import "./utils/resume.typ": resume

#let data = yaml("./data.yml")
#resume(
  data, 
  accentColor: rgb("#3e5c76")
)