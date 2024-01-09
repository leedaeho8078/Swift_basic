# 확장(Extensions)

상속은 본질적으로 -> 수직확장 + 클래스만 가능     
확장은 본질적으로 -> 수평확장 + 클래스/구조체/열거형 가능

수직 확장(상속)
* 데이터(저장속성)을 추가하거나
* 기능(메서드)를 재정의시켜 사용하려는 것

수평 확장(확장)
* 현재 존재하는 타입에 기능(메서드)을 추가하여 사용하는 것(`메서드 종류`만 추가가능, `메모리 공간이 필요한 저장속성`을 확장하는 것은 `불가`)


확장의 장점 ⭐️
- 원본 소스 코드에 대한 엑세스 권한이없는 유형을 확장하는 기능이 포함 -> 소급 모델링
- 예)Int, String, Double등 애플이 미리 만ㄷ르어 놓은 타입에 확장도 가능

확장 문법 
```Swift

class SomeType {

}

var a = SomeType()
a.doSomething() // Do Something! 출력

extension SomeType {    // 기존의 타입에 extension 이라는 키워드를 사용해서 확장하고, 새로운 기능을 정의
  func doSomething() {  // 새로운 기능을 추가 가능(메서드 형태만 가능!! ⭐️
    print("Do Something!")
  }
}

```
예시를 통한 확장의 이해
```Swift

class Person {
    var name = "이름"
    var id = 0
    var email = "Deoho199234@nate.com"
    
    func walk() {
        print("사람이 걷습니다.")
    }
    
}

class Student: Person {
    
    var studentId = 1
    
    override func walk() {      // 재정의
        print("학생이 걷습니다,")
    }
    
    func study() {
        print("학생이 공부합니다.")
    }
    
    
}

extension Student {
 @objc func doSomething() {            // 재정의하려면 @objc 붙여줘야함 -> 오브젝트씨 형태로 변경(objc는 확장도 재정의가 가능)
        print("Do Something!")            //메서드만 추가 가능
    }
    
}

class Undergraduate: Student {
    var major = "컴공"
    
    override func walk() {
        print("대학생이 걷는다")          // 재정의
    }
    
    override func study() {
        print("대학생이 공부한다.")       // 재정의
    }
    
    override func doSomething() {       //확장에서 해당 메서드에 @objc붙여서 재정의 가능
        print("Some Thing")
    }
}

var under = Undergraduate()
under.doSomething()

```
### 확장 가능 맴버의 종류
> 확장에서는 메서드 형태만 정의 가능

* 클래스.구조체.(열거형) 확장 가능 맴버
* 저장속성은 정의할수 없다.

* (타입)계산 속성, (인스턴스) 계산속성
* (타입) 메서드, (인스턴스) 계산 속성
* 새로운 생성자 (⭐️ 다만, 클래스의 경우 편의생성자만 추가 가능 / 지정생성자 및 소멸자는 반드시 본체에 구현)
* 서브 스크립트
* 새로운 중첩 타입 정의 및 사용
* 프로토콜 채택 및 프로토콜 관련 메서드
