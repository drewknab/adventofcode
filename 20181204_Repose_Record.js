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

let times = {}
let minutes = {}
let guardMinutes = {}
let table = {}
let currentGuard = 0
let sleepBegin = 0
let start = 0
status.forEach((record) => {
  let time = new Date(record.date).getTime();
  let minute = record.date.match(/-?[0-9]+/g || []).map(Number)[4]
  if (record.text.startsWith('Guard')) {
    currentGuard = record.text.match(/-?[0-9]+/g || []).map(Number)
    table = (guardMinutes[currentGuard] || {})
    guardMinutes[currentGuard] = table
  }
  if (record.text == 'wakes up') {
    times[currentGuard] = (times[currentGuard] || 0) + (time - sleepBegin)
    for (i = start; i !== minute; i = (i + 1) % 60) {
      minutes[i] = (minutes[i] || 0) + 1
      table[i] = (table[i] || 0) + 1
    }
  }
  if (record.text == 'falls asleep') {
    sleepBegin = time
    start = minute
  }
})

let sleepiest = Object.keys(times).reduce((a, b) => times[a] > times[b] ? a : b)
let asleepest = Object.keys(minutes).reduce((a, b) => minutes[a] > minutes[b] ? a : b)
let guardiest = Object.keys(guardMinutes[sleepiest]).reduce((a, b) => guardMinutes[a] > guardMinutes[b] ? a : b)
console.log(sleepiest * 42)
