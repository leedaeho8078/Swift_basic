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
