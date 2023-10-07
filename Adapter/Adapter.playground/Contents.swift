import UIKit

protocol BirdProtocol {
    func sing()
    func fly()
}

class Bird: BirdProtocol {
    
    func sing() {
        print("tew-tew-teeeeew")
    }
    
    func fly() {
        print("Omg! I'm flying! Can't believe!")
    }
    
}

class Raven {
    
    func flySearchAndDestroy() {
        print("I'm flying and search, and destroy!")
    }
    
    func voice() {
        print("Kaaar-kaaar!!!")
    }
    
}

class RavenAdapter: BirdProtocol {
    
    private var raven: Raven
    
    init(adaptee: Raven) {
        self.raven = adaptee
    }
    
    func sing() {
        raven.flySearchAndDestroy()
    }
    
    func fly() {
        raven.voice()
    }
    
    
}

func makeTheBirdTest(bird: BirdProtocol) {
    
    bird.fly()
    bird.sing()
    
}

let simpleBird = Bird()
let simpleRaven = Raven()

let ravenAdapter = RavenAdapter(adaptee: simpleRaven)

makeTheBirdTest(bird: simpleBird)
makeTheBirdTest(bird: ravenAdapter)
