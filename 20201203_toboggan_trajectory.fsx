#load "helpers.fsx"

open Helpers

let grid = readLines "input/input3.txt"

type Slope = {
    horizontal: int
    vertical: int
}

let slopeSeq = seq {
    {
        horizontal = 1
        vertical = 1
    }
    {
        horizontal = 3
        vertical = 1
    }
    {
        horizontal = 5
        vertical = 1
    }
    {
        horizontal = 7
        vertical = 1
    }
    {
        horizontal = 1
        vertical = 2
    }
}


let plotCourse index slope item =
    let maxLength = (String.length item)

    let point = 
        if (slope.vertical = 2 && index <> 0 && (index % 2 = 0)) then
            ((index / 2 ) * slope.horizontal) % maxLength
        else
            (index * slope.horizontal) % maxLength

    if (slope.vertical = 2 && (index % 2) <> 0) then
        0
    elif (item.[point] = '#') then
        1
    else
        0

let result1 =
    let slope = Seq.item 1 slopeSeq

    grid
    |> Seq.mapi (fun i x -> plotCourse i slope x)
    |> Seq.reduce (fun x y -> x + y)

printf "%i" result1

let plotCourses index slope items =
    items
    |> Seq.mapi (fun i x -> plotCourse i slope x)
    |> Seq.reduce (fun x y -> x + y)

let result2 =
    slopeSeq
    |> Seq.mapi (fun i x -> plotCourses i x grid )
    // |> Seq.iter (fun i -> Console.WriteLine i)
    |> Seq.reduce (fun x y -> x * y)

sprintf "%i" result2