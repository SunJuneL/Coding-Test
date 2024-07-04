# [BOJ 14425 - 문자열 집합(Swift)](https://www.acmicpc.net/problem/14425)

### 기본 전제<br/>
 - 집합 S에 총 N개의 문자열을 저장해야 한다.<br/>
     - 이때, 1 ≤ N ≤ 10,000으로 만약 Swift가 아니였다고 하더라도, 집합의 크기는 Int 내이다.<br/>
 - M의 범위 또한 1 ≤ N ≤ 10,000으로 Int 범위 내에서 해결이 가능하다.<br/> 
<br/>

### 주의 사항<br/>
 - 딱히 없음.<br/>
<br/>

---
### 본문<br/>

1. 기본적으로 사용하는 집합 S, 변수 N, M의 선언 및 값을 저장한다.<br/>
```Swift
// 집합 S 선언
var S: Set<String> = []

// 변수 N, M을 입력 받고, 입력 받은 값을 저장함.
let input = (readLine() ?? "1 1").split(separator: " ").map{ Int($0) ?? 1 }
let N = input[0]
let M = input[1]
```
 - `N`, `M`: 각각 1 이상 10000 이하의 자연수<br/>
 - `S`: 문자열을 저장할 집합<br/> 
 <br/>

2. N의 크기만큼 문자열들을 입력 받고, 집합 S에 저장한다.<br/>
```Swift
// N의 크기만큼 문자열들을 입력 받고, 집합 S에 저장
for _ in 1 ... N {
    let strInput = readLine() ?? ""
    S.insert(strInput)
}
```
<br/>

3. M의 크기만큼 문자열들을 입력 받고, 집합 S에 입력 받은 문자열들이 요소로 있는지 확인한다.<br/>
``` Swift
// M의 크기만큼 문자열들을 입력 받음. 집합 S에 특정 문자열이 있다면 count 늘림
var count = 0
for _ in 1 ... M {
    let strInput = readLine() ?? ""
    if S.contains(strInput) {
        count += 1
    }
}
```
 - `count`: 특정 문자열들이 집합 S에 몇개 있는지 나타내는 변수<br/>
    - 문자열을 M개 입력 받으면서, 집합 S에 문자열이 있다면 count를 늘리며 개수를 센다.<br/>
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
        5 11
        baekjoononlinejudge
        startlink
        codeplus
        sundaycoding
        codingsh
        baekjoon
        codeplus
        codeminus
        startlink
        starlink
        sundaycoding
        codingsh
        codinghs
        sondaycoding
        startrink
        icerink
        ```
    - 출력
        ```Swift
        4
        ```
<br/>
