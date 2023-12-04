//
//  Map.swift
//  Swift_basic
//
//  Created by 이대호 on 2023/12/02.
//  map

import Foundation


// for-in 구문과 맵 메서드의 사용 비교
let numbers: [Int] = [0,1,2,3,4]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

//for 구문 사용
for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers)    // [0,2,4,6,8]
print(strings)           // ["0", "1", "2", "3", "4"]
            
// map 메서드 사용
// 매개 변수 및 반환 타입 생략
// 반환 키워드 생략
// 후행 클로저
doubledNumbers = numbers.map { $0 * 2 }
strings = numbers.map { String($0) }
