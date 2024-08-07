# [BOJ 2775 - 부녀회장이 될테야(Swift)](https://www.acmicpc.net/problem/2775)

### 기본 전제<br/>
 - 아파트 `k`층 `n`호에 사는 인원 수를 구한다.<br/>
    - `k`와 `n`은 1 이상 14 이하의 자연수이다.
 - 0층부터 있고 각층에는 1호부터 있으며, 0층의 `i`호에는 `i`명이 산다.<br/>
 - `a`층의 `b`호에 살려면 자신의 아래(`a - 1`)층의 1호부터 `b`호까지 사람들의 수의 합만큼 사람들을 데려와 살아야 한다.<br/>
<br/>

### 주의 사항<br/>
 - 아파트는 0층 부터 시작한다.<br/>
 - `k`층 `n`호에 사는 인원 수를 구하기 위해서는 아파트의 `0 ~ k`층, `1 ~ n`호까지 정보가 있으면 충분하다.<br/>
    - 따라서 아파트는 이차원 배열을 통해 표현하며, 이차원 배열의 크기는 `(k + 1) × n` 이다.<br/>
<br/>

---
### 본문<br/>
내가 생각하는 해당 문제 유형은 DP(Dynamic Programming)이다.<br/>
<br/>

1. 테스트케이스 개수 `T`를 입력 받는다. 그리고 테스트케이스 개수 `T`번만큼 반복한다.<br/>
```Swift
// 테스트 케이스의 개수를 입력 받음
let T = Int(readLine() ?? "1") ?? 1

// 테스트케이스 개수 만큼 반복함
for _ in 1 ... T {
    •
    •
    •
}
```
 - `T`: 테스트케이스 개수.<br/>
    - 1 부터 `T` 까지 `T` 만큼 `for문`을 반복한다.<br/> 
 <br/>

2. `for`문 내부에서 정수 `k`, `n`을 입력 받는다.<br/>
```Swift
// k(아파트의 층 수)를 입력 받음
let k = Int(readLine() ?? "1") ?? 1
// n(아파트의 호 수)를 입력 받음
let n = Int(readLine() ?? "1") ?? 1
```
 - `k`: 아파트 층 수. (1 ≤ k ≤ 14)<br/>
 - `n`: 아파트 호 수. (1 ≤ n ≤ 14)<br/>
<br/>

3. 아파트를 나타내는 `apartment` 이차원 배열을 선언하고, 0층 `i`호에 `i`명 만큼 인원을 넣어준다.<br/>
```Swift
// 아파트는 0층부터 k층까지 총 k + 1개의 층으로 구성되어 있으며, 1호부터 n호까지 n개의 호로 구성되어 있다.
var apartment = Array(repeating: Array(repeating: 0, count: n), count: k + 1)

// 0층을 호 숫자로 채움. (ex - 1호: 1명, 2호: 2명, 3호: 3명 ...)
for i in 0 ..< n {
    apartment[0][i] = i + 1
}
```
 - `apartment`: 아파트를 나타내는 이차원 배열이다.<br/>
    - 필요한 데이터는 `0 ~ k`층, `1 ~ n`호 이므로, 이차원 배열의 크기를 `(k + 1) * n` 으로 정한다.<br/>
    - 0층의 `i`호는 `i`명 만큼 차있다는 전제가 있으므로, 이에 맞게 0층 데이터를 채워준다.<br/>
        - 단, 해당 코드에서는 `0 ~ n - 1`까지가 이차원 배열의 범위이므로, 0번을 1호로 가정하고 풀이한다.<br/>
<br/>

4. 아래층(1층)부터 윗층(`k`층)까지 차례대로 모든 방(호)에 대한 인원 데이터를 채워준다.<br/>
```Swift
// 1층부터 k층까지 순서대로 모든 방(호)에 대한 인원 데이터를 저장
for floor in 1 ... k {
    // 1호라면 이전 층 1호의 인원 그대로 가져옴
    // 1호가 아니라면, 이전 층 1 ~ room호 까지의 인원을 모두 더함
    // 이때, [이전층 1 ~ (room - 1)호까지]의 모든 인원이 [현재층 (room - 1)]호에 저장되어 있기 때문에,그냥 [현재층 (room - 1)호]의 인원과 [이전층 room호]의 인원을 더함
    for room in 0 ..< n {
        if room == 0 {
            apartment[floor][room] = apartment[floor - 1][room]
        } else {
            apartment[floor][room] = apartment[floor - 1][room] +apartment[floor][room - 1]
        }
    }
}
```
 - `a`층 `b`호에 사는 사람들의 인원 수는 `a - 1`층의 `1 ~ b`호까지 사는 사람들의 인원 수들의 합이다.<br/>
    - `apartment[a][b - 1] = apartment[a - 1][1] + ... + apartment[a - 1][b - 1]`<br/>
 - 모든 층의 1호에 사는 사람들의 인원 수는 1명이다.<br/>
    - `apartment[a][1] = apartment[a - 1][1] = ... = apartment[0][1] = 1`<br/>
 - `a`층 `b`호에 사는 사람들의 인원 수는 `a - 1`층의 `b`호에 사는 사람들의 인원 수와 `a`층 `b - 1`호에 사는 사람들의 합이다.<br/>
    - 아래 식을 통해서 위 명제가 참임을 알 수 있다.
      ```Swift
      apartment[a][b - 2] = apartment[a - 1][1] + ... + apartment[a - 1][b - 2]
      apartment[a][b - 1] = apartment[a - 1][1] + ... + apartment[a - 1][b - 2] + apartment[a - 1][b - 1]
                          = (apartment[a - 1][1] + ... + apartment[a - 1][b - 2]) + apartment[a - 1][b - 1]
                          = apartment[a][b - 2] + apartment[a - 1][b - 1]
       ```
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
        2
        1
        3
        2
        3
        ```
    - 출력
        ```Swift
        6
        10
        ```
<br/>
