# [BOJ 11866 - 요세푸스 문제 0(Swift)](https://www.acmicpc.net/problem/11866)

### 참고<br/>
 - 이 문제는 [(BOJ-1158) 요세푸스 문제]와 완전히 동일하다.<br/>
 - 따라서, [(BOJ-1158) 요세푸스 문제]의 개선 코드와 완전히 동일하게 작성하였다.<br/>
<br/>

### 기본 전제<br/>
 - K의 범위는 1 이상 5000 이하이며, N의 범위는 K 이상이며 5000 이하이다.<br/>
 - N 명의 사람들이 원을 이루어 앉아, 매 K 번째 사람을 제거한다.<br/>
<br/>

### 주의 사항<br/>
 - 없음.<br/>
<br/>

### 전략<br/>
 - 배열에서 요소를 `remove()`하며, 요세푸스 문자열을 완성한다.<br/>
<br/>

---
### 본문<br/>

1. N과 K를 입력 받는다.<br/>
```Swift
// N과 K를 입력 받음
let input = (readLine() ?? "1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }
let N = input[0]
let K = input[1]
```
 - `input`: 입력된 `N`과 `K`의 값을 저장할 배열이다.<br/>
 - `N`: 사람 인원 수를 저장할 변수.<br/>
 - `K`: 몇 번째 사람을 제거할지 정하게 되는 값을 저장할 변수.<br/>
 <br/>

2. 기본적으로 사용할 배열 및 문자열을 선언한다.<br/>
```Swift
// 사람들의 번호를 저장하는 배열과 요세푸스 결과를 저장할 문자열 선언
var people = [Int](1 ... N)
var josephus = "<"
```
 - `people`: 1 부터 N 까지의 번호를 저장하는 배열.<br/>
 - `josephus`: 요세푸스 순열을 저장할 문자열.<br/>
 <br/>

3. 배열에서 요소를 `remove()`하며, 요세푸스 문자열을 완성한다.<br/>
```Swift
// 사람들의 번호를 담은 배열이 빌 때까지 반복
var i = K - 1
while !people.isEmpty {
    // 현재 i 인덱스의 요소를 제거하고, 그 요소의 값을 요세푸스 문자열에 추가
    let num = people.remove(at: i)
    josephus += (String(num) + (people.isEmpty ? ">" : ", "))
    
    // i 에 K - 1 만큼 더하고 i 값을 조정
    i += (K - 1)
    if !people.isEmpty {
        i %= people.count
    }
}
```
 - 현재 index의 요소를 제거했기 때문에 다음 번호가 현재 index로 끌려온다.<br/>
    - 즉, 현재 index를 포함해 K 번째 번호를 제외하기 때문에 K - 1 만큼 더해줌<br/>
<br/>

---
### 문제를 맨 처음에 틀렸던 이유<br/>
- 없음.<br/>
<br/>

---
### 느낀점<br/>
- 배열의 값을 -1로 바꾸고, 배열 전체를 계속 반복하는 것보다 `remove()`를 사용하는게 훨씬 빠르다.<br/>
- 배열을 반복하여 출력을 하는 것보다 문자열을 만들어 한번 출력하는게 훨씬 빠르다.<br/>
<br/>

--- 
푸는데 참고한 참고 자료: 없음.<br/>
<br/>

---
### 시험한 테스트 케이스
<br/>

테스트 케이스 1<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        7 3
        ```
    - 출력
        ```Swift
        <3, 6, 2, 7, 5, 1, 4>
        ```
<br/>
