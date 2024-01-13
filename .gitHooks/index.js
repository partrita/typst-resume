const fs = require("fs");
const path = require("path");
const child_process = require("child_process");

const argOptions = [
  {
    name: "help",
    alias: "h",
  },
  {
    name: "install",
    alias: "i"
  },
  {
    name: "run",
    alias: "r",
    param: true
  }
]

const parseArgs = (args) => {
  args = args.slice(2)
  if (args[0].split("-")[0] !== "" || (args[0].split("-")[0] !== "" && args[0].split("-")[0] !== "")) {
    console.log("ERROR:", "Argument must start with -- or -. See help for available options! (--help or -h)")
    process.exit(1)
  }

  const arg = args[0].split("-").at(-1);
  for (let argOpt of argOptions) {
    if (arg == argOpt.name || arg == argOpt.alias) {
      if (argOpt.param) {
        if (args.slice(1).length == 0) {
          console.log("ERROR:", `Argument: '${argOpt.name}' requires a parameter! See help for available options! (--help or -h)`)
          process.exit(1)
        }
        return [argOpt.name, args.slice(1)]
      } else {
        return [argOpt.name]
      }
    }
  }

  console.log("ERROR:", "Argument did not match any valid options! See help for available options! (--help or -h)")
  process.exit(1)
}

const hooksPath = path.join(__dirname, "./hooks");
const hooksDir = fs.readdirSync(hooksPath);
const [arg, param]  = parseArgs(process.argv)
if (arg === "run") {
  console.log("Running:", param);
  for (let p of param) {
    const js = p + ".js";
    if (!hooksDir.includes(js)) {
      console.log("ERROR:", `File: '${js}' does not exist in the hooks directory! Create it to run this!`)
      process.exit(1)
    }
    console.log(`Running: ${p}`)
    const jsPath = path.join(hooksPath, js);
    const res = child_process.execSync(`node ${jsPath}`);
    console.log(res.toString());
  }
} else if (arg == "install") {
  console.log("Installing...")
  const gitPath = path.join(__dirname, "../.git");
  // const gitHooksPath = path.join(gitPath, "./hooks");
  for (const file of hooksDir) {
    let fileContent = fs.readFileSync(path.join(hooksPath, file)).toString();
    fileContent = `#!/usr/bin/env node\n${fileContent}`;
    const hookFile = file.split(".")[0];
    const hookFilePath = path.join(gitPath, "./hooks", hookFile);
    fs.writeFileSync(hookFilePath, fileContent, { encoding: "utf-8" });
    const res = child_process.execSync(`chmod -x ${hookFilePath}`);
    console.log(res.toString())
  }
} else if (arg == "help") {
  console.log("Help")
}

// const hooksPath = path.join(__dirname, "/hooks");
// console.log(fs.readdirSync(hooksPath))