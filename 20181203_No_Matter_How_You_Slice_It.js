const fs = require('fs');
const input = fs.readFileSync('input/20181203_No_Matter_How_You_Slice_It.txt', 'utf-8');
const rects = input.trim()
                 .split('\n')
                 .map(data => {
                    return {
                      id: parseInt(data.split(' ')[0].replace(/#/g,'')),
                      top: parseInt(data.split(' ')[2].replace(/:/g,'').split(',')[1]),
                      left: parseInt(data.split(' ')[2].replace(/:/g,'').split(',')[0]),
                      width: parseInt(data.split(' ')[3].split('x')[0]),
                      height: parseInt(data.split(' ')[3].split('x')[1]),
                      fail: 0,
                    }
                 })

// RIP Array.fill() doesn't play with multidimensional for loops?
// const fabric = Array(1000).fill(Array(1000).fill(0))
// I give up on clever, here is a dumb matrix.
const fabric = Array
  .from({length: 1000})
  .map(() => Array
    .from({length: 1000})
    .map(() => 0)
  )

// Paint the dumb matrix
rects.forEach((rect) => {
  for (let y = 0; y < rect.height; y++) {
    for (let x = 0; x < rect.width; x++) {
        fabric[y + rect.top][x + rect.left] += 1
    }
  }
})

console.log(fabric.reduce((a, b) => a + b.filter(x => x >= 2).length, 0))

const checkOverlap = (rect1, rect2) => {
  if (rect1.left > (rect2.left + rect2.width) || rect2.left > (rect1.left + rect1.width))
    return false

  if (rect1.top > (rect2.top + rect2.height) || rect2.top > (rect1.top + rect1.height))
    return false

  return true
}

const length = rects.length;
rects.forEach((rect, index, arr) => {
  for (let i = index + 1; i < length; i++) {
    if (checkOverlap(rect, arr[i])) {
      rects[index].fail += 1
      rects[i].fail += 1
    }
  }
})

console.log(rects.filter(x => x.fail == 0)[0].id)
