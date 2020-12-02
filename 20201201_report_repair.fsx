open System
open System.IO

let readLines (filePath : string) = seq {
    use sr = new StreamReader (filePath)
    while not sr.EndOfStream do
        yield sr.ReadLine ()
}

let raw = readLines "input/input1.txt"

let numbers =
    raw
    |> Seq.map (fun x -> x |> int)

let result1 =
    numbers
    |> Seq.map (fun x -> 2020 - x)
    |> Seq.filter (fun x -> Seq.contains x numbers)
    |> Seq.reduce (fun x y -> x * y)

Console.WriteLine result1

// Cave and just do it mutably because FP is hard lol
let result2 =
    let sortNumbers = numbers |> Seq.toList |> List.sort
    let numberLength = sortNumbers.Length
    let mutable returnValue = 0
    for index = 0 to numberLength - 2 do
        let mutable left = index + 1 
        let mutable right = numberLength - 1

        while (left < right) do
            if (sortNumbers.[index] + sortNumbers.[left] + sortNumbers.[right] = 2020) then
                returnValue <- sortNumbers.[index] * sortNumbers.[left] * sortNumbers.[right]
                left <- right + 1
            elif (sortNumbers.[index] + sortNumbers.[left] + sortNumbers.[right] < 2020) then
                left <- left + 1
            else
                right <- right - 1
    returnValue

Console.WriteLine result2