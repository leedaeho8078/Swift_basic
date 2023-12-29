# Part 9 - 컬렉션(Collection)

> 컬렉션이란? 여러개의 데이터를 한꺼번에 다루는 바구니 타입

1. Array(배열) : 데이터를 `순서대로` 저장하는 컬렉션   -> 데이터의 저장,표시
2. Dictionary(딕셔너리) : 데이터를 `키`와 `값`으로 하나의 쌍으로 만들어 관리하는 `순서가 없는 컬렉션`   -> 데이터가 서버에 저장되어 있는 데이터를 받아오는 형태
3. Set(집합) : 수학에서의 집합과 비슷한 연산을 제공하는, `순서가 없는 컬렉션`

### Array(배열)
> 데이터를 순서대로 저장하는 컬렉션
* 배열
  대괄호로 묶음.각각의 데이터는 `요소`라고 지칭
  예시) let numsArray: Array<Int> = [1,2,3,4,5]

* 규칙
  - [] 대괄호로 묶는다. 배열의 인덱스의 시작은 0부터 (모든 프로그래밍 언어 공통 사항)
  - 1개의 배열에는 동일한 타입의 데이터만 담을 수 있다.
  - (순서가 있기 때문에) 값은 중복 가능

```Swift
  
// 빈 배열의 생성

let emptyArray1: [Int] = []     // 빈배열은 타입을 선언해줘야 한다.
let emptyArray2: [Int] = Array<Int>()
let emptyArray3 = [Int]()

// 배열의 기본 기능

var numsArray:[Int] = [1, 2, 3, 4, 5]

numsArray.count
numsArray.isEmpty   // 불린타입으로 전달

numsArray.contains(1)  //파라미터로 값을 전달
numsArray.contains(8)

numsArray.randomElement()

numsArray.swapAt(0, 1)


// 배열의 각 요소(element)에 대한 접근

var stringArray = ["Apple", "Swift", "iOS", "Hello", "eddsF"  ,"iOS"]

stringArray.first // "Apple"
stringArray.last  // "iOS"

print(stringArray.first)  // Optional<Apple>
print(stringArray.last)   // Optional<iOS>

stringArray.startIndex // 0
stringArray.endIndex // 6 그래서 항상 마지막 요소에 접근하려면  endIndex - 1

print(stringArray[stringArray.startIndex]) // "Apple"
print(stringArray[stringArray.endIndex]) // "iOS"

stringArray.index(1, offsetBy: 2) //3 1부터 2건너뛰어서


stringArray.firstIndex(of: "iOS")     // 앞에서 부터 찾았을때 "iOS"는 배열의 (앞에서부터) 몇번째 2
stringArray.lastIndex(of: "iOS")     // 뒤에서 부터 찾았을때 "iOS"는 배열의 (앞에서부터) 몇번째  5

// 삽입하기(insert)

var alphabet = ["A", "B", "C", "D", "E", "F", "G"]

alphabet.append("H") // 마지막 요소에 "H"추가
alphabet.append(contentsOf: ["I","J","K"] // 마지막요소에서 컬렌션 추가

// 교체하기(replace)

// 요소 교체하기
alphabet[0] = "a"

//범위를 교체하기
alphabet[0...2] = ["x","y","z"]

//원하는 범위 삭제
alphabet[0...3] = []

//교체하기 함수 문법
alphabet.replaceSubrange(0...2, with: ["a","b","c"])


// 추가하기(append)
var alphabet = ["A", "B", "C", "D", "E", "F", "G"]

alphabet.append("H") // 맨 마지막에 추가 alphabet += ["H"]
alphabet.append(contentsOf:["H","J"])


// 삭제(제거)하기 (remove)

//alphabet[0...2] = []   //빈배열 전달하면 해당 범위가 삭제

// 요소 한개 삭제
alphabet.remove(at: 2)  // 삭제하고, 삭제된 요소 리턴

// 요소 범위 삭제
alphabet.removeSubrange(0...2) // 0~2 삭제

alphabet.removeFirst()   // 맨 앞에 요소 삭제하고 삭제된 요소 리턴 (리턴형 String)
alphabet.removeFirst(2)   // 앞의 두개의 요소 삭제 ===> 리턴은 안함

alphabet.removeLast()   // 맨 뒤에 요소 삭제하고 삭제된 요소 리턴 (리턴형 String)
alphabet.removeLast(2) // 뒤에 두개 제거


// 배열의 요소 모두 삭제(제거)
alphabet.removeAll()

// 배열의 기타 기능

var nums = [1, 2, 3, 1, 4, 5, 2, 6, 7, 5, 0]

// 1) 배열을 직접정렬하는 메서드  sort  (동사)
// 2) 정렬된 새로운 배열을 리턴  sorted (동사ing/동사ed)

nums.sort()   // 배열을 직접 정렬(오름차순)
nums.sorted()

nums.sorted().reversed()
// 새로운 배열은 생성하지 않고, 배열의 메모리는 공유하면서 역순으로 열거할 수 있는 형식을 리턴

// 배열을 랜덤으로 섞기

//nums.shuffle()    // 요소의 순서 랜덤으로 직접 바꾸기
//nums.shuffled()

// enumerated() ===> 열거된 것들을 Named 튜플 형태로 한개씩 전달

// 데이터 바구니이기 때문에,
// 실제 번호표(index)까지 붙여서, 차례대로 하나씩 꺼내서 사용하는 경우가 많을 수 있어서 아래처럼 활용 가능

nums = [10, 11, 12, 13, 14]


// (offset: 0, element: 10)

for tuple in nums.enumerated() {
//    print(tuple)
    print("\(tuple.0) - \(tuple.1)")
//    print("\(tuple.0) - \(tuple.1)")
}

for (index, word) in nums.enumerated().reversed() {      // 바로 뽑아내기
    print("\(index) - \(word)")
}

 ```
