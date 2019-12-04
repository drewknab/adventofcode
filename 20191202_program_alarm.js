const fs = require('fs');
const input = fs.readFileSync('input/20191202_program_alarm.txt', 'utf-8');

const inputClean = input.trim()
  .split(',')
  .filter(x => x.length != 0)
  .map(x => parseInt(x));


// Part 1
const opcodeMachine = (input, noun = 12, verb = 2) => {
  const opcodes = input.slice();

  const runOpcodes = (operation, position1, position2, output) => {
    if (operation === 1)
      opcodes[output] = opcodes[position1] + opcodes[position2]
    if (operation === 2)
      opcodes[output] = opcodes[position1] * opcodes[position2]
  }

  opcodes[1] = noun;
  opcodes[2] = verb;

  for (let i = 0; i < inputClean.length; i += 4) {
    let opcode = opcodes.slice(i, i+4)
    if (opcode[0] === 99) break;

    runOpcodes(...opcode);
  }

  return opcodes[0]
}

console.log(opcodeMachine(inputClean))
// End Part 1

// Part 2
const bruteForceNounVerb = (input) => {
  for (let noun = 0; noun < 100; noun++)
    for (let verb = 0; verb < 100; verb++)
      if (opcodeMachine(input, noun, verb) === 19690720) {
        return 100 * noun + verb;
      }
}

console.log(bruteForceNounVerb(inputClean))
// End Part 2
