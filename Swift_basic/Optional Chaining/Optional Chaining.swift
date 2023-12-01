//
//  Optional Chaining.swift
//  Swift_basic
//
//  Created by 이대호 on 2023/12/01.
//  Optional Chaining
//
import Foundation


// 사람의 주소 정보 표현 설계
class Room {
    var number: Int     // 호실 번호
    
    init(number: Int) {
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}


struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
}

class Person{
    var name: String
    var address: Address?
    
    init(name: String) {
        self.name = name
      
    }
    
}


let daeho: Person = Person(name: "Daeho")

// 옵셔널 체이닝의 사용
if let roomNumber: Int = daeho.address?.building?.room?.number {
    print(roomNumber)
}else{
    print("Can not find room number") // Can not find room number 출력
}

// 옵셔널 체이닝을 통한 값 할당

daeho.address = Address(province: "서울특별시", city: "송파구 가락동", street:"오금로", building: nil, detailAddress: nil)
daeho.address?.building = Building(name: "곰굴")
daeho.address?.building?.room = Room(number: 204)
daeho.address?.building?.room?.number = 505

print(daeho.address?.building?.room?.number) // Optional<505>
