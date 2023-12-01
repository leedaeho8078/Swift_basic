#  Optional Chaining(옵셔널 체이닝)

> 옵셔널 체이닝은 옵셔널에 속해 있는 nil일지도 모르는 프로퍼티, 메서드, 서브스크립션 등을 가져오거나 호출할 떄 사용할 수 있는 일련의 과정이다
> 즉, 옵셔널을 반복 사용하여 옵셔널이 자전거 체인처럼 서로 꼬리를 물고 있는 모양이기 떄문에 옵셔널 체이닝이라고 부른다.

- 옵셔널 체이닝은 프로퍼티나 메서드 또는 서브스크립트를 호출하고 싶은 옵셔널 변수나 상수 뒤에 물음표(?)를 붙혀 표현한다. 옵셔널이 nil이 아니라면 정상적으로 호출, nil이라면 결괏값으로 nil을 반환한다.
  **결과적으로 nil이 반환된 가능성이 있으므로 옵셔널 체이닝의 반환된 값은 항상** `옵셔널`**이다.**

- 옵셔널 체이닝 결괏값은 옵셔널 값이기 때문에 옵셔널 바인딩과 결합할 수 있다.
  

```Swift
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

```

#  Early Exit(빠른 종료)
- 빠른 종료의 핵심 키워드는 `guard`입니다. guard 뒤에 따라붙는 코드의 실행 결과가 true일 때 코드가 계속 실행된다.
- if 구문과는 다르게 guard구문은 항상 else 구문이 뒤에 따라와아 한다, guard 뒤에 따라오는 Bool 값이 false라면 else의 블록 내부가 실행한다. 현재의 코드 블록을 종료할 때는 `return`, `break`. `continue`, `throw`등의 제어문 전환 명령을 사용한다. 또는 fatalError()와 같은 비반환 함수나 메서드를 호출 할수 있다.
```Swift
guard Bool 타입 값 else {
    예외사항 실행문
    제어문 전환 명령어
}
```
