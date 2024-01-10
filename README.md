# Typst Resume
Writing my resume in Typst (the better version of LaTeX)

## How does this work? 
I was inspired by @thatguy who used yaml files to store the data of his resume to be updated easily and simply. 

I could have simply forked his repo to make my resume in the same way but I wanted to take on the challenge of doing it myself!

Typst comes built-in with file reading and parsing capabilities for .yaml files so I used that in conjuction with functions written myself to format the data into my resume. 

## How to run?
Being a Node.js guy, I included a `package.json` to make use of `yarn` (or npm) to run the compilation commands easily.

### Install the following:
- yarn (or npm)
- typst

Run `yarn build` to compile into a PDF
Rung `yarn watch` to compile ino a PDF and watch for changes in the source file. 
