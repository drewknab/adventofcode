#load "helpers.fsx"

open Helpers

type Instruction = {
    Direction: string
    Degree: int
}

type Coordinate = {
    mutable Depth: int
    mutable Horizon: int
    mutable Aim: int
}

let raw = readLines "input/input2.txt"
// let raw = readLines "input/input2test.txt"

let instructions (raw: seq<string>) =
    raw
    |> Seq.map (fun x -> 
            let strings = x.Split(" ")
            {
                Direction = strings[0];
                Degree = strings[1] |> int
            }
        )
    |> Seq.toList

let part1Plotter (instructions : list<Instruction>) =
    let coords = { Depth = 0; Horizon = 0 ; Aim = 0}
    let plot (x : Coordinate) (y : Instruction) =
        match y.Direction with
        | "up" -> x.Depth <- x.Depth - y.Degree
        | "down" -> x.Depth <- x.Depth + y.Degree
        | "forward" -> x.Horizon <- x.Horizon + y.Degree
        | _ -> ()
        x

    instructions
    |> List.fold plot coords
    |> (fun x -> x.Horizon * x.Depth)

let part2Plotter (instructions: list<Instruction>) =
    let coords = { Depth = 0; Horizon = 0 ; Aim = 0 }
    let plot (x : Coordinate) (y : Instruction) =
        match y.Direction with
        | "up" -> x.Aim <- x.Aim - y.Degree
        | "down" -> x.Aim <- x.Aim + y.Degree
        | "forward" -> (x.Horizon <- x.Horizon + y.Degree; x.Depth <- x.Depth + (x.Aim * y.Degree))
        | _ -> ()
        x

    instructions
    |> List.fold plot coords
    |> (fun x -> x.Horizon * x.Depth)

printf "%i" (part1Plotter (instructions raw))
printf "%i" (part2Plotter (instructions raw))