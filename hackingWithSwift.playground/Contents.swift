//: A UIKit based Playground for presenting user interface

import UIKit
//import PlaygroundSupport
//
//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()

var name = "Levi"
name = "Kaplan"



var numbers = [1, 2, 3, 4, 5]
type(of: numbers)

var anything: [Any] = [1, true, "hello"]
type(of: anything)

// create empty String Array
var dogBreeds = [String]()

// You can add stuff to arrays using operators
var odd = [1, 3, 5, 7]
var even = [2, 4, 6, 8, 10]
var both = odd + even


both += [11]




// dictionaries
var person = ["first": "Taylor",
              "middle": "Alison",
              "last": "Swift",
              "month": "December"]
person["middle"]
person["month"]


// if statements
var num1 = 10
var num2 = 12

if num1 > num2 {
     "num1 bigger"
}
else {
     "num2 bigger"
}

// loops
for i in 1...10 {
    "\(i) x 10 is \(i * 10)"
}

var str = "Fakers gonna"
for _ in 1 ... 5 {
    str += " fake"
}

str

for numbey in both {
    "I like the number \(numbey)"
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]
for i in 0..<people.count {
    var str = "\(people[i]) gonna"
    
    for _ in 1 ... 5
}
