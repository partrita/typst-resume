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
  console.log(res.split("\n"));
}

getTags();

// rl.question("Would you like to tag this commit?[y/N] ", (res) => {
  
// })

// rl.on("close", () => {

// })