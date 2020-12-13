#load "helpers.fsx"

open Helpers

let raw = readLines "input/input2.txt"

type Password = {
    min: int
    max: int
    character: string
    password: string
}

let parsePassword (record : string) =
    let parse = record.Split(" ")
    let minmax = parse.[0].Split("-")
    {
        min = minmax.[0] |> int
        max = minmax.[1] |> int
        character = parse.[1].Substring(0,1)
        password = parse.[2]
    }

let passwordRules =
    raw
    |> Seq.map parsePassword

let validFilter passwordRule = 
    let count =
        passwordRule.password
        |> Seq.filter (fun x -> x = passwordRule.character.[0]) 
        |> Seq.length

    count >= passwordRule.min && count <= passwordRule.max

let result1 =
    passwordRules
    |> Seq.filter validFilter
    |> Seq.length

printf "%i \n" result1

let complexFilter passwordRule = 
    let firstPostion = passwordRule.password.[passwordRule.min - 1].ToString()
    let secondPosition = passwordRule.password.[passwordRule.max - 1].ToString()

    (firstPostion = passwordRule.character || secondPosition = passwordRule.character) &&
    firstPostion <> secondPosition

let result2 = 
    passwordRules
    |> Seq.filter complexFilter
    |> Seq.length


printf "%i" result2