# 집합(set)
수학에서이ㅡ 집합과 비슷한 연산을 제공하는, 순서가 없는 컬렉션

* 셋/세트
  * 대괄호로 묶음.(배열과 구분이 안되기 떄문에)반드시 생성시 타입 선언을 해야함 -> let set: Set<Int> = [1,2,4,5]
* 규칙
  * 생성시 타입 선언을 해야함
  * 요소값을 중복으로 넣어도, 집합의 의미상 요소 중복 저장안됨(각 요소는 유일한 값 - Hashable)
  * `합집합(union)`,`차집합(subtracting)`,`교집합(intersection)`,`대칭차집합(symmetricDifference)` 등 사용
* Set는 `append`함수를 제공하지 않음
* Set을 정렬하면, 배열로 리턴함 (정렬은 순서가 필요하기 때문)
  

```Swift

// 단축문법
let set1: Set = [1, 2, 3]

// 정식문법
let set2: Set<Int> = [1, 2, 3]
let set3: Set<String> = ["a","B","C"]

// 빈 Set의 생성
let emptySet: Set<Int> = []
let emptySet1 = Set<Int>()

// Set의 기본 기능

set.count
set.isEmpty

set.contains(1)
set.randomElement()

// 업데이트 (update) - 삽입하기 / 교체하기 / 추가하기

// 서브스크립트 관련 문법 없음 ⭐️

// (정식 기능) 함수 문법
set.update(with: 1)     // Int?

set.update(with: 7)     // 새로운 요소가 추가되면 ====> 리턴 nil

// 삭제(제거) 하기 (remove)
var stringSet: Set<String> = ["Apple", "Banana", "City", "Swift"]


// 요소 삭제해 보기
stringSet.remove("Swift")     // "Swift" 삭제한 요소를 리턴
print(stringSet)                     // ["Hello", "Apple"]


// 존재하지 않는 요소를 삭제해보기
stringSet.remove("Steve")       // nil    (에러는 발생하지 않음)


// 전체요소 삭제
stringSet.removeAll()
stringSet.removeAll(keepingCapacity: true)


```
