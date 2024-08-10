# [BOJ 1929 - 소수 구하기(Swift)](https://www.acmicpc.net/problem/1929)

### 기본 전제<br/>
 - `M` 이상 `N` 이하의 소수를 모두 출력한다.<br/>
    - `M`과 `N`의 범위는 1 이상 1000000 이하이다.<br/>
<br/>

### 주의 사항<br/>
 - 없음.<br/>
<br/>

### 전략<br/>
 - "에라토스테네스의 체"를 활용한다.<br/>
<br/>

---
### 본문<br/>

1. `M`과 `N`을 입력 받는다.<br/>
```Swift
// M, N 입력 받음
let input = (readLine() ?? "1 1000000").components(separatedBy: " ")
let M = Int(input[0]) ?? 1
let N = Int(input[1]) ?? 1000000
```
 - `input`: 입력을 공백 기준으로 나누어 요소로 저장하는 문자열 배열이다.<br/>
 - `M`: 시작 범위 값을 저장한 상수이다.<br/>
 - `N`: 끝 범위 값을 저장한 상수이다.<br/>
 <br/>
 
2. 단어 `S`를 입력 받는다.<br/>
```Swift
// 에라토스테네스의 체
var eratosthenes = [Bool](repeating: true, count: N + 1)

for i in 0 ... Int(sqrt(Double(N))) {
    if i == 0 || i == 1 {
        eratosthenes[i] = false
    }
    
    if !eratosthenes[i] {
        continue
    }
    
    for j in i + 1 ... N {
        if j % i == 0 {
            eratosthenes[j] = false
        }
    }
}
```
 - `eratosthenes`: "에라토스테네스의 체"를 위해 선언된 `Bool`타입 배열이다.<br/>
    - 값이 `false`일 경우 소수가 아니며, `true`일 경우 소수이다.<br/>
 - 0과 1일 경우 소수가 아니기 때문에 false로 값을 바꾼다.<br/>
 - `i` 번째 값이 `false`일 경우, 아래 코드를 스킵한다.<br/>
 - `i` 번째 값이 `true`일 경우 `i + 1` 번째 값부터 `N`까지 각각의 수를 `i`로 나누어, 나누어 떨어질 경우 소수가 아니므로 값을 `false`로 변경한다.<br/> 
<br/>

3. 소수를 출력한다.<br/>
```Swift
// 소수 출력
for i in M ... N {
    if eratosthenes[i] {
        print(i)
    }
}
```
 - `M` 부터 `N` 번째까지 각 수 마다 `eratosthenes` 값을 확인해 해당 값이 `true`라면 출력한다.<br/>
<br/>

---
### 문제를 맨 처음에 틀렸던 이유<br/>
- "에라토스테네스의 체"를 활용하지 않으면, 시간초과가 난다.<br/>
<br/>

---
### 느낀점<br/>
- "에라토스테네스의 체"를 더 적극적으로 활용하고, 더 응용할 수 있도록 연습하자.<br/>
<br/>

---
### 새로 알게된 내용<br/>
- 없음.<br/>
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
        3 16
        ```
    - 출력
        ```Swift
        3
        5
        7
        11
        13
        ```
<br/>
