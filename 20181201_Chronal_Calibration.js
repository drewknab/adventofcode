const fs = require('fs')
const input = fs.readFileSync('input/20181201_Chronal_Calibration.txt', 'utf-8')

const chrons = input.trim()
                    .split('\n')
                    .map(x => parseInt(x))

// Part 1
console.log(chrons.reduce((sum, current) => sum + current))

// Part 2
const sum_list = new Set([0])
let sum = 0
let result = 0
let length = chrons.length

for(let i = 0; ; i = ((i + 1) % length)) {
  sum += chrons[i]
        
  if (sum_list.has(sum)) {
    console.log(sum)
    break;
  }

  sum_list.add(sum)
}
