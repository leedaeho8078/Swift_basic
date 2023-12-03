//
//  Collection type.swift
//  Swift_basic
//
//  Created by 이대호 on 2023/12/03.
//

import Foundation

//대괄호를 사용하여 배열임을 표현한다

var names: Array<String> = Array<String>()
names = ["daeho", "chulsoo", "younghee", "youngho"]

// 위와 같은 의미
//var names: Array<String> = ["daeho", "chulsoo", "younghee", "youngho"]

print(names.count)      // 4
print(names.isEmpty)    // false

names.insert("elsa", at: 3)
names.append("juoo")
names.append(contentsOf: ["jee","hee"])

print(names)
//names.remove(at: 0)
names.removeFirst()
names.removeLast()
//names.removeAll()
print(names)


// 딕셔너리 선언과 생성
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
var numberForName: [String: Int] = [String: Int]()
var numberForName: [String: Int] = [:]

var numberForName: [String: Int] = ["daeho": 100, "youngho": 200, "hee": 300]

print(numberForName.isEmpty)
print(numberForName.count)

print(numberForName["daeho"])           //Optional(100)
if let name = numberForName["daeho"] {
    print(name)                         //100
}
print(numberForName["youngho"])
print(numberForName["heeee"]) //nil 반환

print(numberForName)
print(numberForName.removeValue(forKey: "daeho"))
print(numberForName)
print(numberForName.removeValue(forKey: "daeho")) // daeho가 이미 삭제되었으므로 nil


//세트의 선언과 생성
//var names: Set<String> = Set<String>()
//var names: Set<String> = []
var names: Set<String> = ["daeho", "chulsoo", "younghee", "youngho"]

// 타입 추론을 사용하게 되면 컴파일러는 Set이 아닌 Array 타입으로 지정한다.
var numbers = [100, 200, 300]

print(names.count)
print(names.isEmpty)

//세트의 활용
let firstSet: Set<Int> = [1,2,3,4,5,6]
let secondSet: Set<Int> = [1,3,5,6,7,8,9]

let unionSet: Set<Int> = firstSet.union(secondSet)
print(unionSet.sorted())

let intersectSet: Set<Int> = firstSet.intersection(secondSet)
print(intersectSet.sorted())

