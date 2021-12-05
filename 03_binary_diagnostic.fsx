#load "helpers.fsx"

open Helpers
open System

type Power = {
    Gamma: string
    Epsilon: string
}

let raw = readLines "input/input3.txt"
// let raw = readLines "input/input3test.txt"

let binaryList =
    raw 
    |> Seq.toList

let bitsCount = binaryList.Length

let tally (x: array<int>) (y: string) =
    let splits = Seq.toList y
    for index = 0 to splits.Length - 1 do
        if splits[index] = '1' then
            x[index] <- x[index] + 1
    x

let bitify (x: string) (y: int) =
    if y > 0 && y > bitsCount / 2 then
        x + "1"
    else
        x + "0"

let parser (raw: seq<string>) (binaryList: list<string>) =
    let mutable tallied = binaryList[0] |> Seq.map (fun _ -> 0) |> Seq.toArray

    let binaryGamma =
        binaryList
        |> List.fold tally tallied
        |> Array.fold bitify ""

    let binaryEpsilon = 
        binaryGamma
        |> Seq.map (fun x -> if x = '1' then '0' else '1')
        |> Seq.map string
        |> String.concat ""

    {Gamma = binaryGamma; Epsilon = binaryEpsilon}

let rec filterBinary
    (column: int)
    (recBinary: list<string>)
    (checkType: string)
    (bit: char)
    (antibit: char) =

    let tallyColumn (x: int) (y: string) =
        let splits = Seq.toList y
        if splits[column] = bit then
            x + 1
        else
        x

    let folded =
        recBinary
        |> Seq.fold tallyColumn 0 

    let gtlt =
        if checkType = "oxy" then 
            folded |> float >= (recBinary.Length |> float) / 2.0
        else 
            folded |> float <= (recBinary.Length |> float) / 2.0

    let filterValue = 
        if gtlt then bit else antibit

    printf "%i and %i\n" folded (recBinary.Length / 2)

    let filtered =
        recBinary
        |> Seq.filter (fun x ->
            let splits = Seq.toList x
            splits[column] = filterValue
            )
        |> Seq.toList

    if filtered.Length = 1 then
        filtered[0]
    else
        filterBinary (column + 1) filtered checkType bit antibit

let part1 = 
    parser raw binaryList
    |> (fun x -> Convert.ToInt32(x.Gamma, 2) * Convert.ToInt32(x.Epsilon, 2))

let part2 =
    let oxy = filterBinary 0 binaryList "oxy" '1' '0'
    let co2 = filterBinary 0 binaryList "co2" '0' '1'

    Convert.ToInt32(oxy, 2) * Convert.ToInt32(co2, 2)

printf "%i\n%i" part1 part2