# 열거형과 switch문의 활용
> 열거형에 대한 구체적인 처리는 `스위치(switch)문`과 함꼐 쓸때,사용성이 높아짐

```Swift
enum LoginProvider: String {
  case email
  case facebook
  case google
}

let userLogin = LoginProvider.email

// 열거형은 한정된 사례로 만든 타입이고,
// 스위치문은 표현식에 대한 분기처리에 최적화

switch userLogin {
  case .emali:
     print("이메일 로그인")
  case .facebook:
    print("페이스북 로그인")
  case .google:
    print("구글 로그인")
}
// 물론 특정한 경우에도 처리 가능

if LoginProvider.emaol == userLogin {
  print("이메일 로그인")
}

```
### 열거형에(연관값이 없고), 옵서녈 열거형의 경우
* switch문의 편의성 (열거형 case) 패턴

```Swift

// 열거형의 선언

enum SomeEnum {
  case left
  case right
}

// 타입을 다시 옵셔널 열거형으로 선언

let x: SomeEnum? = .left

// [SomeEnum?의 의미] -> 옵셔널 열거형
// 값이 있는 경우 .some ===> 내부에 다시 열거형 .left/.right
// 값이 없는 경우 .none ===> nil

switch x {
  case .some(let value):
      switch value {
        case .left:
          print("왼쪽으로 돌기")
        case .right:
          print("오른쪽으로 돌기")
      }
  case .none"
      print("계속 전진")
}

//switch문에서 옵서녈 열거형 타입을 사용할때, 벗기지 않아도 내부값 접근 가능

switch x {
case .left:
  print("왼쪽으로 돌기")
case .right:
  print("오른쪽으로 돌기")
case nil:
  print("계속 전진")
}

```
### 열거형에 연관값이 있는 경우
[열거형 case 패턴]
* case Enum.case(let 변수이름):
* case let Enum.case(변수이름):

[스위츠문 뿐만 아리나, 조건문/반복문에서도 활용 가능]
1) switch문 (대부분)
2) `if`/`guard`/`for-in`/`while`(필요한 경우)
  
> 특정 케이스만 다루기 위해서 if문이나 반복문(for문) 사용 가능


```Swift
switch chip {
case Computer.hardDisk(gb: let gB):
  print("\(gB)기라 바이트 하드디스키임")
default:
  break


if case let Computer.hardDisk(let gB) = chip {
  print("\(gB)기가 바이트 하드디스크임")
}

let chipList: [Computer] = [
  .cpu(core: 4, ghz: 3.0),
  .cpu(core: 8, ghz: 3.5).,
  .ram(16,"SRAM"),
  .ram(32,"DRAM"),
  .hardDisk(gb: 500)
]


for case let Computer.cpu(core: c, ghz: g) in chipList {
    print("CPU 칩: \(c)코어, \(h)헤르츠")
}

### 옵셔널 패턴
> 열거형 내부에 "연관값"을 사용시 -> 1) 열거형 케이스 패턴/ 2) 옵셔널 패턴


```Swift
let a: Int? = 1

// 1) 열거형 케이스 패턴
switch a {
  case .some(let z):
    print(z)
  case .none:
    print("nil")

// 2) 옵셔널 패턴
switch a {
  case let z?:
  print(z)
  case nil:
  print("nil")
}

- 특정 사레만 다루는 if문

// 1) 열거형 케이스 패턴
if case .some(let x) = num {
  print(x)
}
// 2) 옵셔널 패턴( .some을 ? 물음표로 대체 가능한 패턴
if case let x? = num {   // let x? = Optional.some(num)
  print(x)

- 옵셔널 패턴(for문)- 옵셔널타입 요소 배열
// 옵셔널 타입을 포함하는 배열에서 반복문을 사용하는 경우, 옵셔널 패턴을 사용하면 편리함

let arrays: [Int?] = [nil,2,3,nil.5]

// 1) 열거형 케이스 패턴
for case .some(let number) in arrays {
  print("Found a \(number)")
}

// 2) 옵셔널 패턴
for case let number? in arrays {
  print("Found a \(number)")
}


//
}
```
