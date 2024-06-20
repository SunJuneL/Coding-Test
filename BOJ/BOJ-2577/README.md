# [BOJ 2577 - 숫자의 개수(Swift)](https://www.acmicpc.net/problem/2577)

### 기본 전제<br/>
 - 숫자 `A`, `B`, `C` 는 모두 100 이상, 1000보다 작은 세자리 자연수이다.<br/>
     - 즉, `A`, `B`, `C`를 모두 곱한 값의 범위는 1000000 ~ 997002999로 `Int`로 나타낼 수 있다.<br/>
<br/>

### 주의 사항<br/>
 - 딱히 없음.<br/>
<br/>

---
### 본문<br/>

1. 기본적으로 사용할 변수 및 배열을 선언한다.<br/>
```Swift
// 숫자 A, B, C 입력받기
let A = Int(readLine() ?? "100") ?? 100
let B = Int(readLine() ?? "100") ?? 100
let C = Int(readLine() ?? "100") ?? 100

// 0부터 9까지 각 숫자가 사용된 횟수를 저장하는 배열
var numbers = Array(repeating: 0, count: 10)
```
 - `A`, `B`, `C`: 각각 100 이상 999 이하의 자연수<br/>
 - `numbers`: 0 ~ 9 까지 각 숫자가 사용된 횟수를 저장하는 배열<br/> 
 <br/>

2. 10으로 나눈 나머지에 따라 `numbers` 배열의 값을 변화시킨다.<br/>
 - 10으로 나눈 나머지는 각 자리의 수가 되고, 그 값에 해당하는 인덱스의 값을 변화시키면 숫자가 사용된 횟수를 알 수 있다.<br/>
```Swift
// 곱셈의 결과를 10으로 나눈 나머지 값에 따라 배열에 추가
while result > 0 {
    let number = result % 10
    numbers[number] += 1
    result /= 10
}
```
<br/>

3. 구한 `numbers` 배열을 출력한다.<br/>
``` Swift
// 곱셈의 결과를 10으로 나눈 나머지 값에 따라 배열에 추가
while result > 0 {
    let number = result % 10
    numbers[number] += 1
    result /= 10
}
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
        150
        266
        427
        ```
    - 출력
        ```Swift
        3
        1
        0
        2
        0
        0
        0
        2
        0
        0
        ```
<br/>
