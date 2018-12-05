const fs = require('fs');
const input = fs.readFileSync('input/20181205_Alchemical_Reduction.txt', 'utf-8');

const parse = input.split("")

const recursion = (array) => {
  let mapArray = array.map((element, index, array) => {
    if (array[index + 1] == undefined || array[index - 1] == undefined) {
      return;
    }
    
    if (Math.abs(array[index].charCodeAt(0) - array[index + 1].charCodeAt(0)) == 32 ) {
      return "";
    }

    if (Math.abs(array[index].charCodeAt(0) - array[index - 1].charCodeAt(0)) == 32 ) {
      return "";
    }

    return element;
  })
  return (mapArray.indexOf("") > -1) ? recursion(mapArray.filter(element => element != "")) : array
}

let test = recursion(parse)
console.log(recursion(test))
