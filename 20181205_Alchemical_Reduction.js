const fs = require('fs');
let input = fs.readFileSync('input/20181205_Alchemical_Reduction.txt', 'utf-8');
// Lololololol not having .trim lost me like an hour of my life I can never have back
let parse = input.trim().split("")

const recursion = (array) => {
  for (let i = 0; i < array.length - 1; i++) {
    if (Math.abs(array[i].charCodeAt(0) - array[i + 1].charCodeAt(0)) == 32 ) {
      array[i] = ""
      array[i + 1] = ""
    }
  }
  return (array.indexOf("") > -1) ? recursion(array.filter(a => a !== "")) : array.length
}
// Part 1
console.log(recursion(parse))

const alpha = "abcdefghijklmnopqrstuvwxyz".split("");
const result = alpha.map((letter) => {
  let temp = parse.filter(a => a.toLowerCase() != letter)
  return recursion(temp)
}).reduce((a,b) => (a < b) ? a : b)

// Part 2
console.log(result)
