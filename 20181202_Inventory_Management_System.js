const fs = require('fs');
const input = fs.readFileSync('input/20181202_Inventory_Management_System.txt', 'utf-8');
const ids = input.trim()
                 .split('\n')

let twoCount = 0
let threeCount = 0
const length = ids.length

const letterCount = array => {
  return new Map(
    [...new Set(array)].map(current => [array.filter(element => element === current).length, current])
  )
}

for (let id of ids) {
  let count = letterCount([...id])
  twoCount += count.has(2) ? 1 : 0
  threeCount += count.has(3) ? 1 : 0
};

console.log(twoCount * threeCount)

for (let i = 0; i < length; i++) {
  for (let j = i + 1; j < length; j++) {
    let id_i = [...ids[i]]
    let id_j = [...ids[j]]
    let diff = id_i.reduce((sum, current, index) => sum + (current === id_j[index] ? 0 : 1), 0)

    if (diff === 1)
    {
      console.log(id_i.filter((element, index) => element === id_j[index]).join(""))
      break;
    }
  }
}
