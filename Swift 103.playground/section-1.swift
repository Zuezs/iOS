// Playground - noun: a place where people can play

import UIKit

class Shape{
    var numberOfSides = 0
    
    init(sideCount: Int){
        self.numberOfSides = sideCount
    }
}

class NamedShape: Shape {
    var name: String
    
    init(sideCount: Int, nameToUse: String){
        self.name = nameToUse
        super.init(sideCount: sideCount)
    }
    
    func sayHello(){
        println("Hello World, my name is \(name)!")
    }
}

class StubbornShape: NamedShape{
    override func sayHello() {
        println("I'm not telling you my name!")
    }
}

var stubborn = StubbornShape(sideCount: 9, nameToUse: "Mike")
stubborn.sayHello()

var triangle = Shape(sideCount: 3)

let square = Shape(sideCount: 4)

var firstNamedShape = NamedShape(sideCount: 6, nameToUse: "Phil")
firstNamedShape.sayHello()

firstNamedShape.numberOfSides = 7
firstNamedShape.name = "Derek"

var secondNamedShape = firstNamedShape

secondNamedShape.sayHello()
