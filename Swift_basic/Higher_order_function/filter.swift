//
//  filter.swift
//  Swift_basic
//
//  Created by 이대호 on 2023/12/02.
//  filter

import Foundation

let numbers: [Int] = [0,1,2,3,4]

let evenNumbers: [Int] = numbers.filter { (number:Int ) -> Bool in
    return number % 2 == 0
    
}


print(evenNumbers) // [0,2,4]

let oddNumbers: [Int] = numbers.filter { $0 % 2 == 1}
print(oddNumbers)  // [1,3,5]
