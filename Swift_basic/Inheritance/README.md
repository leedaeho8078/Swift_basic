# Inheritance(상속)

**Apple** 공식문서 : [참고](https://bbiguduk.gitbook.io/swift/language-guide-1/inheritance) 

- 상속
클래스는 메서드나 프로퍼티등을 다른 클래스부터 **상속** 받을 수 있다
어떤 클래스로부터 상속을 받으면 상속받은 클래스는 그 어떤 클래스의 **자식클래스** 자신클래스에게 자신의 특성을 물려준 클래스를 **부모클래스**

> **Swift 클래스는 범용 기본 클래스를 상속하지 않습니다. 상위 클래스 지정 없이 정의한 클래스는 자동적으로 빌드 할 때 기본 클래스가 됩니다.**


1. 클래스 상속
```Swift
    class 클래스이름 : 부모클래스 이름 {
    프로퍼티와 메서드들
}
```
상속은 기반클래스를 다른 클래스에서 물려받는 것을 말한다. `부모클래스의 메서드`, `프로퍼티등을 재정의하거나`, `기반클래스의 기능`이나 `프로퍼터`를 물려받고 자신의 기능을 추가할 수 있다.


2. 재정의
- 부모클래스에 물려받은(`인스턴스 메서드`, `타입 메서드`, `인스턴스 프로퍼티`, `타입 프로퍼티`, `서브스크립트`)를 그대로 사용하지 않고 자신만의 기능으로 변경하여
사용하는게 **재정의(Override**)라고 한다.
자식 클래스에서 부모클래스의 특성을 재정의했을 때, 부모클래스의 특성을 자식클래스에서 사용하고 싶다면 `Super`프로퍼티를 사용하면 된다.
e.g 재정의한 func()을 부모 버전으로 호출 하고싶다면 super.func()라고 호출


3. 메서드의 재정의
- 부모클래스로부터 상속받은 인스턴스 메서드나 타입 메서드를 자식클래스에서 용도에 맞도록 재정의 가능
```Swift
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

```
4. 프로퍼티 재정의
- 프로퍼티를 재정의할 떄는 저장 프로퍼티로 재정의 할수 없다. 프로퍼티를 재정의 한다는 것은 프로퍼티 자체가 아니라 `프로퍼티의 접근자`,`설정자`,`프로퍼티 감시자`등을 재정의 하는것
- 조상클래에서 저장 프로퍼티로 정의한 프로퍼티는 물론이고 연산 프로퍼티로 정의한 프로퍼티도 접근자와 설정자를 재정의 할수 있다. 다만 조상클래스에 프로퍼티의 이름과 타입이 일치해야 한다. 조상클래에서 읽기전용 프로퍼티 였어도
자식클래스에서는 읽고 쓰기가 가능한 프로퍼티로 재정의 가능 그러나, 읽기 쓰기 모두 가능했던 프로퍼티를 읽기 전용으로 재정의는 불가능

```Swift
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

```
5. 프로퍼티 감시자 재정의
- 프로퍼티 감시자도 프로퍼티의 접근자와 설정자처럼 재정의 가능, 또 조상클래스에 정의한 프로퍼티가 연산 프로퍼티인지 저장 프로퍼티인지는 상관없다. 다만 `상수 저장 프로퍼티`나 `읽기 전용 연산 프로퍼티`는 프로퍼티 감시자를 재정의 불가, 왜냐하면 상수 저장 프로퍼티나 읽기 전용 연산 프로퍼티는 값을 설정할 수 없으므로 `willSet`이나 `didSet`메서드르 사용 불가

```Swift

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

```

6. 서브스크립트 재정의
- 서브스크립도 메서드와 마찬가지로 재정의가 가능하다. 자식클래스에서 재정의하려는 서브스크립트라면 부모클래스 서브스크립트의 `매개변수`와 `반환 타입`이 같아야 한다.

7. 재정의 방지
- 만약 부모클래스를 상속받는 자식클래스에서 몇몇 특성을 재정의할 수 없도록 제한하고 싶다면 재정의를 방지하고 싶은 특성 앞에 `final`키워드를 명시하면 된다. 만약 클래스를 상속허거나 재정의할 수 없도록 하고 싶다면 class 키워드
앞에 `final`키워드를 명시해 주면된다. 그렇게 하면 더 이상 자식클래스를 가질 수 없다.







예시
| A | B | C |
|:---|:---:|---:|
| `이대호` | aaa | `111` |
| `이희병` | bbb |  |
