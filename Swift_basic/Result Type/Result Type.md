# Result Type
<img width="1039" alt="image" src="https://github.com/leedaeho8078/Swift_basic/assets/83402908/d5c77db0-ecec-46ca-8e9a-a3609939ec2a">
Result 타입은 **연관값이 있는 제네릭 열거형**으로 구현되어있다.

`Success`와 `Error`프로토콜을 채택한 `Failure`의 형태인 `Result Type`
```swift
@frozen enum Result<Success, Failure> where Failure : Error
```

에러가 발생하는 경우, 에러를 외부로 던지는 것이 아니라     
리턴 타입 자체를 Result Type(2가지를 다 담을 수 있는)으로 구현해서    
함수 실행의 성공과 실패의 정보를 함꼐 담아서 리턴    

### 기존의 에러치리 과정(3단계)
1. 에러정의    
```swift
// 에러 정의 (어떤 에러가 발생할지 경우를 미리 정의)

enum HeightError: Error {    //에러 프로토콜 채택 (약속)
    case maxHeight
    case minHeight
}
```

2. 에러가 발생할 수 있는 함수에 대한 정의
```swift
func checkingHeight(height: Int) throws -> Bool {    // (에러를 던잘수 있는 함수 타입이다)
    
    if height > 190 {
        throw HeightError.maxHeight
    } else if height < 130 {
        throw HeightError.minHeight
    } else {
        if height >= 160 {
            return true
        } else {
            return false
        }
    }
}

```
3. 에러가 발생할 수 있는 함수의 처리(함수의 실행)
```swift

do {
    let _ = try checkingHeight(height: 200)
    print("놀이기구 타는 것 가능")
} catch {
    print("놀이기구 타는 것 불가능")
}

```

### Result타입을 활용한 에러의 처리
- 에러는 동일하게 정의되어 있다고 가정
- Result타입에는 성공/실패했을 경우에 대한 정보가 다 들어있다.
```swift
func checkingHeight(height: Int) -> Result<Bool, HeightError> {    
    
    if height > 190 {
        return Result.failure(HeightError.maxHeight)
    } else if height < 130 {
        return Result.failure(HeightError.minHeight)
    } else {
        if height >= 160 {
            return Result.success(true)
        } else {
            return Result.success(false)
        }
    }
}

// 리턴값을 받아서
let result = resultTypeCheckingHeight(height: 200)
print(result) 

// 처리
switch result {
case .success(let data):
    print("결과값은 \(data)입니다.")
case .failure(let error):
    print(error)
}

```

### Result타입의 다양한 활용     
- Result타입에는 여러메서드가 존재
- get()메서드는 결과값을 throwing함수처럼 변환가능한 메서드 (Success밸류를 리턴)    
```swift
do {
    let data = try result.get()
    print("결과값은 \(data)입니다.")
} catch {
    print(error)
}
``` 


Result타입을 왜 사용할까?
 - 성공/실패의 경우를 깔끔하게 처리가 가능한 타입
 - 기존의 에러처리 패턴을 완전히 대체하려는 목적이 아니라
   개발자에게 에러 처리에 대한 다양한 처리 방법에 대한 옵션을 제공
