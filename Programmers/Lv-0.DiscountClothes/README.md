# [프로그래머스 - 옷가게 할인 받기](https://school.programmers.co.kr/learn/courses/30/lessons/120818)

### 본문
참고 자료: 아직 없음<br/>
예시는 Swift로 들었습니다.<br/>
Swift로만 풀었습니다.(C++로는 안했습니다.)<br/>
<br/>

기본 전제
 - 딱히 없다.<br/>
<br/>

1. 각 조건이 되는 금액 이상일 경우 할인된 가격을 리턴합니다.<br/>
```Swift
// n과 [이동비용들]을 입력 받음
func solution(_ price: Int) -> Int {
    if price >= 500000 {
        // 50 만원 이상 사면 20% 할인
        return price * 4 / 5
    } else if price >= 300000 {
        // 30 만원 이상 사면 10% 할인
        return price * 9 / 10
    } else if price >= 100000 {
        // 10 만원 이상 사면 5% 할인
        return price * 19 / 20
    } else {
        // 그 이하라면 본래 가격대로임
        return price
    }
}
```
 <br/>

---
### 문제를 맨 처음에 틀렸던 이유<br/>
- 없습니다.<br/>
<br/>

---
### 시험한 테스트 케이스
<br/>

테스트 케이스 1<br/>
- 기본적으로 프로그래머스에 써 있는 테스트 케이스 입니다.<br/>
    ```Swift
    입력
        150,000
    출력
        142,500
    ```
<br/>

테스트 케이스 2<br/>
- 기본적으로 프로그래머스에 써 있는 테스트 케이스 입니다.<br/>
    ```Swift
    입력
        580,000
    출력
        464,000
    ```
<br/>
