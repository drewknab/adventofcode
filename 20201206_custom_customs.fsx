#load "helpers.fsx"

open System
open Helpers

let raw =
    readString "input/input6.txt"

let distinctAnswers (answers : string) = 
    answers.Replace("\n", "") 
    |> Seq.distinct
    |> Seq.toArray
    |> Array.length


let cleanList = 
    raw.Split("\n\n")
    |> Array.toList

let result1 = 
    cleanList
    |> List.map distinctAnswers
    |> List.reduce ( + )

printf "%i \n" result1

let isAllGroups (haystack : string) (needle : string) (comparison : int) =
    (haystack.Length - haystack.Replace(needle, "").Length) = comparison

let commonAnswers (answers : string) =
    let splitAnswers = answers.Split("\n")
    let size = splitAnswers.Length
    let mutable allAnswered = 0

    let distinct =
        answers.Replace("\n", "")
        |> Seq.distinct

    for answer in distinct do
        if (isAllGroups (answers.Replace("\n", "")) (answer.ToString()) size) then
            allAnswered <- allAnswered + 1

    allAnswered

let result2 = 
    cleanList
    |> List.map commonAnswers
    |> List.reduce ( + )

printf "%i" result2