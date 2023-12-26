# guard문
- 불만족하는 조건을 사전에 걸러내는 조건문
> if문의 단점 - 여러개의 조건이 있을때 코드의 가독성이 문제됨 ➞ guard문으로 단점 극복

guard문
 - `else`문을 먼저 배치 - 먼저 조건을 판별하여 `조기 종료(early exit)`
 - 조건을 만족하는 경우 코드가 다음 줄로 넘어가서 계속 실행
 - 가드문에서 선언된 `변수`를 아래문장에서 사용 가능 (동일한 스코프로 취급) (guard let 바인딩 관련)

사용 이유 :
 - 가독성을 높임/if문의 불편함을 해소

```Swift

// 반드시 코드를 종료해야하는 조기 종료의 조건이 필요하므로, 로컬스코프(함수/반복문) 내에서만 사용 가능

func check(words: String) -> Bool {
    
    guard words.count >= 5 else {
        
        print("5글자 미만입니다.")
        
        return false                             // 종료 조건 - 함수 내에서는 return / throw
    }
    
    print("\(words.count)글자입니다.")    
    
    return true
}

check(words: "안녕하세요")    //다섯글자입니다.

```

# @discardableResult 
 @어트리뷰트 키워드
   - 선언에 추가정보 제공
   - 타입에 추가정보 제공

```Swift

//@discardableResult
func sayHelloString() -> String {
    print("하이")
    return "안녕하세요"
}


_ = sayHelloString()     // 실제 프로젝트에서 경고창 표시 -> 원래이렇게

@discardableResult 이거를 사용하면 -> sayHelloString() 사용 가능




```
