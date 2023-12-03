#  Collection type(컬렉션 형)

> 컬렉션 타입에는 `배열`, `딕셔너리`, `세트`등이 있다.


### 배열
배열과 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 **컬렉션 타입**이다
배열 타입을 선언해줄 방법은 다양하다, `let` 키워드를 사용해 상수로 선언하면 변경할 수 없는 배열이 되고, `var` 키워드를 사용해 변수로 선언해주면 변경 가능한 배열이 된다.
실제로 배열을 사용할 때는 Array라는 키워드와 타입 이름의 조합으로 사용한다.

- 배열은 각 요소에 인덱스를 통해 접근할 수 있다. 인덱스는 0부터 시작한다.
- 잘못된 인덱스로 접근하려고 하면 익셉션 오류가 발생한다.


```Swift
//대괄호를 사용하여 배열임을 표현한다

var names: Array<String> = Array<String>()
names = ["daeho", "chulsoo", "younghee", "youngho"]

// 위와 같은 의미
//var names: Array<String> = ["daeho", "chulsoo", "younghee", "youngho"]

print(names.count)      // 4
print(names.isEmpty)    // false

names.insert("elsa", at: 3)
names.append("juoo")
names.append(contentsOf: ["jee","hee"])

print(names)
//names.remove(at: 0)
names.removeFirst()
names.removeLast()
//names.removeAll()
print(names)
```

### 딕셔너리
딕셔너리는 요소들이 **순서 없이 키와 쌍**으로 구성되는 컬렉션 타입입니다. 딕셔너리에 저장되는 값은 항상 키와 쌍을 이루게 된다
단, 하나의 딕셔너리 안의 키는 같은 이름을 중복해서 사용할 수 없다. 즉 딕셔너에서 키는 값을 대변하는 유일한 식별자가 되는 것이다.

```Swift
// 딕셔너리 선언과 생성
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
var numberForName: [String: Int] = [String: Int]()
var numberForName: [String: Int] = [:]

var numberForName: [String: Int] = ["daeho": 100, "youngho": 200, "hee": 300]

print(numberForName.isEmpty)
print(numberForName.count)

print(numberForName["daeho"])           //Optional(100)
if let name = numberForName["daeho"] {
    print(name)                         //100
}
print(numberForName["youngho"])
print(numberForName["heeee"]) //nil 반환

print(numberForName)
print(numberForName.removeValue(forKey: "daeho"))
print(numberForName)
print(numberForName.removeValue(forKey: "daeho")) // daeho가 이미 삭제되었으므로 nil
```

### 세트
세트는 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션 타입이다.
세트 내의 값은 모두 유일한 값이며, 즉 중복된 값이 존재하지 않는다. 그래서 세트는 **보통 순서가 중요하지 않거나 각요소가 유일한 값이어야 하는 경우** 사용한다.
배열과 달리 줄여서 표현할 수 있는 축약형이 없다. (예를 들어 Array<Int>를 [Int]처럼)
