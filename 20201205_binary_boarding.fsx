#load "helpers.fsx"

open System
open Helpers

let raw =
    readLines "input/input5.txt"
    |> Seq.toList

let isLower (input : char) = input = 'F' || input = 'L'


let findSeatId (ticket : string) : int =
    let rec calculate (ticket : string) (upper : int) (lower : int)  = 
        if (ticket.Length = 1) then
            if (isLower ticket.[0]) then
                lower
            else
                upper
        else
            if (isLower ticket.[0]) then
                let newUpper = (upper + lower) / 2
                calculate ticket.[1..] newUpper lower
            else
                let newLower = ((upper + lower) / 2) + 1
                calculate ticket.[1..] upper newLower
    let row = calculate ticket.[0..7] 127 0 
    let column =  calculate (ticket.[ticket.Length - 3..]) 7 0

    row * 8 + column 

let sorted =
    raw
    |> List.map (fun ticket -> findSeatId ticket)
    |> List.sortByDescending (fun x -> x)

printf "%i \n" (List.item 0 sorted)

let min = List.min sorted
let max = List.max sorted

let mySeat =
    [min..max]
    |> List.filter (fun x -> not <| List.contains x sorted)

printf "%i \n" (List.item 0 mySeat)