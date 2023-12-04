#  Control Flow(흐름 제어)

## 조건문
조건문에는 if 구문과 switch구문이 있다. 스위프트의 조건문에는 guard구문도 있다.

### 1. if 구문
> if 구문은 대표적인 조건문으로 if,else등의 키워드를 사용하여 구현 가능하다. 정수,실수 등 0ㅇ 아닌 모든 값을 참으로 취급하여 조건 값이 될 수 있었던 다른 언어와는 달리 스위프트의 **if 구문은 조건의 값이 꼭 `Bool타입`이어야 한다.**
- `else if`구문은 몇개가 이어져도 상관없으며 `else`블록은 없어도 상관없다.
- `else if` 및 `else`구문 없이 `if`만 단독응로 사용할 수도 있습니다.
- 소괄호를 생략할 수 있다.

```Swift
let first: Int = 5
let second: Int = 7

if first > second {
  print("first > second")
}else if first < second {
  print("second > first")
}else{
  print(" first == second")
}
// "second > first" 출력
```


### 2. Switch 구문
> 기본 문법이라 할 수 있는 switch 구문은 다른 언어와 비교했을 떄 많이 달라진 문법 중 하나다.
- 소괄호 생략 가능
- `break` 키워드 사용은 생략 가능 -> case 내부의 코드를 모두 실행하면 break 없이도 switch구문이 종료된다.
- 스위프트에서 switch 구문의 case를 연속 실행하려면 `fallthrough` 키워드를 사용해야 한다.
- case에 들어갈 비교 값은 입력 값과 데이터 타입이 같아야 한다.
- 비교될 값이 명확히 한정적인 값이 아닐 떄는 `default`를 꼭 작성해줘야한다.
- **열겨형**과 같이 한정된 범위의 값을 입력 값으로 받게 될 때 값에 대응하는 각 case를 구현한다면 default를 구현하지 않아도 된다.

```Swift
  Switch 입력 값 {
  case 비교 값 1:
    실핼 구문
  case 비교 값 2:
    실행 구문
  // 이번 case를 마치고 switch 구문을 탈출하지 않습니다. 아래 case로 넘어갑니다.
    fallthrough
  case 비교 값 3, 비교 값 4, 비교 값5:
    실행 구문
    break  // break 키워드를 통한 종료는 선택 사항이다.
  default: // 한정된 범위가 명확지 않다면 default는 필수입니다.
    실행 구문

// switch 구문 기본 구현
let integerValue: Int = 5

switch integerValue {
case 0:
    print("value == zero")
case 1...10:
    print("value == 1~10")
    fallthrough
case Int.min..< 0, 101..< Int.max:
    print("value < 0 or value > 100")
default:
    print("10 < value <= 100"
}


// value == 1~10
// value < 0 or value > 100



// 열거형을 입력 값으로 받는 switch 구문
enum School {
case primary, elementary, middle, high, college, university, graduate
}

let 최종학력: School = .university

switch 최종학력 {
case .primary:
  print("최종학력은 유치원입니다.")
case .elementary 
  print("최종학력은 초등학교입니다")
case .middle:
  print("최종학력은 중학교입니다.")
case .high:
  print("최종학력은 고등학교입니다.")
caes .college, .university:
  print("최종학력은 대학교입니다.")
case .gradutate
  print("최종학력은 대학원입니다.")
}

// 최종학력은 대학교입니다.
```

## 반복문

### for~in 구문
> 같거나 비슷한 명령을 반복 실행할 때는 반복문만큼 중요한것이 없다. 특히나 배열과 같은 시퀀스, 순서가 있는 데이터는 반복문으로 더욱 편리하게 처리 할 수 있다.
- 조건에 괄호를 생략 가능
- 또한 `do-while`구문은 스위프트에서 `repeat-while`구문으로 구현
- 함수형 프로그래밍 패러다임을 이해하면 for-in 구문보다 `map`,`filter`,`flatMap`등을 더많이 사용하게 된다
```Swift
for 임시 상수 in 시퀀스 아이템 {
  실행 코드


// for~in 반복 구문의 활용
var musicList = ["좋은 날", "잔소리", "Dynamite", "Omg"]

for number in 0...3 {
    print("\(number+1)위: \(musicList[number])")
}


// for-in 반복 구문의 활용
for i in 0...2 {
    print(i)
}

let helloSwift: String = "hello Swift!"

for char in helloSwift {
    print(char)
}


let 주소: [String: String] = ["특별시":"서울시", "구":"송파구" ,"동":"가락동"]

for (key,value) in 주소 {
    print("\(key),\(value)")
}

```



