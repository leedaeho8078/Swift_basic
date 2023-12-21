
# Switch문

> 표현식/변수를 (매칭시켜) 분기 처리 할때 사용하는 조건문
> 
> if 문보다 한정적인 상황에서 사용

  [스위치문의 특징]
1. 스위치문에서 케이스의 ,(콤마)는 또는 의미로 하나의 케이스에 여럭 매칭값을 넣을 수 있다.
2. switch문은 값의 가능한 모든 모든 경우의 수를 바드시 다루어야 한다.
3. 각 케이스는 문장이 최소 하나 이상 있어야 하며 만약 없다면 컴파일 에러 발생
4. 실행하지 않으려면 `break`사용 break를 반드시 입력해야한다.(if 문에서는 실행문을 입력안해도 괜찮지만, 스위치문에는 필수!)

```Swift

var choice: String = "안녕하세요"

// 조건을 부등식이 아닌 "==" 와만 비교
// 변수가 어떤값을 가지냐에 따라 실행문을 선택하고 진행

switch choice {
case "가위"
  print("가위 입니다")
case "바위":
  print("바위 입니다")
case "보":
  print("보 입니다")
default:
  break
}

switch choice {
case "가위":
  print("가위 입니다")
case "바위", "보":
  print("바위 또는 보입니다")
default:
  break
}
```
------
* fallthrough 키워드의 사용

```Swift

var num1 = 10

switch num1 {
case ..<10:
  print("1")             // 매칭된 값에 대한 고려없이 무조건 다음 블럭을 실행한다.
  fallthrough
case 10:
  print("2")
  fallthrough
default:
  print("3")              // 2,3 출력 
}


```

-----
* switch문의 범위 매칭 - 패턴 매칭 연산자와 관련

```Swift
 var num = 30

// 범위연산자, 패턴 매칭 연산자(참과 거짓의 결과가 나옴)
0...50 ~= num //30 true
51...100 ~= num // false

switch num {
case 0...50:
  print("숫자의 범위: 0 ~ 50")     // 숫자의 범위 0 ~ 50
case 51...100:
  print("숫자의 범위: 51~100")
default:
  print("그 외의 범위")

}


var temperature = 19

switch temperature {
case ..<0:                       
  print("영화 - 9도 미만")
case 0...18:
  print("0도 이상 무덥지 않은 날씨")
case 19...:
  print("여름 날씨")      // 여름 날씨
default: 
  break                   
}
```
------

# Switch문의 활용
* 스위치문과 벨류바인딩

> Note
>
> 바인딩 : *다른 새로운 변수/상수 식별자로 할당*

```Swift
var a = 7

let b = a  //바인딩을 한다. (다른 변수/상수의 새로운 식별자로 할당한다.

스위치문에서 바인딩

var num = 6

switch num {
case let a:    /let a = num
  print("숫자 \(a)")
default:
  break
}

```
------
* 스위치문과 where절 (스위치문에서 조건을 확인하는 방식)
> Note
>
> where키워드는 조건을 확인하는 키워드

```Swift
// 일단 다른 상수 값에 바인딩한(넣은) 후, 조건절(참/거짓 문장)을 통해 다시 한번 더 조건 확인
// (바인딩 된 상수는 케이스블럭 내부에서만 사용가능하고, 상수 바인딩은 주로 where절하고 같이 사용됨)

var num = 8

switch num {
case let x where x % 2 == 0:
  print("짝수 숫자: \(x) ")
case let x where x % 2 != 1:
  print("홀수 숫자: \(x) ")
default:
  break

// where절은 대부분 밸류바인딩 패턴과 함께 사용 (
}


```

