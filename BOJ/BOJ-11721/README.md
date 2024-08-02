# [BOJ 11721 - 열 개씩 끊어 출력하기(Swift)](https://www.acmicpc.net/problem/11721)

### 기본 전제<br/>
 - 알파벳 소문자와 대문자로만 이루어진 길이가 `N`인 단어가 입력된다.<br/>
    - 소문자 및 대문자인지, 그리고 길이가 `N`인지는 문제 해결에 크게 중요하지 않다.<br/>
    - 길이 N은 1 이상 100 이하이다.<br/> 
 - 10 글자씩 끊어서 출력하라.<br/>
<br/>

### 주의 사항<br/>
 - 없음.<br/>
<br/>

### 전략<br/>
 - 임시 문자열을 선언한다.<br/>
 - 단어의 모든 문자에 대해 반복하여, 임시 문자열에 문자를 `append()`한다.<br/>
    - 임시 문자열의 길이가 10이 될 때마다 출력하고, 임시 문자열을 비운다.<br/>
 - 반복문 이후, 임시 문자열의 길이가 10이 되지 않아 출력되지 않은 문제가 있을 수 있다.<br/>
    - 따라서, 임시 문자열이 비어있지 않다면 출력해준다.<br/>
<br/>

---
### 본문<br/>

1. 단어를 입력 받는다.<br/>
```Swift
// 단어를 입력 받음
let input = readLine() ?? ""
```
 - `input`: 입력된 단어를 저장하는 상수이다.<br/>
 <br/>

2. 단어의 모든 문자에 대해 반복하면서 임시 문자열을 이용해 10개의 문자마다 출력한다.<br/>
```Swift
// 임시 문자열 선언
var line = ""

// 단어의 모든 문자에 대해 반복
for ch in input {
    line.append(ch)
    if line.count == 10 {
        print(line)
        line.removeAll()
    }
}
```
 - `line`: 단어의 문자 10개까지 저장할 임시 문자열.<br/>
 - 단어의 모든 문자마다 반복하여 아래 코드를 실행한다.<br/>
    - 임시 문자열 `line`에 문자를 `append()`한다.<br/>
    - `line` 문자열의 길이가 10이 될 때마다 출력하고, 문자열을 초기화한다.<br/>
 <br/>

3. 임시 문자열의 길이가 10 미만이라 출력이 안됐다면 출력해준다.<br/>
```Swift
// 아직 출력 안된 문자가 있는지 확인 후 출력
if !line.isEmpty {
    print(line)
}
```
 - 반복문이 끝났을 때 `line`에 값이 있다면, `line`에 10개의 문자가 채워지지 않아서 출력되지 않은 것이다.<br/>
    - 따라서, `line`이 비어있지 않다면 `line`을 출력한다.<br/>
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
        BaekjoonOnlineJudge
        ```
    - 출력
        ```Swift
        BaekjoonOn
        lineJudge
        ```
<br/>

테스트 케이스 2<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        OneTwoThreeFourFiveSixSevenEightNineTen
        ```
    - 출력
        ```Swift
        OneTwoThre
        eFourFiveS
        ixSevenEig
        htNineTen
        ```
<br/>
