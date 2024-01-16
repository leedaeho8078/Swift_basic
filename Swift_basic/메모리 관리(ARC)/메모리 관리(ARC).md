# 메모리 관리(ARC)
메모리 구조는 -> 코드 + 데이터 + 힙 + 스택 으로 구성

`코드`: 명렁어/프로그램 -> 프로그램의 모든 코드     
`데이터`: 전역변수/타입 변수 -> 공통으로 공유하기 위한 데이터(**앱이 실행되는 동안 불변**)     
`힙`: 동적할당(일반적으로 오랫동안 긴시간 동안 저장) -> 개발자가 잘 관리해야 한다.         
`스택`: 크기가 작고 빠르게 사용하기 위한 데이터 -> **알아서 자동 관리됨**         

* Heap(힙) 영역에 할당되는 데이터는 관리를 해야지만, 메모리에서 헤제가 됨
* 할당이 해제되지 않으면 `메모리 누수(Memory Leak) 현상`이 발생

java : GC       
Objective: MRC, ARC      
Swift: ARC

 ARC(Automatic Reference Counting): 스위프트의 메모리 관리 모델     
 * RC(참조 숫자)를 세는 것을 통해 `메모리 관리`/컴파일시에 `메모리 헤제시점`을 결정

```Swift

class Dog {
  var name: String
  var weight: Double

  init(name: String, weight: Double) {
      self.name = name
      self.weight = weight
  }

  deinit() {
      print("\(name)이 해제되었습니다.")

  }

}
var dog1: Dog? = Dog(name: "이대호", weight: 8.0)   // RC == 1
var dog2: Dog? = Dog(name: "이영호", weight: 7.0)   // RC == 2

dog1 = nil // RC == 0  // print("이대호가 해제되었습니다.")
dog2 = nil // RC == 0  // print("이영호가 해제되었습니다.")
```

```
[ARC모델의 기반: 소유정책과 참조카운팅]
```
1. 소유정책: 인스턴스는 하나이상의 소유자가 있는 경우 메모리에서 유지됨(소유자가 없으면, 메모리에서 제거)
2. 참조 카운팅: 인스턴스(나를 가르키는) 소유자수를 카운팅     
-> 인스턴스를 가르키고 있는 참조 카운팅이 1이상이면 메모리에서 유지되고, 0이면 메모리에서 제거됨



### ARC    
```Swift

var dog1: Dog?
var dog2: Dog?
var dog3: Dog?

dog1 = Dog(name: "초코", weight: 12.0) // RC -> 1
dog2 = dog1                           // RC -> 2
dog3 = dog1                           // RC -> 3

dog3 = nil   // RC- 1  RC == 2
dog2 = nil   // RC- 1  RC == 1
dog1 = nil   // RC- 1  RC == 0 // 초코가 메모리에서 해제되었습니다.

```

### 강한 참조 사이클과 메모리 누수  
* 객체(클래스의 인스턴스)가 서로를 참조하는 `강한 참조 사이클로` 인해    
* 변수의 참조에 nil을 할당해도 메모리 해제가 되지않는 -> `메모리 누수의 상황`이 발생

```
그래서 과연 강한 참조를 해결할수 있는 방안은?
```
1. weak Reference(약한 참조)
2. unowned Reference(비소유 참조)

```Swift

class Dog {
    var name: String
    weak var owner: Person?  // 강한 참조를 해결하기 위해 weak사용
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name)이 해제되었습니다.")
    }
}

class Person {
    var name: String
    weak var pet: Dog?  // 강한 참조를 해결하기 위해 weak사용
    
    init(name: String) {
        self.name = name
        
    }
    
    deinit {
        print("\(name)이 해제되었습니다.")
    }
    
}

var dog: Dog? = Dog(name: "초코")
var gildong: Person? = Person(name: "이대호")

dog?.owner = gildong
gildong?.pet = dog

//dog?.owner = nil
//gildong?.pet = nil

dog = nil
gildong = nil

```

Weak 키워드 및 Unowned 키워드
* weak 키워드 : `weak var pet: Dog?`
* Unowned 키워드 : `Unowned var pet: Dog?`(5.3버전 이후에 옵셔널 선언도 가능)
* 가르키틑 인스턴스의 `RC의 숫자`를 올라가지 않게 함(인스턴스 사이의 강한 참조를 제거)


strong(기본 변수 선언시): `let/var`, `optioanl/Non-optional` 가능       
weak: `var`, `optional`만 가능      
Unowned: `let/var`, `optioanl/Non-optional 가능



