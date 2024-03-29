

### escaping / autoclusre 키워드
`[@escaping]` : 클로저의 실행이 본래 함수를 벗어나서도 실행되도록 하는 키워드
* 원칙적으로 함수의 실행이 종료되면 파라미터로 쓰이는 클로저도 제거됨

* @escaping이 필요한 이유
  * 어떤 함수 내부에서 존재하는 `클로저`를 `외부 변수`에 저장 -> 함수를 오랫동안 사용한다 그래서 `Heap`에 저장
  * `GCD (비동기 코드의 사용)`    
  * 함수의 실행을 벗어나서도 사용     
```Swift


var aSavedFunction: () -> () = { print("출력") }


func perFormEsacping(closure: @escaping () -> ()) {
    aSavedFunction = closure
}
aSavedFunction() // 출력

perFormEsacping(closure: { print("다르게 출력") }) // 함수를 변수에 저장한다. -> 함수를 오랫동안 저장


aSavedFunction() // 다르게 출력


```

`[@autoclosure 키워드]` : 자동으로 클로저를 생성해 줄게    
* 함수의 파라미터 즉 클로저 타입에 @autoclosure 키워드를 붙이는 이유(`파라미터가 없는` 클로저만 가능)    
* 일반적으로 클로저 형태로 써도 되지만, 너무 번거로울떄 사용
* 번거로움을 해결해주지만, 실제 코드가 명확해 보이지 않을수 있으므로 사용 지양(애플 공식 문서)
* 잘 사용하지 않음 -> 읽기 위한 문법
  
```Swift
func somFunction(closure: @autoclosure () -> Bool) {
  if closure() {
    print("참입니다.")
  }else {
    print("거짓 입니다.")
  }
var num = 1

somFunction(closure: true) // 참입니다. -> 자동으로 클로저 생성( { true } )


}
```



