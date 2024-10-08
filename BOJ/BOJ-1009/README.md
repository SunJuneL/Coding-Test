# [BOJ 1009 - 분산처리(Swift)](https://www.acmicpc.net/problem/1009)

### 기본 전제<br/>
- 테스트케이스 개수 `T`가 입력된다.<br/>
- 테스트케이스 개수만큼 숫자 `a`, `b`가 입력된다.<br/>
    - `a`의 범위는 1 이상 100 미만의 정수이고, `b`의 범위는 1 이상 1,000,000 미만의 정수이다.<br/>
- 1번 데이터는 1번 컴퓨터, 3번 데이터는 3번 컴퓨터, ..., 10번 데이터는 10번 컴퓨터, 11번 데이터는 1번 컴퓨터에서 처리한다.<br/>
- 총 데이터의 개수는 `aᵇ` 형태로 주어질 떄, 마지막 데이터가 처리되는 컴퓨터의 번호를 출력한다.<br/>
<br/>

### 주의 사항<br/>
- 없음.<br/>
<br/>

### 전략<br/>
- 12번 데이터는 2번 컴퓨터에서, 39번 데이터는 9번 컴퓨터에서 처리한다.<br/>
    - 즉, 일의 자리에 따라 처리하는 컴퓨터의 번호가 결정된다.<br/>
- 거듭제곱의 일의 자리는 반복된다.<br/>
    - 3의 거듭제곱은 `3, 9, 27, 81, 243, 729, ...` 이며, 일의 자리가 `3, 9, 7, 1, 3, 9, ...` 순으로 `3, 9, 7, 1`이 반복된다.<br/>
- 따라서, `a`를 10으로 나눈 나머지를 통해 일의 자리를 구하고, 구한 숫자의 `b` 만큼 거듭제곱한 값을 구해 출력한다.<br/>
    - `a = 73, b = 234`라면, `a`를 10으로 나눈 나머지 3을 구한다.<br/>
    - 3은 `3, 9, 7, 1`이 반복되므로, 234번째 거듭제곱의 일의 자리는 `234 % 4 = 2`를 통해 9가 됨을 알 수있다.<br/>
<br/>

---
### 본문<br/>

1. 0부터 9까지의 숫자들의 거듭제곱의 일의 자리들을 저장하는 딕셔너리를 선언한다.<br/>
```Swift
// key값의 거듭제곱의 반복되는 일의 자리 숫자들을 배열로 value에 저장한 딕셔너리 선언
let powered = [
    1: [1],
    2: [6, 2, 4, 8],
    3: [1, 3, 9, 7],
    4: [6, 4],
    5: [5],
    6: [6],
    7: [1, 7, 9, 3],
    8: [6, 8, 4, 2],
    9: [1, 9],
    0: [10],
]
```
- `powered`: 0부터 9까지 각 숫자들을 `key` 값으로 하여, 해당 `key` 값을 거듭제곱하여 나오는 일의 자리들을 배열로서 `value`에 저장한 딕셔너리이다.<br/>
- 반복되는 숫자를 배열로 만들 때 반복되는 숫자가 4개라면, 4번째로 등장하는 숫자를 0번 `index`로 하여 배열을 만든다.<br/>
    - 예를 들어 3을 키 값으로 하는 배열을 만들 때, 반복되는 수는 순서대로 `[3, 9, 7, 1]`이지만, 마지막 수를 맨 처음으로 하여 `[1, 3, 9, 7]`로 저장한다.<br/>
    - `b`를 반복되는 숫자 배열의 크기로 나눈 나머지를 이용할건데, 나머지가 0이라면 나누어 떨어졌다는 의미이며, 이는 4번째인 1이 나와야 하기 때문이다.<br/> 
<br/>

2. 테스트케이스 개수를 입력 받고, 특정 코드를 반복한다.<br/>
```Swift
// 테스트케이스 개수 입력 받음
let T = Int(readLine() ?? "1") ?? 1

for _ in 1...T {
    .
    .
    .
}
```
- `T`: 입력된 테스트케이스의 개수를 저장하는 정수형 상수이다.<br/>
- `T`값으로 몇 번 반복할지 정해져 있으므로, `for문`을 이용해 특정 코드를 반복한다.<br/>
<br/>

3. `a`와 `b`에 따라 처리하는 컴퓨터의 번호를 출력해주는 코드를 작성한다.<br/>
```Swift
// a와 b를 입력 받음
let input = (readLine() ?? "1 1").split(separator: " ").map{ Int($0) ?? 1 }
// 입력 받은 a를 10으로 나눈 나머지로 변경
let a = input[0] % 10

// 변경된 a값을 키 값으로 딕셔너리에서 배열을 구함
let firstPlaces = powered[a] ?? [10]
// 입력 받은 b값을 배열의 크기로 나눈 나머지를 구함
let b = input[1] % firstPlaces.count

// 나눈 나머지에 따라 배열에서 알맞은 결과를 출력
print(firstPlaces[b])
```
- `input`: 입력된 문자열을 띄어쓰기로 나눈 뒤, 정수형으로 변환해 저장한 정수형 배열이다.<br/>
- `a`: 입력된 a값을 10으로 나눈 나머지 값을 저장한 정수형 상수이다.<br/>
- `firstPlaces`: `a` 값을 `powered`의 키 값으로 하여 구한 배열을 저장한 정수형 배열이다.<br/>
- `b`: 입력된 `b`값을 `firstPlaces`의 크기로 나눈 나머지 값을 저장한 정수형 상수이다.<br/>
    - `firstPlaces`의 크기가 4이고, `b`가 4의 배수라면 나머지 값이 0이 나오므로, 얻어야 하는 값은 반복되는 숫자 중 4번째이다.<br/>
    - `firstPlaces`의 크기가 4이고, `b`를 4로 나눈 나머지가 1~3이라면, 반복되는 숫자 중 1~3번째 값이 나와야 한다.<br/>
    - 위와 같은 이유로 `powered`의 `value` 들의 배열의 순서가 저렇다.<br/>
- `firstPlaces`에서 `b`를 인덱스로 하여 나오는 값을 출력한다.<br/>
<br/>

---
### 문제를 맨 처음에 틀렸던 이유<br/>
- `powered`의 `value`로 등장하는 배열들의 순서를 그냥 반복되는 순서로 해 놓았다.<br/>
- `a`를 10으로 나눈 나머지를 `key`값으로 하여, `powered`의 `value`를 구하지 않았다.<br/>
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
        5
        1 6
        3 7
        6 2
        7 100
        9 635
        ```
    - 출력
        ```Swift
        1
        7
        6
        1
        9
        ```
<br/>
