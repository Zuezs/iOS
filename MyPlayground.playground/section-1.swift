// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


//Constant
let x = 5 + 7

//Variable
let y = 3

var aString = "The value of Y is: "

// Variables in strings 
aString = " The value of Y is: \(y + (x/2))"

var myArray = ["Eenie", "Meenie", "Miney", "Moe"]

var myDictionary = ["first" : "Eenie", "second" : "Meenie", "third" : "Miney", "fourth" : "Moe"]

myArray[3]

myDictionary["second"]

var typedArray = [String]()
var typedDictionary = [String:String]()

if 1==2{
    let statement = "Duh"
}

for item in myArray{
    item
}

var firstName: String? = "Tyron"

if let name = firstName {
    name
}

switch firstName! {
    case "Tyron":
        let aboutThisPerson = "Graduated in 2010"
    case "Shawn", "Rob":
        let aboutThisPerson = "TA for the course."
    default:
        let aboutThisPerson = "Dont know anything about this person."
    
}

var i = 0

for a in 0 ..<7{
    a
}




