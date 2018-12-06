const fs = require('fs');
const input = fs.readFileSync('input/20181206_Chronal_Coordinates.txt', 'utf-8');

const pointsList = input.trim()
  .split("\n")
  .map((a, i) => {
    let temp = a.split(", ")
    let x = temp[0]
    let y = temp[1]
    return { name: String.fromCharCode(i), x, y }
  })
console.log(pointsList)
const grid = Array
  .from({length: 400})
  .map(() => Array
    .from({length: 400})
    .map(() => 0)
  )

pointsList.forEach((point, index) => {
  grid[point.y][point.x] = point.name;
})

//console.table(grid)
