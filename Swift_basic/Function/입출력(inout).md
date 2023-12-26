# inout 파라미터

> 함수내의 파라미터는 기본적으로 `값타입`이고(복사되서 전달) `임시 상수`이기 때문에 변경 불가 원칙

```Swift

var num1 = 123    // 전역 변수
var num2 = 456    // 전역 변수

func swap(a:Int, b:Int) {
    var c = a
      a = b   
      b = c    

}

swap(num1,num2)


```
---
* 함수 내에서 변수를 직접 수정하도록 돕는 inout키워드 **(참조로 전달 : 메모리에 주소를 전달하는거다.)**

> Note
>
> inout 키워드(선언시),   & 사용(실행시)

- inout파라미터 사용시 주의점
  - 상수(let)나, 리터럴 전달하는 것 불가능
  - 파라미터의 기본값 선언을 허용하지 않음
  - 가변파라미터(여러개의 파라미터)로 선언하는 것 불가능

```Swift
num1 = 123
num2 = 456


func swapNumbers(a: inout Int, b: inout Int) {
    var temp = a
    a = b // a -> num1이전달, b -> num2가 전달
    b = temp
}
//상수 let a가아니고





// 함수 실행시에는 앰퍼샌드를 꼭 붙여야함
// &메모리 주소
swapNumbers(a: &num1, b: &num2)


print(num1)
print(num2)


```
