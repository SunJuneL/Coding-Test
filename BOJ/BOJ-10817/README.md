# [BOJ 10817 - 세 수(Swift)](https://www.acmicpc.net/problem/10817)

### 기본 전제<br/>
 - 세 정수 A, B, C가 공백으로 구분되어 주어진다.<br/>
 - 세 정수 A, B, C의 범위는 1 이상 100 이하이다.<br/>
<br/>

### 주의 사항<br/>
 - 딱히 없음.<br/>
<br/>

---
### 본문<br/>

1. 세 정수 A, B, C를 입력 받는다.<br/>
```Swift
// 세 정수 A, B, C를 입력 받음
// numbers = [ A, B, C ]
let numbers = (readLine() ?? "1 1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }
```
 - `numbers`: 정수 A, B, C를 저장하는 배열.<br/>
    - A, B, C 순서대로 배열에 저장한다.<br/> 
 <br/>

2. 세 정수를 저장한 배열을 정렬한다.<br/>
```Swift
// A, B, C의 값을 정렬
let sortedNumbers = numbers.sorted()
```
 - `sortedNumbers`: `numbers`를 정렬한 배열을 저장한다.<br/>
<br/>

3. 정렬한 배열 중에서 `index`가 1인 값을 출력한다.<br/>
```Swift
// 두 번째로 큰 정수를 출력
print(sortedNumbers[1])
```
 - 작은 값부터 큰 값 순으로 정렬되었고, 3개의 정수로 정해져 있기 때문에 `index`가 1인 값을 출력한다.<br/>
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
        20 30 10
        ```
    - 출력
        ```Swift
        20
        ```
<br/>

테스트 케이스 2<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        30 30 10
        ```
    - 출력
        ```Swift
        30
        ```
<br/>

테스트 케이스 3<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        40 40 40
        ```
    - 출력
        ```Swift
        40
        ```
<br/>

테스트 케이스 4<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        20 10 10
        ```
    - 출력
        ```Swift
        10
        ```
<br/>
