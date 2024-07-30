# [BOJ 11050 - 이항 계수 1(Swift)](https://www.acmicpc.net/problem/11050)

### 기본 전제<br/>
 - `N`의 범위는 1 이상 10 이하이며, `K`의 범위는 0 이상 `N` 이하이다.<br/>
 - 이항 계수는 아래와 같다.<br/>
 <img width="338" alt="이항계수" src="https://github.com/user-attachments/assets/e84c4830-f662-484e-ba43-2d924e013c0a">
<br/>

### 주의 사항<br/>
 - `0! = 1`임을 명심하자.<br/>
<br/>

### 전략<br/>
 - 펙토리얼(!)을 구하는 함수를 구현한 뒤, 이를 이용해서 이항 계수를 구한다.<br/>
 - `n!`에서 `(n - k)!`을 나누면 `n × (n - 1) × ・・・ × (n - k + 1)`로 연산 횟수를 줄일 수 있지만, 크게 차이나지 않기 때문에 이항 계수의 모습 그대로 `n! / ((n - k)! × n!)`의 형태로 구한다.<br/>
<br/>

---
### 본문<br/>

1. `n 팩토리얼(n!)`을 구하는 함수를 선언한다.<br/>
```Swift
// 팩토리얼을 구하는 함수 선언
func factorial(_ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    return [Int](1 ... n).reduce(1){ $0 * $1 }
}
```
 - `n` 값이 0인 경우, 1을 리턴한다.<br/>
 - 1 부터 `n` 까지의 값을 갖는 정수형 배열과 고차함수 `reduce()`를 사용하여 팩토리얼의 결과를 구해 리턴한다.<br/>
 <br/>

2. `N`과 `K`를 입력 받는다.<br/>
```Swift
// 변수 N과 K를 입력 받음
let input = (readLine() ?? "1 0").components(separatedBy: " ")
let N = Int(input[0]) ?? 1
let K = Int(input[1]) ?? 0
```
 - `N`: 범위가 1 이상 10 이하인 정수.<br/>
 - `K`: 범위가 0 이상 `N` 이하인 정수.<br/>
 <br/>

3. `factorial()` 함수를 이용해 분자 및 분모를 구하고, 이항 계수를 출력한다.<br/>
```Swift
// 분자 및 분모를 구함
let numerator = factorial(N)
let denominator = factorial(N - K) * factorial(K)
```
 - `numerator`: 영단어로 "분자"를 의미하며, `N!`의 값을 갖는 상수이다.<br/>
 - `denominator`: 영단어로 "분모"를 의미하며, `(N - K)! × K!` 값을 갖는 상수이다.<br/>
<br/>

---
### 문제를 맨 처음에 틀렸던 이유<br/>
- 없음.<br/>
<br/>

---
### 느낀점<br/>
- 고차함수 `reduce()`를 사용해보고 싶어서 `[Int]`를 사용했는데, 메모리나 연산에 손해가 있지 않을까 하는 의구심이 든다.<br/>
<br/>

--- 
### 푸는데 참고한 참고 자료<br/>
- 없음.<br/>
<br/>

---
### 시험한 테스트 케이스
<br/>

테스트 케이스 1<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        5 2
        ```
    - 출력
        ```Swift
        10
        ```
<br/>
