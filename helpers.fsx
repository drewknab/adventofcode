open System
open System.IO

let readLines (filePath : string) = seq {
    use sr = new StreamReader (filePath)
    while not sr.EndOfStream do
        yield sr.ReadLine ()
}

let readString (filePath : string) =
    use sr = new StreamReader (filePath)
    sr.ReadToEnd ()