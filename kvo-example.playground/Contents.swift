import Foundation
//KVO: key value observing
// exist in objective-c and swift
// when we have object with instance variables, KVO allows other objects to establish surveillance on changes for these instance variables
// KVO is enabled by default in objective-c all you have to do is to create property and objective-c will create it's setter that
// send valuewillchangeforkey
//set the new value to _proprty
//send valueDidChangeforKey
// other objects set itself as an observer and handle value change notifications
// in swift KVO is not enabled by default so we need to
// make class inherit from nsobject
// add @objc dynamic before each property
// add myself as observer(don't need to inherit from nsobject)
class Person: NSObject {
    @objc dynamic var name: String
    init(name: String) {
        self.name = name
    }
}

class Other {
    var token: NSKeyValueObservation?
    
    func observe(person: Person) {
        token = person.observe(\Person.name, options: .new, changeHandler: { (person, change) in
            print("other object's name property changed to: \(person.name)")
        })
    }
    deinit {
        token?.invalidate()
    }
    
}

var huda = Person(name: "Huda")

//Person object observe it's name property
huda.observe(\Person.name, options: .new) { (person, change) in
    print("my name property changed to: \(person.name)")
}

// other objects observe Person object
let other = Other()
other.observe(person: huda)
huda.name = "Azza"
