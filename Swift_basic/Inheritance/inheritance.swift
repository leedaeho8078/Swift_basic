//
//  inheritance.swift
//  Swift_basic
//
//  Created by 이대호 on 2023/12/01.
//  inheritance(상속)

import Foundation


//기반 클래스 Person
class Person {
    var name: String = ""
    var age: Int = 0
    
    var introduciton: String {
        return "이름\(self.name)"
    }
    
    func speak() {
        print("가나다라마바사")
    }
    
}


//Person 클래스를 상속받은 Student 클래스
class Student: Person {
    var grade: String = "F"
   
    /* 부모클래스에게 상속받은 메서드 및 프로퍼티 생략되어 있다.*/
//    var name: String = ""
//    var age: Int = 0
//    
//    var introduciton: String {
//        return "이름\(self.name)"
//    }
//    
//    func speak() {
//        print("가나다라마바사")
//    }
    
    func study() {
        print("Study hard....")
    }
}

let daeho: Person = Person()
daeho.name = "Daeho"
daeho.age = 33

let youngho: Student = Student()
youngho.name = "Youngho"   // 상속을 받았기 때문에 접근가능
youngho.age = 32           // 상속을 받았기 때문에 접근가능
youngho.speak()            // 상속을 받았기 때문에 접근가능




// 메서드 재정의

class Person {
    var name: String = ""
    var age: Int = 0

    var introduciton: String {
        return "이름\(self.name)"
    }

    func speak() {
        print("가나다라마바사")
    }
    
    class func introduceClass() -> String {
        return "인류의 소원은 평화 입니다."
    }

}

class Student: Person {
    var grade: String = "F"
   
    
    func study() {
        print("Study hard")
    }
    
    override func speak() {  // 부모클래스의 speak함수 재정의
        super.speak()
        print("저는 학생입니다")
    }
}


let daeho: Student = Student()
daeho.speak()    //가나다라마바사, 저는 학생입니다 출력



// 프로퍼티 재정의
class Person {
    var name: String = ""
    var age: Int = 0
    var koreanAge: Int {     //연산 프로퍼티
        return self.age + 1
    }
    
    var introduction: String { //연산 프로퍼티
        return "이름 : \(name), 나이 : \(age)"
    }

}

class Student: Person {
    var grade: String = "F"
    
    override var introduction: String {
        return super.introduction + " " + "학점 : \(self.grade)"
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
    }
}
let daeho: Person = Person()
daeho.name = "Daeho"
daeho.age = 32
print(daeho.koreanAge)


let youngho: Student = Student()
youngho.name = "Youngho"
youngho.age = 14
youngho.grade = "A"
youngho.koreanAge = 18
print(youngho.koreanAge)

// 프로퍼티 감시자 재정의
class Person {
    var name: String = ""
    var age: Int = 0  {
        didSet {
            print("Person age : \(self.age)")
        }
    }
    
    var koreanAge: Int {
        return self.age + 1
    }
    
    var fullName: String {
        get {
            return self.name
        }
        set {
            self.name = newValue
        }
    }
}


class Student: Person {
    var grade: String = "F"
    
    override var age: Int {
        didSet {
            print("Student age: \(self.age)")
        }
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        
        set {
            self.age = newValue - 1
        }
    }
    
    override var fullName: String {
        didSet {
            print("Full name: \(self.fullName)")
        }
    }
}

let daeho: Person = Person()
daeho.name = "Daeho"
daeho.age = 32
print(daeho.fullName)
print(daeho.koreanAge)
