#  Higher_order_function(고차 함수)

> **고차함수(Higher_order_function)은** ‘다른 함수를 전달인자로 받거나 함수실행의 결과를 함수로 반환하는 함수’를 뜻한다.
> 스위프트는 함수를 일급 객체로 취급한다.

고차 함수 종류
- `map`
- `filter`
- `reduce`

### map
> `map` 함수는 기존 컨테이너의 값은 변경되지 않고 새로운 컨테이너가 생성되어 반환된다. 그래서 **맵은 기존 데이터를 변형**하는데 많이 사용한다.
```SWift
// for-in 구문과 맵 메서드의 사용 비교
let numbers: [Int] = [0,1,2,3,4]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

//for 구문 사용
for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers)    // [0,2,4,6,8]
print(strings)           // ["0", "1", "2", "3", "4"]
            
// map 메서드 사용
// 매개 변수 및 반환 타입 생략
// 반환 키워드 생략
// 후행 클로저
doubledNumbers = numbers.map { $0 * 2 }
strings = numbers.map { String($0) }

```

### filter
> `filter` 함수는 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출하는 고차 함수이다.
> 맵처럼 기존 콘텐츠를 변형하는 것이 아니라, 트정 조건에 맞게 걸러낸다
> filter함수의 매개변수로 전달되는 함수의 반환 타입은 **Bool**이다.

```Swift

let numbers: [Int] = [0,1,2,3,4]

let evenNumbers: [Int] = numbers.filter { (number:Int ) -> Bool in
    return number % 2 == 0
    
}


print(evenNumbers) // [0,2,4]

let oddNumbers: [Int] = numbers.filter { $0 % 2 == 1}
print(oddNumbers)  // [1,3,5]

```
### reduce
> `reduce` 기능은 사실 결합이라고 불러야 마땅한 기능이다. 리듀스는 컨테이너 내부의 콘텐츠를 하나로 합하는 기능을 실행하는 고차함수다.
```Swift

// 초깃값이 0이고 정수 배열의 모든 값을 더한다.
var sum: [Int] = numbers.reduce(0, { (result: Int, next: Int) -> Int in
        return result + next
})

var sum: [Int] = numbers.reduce(0){
    return $0 + $1
}

```
