#import "../utils/init.typ": init
#import "../utils/resume.typ": contactInfo


#let coverLetter(data, accentColor: black, rest) = {
  show: doc => init(doc, accentColor: accentColor, fontSize: 12pt, lineSpacing: 10pt)
  heading(level: 1, [Ammar Ahmed])
  block()[
    #contactInfo(data, accentColor)
    #rest
  ]
}