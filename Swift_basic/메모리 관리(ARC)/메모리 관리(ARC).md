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
