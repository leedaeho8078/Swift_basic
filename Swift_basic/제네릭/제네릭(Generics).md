# 제네릭(Generics)
* `한번의 구현`으로 `모든 타입`을 커버가능한 문법: 제네릭
  * 유지보수/재활용성이 편해진다.
* `제네릭은 타입`에 관계없이, `하나의 정의 구현`으로 모든 타입을 처리할 수 있는 문법
* `2개 이상`을 선언하는 것도 가능 
* `<T>` -> 타입 파라미터


```swift
var num1 = 10
var num2 = 20

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
  let temp = a
     a =  b
     b = temp
}

swapTwoInts(&num1,&num2)


// 만약, Double을 교환하고 싶다면?, String을 교환하고 싶다면

var num1 = 10
var num2 = 20


var str1 = "str1"
var str2 = "str2"

var db1 = 3.0
var db2 = 5.0



func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temp = a
            a = b
            b = temp
    
}

swapTwoValues(&num1, &num2)
print(num1,num2)        // 20, 10
swapTwoValues(&str1, &str2)
print(str1,str2)        // str2,str1
swapTwoValues(&db1, &db2)
print(db1,db2)          // 5.0, 3.0
```

* 사실 우리는 제네릭을 계속 사용해 왔디.
```swift
// 배열
let array: [Int] = [1,2,3,4,5]        // 단축 문법
let array: Array<Int> = [1,2,3,4,5]   // 정식 문법 

//딕셔너리
let dic: [String:Int] = ["A":123,"B":1234]
let dic; Dictionary<Stirng, Int> = ["A":123,"B":1234]

//옵셔널 타입
var optionalType: String?
var optionalType: Optional<String>

// 고차함수
// 고차함수 map도 제네릭
[1,2,3].map(transfomrm: (Int) throws -> T)


```

### 제네릭 타입의 정의
* `클래스`, `구조체`, `열거형`의 타입이름 뒤에` 파라미터<T>`를 추가하면, 제네릭 타입으로 선언됨
* `속성의 자료형`, `메서드의 파라미터 형식`, `리턴형을 타입 파라미터`로 대체 가능
  단점 : 
```swift
// 제네릭 타입의 정의
//구조체
struct Member {
    var members: [String] = []
    
}

struct GenericMember<T> {
    var members: [T] = []
    
    func doSomeThing(a: T) -> T {
        return a
    }
    
}

// 생성시에 메모리구조가 결정되어 member1은 [Int]타입
var member1 = GenericMember(members: [1,2,3,4,5])
member1.members[0]
var memeber2 = GenericMember(members: ["A","B","C"])
memeber2.members


//클래스
class GridPoint<A> {
    var x: A
    var y: A
    
    init(x: A, y: A) {
        self.x = x
        self.y = y
    }
    
}
let aPoint = GridPoint(x: 10, y: 20)
let bPoint = GridPoint(x: 10.0, y: 20.0)


// 열거형에서 연관값을 가질때만 제네릭으로 정의가능⭐️
// 어차피 케이스는 자체가 선택항목 중에 하나일뿐(특별타입)이다.
enum Pet<T> {
    case dog
    case cat
    case etc(T)
    
}

let animal1: Pet = .etc("고슴도치")
let animal2: Pet = .etc(30)



// 제네릭 구조의체의 확장
// 정의
struct Coodinates<T> {
    var x: T
    var y: T
}

// 제네릭을 확장에도 적용할수 있다.
extension Coodinates { // Coodinates<T> -> X
    func getPlace() -> (T,T) {
        return (x,y)
    }
    
}

//where절도 추가 가능
// Int타입에만 적용되는 확장과 getIntArray()메서드
extension Coodinates where T == Int {
            
    func getIntArray() -> [T] {
        return [x,y]
    }
    
}

var place2 = Coodinates(x: 10, y: 10)
place2.getIntArray()
var place3 = Coodinates(x: "da", y: "b")
//place3.getIntArray()
// 정수형일때만 메서드가 나타난다.


// 타입 제약
// 제네릭에서 타입을 제약할수 있음
// 타입 매개 변수 이름 뒤에 콜론으로 "프로토콜"제약 조건 또는 "단일 클래스"를 배치 가능
// (1) 프로토콜 제약 <T: Equtable>
// (2) 클래스 제약  <T: SomeClass>

// Equtable 프로토콜을 채택한 타입만 해당 함수에서 사용 가능 하다는 채택

func findIndex<T: Equatable>(item: T, array: [T]) -> Int? {
    for (index,value) in array.enumerated() {
        if item == value {
            return index
        }
    }
    return nil
}

let aNumber = 5
let someArray = [3,4,5,6,7]

findIndex(item: aNumber, array: someArray)!
//if let newIndex = findIndex(item: aNumber, array: someArray) {
//    print(newIndex)
//}

//클래스 제약의 예시

class Person {}
class Student: Person {}
class Vehicle {}

let person = Person()
let student = Student()
let vehicle = Vehicle()

func personClass<T: Person>(array: [T]) {
    
}

personClass(array: [person,vehicle])
personClass(array: [student,student])


```

