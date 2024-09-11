# [BOJ 1629 - 곱셈(Swift)](https://www.acmicpc.net/problem/1629)

### 기본 전제<br/>
- 자연수 `A`, `B`, `C`가 입력된다.<br/>
    - `A`, `B`, `C`는 모두 2,147,483,647 이하의 자연수이다.<br/>
- 자연수 `A`를 `B`번 곱한 수에서 `C`로 나눈 나머지를 구해 출력한다.<br/>
    - `A`를 `B`번 곱했다는 말은 `A`를 `B`제곱했다는 의미이다.<br/> 
<br/>

### 주의 사항<br/>
- 없음.<br/>
<br/>

### 사전지식<br/>
- 지수법칙(Law of Exponents)<br/>
    - 밑이 같은 두 거듭제곱의 곱은 밑을 그대로 쓰고, 지수만 서로 더해준다.<br/>
    ```Swift
    nˣ⁺ʸ = nˣ × nʸ (단, n ≠ 0 이며, x, y는 정수이다.) 
    ```
- 모듈러 연산(Modular Arithmetic)<br/>
    - 나머지를 이용한 산술 연산이다.<br/>
    - 모듈러 산술 연산은 분배 법칙이 성립한다.<br/>
    ```Swift
    (A × B) % C = ((A % C) × (B % C) % C)
    ```

### 전략<br/>
- 매개변수 `b`에 따라, `A`를 `b`번 곱한 수를 `C`로 나눈 나머지를 구하는 함수를 선언한다.<br/>
    - 함수는 재귀함수로 만든다.<br/>
<br/>

---
### 본문<br/>

1. 자연수 `A`, `B`, `C`를 입력 받는다.<br/>
```Swift
// A, B, C를 입력 받음
let input = readLine()!.split(separator: " ").map{ Int($0)! }
let A = input[0]
let B = input[1]
let C = input[2]
```
- `input`: 입력된 문자열을 띄어쓰기로 나눈 뒤, 정수형으로 변환해 저장한 정수형 배열이다.<br/>
- `A`, `B`, `C`: 입력된 2,147,483,647 이하의 자연수를 저장한 정수형 상수이다.<br/> 
<br/>

2. 테스트케이스 개수를 입력 받고, 특정 코드를 반복한다.<br/>
```Swift
// 나머지 구하는 함수 선언
func findRemainder(b: Int) -> Int {
    // b가 1인경우, A를 C로 나눈 나머지를 리턴
    if b == 1 {
        return A % C
    }
    
    // (b / 2)를 매개변수로 하여, 재귀함수를 통해 구한 나머지 값
    let remainder = findRemainder(b: b / 2)
    
    // b가 짝수인 경우, 모듈러 연산에 따라 (나머지 × 나머지 % C)를 리턴
    if b % 2 == 0 {
        return remainder * remainder % C
    // b가 홀수인 경우, 모듈러 연산에 따라 ((나머지 × 나머지 % C) × A) % C를 리턴
    } else {
        return remainder * remainder % C * A % C
    }
}
```
- `findRemainder(b: )`: 매개변수 `b`를 입력 받아, `A`를 `b`번 곱한 수를 `C`로 나눈 나머지를 구하는 함수이다.<br/>
    - 함수 내부에서 `findRemainder(b: b / 2)`를 호출하는 재귀함수 형태로 선언한다.<br/>
        - 이에 따라 `O(logN)`의 시간복잡도를 갖는다.<br/>
- `b`가 1인 경우, 더 나눌 수 없기 떄문에 `A % C`를 리턴한다.<br/>
- `b`가 짝수, 홀수인 경우 모듈러 연산에 따라 다른 리턴값을 갖는다.<br/>
<br/>

---
### 문제를 맨 처음에 틀렸던 이유<br/>
- `findRemainder()`함수에서 재귀함수가 아닌 `for문`을 사용해, `O(N)`의 시간복잡도로 구현하여 시간초과로 인해 성공하지 못했다.<br/>
<br/>

---
### 느낀점<br/>
- 개인적으로 재귀함수는 [피보나치 수]의 예시에 따라 스택오버플로우 발생 확률도 높고, 시간복잡도가 오히려 느려지는 상황이 많다고 생각해, 일부러 사용을 잘 하지 않고 꺼리는 편이었다.<br/>
- 이 문제를 통해 재귀함수가 잘 사용하면 시간복잡도를 줄일 수 있는 좋은 방법이라는 걸 깨달았다.<br/>
    - 앞으로는 재귀함수를 적극적으로 고려해 보자고 생각했다.<br/>
<br/>

---
### 새로 알게된 내용<br/>
- 지수 법칙<br/>
- 모듈러 법칙<br/>
<br/>

--- 
### 푸는데 참고한 참고 자료<br/>
- [Rujang님의 백준 하루 한 문제 블로그](https://rujang.tistory.com/entry/백준-1629번-곱셈-CC)<br/>
- [모듈러 산술에 관한 블로그](https://sskl660.tistory.com/75)<br/>
- [지수법칙에 관한 수학방 사이트](https://mathbang.net/243#gsc.tab=0)<br/>
<br/>

---
### 시험한 테스트 케이스
<br/>

테스트 케이스 1<br/>
- 기본적으로 백준에 써 있는 테스트케이스이다.<br/>
    - 입력
        ```Swift
        10 11 12
        ```
    - 출력
        ```Swift
        4
        ```
<br/>

테스트 케이스 2<br/>
- 모듈러 법칙을 확인하기 위해 사용한 테스트케이스이다.<br/>
    - 입력
        ```Swift
        11 11 7
        ```
    - 출력
        ```Swift
        2
        ```
<br/>