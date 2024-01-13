# Typst Resume
Writing my resume in Typst (the better version of LaTeX)

## How does this work? 
I was inspired by [@jskherman](https://github.com/jskherman/cv.typ) who used `.yaml` files to store the data of his resume to be updated easily and simply. 

I could have simply forked his repo to make my resume in the same way but I wanted to take on the challenge of doing it myself!

Typst comes built-in with file reading and parsing capabilities for `.yaml` files so I used that in conjuction with functions written myself to format the data into my resume. 

## How to run?
Being a Node.js guy, I included a `package.json` to make use of `yarn` (or npm) to run the compilation commands easily.

### Install the following:
- yarn (or npm)
- typst

Run `yarn build` to compile into a PDF 

Run `yarn watch` to compile ino a PDF and watch for changes in the source file. 


## Continuous Deployment
### Compile and Release Resume
- GitHub Action that runs whenever a new tag is released
- Compiles the Typst code to PDF and releases it with a timestamp
#### Steps
1. Checks out the repository (so it's available for the action to use)
2. Compiles the Typst code to PDF
3. Uploads the generated PDF as an artifact
4. Releases the generated PDF with the timestamp

### `post-commit` Git Hook
- Whenever I commit changes locally, I am prompted if I want to tag the commit
- Pulls the latest version
  + Prompted to bump major or minor version
  + Creates the new tag based on the latest
#### Here's how it looks for me:
```bash
>> git add . && git commit -m "Some changes"
[post-commit hook] Commit done!
Would you like to tag this commit? [y/N] y
[current-version]: v1.7
Is this a major change or a minor change? minor
[bumping-version]: v1.8
[main 0d0fce2] Updating README.md
 2 files changed, 30 insertions(+), 4 deletions(-)
```