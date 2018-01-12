//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if args.contains("count") {
            var count = 0
            for arg in args {
                if Int(arg) != nil {
                    count += 1
                }
            }
            return count
        } else if args.contains("avg") {
            var sum = 0
            var count = 0
            for arg in args {
                if Int(arg) != nil {
                    count += 1
                    sum += Int(arg)!
                }
            }
            if count > 0 {
                return sum / count
            } else {
                return 0
            }
        } else if args.contains("fact") {
            var fact = 1
            for arg in args {
                if Int(arg) != nil {
                    var num = Int(arg)!
                    while num > 0 {
                        fact = fact * num
                        num -= 1
                    }
                    return fact
                }
            }
            return 0
        } else {
            switch args[1]{
            case "+":
                return Int(args[0])! + Int(args[2])!
            case "-":
                return Int(args[0])! - Int(args[2])!
            case "/":
                return Int(args[0])! / Int(args[2])!
            case "*":
                return Int(args[0])! * Int(args[2])!
            default:
                return 0
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

