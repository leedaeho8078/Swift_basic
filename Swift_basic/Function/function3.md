# 함수 사용시 주의 점
* 함수의 파라미터에 대한 정확한 이해
---
```Swift

// 함수의 파라미터

func someAdd(a: Int) -> Int {            // let a: Int   (값의 변경이 불가능)
    //a = a + 1 사용불가
    a = a + 1 
    return a
}

someAdd(a: 5)

```
----

* 함수 내의 변수의 Scope(스코프)
```Swift

func sumOfNum(a: Int) -
    var sum = 0
    sum += a
    return sum
}
//sum  스코프밖에선 사용 불가능
let result = sumOfNum(a: 3)
print(result)
```

* return 키워드의 정확한 이해
    * 리턴타입이 있는 함수의 경우(아웃풋이 있는 경우): 리턴 키워드 다음의 표현식을 평가한 다음에 그 결과를 리턴하면서 함수를 벗어남
    * 리턴타입이 없는 함수의 경우(아웃풋이 없는 경우): 함수의 실행을 중지하고 함수를 벗어남

 ```Swift

// 리턴 타입이 있는 경우

func addFunction(num1: Int, num2: Int) -> Int {
    var result = num1 + num2
    return result
}


addFunction(num1: 3, num2: 4)


// 리턴 타입이 있는 경우

func valuationFunction(num: Int) -> Int {
    
    if num >= 5 {
        return num
    }

    return 0
}

// 리턴 타입이 없는 경우

func numberPrint(n num: Int) {
    
    if num >= 5 {
        print("숫자가 5이상입니다.")
        return                     //함수를 중료
    }
    
    print("숫자가 5미만입니다.")
}

```
# 함수 표기법, 함수의 타입 표기
```Swift

// 함수의 표기법(함수를 지칭시)

// 1) 파라미터가 없는 경우, ()를 삭제

var some = doSomething //
some()



// 2) 아규먼트 레이블이 있는 경우, 아규먼트 레이블까지를 함수의 이름으로 봄

numberPrint(n:)        //  "numberPrint n 함수이다."



// 3) 파라미터가 여러개인 경우, 콤마없이 아규먼트이름과 콜론을 표기

chooseStepFunction(backward:value:)



// 4) 아규먼트 레이블이 생략된 경우, 아래와 같이 표기

addPrintFunction(_:_:)

```
