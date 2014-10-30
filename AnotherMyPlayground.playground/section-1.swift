// Playground - noun: a place where people can play

import UIKit

func addTwoNumber(firstValue: Int, secondValue: Int) -> Int{
    func multiplyThem(a: Int) -> Int{
        return (a * secondValue)
    }
    return multiplyThem(firstValue)
}

addTwoNumber(50, 2)
addTwoNumber(21, 30)
addTwoNumber(44, 78)

func sum (numbers: Int...) -> Int{
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

sum(1,2,3,4,5)