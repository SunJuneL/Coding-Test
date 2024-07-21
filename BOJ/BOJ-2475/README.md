# [BOJ 2475 - 검증수(Swift)](https://www.acmicpc.net/problem/2475)

### 기본 전제<br/>
 - 5자리 고유번호의 각 숫자 범위는 0부터 9까지이다.
 - 고유번호의 각 자리 숫자들을 제곱한 뒤, 10으로 나눈 나머지가 검증수이다.
<br/>

### 주의 사항<br/>
 - 없음.
<br/>

---
### 본문<br/>

1. 고유번호 5자리를 입력받아 배열 형식으로 저장한다.<br/>
```Swift
// 고유번호 배열 형식으로 입력 받기
let uniqueNumber = (readLine() ?? "0 0 0 0 0").components(separatedBy: " ").map{ Int($0) ?? 0 }
```
 - `uniqueNumber`: 고유번호를 저장한 배열, 각 요소의 범위는 0 이상 9 이하이다.<br/>
 <br/>

2. 고유번호의 각 숫자들을 제곱한 합을 구한다. 이를 이용해 검증수를 구한다.<br/>
```Swift
// sum: 각 고유번호 숫자들을 제곱한 합
var sum = 0
for n in uniqueNumber {
    sum += (n * n)
}
// 검증수
let verification = sum % 10
```
 - `sum`: 각 숫자들의 제곱한 합을 저장하는 변수.<br/>
 - `verification`: 검증수를 저장하는 상수.<br/>
    - 검증수는 `sum`을 10으로 나눈 나머지 값이다.<br/>
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
푸는데 참고한 참고 자료: 없음<br/>
<br/>

---
### 시험한 테스트 케이스
<br/>

테스트 케이스 1<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        0 4 2 5 6
        ```
    - 출력
        ```Swift
        1
        ```
<br/>
