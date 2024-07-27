# [번외 BOJ 10866 - 덱(Swift)](https://www.acmicpc.net/problem/10866)

### 기본 전제<br/>
 - 확장에서는 어떤 타입이든 저장할 수 있는 덱(Deque) 클래스를 선언하고, 사용한다.<br/>
 - 1 이상 10000 이하 범위의 N값 만큼 명령어가 입력된다.<br/>
    - push_front X: X를 덱의 앞에 넣는다.<br/>
    - push_back X: X를 덱의 뒤에 넣는다.<br/>
    - pop_front: 덱의 가장 앞에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.<br/>
    - pop_back: 덱의 가장 뒤에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.<br/>
    - size: 덱에 들어있는 정수의 개수를 출력한다.<br/>
    - empty: 덱이 비어있으면 1을, 아니면 0을 출력한다.<br/>
    - front: 덱의 가장 앞에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.<br/>
    - back: 덱의 가장 뒤에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.<br/>
<br/>

### 주의 사항<br/>
 - 없음.<br/>
<br/>

### 전략<br/>
 - Swift에 기본적으로 내장된 배열을 사용해 덱을 구현하고, 이 덱을 활용해 문제를 푼다.<br/>
<br/>

---
### 본문<br/>

1. 기본 배열을 활용하여 덱(Deque)를 구현한다.<br/>
```Swift
class Deque<TYPE> {
    /// 데이터
    private var datas: [TYPE] = []
    
    func push_front(_ data: TYPE) {
        datas.insert(data, at: 0)
    }
    
    func push_back(_ data: TYPE) {
        datas.append(data)
    }
    
    func pop_front() -> TYPE? {
        if datas.isEmpty {
            return nil
        }
        return datas.removeFirst()
    }
    
    func pop_back() -> TYPE? {
        if datas.isEmpty {
            return nil
        }
        return datas.removeLast()
    }
    
    func size() -> Int {
        datas.count
    }
    
    func empty() -> Bool {
        datas.isEmpty
    }
    
    func front() -> TYPE? {
        datas.first
    }
    
    func back() -> TYPE? {
        datas.last
    }
}
```
 - `Deque<TYPE>`: `TYPE` 타입의 데이터를 저장하는 덱 컬렉션이다.<br/>
    - 어떤 타입이든 들어올 수 있기 때문에, 값이 없다면 `-1`이 아닌 `nil`을 반환한다.<br/>
 <br/>

2. 명령어 수 `N`을 입력 받고, 덱(Deque)으로 사용할 컬렉션을 선언한다.<br/>
```Swift
// N(명령어 수) 입력 받기
let N = Int(readLine() ?? "1") ?? 1

// 정수형 덱(deque) 선언
var deque = Deque<Int>()
```
 - `N`: 입력 받을 명령어의 수이며, 범위는 1 이상 10000 이하이다.<br/>
 - `deque`: 구현한 덱(Deque) 컬렉션. 정수형으로 선언하여 문제를 푼다.<br/>
 <br/>

3. 명령어 수 `N` 만큼 명령어를 입력 받는다.<br/>
```Swift
// 명령어 입력 받기
for _ in 1 ... N {
    let command = (readLine() ?? "").components(separatedBy: " ")
    
    •
    •
    •
}
```
 - `command`: 입력 받은 문자열을 띄어쓰기 기준으로 나누어, 문자열 배열 형태로 명령어를 저장한 변수이다.<br/>
    - 명령어에 따라, 배열의 길이는 1 또는 2를 갖게 된다. (만약 길이가 1 혹은 2가 아니라면, 입력에 오류가 있는 것이다.)<br/>
<br/>

4. `for`문 내부 코드를 구현한다. (명령어의 배열 길이 기준으로 나누어, 명령어에 따라 동작을 구현한다.)<br/>
```Swift
if command.count == 1 {
    switch command[0] {
    case "front":
        if let front = deque.front() {
            print(front)
        } else {
            print(-1)
        }
    case "pop_front":
        if let front = deque.pop_front() {
            print(front)
        } else {
            print(-1)
        }
    case "back":
        if let back = deque.back() {
            print(back)
        } else {
            print(-1)
        }
    case "pop_back":
        if let back = deque.pop_back() {
            print(back)
        } else {
            print(-1)
        }
    case "size":
        print(deque.size())
    case "empty":
        if deque.empty() {
            print(1)
        } else {
            print(0)
        }
    default:
        print("ERROR!!")
        break
    }
} else if command.count == 2 {
    let data = Int(command[1]) ?? 0
    
    switch command[0] {
    case "push_front":
        deque.push_front(data)
    case "push_back":
        deque.push_back(data)
    default:
        print("ERROR!!")
        break
    }
} else {
    print("ERROR!!")
}
```
 - 명령어에 대한 반환값으로 `nil`이 반환됐다면 -1을 출력한다.<br/>
 - 명령어의 길이가 1 이라면, 명려어만 존재하기 때문에 이에 따라 동작을 구현한다.<br/>
 - 명령어의 길이가 2 라면, 명려어와 뒤에 정수가 존재한다. 따라서 두 번째 요소를 정수형으로 변환해 동작을 구현한다.<br/>
 - 명령어의 길이가 1 혹은 2가 아니라면 입력 받은 명령어에 오류가 있는 것이다.<br/>

---
### 문제를 맨 처음에 틀렸던 이유<br/>
- 없음.<br/>
<br/>

---
### 느낀점<br/>
- 저장되는 데이터가 정수형으로 정해져 있기 때문에, 덱(Deque) 클래스를 구현할 필요 없다.<br/>
    - 시간, 노력 등이 헛수고이다.<br/>
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
        15
        push_back 1
        push_front 2
        front
        back
        size
        empty
        pop_front
        pop_back
        pop_front
        size
        empty
        pop_back
        push_front 3
        empty
        front
        ```
    - 출력
        ```Swift
        2
        1
        2
        0
        2
        1
        -1
        0
        1
        -1
        0
        3
        ```
<br/>

테스트 케이스 2<br/>
- 기본적으로 백준에 써 있는 테스트 케이스이다.<br/>
    - 입력
        ```Swift
        22
        front
        back
        pop_front
        pop_back
        push_front 1
        front
        pop_back
        push_back 2
        back
        pop_front
        push_front 10
        push_front 333
        front
        back
        pop_back
        pop_back
        push_back 20
        push_back 1234
        front
        back
        pop_back
        pop_back
        ```
    - 출력
        ```Swift
        -1
        -1
        -1
        -1
        1
        1
        2
        2
        333
        10
        10
        333
        20
        1234
        1234
        20
        ```
<br/>
