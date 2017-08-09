//
//  main.swift
//  function,closure
//
//  Created by Tops on 7/1/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import Foundation

// Functions
// Functions are self-contained chunks of code that perform a specific task.



// no arguments
func sayHelloWorld() -> String {
    return "hello, world"
}

print(sayHelloWorld())



// with argument(person)


func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))


// Functions With Multiple Parameters

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return person + "how are you ?"
    } else {
        return "your condition is false"
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

//Functions Without Return Values
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")

// return multiple values

func givienvalues(array1 : [Int]) -> (min : Int , max : Int , sum : Int) {
    
    var minimumvalue = array1[0]
    var maximumvalue = array1[0]
    var sum = 0
    
    for everyvalue in array1[1..<array1.count] {
        if everyvalue < minimumvalue {
            minimumvalue = everyvalue
        } else if everyvalue > maximumvalue {
            maximumvalue = everyvalue
        }
        sum += everyvalue
    
    }
    
    return (minimumvalue,maximumvalue,sum)

}

let myarray  = [1,3,5,3,3,9]
let result = givienvalues(array1: myarray)
print(result)

// Variadic Parameters



// A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write variadic parameters by inserting three period characters (...) after the parameter’s type name.


func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))

func calling(_ name: String, _ surname : String) -> String {
    return name + surname
    
}

print(calling("kushal", "patel"))

// Nested Functions
// A nested function provides the facility to call the outer function by invoking the inside function.


func callingvalue(value1: Int) -> (Int) -> Int {
    var constant = 5
    var mul = constant * value1
    print(mul)
    func increment(mul1 : Int) -> Int {
        print(mul)
       
        return mul1 * mul
    }
    return increment
}
let cal1 = callingvalue(value1: 5)
print(cal1(5))


// Closures
//Closures are self-contained blocks of functionality that can be passed around and used in your code.
//closure is a block of code you can pass around and use elsewhere in your code.

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
print(reversedNames)

/*
 { (parameters) -> return type in
 statements
 }

 */

let reversedNames1 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversedNames1)


let reversedNames2 = names.sorted(by: { s1, s2 in return s1 > s2 } )
print(reversedNames2)

let reversedNames3 = names.sorted(by: { s1, s2 in s1 > s2 } )
print(reversedNames3)


// Shorthand Argument Names

// Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.

let reversedNames4 = names.sorted(by: { $0 > $1 } )
print(reversedNames4)

let reversedNames5 = names.sorted(by:  >)
print(reversedNames5)

let integerval = [10,4,64,6,62,42,8678,6,43,757,546,4,6]

let reversed = integerval.sorted(by: {$0 < $1 })
print(reversed)

// trailing closures

func receiving1(closure : () -> Void) {
    
}
// without trailing closure
receiving1 {
    
}

// with trailing closure


receiving1() {
    
}


func doingtotal(start : Int , End : Int , _ closure : (Int) -> Int) -> Int {
    
    var sum = 0
    for i in start...End {
        sum += closure(i)
        
    }
    
    return sum

}

var sum1 = doingtotal(start: 1, End: 5, { $0 })      // 1+2+3+4+5 = 15
print(sum1)

let dict = [0 : "ZERO" , 1 : "ONE" , 2 : "TWO" , 3 : "THREE" , 4 : "FOUR"]
let numbers = [0,1,2,3,4]
var num1 = numbers.map { (num) -> String in
    var op = ""
    op = dict[num]! + op
    
    return op
    
}

print(num1)





// Classes and Structures
// Classes and structures are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.

class SomeClass {
    // class definition goes here
}
struct SomeStructure {
    // structure definition goes here
}


class Rectangle {
    
    var name:String = ""
    var length:Double = 0
    var breadth:Double = 0
    
    
    func area() -> Double {
        return length * breadth
    }

}

let rect1 = Rectangle()
rect1.name = "square type"
rect1.length = 100
rect1.breadth = 50


let area1 = rect1.area()
print(area1)

class square {
    var length : Double
    var width : Double
    init(length : Double, width :Double) {
        self.length = length
        self.width = width
    }
    
    func calculateAre() -> Double {
        return length * width
    }
}

let sq1 = square(length: 100, width: 100)
print(sq1.calculateAre())

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
var someResolution = Resolution()
let someVideoMode = VideoMode()

someResolution.height = 20
someResolution.width = 20

someVideoMode.frameRate = 10
someVideoMode.interlaced = true
someVideoMode.name = "welcome"
someVideoMode.resolution = someResolution
print(someVideoMode)

// Properties

//  Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value.
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 2, length: 5)
rangeOfThreeItems.firstValue = 6

class home {
    var rent = 100
    var actualvalue : Int {
        get {
            return 10
        }
        set {
            rent = newValue * 5
        }

    }

}
var hm1 = home()
print(hm1.actualvalue)
print(hm1.rent)
hm1.actualvalue = 30
print(hm1.rent)

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


// Property Observers
// Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.

// willSet is called just before the value is stored.
// didSet is called immediately after the new value is stored

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}


let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 300

stepCounter.totalSteps = 400

struct Some {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 10
    }
}

print(Some.storedTypeProperty)
print(Some.computedTypeProperty)

// Inheritance
// A class can inherit methods, properties, and other characteristics from another class. When one class inherits from another, the inheriting class is known as a subclass, and the class it inherits from is known as its superclass. Inheritance is a fundamental behavior that differentiates classes from other types in Swift.


class Vehicle {                                           // base class
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
    print("noise")
    }
}

let someVehicle = Vehicle()
// someVehicle.currentSpeed = 100
print("Vehicle: \(someVehicle.description)")

// Subclassing
//Subclassing is the act of basing a new class on an existing class. The subclass inherits characteristics from the existing class, which you can then refine. You can also add new characteristics to the subclass.


class Bicycle: Vehicle {                             // subclass
    var hasBasket = false
    var speed = 10
    
}

let bicycle1 = Bicycle()
bicycle1.hasBasket = true
bicycle1.speed = 20
bicycle1.currentSpeed = 30
print(bicycle1.description)
print(bicycle1.makeNoise())



// Overriding
// To override a characteristic that would otherwise be inherited, you prefix your overriding definition with the override keyword


class Train: Vehicle {                          // subclass
    override func makeNoise() {
        print("Choo Choo")
    }
}

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

class college {
    final var student = 500
    final var address = "ahmedabad"
}


// Preventing Overrides

let ch1 = college()
ch1.address = "rajkot"
ch1.student  = 200

class school : college {
//    override var student = 100
  //  override var address = "surat"
}


// Subscripts


// Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval.

/*
 Subscript Syntax
 
 
 
 subscript(index: Int) -> Int {
 get {
 
 }
 set(newValue) {
 
 }
 }

 
 */

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")


// Initializers

// Initializers are called to create a new instance of a particular type. In its simplest form, an initializer is like an instance method with no parameters, written using the init keyword:

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)


// Deinitialization
// A deinitializer is called immediately before a class instance is deallocated. You write deinitializers with the deinit keyword

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        self.coinsInPurse = coins
        print("inctance is initiallized")
    }
    func win(coins: Int) {
        print("i have \(coins) coins")
    }
    deinit {
       print("instance is deallocated")
    
    }
}

var pla1: Player = Player(coins: 5)
pla1.win(coins: 10)





