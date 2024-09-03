# [(BOJ-2163) 초콜릿 자르기(Swift)](https://www.acmicpc.net/problem/2163)

### 기본 전제<br/>
- 두 정수 `N`, `M`이 주어진다.<br/>
    - `N`, `M`의 범위는 1 이상 300 이하이다.<br/>
- `N × M` 크기의 초콜릿을 1 × 1 크기의 초콜릿으로 쪼개기 위한 횟수를 구해 출력한다.<br/>
<br/>

### 주의 사항<br/>
- 없음.<br/>
<br/>

### 전략<br/>
- `N × M` 초콜릿을 1 × 1 크기의 초콜릿으로 쪼개는 횟수는 항상 `N × M - 1` 이다.<br/>
<br/>

---
### 본문<br/>

1. N, M을 입력 받고, `N × M - 1`을 출력한다.<br/>
```Swift
// N, M을 입력 받고, N × M - 1 출력
print(readLine()!.split(separator: " ").reduce(1){ $0 * Int($1)!} - 1)
```
- `readLine()!.split(separator: " ")` 부분을 통해 `N`, `M`을 입력받는다.<br/>
- `reduce(1){ ... } - 1`부분을 통해 `N × M - 1`을 구한다.<br/> 
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
- `N × M` 초콜릿을 1 × 1 크기의 초콜릿으로 쪼개는 횟수는 항상 `N × M - 1` 이다.<br/>
    - 원래는 재귀함수를 통해 풀었다.<br/>
        ```Swift
        import Foundation

        func crackChocolate(N: Int, M: Int) -> Int {
            // 1 × 1 크기의 초콜릿
            if N == 1 && M == 1 {
                return 0
            }
            
            if N > M {
                if N % 2 == 0 {
                    return 1 + 2 * crackChocolate(N: N / 2, M: M)
                } else {
                    return 1 + crackChocolate(N: N / 2, M: M) + crackChocolate(N: N / 2 + 1, M: M)
                }
            } else {
                if M % 2 == 0 {
                    return 1 + 2 * crackChocolate(N: N, M: M / 2)
                } else {
                    return 1 + crackChocolate(N: N, M: M / 2) + crackChocolate(N: N, M: M / 2 + 1)
                }
            }
        }
        
        let input = (readLine() ?? "1 1").split(separator: " ").map{ Int($0) ?? 1 }
        print(crackChocolate(N: input[0], M: input[1]))
        ```
<br/>

--- 
### 푸는데 참고한 참고 자료<br/>
- [buttercrab님의 풀이](https://www.acmicpc.net/source/11082478)<br/>
<br/>

---
### 시험한 테스트 케이스
<br/>

테스트 케이스 1<br/>
- 기본적으로 백준에 써 있는 테스트케이스이다.<br/>
    - 입력
        ```Swift
        2 2
        ```
    - 출력
        ```Swift
        3
        ```
<br/>

테스트 케이스 2<br/>
- 기본적으로 백준에 써 있는 테스트케이스이다.<br/>
    - 입력
        ```Swift
        1 1
        ```
    - 출력
        ```Swift
        0
        ```
<br/>
