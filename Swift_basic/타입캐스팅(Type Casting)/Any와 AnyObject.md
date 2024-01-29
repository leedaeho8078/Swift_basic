
# Any와 AnyObject를 위한 타입 캐스팅
> 불 특정한 타입을 다룰 수 있는(범용적인 타입)


### Any 타입
* 스위프트의 기본타입,`클래스`,`구조체`,`열거형`,`함수` 어떤 타입의 인스턴스도 표현할수 있는 타입(옵셔널타입도 포함)
*  단점 ===> 저장된 타입의 메모리 구조를 알 수없기 때문에, 항상 타입캐스팅해서 사용해야함 ⭐️
```swift
var some: Any = "swift"
// some = 123
// some = 1.2

(some as! String).count // 5

class Person {
    var name = "이름"
    var age = 10
}

class Superman {
    var name = "슈퍼맨"
    var weight = 100
}

let array: [Any] = ["안녕", 1, 1.0, Person(), Superman(), {(name:String) -> String in return name}]

(array[0] as! String).count // 2

```

### AnyObject 타입    
* `어떤 클래스 타입의 인스턴스`도 표현할 수 있는 타입 (정확하게는 `AnyObject 프로토콜임`)
* typealias AnyClass = AnyObject.Type
    
```swift
class Person {
    var name = "이름"
    var age = 10
}

class Superman {
    var name = "슈퍼맨"
    var weight = 100
}

let objArray: [AnyObject] = [Person(),Superman(),NSString()]
(objArray[1] as! Superman).name //슈퍼맨 
(objArray[0] as! Person).name   // 이름
```
