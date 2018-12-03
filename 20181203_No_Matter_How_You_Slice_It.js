const fs = require('fs');
const input = fs.readFileSync('input/20181203_No_Matter_How_You_Slice_It.txt', 'utf-8');
const rects = input.trim()
                 .split('\n')
                 .map(data => {
                    return {
                      'id': parseInt(data.split(' ')[0].replace(/#/g,'')),
                      'topLeft': {
                        'x': parseInt(data.split(' ')[2].replace(/:/g,'').split(',')[0]) + 1,
                        'y': parseInt(data.split(' ')[2].replace(/:/g,'').split(',')[1]) + 1
                      },
                      'bottomRight': {
                        'x': (parseInt(data.split(' ')[2].replace(/:/g,'').split(',')[0]) + 1) + parseInt(data.split(' ')[3].split('x')[0]),
                        'y': (parseInt(data.split(' ')[2].replace(/:/g,'').split(',')[1]) + 1) + parseInt(data.split(' ')[3].split('x')[1]),
                      },
                      'size': {
                        'w': parseInt(data.split(' ')[3].split('x')[0]),
                        'h': parseInt(data.split(' ')[3].split('x')[1]),
                      }
                    }
                 })
console.log(rects.length)
// Code
const length = rects.length
const overlapRects = new Set([0])
const checkOverlap = (rect1, rect2) => {
  if (rect1.topLeft.x > rect2.bottomRight.x || rect2.topLeft.x > rect1.bottomRight.x)
    return false

  if (rect1.topLeft.y > rect2.bottomRight.y || rect2.topLeft.y > rect1.bottomRight.y)
    return false

  return true
}
for (let i = 0; i < length; i++) {
  for (let j = i + 1; j < length; j++) {
    let rect_i = rects[i]
    let rect_j = rects[j]

    if (checkOverlap(rect_i, rect_j)) {
      overlapRects.add(rect_i)
      overlapRects.add(rect_j)
    }
  }
}
console.log(overlapRects.size);
