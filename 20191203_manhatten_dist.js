const fs = require('fs');
const input = fs.readFileSync('input/20191203_manhatten_dist.txt', 'utf-8');

const wires = input.trim()
  .split('\n')
  .map(x => x.split(','))

const buildGrid = (maxX = 5000, maxY = 5000) => {
  const grid = Array
  .from({length: maxY})
  .map(() => Array
    .from({length: maxX})
    .map(() => 0)
  )

  return grid;
}

console.log(wires);
console.log(buildGrid());
