#load "helpers.fsx"

open System
open Helpers
open System.Text.RegularExpressions

let raw =
    readString "input/input4.txt"

let parser (items : string list) =
    let splitKeyValue (str : string) = 
        let tempStr = str.Trim()
        match tempStr.Split(':') with
        | [|key;value|] -> key, value
        |_ -> invalidArg "str" "str must have key:value"

    items
    |> List.map splitKeyValue
    |> dict
    |> Collections.Generic.Dictionary

let passportTester (passport : Collections.Generic.Dictionary<string, string>) = 
    passport.ContainsKey("byr") &&
    passport.ContainsKey("iyr") &&
    passport.ContainsKey("eyr") &&
    passport.ContainsKey("hgt") &&
    passport.ContainsKey("hcl") &&
    passport.ContainsKey("ecl") &&
    passport.ContainsKey("pid")

let rangeTester (value : string) min max = 
    let intValue = value |> int
    intValue >= min && intValue <= max

let heightTester input = 
    let formatPattern = "^(\d+)(cm|in)$"
    if (Regex.IsMatch(input, formatPattern)) then
        if (input.IndexOf("c") > 0) then
            let height = input.Substring(0, input.IndexOf("c")) 
            rangeTester height 150 193
        else
            let height = input.Substring(0, input.IndexOf("i")) 
            rangeTester height 59 76
    else
        false

let hairTester value =
    Regex.IsMatch(value, "^#[0-9a-f]{6}")

let colors = ["amb" ; "blu" ; "brn" ; "gry" ; "grn" ; "hzl" ; "oth"]

let eyeTester value = colors |> List.contains value

let pidTester value = Regex.IsMatch(value, "\d{9}") && value.Length = 9

let allRequired =
    raw.Split("\n\n")
    |> Array.toList
    |> List.map (fun x -> x.Replace("\n", " ").Split(" ") |> Array.toList |> parser)
    |> List.filter (passportTester)

printf "part 1: %i \n" (allRequired |> List.length)

let passportSecondPass (passport : Collections.Generic.Dictionary<string, string>) = 
    rangeTester passport.["byr"] 1920 2002 &&
    rangeTester passport.["iyr"] 2010 2020 &&
    rangeTester passport.["eyr"] 2020 2030 &&
    heightTester passport.["hgt"] &&
    hairTester passport.["hcl"] &&
    eyeTester passport.["ecl"] &&
    pidTester passport.["pid"]

let finalValid =
    allRequired
    |> List.filter (passportSecondPass)

printf "part 2: %i" (finalValid |> List.length)