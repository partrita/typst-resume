const fs = require("fs");
const path = require("path");
const readline = require("readline");
const child_process = require("child_process");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

const getTags = () => {
  const res = child_process.execSync("git tag").toString();
  return res.split("\n").filter(s => s !== "");
}

const handleBoolInput = (res) => {
  res = res.toLowerCase();
  if (res === "yes" || res === "y") return true;
  return false
}



const tags = getTags();



rl.question("Would you like to tag this commit?[y/N]: ", (res) => {
  if (handleBoolInput(res)) {
    console.log(`Latest tag: ${tags.at(-1)}`);
    let changeType;
    while(!changeType) {
      rl.question("Is this a minor change or a major change?: ", (res) => {
        if (res === "major" || res == "minor") {
          changeType = res;
        }
      })
    }
  } else {
    rl.close()
  }
})

rl.on("close", () => {
  process.exit(0);
})