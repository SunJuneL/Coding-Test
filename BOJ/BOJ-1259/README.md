# [BOJ 1259 - 팰린드롬수(Swift)](https://www.acmicpc.net/problem/1259)

### 기본 전제<br/>
 - 어떤 숫자를 앞에서 읽어도, 뒤에서 읽어도 같다면 그 수는 "팰린드롬수"이다.<br/>
    - ex) 121, 12421 등.<br/>
    - 숫자 앞쪽에 무의미한 0이 올 수 있다면 010 또한 팰린드롬수지만, 이 문제에서는 무의미한 0이 앞에 올 수 없다.<br/> 
 - 테스트 케이스로 1 이상 99999 이하의 정수가 주어진다.<br/>
 - 0이 입력되면 반복을 끝낸다.<br/>
 - 입력된 정수가 팰린드롬수라면 "yes"를, 아니라면 "no"를 출력한다.<br/>
<br/>

### 주의 사항<br/>
 - 없음.<br/>
<br/>

### 전략<br/>
 - 입력된 정수를 `input`이라고 하자.<br/>
 - `input`이 짝수이고 길이가 8이라면, 아래와 비교하여 팰린드롬수인지 아닌지 확인한다.<br/>
    ```Swift
    input[0] vs input[7]
    input[1] vs input[6]
    input[2] vs input[5]
    input[3] vs input[4]
    ```
    - 즉, `input[i]`와 `input[(input.count - 1) - i]`를 비교해야 하며, `i`의 범위는 `0 ..< input.count / 2`이다.<br/>
 - `input`이 홀수이고 길이가 9라면, 아래와 비교하여 팰린드롬수인지 아닌지 확인한다.<br/>
    ```Swift
    input[0] vs input[8]
    input[1] vs input[7]
    input[2] vs input[6]
    input[3] vs input[5]
    
    // input[4]는 가운데에 있으므로 비교가 필요 없다.
    ```
    - 즉, `input[i]`와 `input[(input.count - 1) - i]`를 비교해야 하며, `i`의 범위는 `0 ..< input.count / 2`이다.<br/>
 - 위 두 경우를 살펴보았을 때, "`input[i]`와 `input[(input.count - 1) - i]`를 비교해야 하며, `i`의 범위는 `0 ..< input.count / 2`" 부분이 완전히 동일하므로 같은 반복문을 사용해도 괜찮다.<br/>
 - 따라서, 반복문에서 팰린드롬수인지 확인하고 팰린드롬수가 아니라면 "no"를, 맞다면 "yes"를 출력한다.<br/>
<br/>

---
### 본문<br/>

1. `String` 타입에서 임의접근(Random Access, RA)이 가능하도록 한다.<br/>
```Swift
// String에 subscript를 extension해, String에서도 RA를 허용하도록 한다.
extension String {
  subscript(idx: Int) -> String? {
    guard(0..<count).contains(idx) else {
      return nil
    }
    let target = index(startIndex, offsetBy: idx)
    return String(self[target])
  }
}
```
 - **Swift**에서는 기본적인 `String` 타입에서 임의접근이 불가능하다. 따라서, `extension`에서 `subscript`를 활용해 `String` 타입에서도 임의 접근이 가능하도록 한다.<br/>
 - 참고) 다른 방법으로 문자열을 배열로 바꿔주어 사용 가능하다.<br/>
    ```Swift
    // String 타입의 input을 배열로 바꿔줌
    let arr = Array(input)
    ```
 <br/>

2. "0"이 입력될 때까지 반복문 내부 코드를 반복한다.<br/>
```Swift
// "0"이 입력될때까지 반복
while true {
    // 단어를 입력 받음
    let input = readLine() ?? ""

    if input == "0" {
        break
    }
    
    ・
    ・
    ・
}

```
 - `input`: 입력된 정수. 범위는 0 이상 99999 이하이다.<br/>
    - 0이 입력으로 들어오면 `while`문을 멈춘다.<br/>
 <br/>

3. 임시 문자열의 길이가 10 미만이라 출력이 안됐다면 출력해준다.<br/>
```Swift
// 팰린드롬수인지 판별하는 변수
var isPalindrome = true

// 반복문을 통해 input이 팰린드롬수인지 확인
for i in 0 ..< (input.count / 2) {
    if input[i] != input[input.count - i - 1] {
        isPalindrome = false
        break
    }
}

// 팰린드롬수라면 "yes", 아니라면 "no" 출력
print(isPalindrome ? "yes" : "no")
```
 - `isPalindrome`: 팰린드롬수인지 판별하는 `Bool`타입 변수.<br/>
    - 팰린드롬수라면 `true`를, 아니라면 `false`의 값을 갖게 된다.<br/>
 - **전략**에 적혀 있는 대로 반복문을 실행하여 팰린드롬수인지 확인하고, `isPalindrome` 값에 따라 다른 문자열을 출력한다.<br/> 
<br/>

---
### 문제를 맨 처음에 틀렸던 이유<br/>
- 없음.<br/>
<br/>

---
### 느낀점<br/>
- 없음.<br/>
<br/>

---
### 새로 알게된 내용<br/>
- **Swift**는 왜 `String` 타입에서 임의 접근이 불가능하도록 설계했는지와 임의 접근을 가능하도록 만드는 방법에 대해 아주 조금 알게 되었다.<br/> 
<br/>

--- 
### 푸는데 참고한 참고 자료<br/>
- [문자열을 배열로 변환해 임의접근이 가능하다는 것을 알게 해준 블로그](https://jrepository.tistory.com/147)<br/>
- [`String` 타입에서 임의접근이 불가능한 이유와 `extension` 및 `subscript`를 활용해 임의접근이 가능하다는 것을 알게해준 블로그](https://green1229.tistory.com/286)<br/>
<br/>

---
### 시험한 테스트 케이스
<br/>

테스트 케이스 1<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        121
        1231
        12421
        0
        ```
    - 출력
        ```Swift
        yes
        no
        yes
        ```
<br/>
