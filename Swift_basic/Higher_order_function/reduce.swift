//
//  reduce.swift
//  Swift_basic
//
//  Created by 이대호 on 2023/12/02.
//  reduce

import Foundation

let numbers: [Int] = [1,2,3]

// 첫 번째 형태인 reduce(_:_:) 메서드의 사용

// 초깃값이 0이고 정수 배열의 모든 값을 더한다.
var sum: [Int] = numbers.reduce(0, { (result: Int, next: Int) -> Int in
        return result + next
})

var sum: [Int] = numbers.reduce(0){
    return $0 + $1
}
