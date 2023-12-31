# 메서드(Method)

1. 인스턴스 메서드
2. 타입 메서드
3. 서브스크립트


### 1.인스턴스 메서드
* 메서드이기 떄문에 인스턴스에 `메모리 공간`이 할당되어 있지 않음
* 메서드 접근 시, 인스턴스 이름으로 접근 해야함 -> `instance.메서드()`
* 메서드 실행 시, 스택프레임을 만들고 인스턴스의 데이터를 사용-> 메서드 종료시 스텍프레임 사라짐
* 값 타입(구조체/열거형)의 인스턴스 메서드에서 인스턴스 `고유의 저장 속성`을 수정할 수 없음
  -> 수정하려면 `mutating` 키워드를 인스턴스 메서드 앞에 붙여야 한다.
* 함수에서의 `오보로딩`과 동일하게, `클래스`, `구조체`, `열거형`의 메서드에서도 오보로딩을 지원
  

```Swift

class/Struct Dog {
  var name: String
  var weight: Double

  init(name:String, weight: Double) {
    self.name = name
    self.weight = weight
  }

  func sit() {                          //인스턴스 메서드
    priint("\(name) 앉았습니다.")
  }  

  func layDown() {                      //인스턴스 메서드
    print("(name) 누웠습니다.")
  }

  (mutating) func changeName(name: String) {       // 인스턴스 메서드 
    self.name = name                               // 구조체면 mutating 키워드 붙여줘야 한다.
  }

}
```

### 2.타입 메서드
* 메서드이기 떄문에 타입에 `데이터 메모리 공간이 할당되어 있지 않음`(함수 주소를 저장하는 메모리 공간은 잇음)
* 인스턴스에 속한 속성이 아니고, 타입자체에 속한 속성이기에 `내/외부`에서 `Type.method()`로 접근해야 한다.
  -> 메서드 실행 시, 스택프래임을 만들고 타입 데이터를 사용 -> 메서   드 종료시 스택프레임 사라짐
* 타입에 해당하는 `보편적인 동작`의 경우
* `static` 또는 `class` 키워드 사용(static 상속시 재정의 불가/ class 상속시 재정의 가능 )    
* 사용 예시 : Int.random(in: 1..10), Double.random(in: 1.0...10.0)    


```Swift
class Dog {
  static var species = "Dog"


  static func SaySpec() {
    print("\((Dog.)species) 입니다.")
  }

}
```

### 3. 서브스크립트
> 대괄호는 사실, 특별한 형태의 메서드(기능) 호출 역할임 -> 메서드를 직접 구현도 가능



배열: array[0] -> 배열에서 대괄호 앞에 인덱스 값을 넣으면 해당 인덱스에 해당하는 배열의 요소에 접근가능       
딕셔너리 : dictionary["A"] -> 딕셔너리에서는 대괄호 안에 키 값을 넣으면 해당 키값에 해당하는 딕셔너리의 벨류에 접근 가능

1) (인스턴스) 서브스크립트
* 함수의 구현이 특별한 키워드인 subscript로 명명됨
* 메서드이기 떄문에 인스턴스에 메모리 공간이 할당되어 있지 않음
* 메서드 접근 시, 인스턴스 이름으로 접근 해야함 -> `instance[파라미터]` **특별한 형태**
* 파라미터 2개이상도 구현가능하긴 함(아규먼트 레이블을 따로 사용 안함)

(계산 속성과 형태는 유사 - getter/setter)
* get블록만 선언하면 `읽기전용(read-only) 계산 속성`이 됨`(필수 구형)`
* set블록은 `선택적으로 구현`할 수 있음
* set블록에서 기본 파라미터 newValue가 제공됨(직접 파라미터 이름 설정도 가능

2) 타입 서브스크립트
 * 서브스크립트 메서드 앞에 `static` 또는 `class(재정의 가능) 키워드`만 붙이면 됨

```Swift
class SomeClass {
  var datas = ["iOS", "Swift", "UIkit", "Hello"]

  subscript(index: Int) -> String {
      get {
        return datas[index]
      }
      set {
      datas[index] = newValue
      }

  }

}
var data = SomeClass()
data.datas[0] // iOS
data[0] // get iOS 서브크립트로 인하여
data[0] = "Android" // set


eunm Planet: Int {
  case venus = 1, mars, stars, ...

  subscript(n: Int) -> Planet {
    return Planet(rawValue: n)!
  }  
}

var mars = Planet.mars // mars
var mars = Planet[2] // mars
print(mars) //mars
```






