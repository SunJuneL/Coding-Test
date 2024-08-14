# [BOJ 1010 - 다리 놓기(Swift)](https://www.acmicpc.net/problem/1010)

### 기본 전제<br/>
 - 테스트케이스의 개수 `T`가 입력 받는다.<br/>
 - `T` 만큼 강의 서쪽과 동쪽 사이트 개수 `N`, `M`을 입력 받는다.<br/>
    - `N`과 `M`의 범위는 `0 < N ≤ M < 30` 이다.<br/>
 - 다리는 서로 겹쳐질 수 없다고 할 때, 다리를 지을 수 있는 경우의 수를 구한다.<br/>
<br/>

### 주의 사항<br/>
 - 없음.<br/>
<br/>

### 전략<br/>
 - 위 사진에 따라 DP를 활용해 풀 수 있다.<br/>
    - `bridgeCase[n][m] = bridgeCase[n - 1][m - 1] + bridgeCase[n][m - 1]`임을 이용한다.<br/>
 - (1, 1)부터 (N, M) 까지의 경우의 수를 모두 구한 뒤, (N, M)일 때의 경우의 수를 출력한다.<br/>
<br/>

---
### 본문<br/>

1. 테스트케이스를 입력 받고, 테스트케이스 개수만큼 특정 코드를 반복한다.<br/>
```Swift
// 테스트케이스 개수 입력 받음
let T = Int(readLine() ?? "1") ?? 1

// 테스트케이스 개수 만큼 반복
for _ in 1 ... T {
    ・
    ・
    ・
}

```
 - `T`: 테스트케이스 개수를 저장하는 상수이다.<br/>
 - 테스트케이스 개수가 정해져있기 때문에 `for문`을 이용해 경우의 수를 구하는 코드를 반복한다.<br/>
 <br/>
 
2. 서쪽과 동쪽 사이트 개수 `N`, `M`을 입력 받는다.<br/>
```Swift
// N과 M 입력 받음
let input = (readLine() ?? "1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }
let N = input[0]
let M = input[1]
```
- `input`: 입력 받은 문자열을 띄어쓰기 기준으로 나누고, 정수형으로 타입 캐스팅해 저장한 정수형 배열이다.<br/>
- `N`, `M`: 각각 서쪽과 동쪽 사이트 개수이다.<br/>
    - `N`과 `M`의 범위는 `0 < N ≤ M < 30` 이다.<br/>
<br/>

3. 다리 놓는 경우의 수를 저장하는 배열을 선언하고, DP를 이용해 배열을 채운다.<br/>
```Swift
// 다리 놓는 경우의 수를 저장하는 배열 선언
var bridgeCase = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)

// 배열을 DP로 완성시키기
for n in 1 ... N {
    for m in n ... M {
        if n == 1 {
            bridgeCase[n][m] = m
        } else if n == m {
            bridgeCase[n][m] = 1
        } else {
            bridgeCase[n][m] = bridgeCase[n - 1][m - 1] + bridgeCase[n][m - 1]
        }
    }
}
```
- `bridgeCase`: 다리를 놓는 경우의 수를 저장하는 배열이다.<br/>
    - `bridgeCase[N][M]` 형태이다.<br/>
    - `N == 0, M == 0` 일때는 무시한다.<br/>
- 아래의 규칙에 따라 DP로 배열을 완성한다.<br/> 
    - `n == 1` 일때의 경우의 수는 `m`이어야 한다.<br/>
    - `n == m` 일때 경우의 수는 항상 1이다.<br/>
    - `bridgeCase[n][m] = bridgeCase[n - 1][m - 1] + bridgeCase[n][m - 1]`을 만족한다.<br/>
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
        3
        2 2
        1 5
        13 29
        ```
    - 출력
        ```Swift
        1
        5
        67863915
        ```
<br/>
