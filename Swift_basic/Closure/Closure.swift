//
//  Closure.swift
//  Swift_basic
//
//  Created by 이대호 on 2023/12/07.
//  클로저

import Foundation


// 기본 클로저 문법

//{ (매개변수 목록) -> 반환타입 in
//    실행 코드
//}

// sum 이라는 상수에 클로저를 할당
let sum: (Int,Int) -> Int = {( a: Int, b: Int) in
    return a + b
}

let sumResult: Int  = sum(2,3)
print(sumResult)  // 43


//함수의 전달인자로로서 클로저
// 덧셈 클로저
let add: (Int,Int) -> Int

add = { (a:Int, b:Int) in
    return a+b
}

// 뺼셈 클로저
let subtract: (Int,Int) -> Int

subtract = { (a:Int, b:Int) in
    return a - b
}

// 나눈셈
let divide: (Int, Int) -> Int

divide = { (a:Int, b:Int) in
    return a / b
}

func calculate(a:Int, b:Int, method:(Int,Int) -> Int) -> Int {
    return method(a,b)
    
}

var calculated: Int

calculated = calculate(a: 50, b: 10, method: add)
print(calculated) // 60

calculated = calculate(a: 50, b: 10, method: subtract)
print(calculated) // 40

calculated = calculate(a: 50, b: 10, method: divide)
print(calculated)  // 5

// 따로 클로저를 상수/변수에 넣어 전달하지 않고
// 함수를 호출할때 클로저를 작성하여 전달할 수도 있다.

calculated = calculate(a: 50, b: 10, method: {( left:Int, right:Int) -> Int in
    return left * right
    
})


// 후행 클로저

func calculate(a:Int, b:Int, method:(Int,Int) -> Int) -> Int {
    return method(a,b)
    
}

var result: Int

// 클로저가 함수의 마지막 전달인자라면 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저 구현 가능
result = calculate(a: 50, b: 10){ (left:Int, right:Int) -> Int in
    return left + right

}
print(result) // 60

// 반환 타입 생략
result = calculate(a: 50, b: 10, method: { (left:Int, right:Int) in
    return left + right

})

// 후행클로저와 함꼐 사용할 수 있다.
result = calculate(a: 20, b: 10){ (left:Int, right:Int) in
    return left + right

}

print(result) //30

// 단축 인자 이름
result = calculate(a: 10, b: 20, method: {
        return $0 + $1
    
})

// 당연히 후행 클로저와 함꼐 사용할 수 있다
result = calculate(a: 20, b: 30) {
        return $0 + $1
}
    

// 암시적 반환 표현
result = calculate(a: 10, b: 20){
        $0 + $1
}
print(result) // 30

result = calculate(a: 20, b:20){ $0 + $1 }
print(result)  // 40


// 축약 전과 후 비교

//축약 전
result = calculate(a: 10, b: 10, method: {(left:Int, right:Int) -> Int in
    return left + right
    
})

//축약 후
result = calculate(a: 10, b: 20){ $0 + $1 }
