//
//  Early Exit.swift
//  Swift_basic
//
//  Created by 이대호 on 2023/12/01.
//  Early Exit(빠른 종료)

import Foundation

// guard 구문의 옵셔널 바인딩 활용

func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    
    print("Hello \(name)")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location)")

}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Jenny"

greet(personInfo) //Hello jenny, I hope the weather is nice near you

personInfo["location"] = "Korea"

greet(personInfo) //Hello jenny, I hope the weather is nice in Korea


// guard 구문이 사용될 수 없는 경우
let first: Int = 3
let second: Int = 5

guard first > second else {
    // 여기에 들어올 제어문 전환 명령은 딱히 없습니다. 오류!
}

