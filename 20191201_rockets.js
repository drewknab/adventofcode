const fs = require('fs');
const input = fs.readFileSync('input/20191201_rockets.txt', 'utf-8');

const masses = input.trim()
                    .split('\n')
                    .map(x => parseInt(x));

const equation = currentValue => (Math.floor(currentValue / 3)) - 2;

// Part 1
const reducer = (accumulator, currentValue) => accumulator + equation(currentValue);
const fuel = masses.reduce(reducer, 0);
console.log(fuel);
// End Part 1

// Part 2
const recurEquation = mass => {
  let fuel = equation(mass);
  fuel += fuel >= 9 ? recurEquation(fuel) : 0;
  return fuel;
}

const fuelForFuel = masses.map(mass => recurEquation(mass))
                          .reduce((accumulator, currentValue) => accumulator + currentValue, 0);
console.log(fuelForFuel);
// End Part 2
