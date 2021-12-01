#load "helpers.fsx"

open Helpers

let raw = readLines "input/input1.txt"

let numbers =
    raw
    |> Seq.map (fun x -> x |> int)

let result lengthOffset =
    let numberList = numbers |> Seq.toList
    let numbersLength = numberList.Length 

    let mutable returnValue = 0
    for index = 0 to numbersLength - lengthOffset do
        if numberList[index] < numberList[index + (lengthOffset - 1)] then
            returnValue <- returnValue + 1

    returnValue

printf "%i \n %i" (result 2) (result 4)