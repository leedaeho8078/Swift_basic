//
//  Control Flow.swift
//  Swift_basic
//
//  Created by 이대호 on 2023/12/04.
//  Control Flow(흐름 제어)
//  조건문

import Foundation

// 조건문
let first: Int = 5
let second: Int = 7

if first > second {
  print("first > second")
}else if first < second {
  print("second > first")
}else{
  print(" first == second")
}
// "second > first" 출력

// Switch문

// switch 구문 기본 구현
let integerValue: Int = 5

switch integerValue {
case 0:
    print("value == zero")
case 1...10:
    print("value == 1~10")
    fallthrough
case Int.min..< 0, 101..< Int.max:
    print("value < 0 or value > 100")
default:
    print("10 < value <= 100"
}

// value == 1~10
// value < 0 or value > 100

enum School {
case primary, elementary, middle, high, college, university, graduate
}

let 최종학력: School = .university

switch 최종학력 {
case .primary:
  print("최종학력은 유치원입니다.")
case .elementary
  print("최종학력은 초등학교입니다")
case .middle:
  print("최종학력은 중학교입니다.")
case .high:
  print("최종학력은 고등학교입니다.")
case .college, .university:
  print("최종학력은 대학교입니다.")
case .gradutate
  print("최종학력은 대학원입니다.")
}

// 최종학력은 대학교입니다.


// 반복문

// for~in 반복 구문의 활용
var musicList = ["좋은 날", "잔소리", "Dynamite", "Omg"]

for number in 0...3 {
print("\(number+1)위: \(musicList[number])")
}


// for-in 반복 구문의 활용
for i in 0...2 {
    print(i)
}

let helloSwift: String = "hello Swift!"

for char in helloSwift {
        print(char)
}

let 주소: [String: String] = ["특별시":"서울시", "구":"송파구" ,"동":"가락동"]

for (key,value) in 주소 {
        print("\(key),\(value)")
}

