const fs = require('fs');
const input = fs.readFileSync('input/20181204_Repose_Record.txt', 'utf-8');
const status = input.trim()
                    .split('\n')
                    .map(data => {
                      return {
                        date: data.split(']')[0].replace(/\[/g,''),
                        text: data.split(']')[1].trim()
                      }
                    })
                    .sort((a, b) => {
                      if (a.date === b.date)
                        return a.time > b.time ? 1 : -1
                      return a.date > b.date ? 1 : -1
                    })

const returnMax = (obj) => reduceObject(Object.entries(obj), entry => entry[1])
const reduceObject = (array, criteria) => array.reduce((a,b) => criteria(a) > criteria(b) ? a : b)

// Break down guards
let guardTime = {}
let currentGuard = 0
let sleepBegin = 0
status.forEach((record) => {
  let time = new Date(record.date).getTime();
  if (record.text.startsWith('Guard')) {
    [currentGuard] = record.text.match(/-?[0-9]+/g).map(Number)
  }
  if (record.text == 'wakes up') {
    guardTime[currentGuard] = (guardTime[currentGuard] || 0) + (time - sleepBegin)
  }
  if (record.text == 'falls asleep') {
    sleepBegin = time
  }
})

// Since we have our guard, grab times
let ourBoy = returnMax(guardTime)[0]
let minutes = {}
let startMinute = 0
status.forEach((record) => {
  let minute = record.date.match(/-?[0-9]+/g || []).map(Number)[4]
  if (record.text.startsWith('Guard'))
    [currentGuard] = record.text.match(/-?[0-9]+/g).map(Number)
  
  if (record.text == 'wakes up') {
    if (currentGuard != ourBoy) {
      return;
    }

    for (i = startMinute; i != minute; i = (i + 1) % 60)
      minutes[i] = (minutes[i] || 0) + 1;
  }

  if (record.text == 'falls asleep') 
    startMinute = minute
})
let ourTime = returnMax(minutes)[0]

// Part 1
console.log(ourTime * ourBoy)

// We're looping again, by god
let guardMinutes = {}
let currentTable = {}
startMinute = 0
status.forEach((record) => {
  let minute = record.date.match(/-?[0-9]+/g || []).map(Number)[4]
  if (record.text.startsWith('Guard')) {
    [currentGuard] = record.text.match(/-?[0-9]+/g).map(Number)
    currentTable = (guardMinutes[currentGuard] || {})
    guardMinutes[currentGuard] = currentTable
  }
  
  if (record.text == 'wakes up') {
    for (i = startMinute; i != minute; i = (i + 1) % 60)
      currentTable[i] = (currentTable[i] || 0) + 1;
  }

  if (record.text == 'falls asleep') 
    startMinute = minute
})

let finish = reduceObject(Object.entries(guardMinutes).map(([key, value]) => {
  if (!Object.entries(value).length) { 
    return [key, 0, 0];
  }

  return [key].concat(returnMax(value));
}), a => a[2])

// Part 2
console.log(finish[0] * finish[1])
