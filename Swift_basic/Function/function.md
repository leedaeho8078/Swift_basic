
# Part 7. Function(함수)

* `특정한 작업(기능)`을 수행하는 코드의 묶음에 (식별할 수 있는 특정한) 이름을 부여하여 사용하는 것

-------
* 함수를 왜 사용할까? (함수 사용의 이유)
  * 반복되는 동작을 단순화해서 재사용 가능
  * 코드를 논리적 단위로 구분 가능
  * 코드 길이가 긴 것을 단순화해서 사용 가능
  * 미리 함수를 잘 만들어 놓으면, 개발자는 사용만 하면 됨(내부적 내용을 몰라도 사용 가능)  


  
> Note
>
> 함수는 항상 2단계로 실행


### 함수의 형태
1. 함수가 인풋(input)이 있는 경우

```Swift

func saySomething(name: String) {  //name은 파라미터이며 내부에서 사용가능
    print("안녕하세요 \(name) 님")
}



// 함수 실행문(call)
saySomething(name: "스티브")  //네임에 스티브를 전달
                            // 안녕하세요 스티브님

```
-----
2. 함수가 아웃풋(output)이 있는 경우
```Swift
// 아웃풋이 있는 경우에는 return으로 전달

func sayHelloString() -> String {
    return "안녕하세요"
}



sayHelloString()
print(sayHelloString() + " 잡스 님")   // 안녕하세요 잡스 님


// 함수를 호출하는 것도 표현식이 될 수 있다.(리턴형이 있는 경우)
// (표현식의 결과는 함수가 리턴하는 값)

var name1 = sayHelloString()  //안녕하세요

```
----

3. 인풋과 아웃풋이 모두 있는 경우
```Swift


// 함수 정의문
func plusFuntion(a: Int, b: Int) -> Int {
    let c = a + b
    return c       // 아웃풋이 있는 경우, 리턴키워드를 사용해야함
}



// 함수 실행문(call)
plusFuntion(a: 3, b: 4)


print(plusFuntion(a: 5, b: 6))  // 11 출력
  
```
4. Void 타입의 이해 (아웃풋이 없는 경우)
```Swift

func sayhello1() {
    print("Hello, Swift!")
}

func sayhello2() -> Void {
    print("Hello, Swift!")
}


func sayhello3() -> () {
    print("Hello, Swift!")
}
sayhello1()   // Hello, Swift!"
sayhello2()   // Hello, Swift!"
sayhello3()   // Hello, Swift!"

```

