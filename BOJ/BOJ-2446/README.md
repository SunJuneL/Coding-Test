# [BOJ 2446 - 별 찍기 - 9(Swift)](https://www.acmicpc.net/problem/2446)

### 기본 전제<br/>
 - 1 이상 100 이하의 숫자 `N`이 입력된다.<br/>
 - 아래의 규칙대로 출력한다.<br/>
    - 첫 번째 줄부터 `N` 번째 줄까지는 `2 × N - 1` 개의 별을 시작으로, 1개의 공백 추가와 2개의 별이 줄어들면서 출력된다.<br/>
    - `N` 번째 줄부터 `2 × N - 1` 번째 줄까지, 공백 1개가 줄고 2개의 별이 추가되며 출력된다.<br/>
<br/>

### 주의 사항<br/>
 - 없음.<br/>
<br/>

### 전략<br/>
 - 기본 전제 그대로 출력한다.<br/>
<br/>

---
### 본문<br/>

1. `N`을 입력 받는다.<br/>
```Swift
// N을 입력 받음
let N = Int(readLine() ?? "1") ?? 1
```
 - `N`: 1 이상 100 이하의 정수를 저장하는 상수.<br/>
 <br/>
 
2. 한 줄을 의미하는 문자열을 초기화한다.<br/>
```Swift
// 별 문자열 초기화
var stars = ""
for _ in 1 ... (2 * N - 1) {
    stars.append("*")
}
```
 - `stars`: 한 줄을 의미하는 문자열이다.<br/>
 - 가장 첫 줄은 `*` 문자 `2 × N - 1` 개로 시작하기 때문에, 초기화 해준다.<br/>
 <br/>
 
3. 규칙에 따라 `stars`를 조절하여 출력한다.<br/>
```Swift
// 규칙에 따라 2 * N - 1 개의 줄 출력
for i in 1 ... (2 * N - 1) {
    // 첫 줄부터 N 줄까지, 별을 2개 줄이고 공백을 1개 추가
    if 1 < i && i <= N {
        stars.removeLast()
        stars.removeLast()
        stars = " " + stars
    }
    // N 줄 이후, 공백을 1개 줄이고 별 2개 추가
    if N < i {
        stars.removeFirst()
        stars.append("*")
        stars.append("*")
    }
    // 줄을 출력한다.
    print(stars)
}
```
 - 두 번째 줄부터 `N` 번째 줄까지, 별을 2개 줄이고 공백을 1개 추가한다.<br/>
    - 첫 번째 줄은 **본문 2번**에서 초기화 했기 때문에 넘긴다.<br/>
 - N 번째 줄 이후에는 공백을 1개 줄이고 별을 2개 추가한다.<br/>
 - 변경한 문자열 stars를 출력한다.<br/>
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
- 문자열을 사용해 출력하는 방법은 그냥 출력하는 방법보다 메모리 효율이 좋지 못하다.<br/>
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
        5
        ```
    - 출력
        ```Swift
        *********
         *******
          *****
           ***
            *
           ***
          *****
         *******
        *********
        ```
<br/>
