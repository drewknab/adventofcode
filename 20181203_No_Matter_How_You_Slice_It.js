const fs = require('fs');
const input = fs.readFileSync('input/20181203_No_Matter_How_You_Slice_It.txt', 'utf-8');
const rects = input.trim()
                 .split('\n')
                 .map(data => {
                    return {
                      'id': data.split(' ')[0].replace(/#/g,''),
                      'ords': {
                        'left': data.split(' ')[2].replace(/:/g,'').split(',')[0],
                        'top': data.split(' ')[2].replace(/:/g,'').split(',')[1]
                      },
                      'size': {
                        'width': data.split(' ')[3].split('x')[0],
                        'height': data.split(' ')[3].split('x')[1],
                      }
                    }
                 })
//console.log(rects)
// Code

