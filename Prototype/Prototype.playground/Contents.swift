import UIKit

var prototype = "Hello, prototype"

class Person {
    
    var name = ""
    
    // Easy method
    func clone() -> Person {
        
        let person = Person()
        person.name = name
        
        return person
        
    }
    
}

// An instance of the Person class
// A pointer to an object in memory
var person_first = Person()
person_first.name = "Jim" // Working with person_first object

print(person_first.name)

// var person_second = person_first
var person_second = person_first.clone()
person_second.name = "Jack"

print(person_first.name)
print(person_second.name)

print(person_first === person_second)

// ================================== //

class Person1 {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func clone() -> Person1 {
        return Person1(name: self.name)
    }
    
}

var person_first1 = Person1(name: "Jim")
var person_second1 = person_first1.clone()
print(person_first1 === person_second1)

// Protocol inside Objective-C
// NSCopying

// ================================== //

public protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    public func copy() -> Self {
        return type(of: self).init(self)
    }
}

class Person2: Copying {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    required convenience init(_ prototype: Person2) {
        self.init(name: prototype.name)
    }
    
}

var person_first2 = Person2(name: "Jim")
var person_second2 = person_first2.copy()


