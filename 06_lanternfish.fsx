#load "helpers.fsx"

open Helpers
open System

let raw = readString "input/input6.txt"
// let raw = readString "input/input6test.txt"

let binaryList =
    raw.Split(',')
    |> Seq.map (fun x -> x |> int) 
    |> Seq.toList

let spawnNew (collection: list<int>) (count: int) =
    if count > 0 then
        collection @ [ for i in 1 .. count -> 8 ]
    else
        collection

let rec dayPass (days: int) (day: int) (collection: list<int>) =
    let count = collection |> List.filter (fun x -> x = 0)
    let spindownCollection = collection |> List.map (fun x -> if x = 0 then 6 else x - 1)
    let newCollection = spawnNew (spindownCollection) count.Length

    if day < days then dayPass days (day + 1) (newCollection) else newCollection

let day1 = (dayPass 80 1 binaryList)
Console.WriteLine(day1.Length)
Console.WriteLine((dayPass 176 1 day1).Length)