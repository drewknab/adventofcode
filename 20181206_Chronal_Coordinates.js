const fs = require('fs');
const input = fs.readFileSync('input/20181206_Chronal_Coordinates.txt', 'utf-8');

const pointsList = input.trim().split("\n")

const grid = Array
  .from({length: 400})
  .map(() => Array
    .from({length: 400})
    .map(() => 0)
  )

pointsList.forEach((point) => {
  let x = point.split(", ")[0]
  let y = point.split(", ")[1]
  grid[y][x] = 0
})

console.table(grid)
