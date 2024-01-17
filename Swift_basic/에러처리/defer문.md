# Defer문

`defer`: 할일을 뒤로 미루다 
> 일반적으로 어떤 스코프내의 동작을 마무리하기 위해 사용

* 해당 스코프 내에서 작업의 실행을 가장 마지막으로 미룸.     
* defer문은 한번은 호출되어야지, 해당 구문이 실행

```Swift

func doSomething() {
    defer {
      print("1")
    }
    print("2")
}

doSomething() // 2,1



func doSomething2() {
  if true {
    print("1")
    return
  }

    defer {
      print("2")
    }
    
}
doSomething() // 1


// 등록된 역순으로 출력, Defer문은 하나만 구현하는게 좋음
func doSomething3() {
    defer {
      print("1")
    }

    defer {
      print("2")
    }

    defer {
      print("3")
    }

}
doSomething3() // 3,2,1 역순으로 출력

for i in 1...4 {
    defer { print("defer문 \(i)") }
    print("for문 \(i)")
}

// for문 1
// defer문 1
// for문 2
// defer문 2
// for문 3
// defer문 3

```
