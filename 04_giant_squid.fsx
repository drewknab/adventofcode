#load "helpers.fsx"

open Helpers
open System

type Square = {
    Number: int
    Marked: bool
}

// let raw = readLines "input/input4.txt"
let raw = readLines "input/input4test.txt" |> Seq.toList

let parse (text: string) =
    [
        for line in text.Split("\n") do
            [
                for number in line.Trim().Split(" ", StringSplitOptions.RemoveEmptyEntries)
                    -> { Number = int number; Marked = false }
            ]
    ]
    //|> array2D

let calls = raw[0].Split(',') |> Array.map int |> Array.toList

let boards =
    raw.Tail
    |> Seq.map parse
    |> Seq.toList

// let rows = [ for i in 0 .. 4 -> boards[0][i, *] ]
// let cols = [ for i in 0 .. 4 -> boards[0][*, i] ]



Console.WriteLine(boards)