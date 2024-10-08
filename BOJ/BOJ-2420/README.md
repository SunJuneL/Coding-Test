# [BOJ 2420 - 사파리월드(Swift)](https://www.acmicpc.net/problem/2420)

### 기본 전제<br/>
- 두 서브도메인의 유명도 `N`과 `M`이 주어졌을 때, 그 차이를 구한다.<br/>
    - `N`과 `M`의 범위는 -2,000,000,000 이상 2,000,000,000 이하이다.<br/>
<br/>

### 주의 사항<br/>
- 없음.<br/>
<br/>

### 전략<br/>
- `N`과 `M`을 입력받고, 둘 중 큰 값에서 작은 값을 뺀다.<br/>
<br/>

---
### 본문<br/>

1. `N`, `M`을 입력 받는다.<br/>
```Swift
// N과 M 입력 받음
let input = (readLine() ?? "0 0").split(separator: " ").map{ Int($0) ?? 0 }
let N = input[0]
let M = input[1]
```
- `input`: 띄어쓰기를 기준으로 입력된 문자열을 자른 후, 정수형으로 변환해 저장한 정수형 배열이다.<br/>
- `N`, `M`: 입력된 두 서브도메인 유명도를 저장하는 정수형 상수이다.<br/>
    - 범위는 -2,000,000,000 이상 2,000,000,000 이하이다.<br/>
<br/>

2. 유명도 차이를 구해 출력한다.<br/>
```Swift
// N과 M의 차이를 구함
print(max(N, M) - min(N, M))
```
- `N`, `M` 중 큰 값에서 작은 값을 빼, 유명도 차이를 구한다.<br/>
- 구한 차이를 출력한다.<br/>
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
        -2 5
        ```
    - 출력
        ```Swift
        7
        ```
<br/>
