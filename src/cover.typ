#import "./templates/coverLetter.typ": coverLetter

#let data = yaml("./data.yml")

#coverLetter(
  data, 
  accentColor: rgb("#764BA2"),
  block(width: 100%)[
     #text()[
      *Behaviour Interactive Inc.* 
    ] #h(1fr) #text()[January 19th, 2024] \
    #text()[
      6666 Saint-Urbain \
      5e etage \
      H2S 3H1 \ 
      Montreal, QC, Canada 
    ] \
    \
    Dear Hiring Manager, \
    \
    I'm writing to express my interest in the Behaviour Interactive Programming internship. I am excited about the chance to contribute to your game projects and backend services due to my strong background in software development and fundamentals in Engineering from the University of Waterloo.\
    \
    As a software developer at Nokia, I am working on important Network Services Platform components and improving user experience with using React.js for front-end development. I created interesting user interface (UI) elements for a fighter game on a web platform while working at AI Arena. This greatly enhanced user engagement and game performance. My comprehension of software development has been strengthened by these experiences, especially in front-end and full-stack development, which I think will be helpful in the game development industry. \ 
    \
    I am proficient in several programming languages, including Python, NodeJS, and C++. Working on game features and backend services that improve user engagement and application efficiency excites me in particular.\
    \
    I am especially interested in the chance to learn from and advance within the gaming industry under the guidance of senior members of Behaviour Interactive. The prospect of working for a company that is renowned for its creative game development methods and commitment to producing captivating gaming experiences excites me. \
    \
    Enclosed is my resume for your consideration. I look forward to the opportunity to discuss how my background, skills, and enthusiasm for game development make me a strong fit for this position. Thank you for considering my application. I am eager to contribute to the continued success of Behaviour Interactive. \
    \
    Sincerely, \
    \ 
    Ammar Ahmed
  ] 
)
