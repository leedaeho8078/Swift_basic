#  Closure(클로저)
> 클로저는 일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것을 말한다. 클로저는 변수나 상수가 선언된 위치에서 `참조`를 `획득`하고 저장할 수있다. 이를 변수나 상수의 클로징(잠금)이라고 하며 클로저는 여기서 착안된 이름이다.
> 사실 **함수**는 **클로저**의 한 형태다.
> 클로저의 위치를 기준으로 크게 `기본 클로저` 표현과 `후행 클로저` 표현이 있다.

클로저는 세 가지 형태가 있다.
- 이름이 있으면서 어떤 값도 획득하지 않는 전역함수의 형태
- 이름이 있으면서 다른 함수 내부의 값을 획득할 수 있는 중첩된 함수의 형태
- 이름이 없고 주변 문맥에 따라 값을 획득 할 수 있는 축약 문법으로 작성한 형태

## 1. 기본 클로저
```Swift
// 기본 클로자 문법
{ (매개변수 목록) -> 반환타입 in
    실행 코드
}

```

## 2. 함수의 전달인자로서 클로저
```Swift
// sum 이라는 상수에 클로저를 할당
let sum: (Int,Int) -> Int = {( a: Int, b: Int) in
    return a + b
}

let sumResult: Int  = sum(2,3)
print(sumResult)  // 43


//함수의 전달인자로로서 클로저
// 덧셈 클로저
let add: (Int,Int) -> Int

add = { (a:Int, b:Int) in
    return a+b
}

// 뺼셈 클로저
let subtract: (Int,Int) -> Int

subtract = { (a:Int, b:Int) in
    return a - b
}

// 나눈셈
let divide: (Int, Int) -> Int

divide = { (a:Int, b:Int) in
    return a / b
}

func calculate(a:Int, b:Int, method:(Int,Int) -> Int) -> Int {
    return method(a,b)
    
}

var calculated: Int

calculated = calculate(a: 50, b: 10, method: add)
print(calculated) // 60

calculated = calculate(a: 50, b: 10, method: subtract)
print(calculated) // 40

calculated = calculate(a: 50, b: 10, method: divide)
print(calculated)  // 5

// 따로 클로저를 상수/변수에 넣어 전달하지 않고
// 함수를 호출할때 클로저를 작성하여 전달할 수도 있다.

calculated = calculate(a: 50, b: 10, method: {( left:Int, right:Int) -> Int in
    return left * right
    
})


```

## 3. 다양한 클로저 표현
- 함수의 매개변수 마지막으로 전달되는 클로저는 `후행클로저(trailing closure)`로 함수 밖에 구현할 수 있다.
- 컴파일러가 클로저의 타입을 유추할 수 있는 경우 **매개변수**,**반환 타입**을 생략할 수 있다.
- 반환 값이 있는 경우, 암시적으로 클로저의 맨 마지막 줄은 `return` 키워드를 생략하더라도 반환값 으로 취급한다.
- 전달인자의 이름이 굳이 필요없고, 컴파일러가 타입을 유추할 수 있는 경우 **축약된 전달인자 이름**($0,$1,$2..)을 사용할 수 있다.

### 3.1 후행 클로저
```Swift
func calculate(a:Int, b:Int, method:(Int,Int) -> Int) -> Int {
    return method(a,b)
    
}

var result: Int

// 클로저가 함수의 마지막 전달인자라면 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저 구현 가능
result = calculate(a: 50, b: 10){ (left:Int, right:Int) -> Int in
    return left + right

}
print(result) // 60
```
### 3.2 반환타입 생략
- calculate(a:b:method:) 함수의 method 매개변수는 Int 타입을 반환할 것이라는 사실을 컴파일러도 알기 때문에 굳이 클로저에서 반환타입을 명시해 주지 않아도 됩니다. 대신 in 키워드는 생략할 수 없습니다
```Swift
// 반환 타입 생략
result = calculate(a: 50, b: 10, method: { (left:Int, right:Int) in
    return left + right

})

// 후행클로저와 함꼐 사용할 수 있다.
result = calculate(a: 20, b: 10){ (left:Int, right:Int) in
    return left + right

}

print(result) //30

```
### 3.3 단축 인자이름
- 클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자이름을 활용할 수 있습니다. 단축 인자이름은 클로저의 매개변수의 순서대로 $0, $1, $2… 처럼 표현합니다.

```Swift
// 단축 인자 이름
result = calculate(a: 10, b: 20, method: {
        return $0 + $1
    
})

// 당연히 후행 클로저와 함꼐 사용할 수 있다
result = calculate(a: 20, b: 30) {
        return $0 + $1
}
```
### 3.4 암시적 반환 표현
- 클로저가 반환하는 값이 있다면 클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급합니다.
  
```Swift
// 암시적 반환 표현
result = calculate(a: 10, b: 20){
        $0 + $1
}
print(result) // 30

result = calculate(a: 20, b:20){ $0 + $1 }
print(result)  // 40

```

### 축약전과 후 비교
```Swift
// 축약 전과 후 비교

//축약 전
result = calculate(a: 10, b: 10, method: {(left:Int, right:Int) -> Int in
    return left + right
    
})

//축약 후
result = calculate(a: 10, b: 20){ $0 + $1 }
```
