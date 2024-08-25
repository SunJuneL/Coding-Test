# [(BOJ-1037) 약수(Swift)](https://www.acmicpc.net/problem/1037)

### 기본 전제<br/>
 - 숫자 `N`의 진짜 약수는 1과 `N`을 제외한 약수이다.<br/>
 - `N`의 진짜 약수의 개수와 진짜 약수가 주어질 때, `N`을 구한다.<br/>
    - 진짜 약수의 개수는 50 이하의 자연수이다.<br/>
    - 약수는 2 이상 1000000 이하이다.<br/>
<br/>

### 주의 사항<br/>
 - 없음.<br/>
<br/>

### 전략<br/>
 - 진짜 약수의 개수는 자연수이므로, 반드시 1개 이상은 존재한다.<br/>
 - 진짜 약수들 중 가장 작은 값과 가장 큰 값을 곱하면 숫자 `N`이 나오는 걸 이용한다.<br/>
<br/>

---
### 본문<br/>

1. 진짜 약수의 개수와 진짜 약수를 입력 받는다.<br/>
```Swift
// 약수의 개수 입력 받음
let divisorsCount = Int(readLine() ?? "1") ?? 1
// 약수 입력 받음
let divisors = (readLine() ?? "2").split(separator: " ").map{ Int($0) ?? 2 }
```
 - `divisorsCount`: 입력된 진짜 약수의 개수를 저장하는 상수이다.<br/>
 - `divisors`: 입력된 진짜 약수들을 저장하는 정수형 배열이다.<br/>
    - 입력된 문자열을 띄어쓰기를 기준으로 자르고, 각 요소를 정수형으로 캐스팅한다.<br/>
 <br/>

2. `N`을 구한다.<br/>
```Swift
// N 구하기
let N = (divisors.min() ?? 2) * (divisors.max() ?? 2)
```
 - `N`: 본래 숫자를 저장하는 상수이다.<br/>
    - 진짜 약수들 중 가장 작은 값과 가장 큰 값의 곱으로 구한다.<br/>
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
        2
        4 2
        ```
    - 출력
        ```Swift
        8
        ```
<br/>

테스트 케이스 2<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        1
        2
        ```
    - 출력
        ```Swift
        4
        ```
<br/>

테스트 케이스 3<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        6
        3 4 2 12 6 8
        ```
    - 출력
        ```Swift
        24
        ```
<br/>

테스트 케이스 4<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        14
        14 26456 2 28 13228 3307 7 23149 8 6614 46298 56 4 92596
        ```
    - 출력
        ```Swift
        185192
        ```
<br/>