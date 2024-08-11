# [BOJ 2609 - 최대공약수와 최소공배수(Swift)](https://www.acmicpc.net/problem/2609)

### 기본 전제<br/>
 - 두 개의 자연수를 입력 받아, 최대공약수와 최소공배수를 구해 출력한다.<br/>
    - 두 자연수는 10000 이하의 수이다.
<br/>

### 주의 사항<br/>
 - 큰 수가 먼저 입력 되는지, 아닌지는 모른다.<br/>
<br/>

### 전략<br/>
 - 최대공약수(GCD)는 [유클리드 호제법]을 이용한다.<br/>
 - 최소공배수(LCM)은 구한 최대공약수를 이용해 구한다.<br/>
    - `LCM = num1 * num2 / GCD`임을 이용한다.<br/>
<br/>

---
### 본문<br/>

1. 두 자연수를 입력 받는다.<br/>
```Swift
// 두 자연수를 입력 받음
let input = (readLine() ?? "1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }
let num1 = input[0]
let num2 = input[1]
```
 - `input`: 입력을 공백 기준으로 나누어 요소로 저장하는 문자열 배열이다.<br/>
 - `num1`, `num2`: 두 자연수를 각 상수에 저장한다.<br/>
    - 두 상수는 10000 이하의 자연수이다.<br/>
 <br/>
 
2. 최대공약수(GCD)를 구하는 함수를 선언한다.<br/>
```Swift
// 최대공약수를 구하는 함수 선언
func GCD(num1: Int, num2: Int) -> Int {
    var big = num1 >= num2 ? num1 : num2
    var small = num1 >= num2 ? num2 : num1
    
    // 유클리드 호제법 이용
    while small != 0 {
        let temp = small
        small = big % small
        big = temp
    }
    
    return big
}
```
- `GCD(num1: , num2: )`: `num1`, `num2`를 파라미터로 입력 받아, 최대공약수를 리턴하는 함수이다.<br/>
- 두 자연수 중에서 어떤 값이 더 큰지 모르기 때문에, 큰 값을 `big`에, 작은 값을 `small`에 저장한다.<br/>
- [유클리드 호제법]을 이용한다.<br/>
    - 큰 값에서 작은 값을 나눈 나머지를 구한다.<br/>
    - 작은 값을 큰 값으로, 구한 나머지를 작은 값으로 하여 또 나눈 나머지를 구한다.<br/>
    - 이를 반복하여, 나머지가 0이 되면 그 때 나눈 값이 최대공약수이다.<br/> 
<br/>

3. 최대공약수와 최소공배수를 출력한다.<br/>
```Swift
// gcd, a, b를 구함
let gcd = GCD(num1: num1, num2: num2)

// 최대공약수, 최소공배수 출력
print(gcd)
print(num1 * num2 / gcd)
```
- `gcd`: `GCD(num1: , num2: )`를 이용해 구한 최대공약수 값을 저장하는 상수이다.<br/>
- `lcm`: 최소공배수를 저장하는 상수이다.<br/>
    - `LCM = num1 * num2 / GCD`임을 이용하여 구한다.<br/>
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
        24 18
        ```
    - 출력
        ```Swift
        6
        72
        ```
<br/>
