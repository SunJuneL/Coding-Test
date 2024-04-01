# [BOJ 31231 - 마카롱카마](https://www.acmicpc.net/problem/31231)

### 본문
참고 자료: 아직 없음<br/>
예시는 Swift로 들었습니다.<br/>
<br/>

기본 전제
 - N이 홀수인 경우에 중앙에 있는 값을 제외하고, 팰린드롬수가 되기 위해서는 중앙을 기준으로 좌·우를 비교했을 때, 좌·우 중에서 더 큰 값 이상의 수로 데칼코마니 모양을 만들어야 한다.<br/>
     - 예를 들어, 12345의 경우, 5번째 빨간 코크가 5로 정해져 있기 때문에 팰린드롬수를 만들기 위해서는 첫 번째 자리에 크기가 5인 파란 코크가 반드시 와야 한다.<br/>
     - 즉, 좌(1), 우(5) 중에서 우측의 코크 크기가 더 크므로 이 두 개의 자리는 최소 5 이상의 값이 되어야 한다는 의미이다.<br/>
<br/> 

1. 기본적으로 사용할 변수 및 배열을 저장합니다.
```Swift
let MAX_COQUE_SIZE = 10                // 1 ≤ 코크 크기 ≤ 9

var redCoque: [Int] = []                                // [빨간 코크들]를 저장하는 배열
var blueCoque: [Int] = Array(repeating: 0, count: 10)   // [파란 코크들의 개수들]을 저장하는 배열   ex) index(크기 1): count(개수 2)
var answer: [Int] = Array(repeating: 0, count: N)       // [정답 점수]를 저장하는 배열
```
 - `MAX_COQUE_SIZE`: 코크의 최대 크기 (1 ≤ 코크 크기 ≤ 9 이므로 10을 저장)
 - `redCoque`: 빨간 코크를 순서대로 저장할 배열
 - `blueCoque`: 파란 코크 크기 별 개수를 저장할 배열
    - 만약 크기가 3인 파란 코크가 2개 있다고 할때, `blueCoque[3] = 2` 으로 저장한다.
 - `answer`: 정답을 저장할 배열
<br/>

2. N와 input을 입력 받습니다.
```Swift
let N: Int = Int(readLine() ?? "0") ?? 0
let input: String = readLine() ?? ""
```
<br/>

3. 입력(input)을 redCoque와 blueCoque 배열에 알맞게 저장합니다.
``` Swift
func setInputToArrays() {
    for num in input {
        let coqueSize: Int = Int(String(num)) ?? 0             // 입력으로 받는 1개의 코크 크기
        
        // redCoque에는 입력 받은 순서대로 저장
        redCoque.append(coqueSize)
        // blueCoque에는 코크의 크기를 index로 해서 개수를 하나 올림
        blueCoque[coqueSize] += 1
    }
}
```
 - redCoque에는 입력 받은 순서대로 저장합니다. 그리고 이 빨간 코크는 이후 절대 바뀌지 않습니다.
 - blueCoque에는 입력 받은 코크의 크기를 index로 해서 개수를 하나 올립니다. 이렇게 해서 각 코크의 크기 별 개수를 알 수 있도록 합니다.
<br/>
    
4. redCoque에 따라, answer 배열을 데칼코마니 형태로 저장합니다.
```Swift
// redCoque에 따라, answer 배열을 데칼코마니 형태로 저장하는 함수
void setAnswerDecalcomani() {
    int halfIdx = N / 2;                // 중간 index
    
    // N이 홀수일 때, answer에 redCoque의 중앙에 있는 값을 저장
    if (N % 2 != 0) {
        answer[halfIdx] = redCoque[halfIdx];
    }
    
    // 중간 index가 될 때까지 반복함
    for (int i = 0; i < halfIdx; i++) {
        if (redCoque[i] == redCoque[N - 1 -i]) {
            // 좌·우가 동일하다면, blueCoque를 사용하지 않고, answer를 좌·우 대칭으로 만듬
            answer[i] = redCoque[i];
            answer[N - 1 - i] = answer[i];
        } else {
            // 만약, redCoque의 좌·우가 다르다면, 둘 중 큰 크기를 기준으로 파란 코크를 사용하여, answer를 좌·우 대칭으로 만듬
            int biggerSize = -1;
            
            // 좌·우 중에서, 크기가 큰 코크를 정함
            if (redCoque[i] < redCoque[N - 1 - i]) {
                biggerSize = redCoque[N - 1 - i];
            } else {
                biggerSize = redCoque[i];
            }
            
            // answer를 설정
            answer[i] = biggerSize;
            answer[N - 1 - i] = biggerSize;
            
            // 좌·우 중에서 빨간 코크를 적어도 하나 활용했을 테니, 파란 코크를 1개만 사용했음
            blueCoque[biggerSize] -= 1;
        }
    }
}
```
 - answer 배열을 N 값의 중간값 전까지 채울 것이기 때문에, N이 홀수인 경우 따로 채워주어야 합니다.
     - 따라서, N이 홀수일 때 answer에 redCoque 배열의 중앙에 있는 값을 저장해 줍니다.
 - 이후, 0부터 N의 중간값 전까지 아래의 항목들을 반복합니다.<br/>
     1. 만약 현재 지점에서 빨간 코크의 좌·우가 데칼코마니처럼 동일하다면 따로 파란 코크를 사용해야할 필요가 없습니다.<br/>
         - 따라서 blueCoque를 사용하지 않고, 해당 지점의 answer 값을 좌·우 대칭으로 만듭니다.<br/>
     2. 만약 현재 지점에서 빨간 코크의 좌·우가 다르다면, 둘 중 큰 크기를 기준으로 answer를 데칼코마니처럼 좌·우 대칭으로 만들어야 합니다.<br/>
         - 이때, 좌·우 중에서 빨간 코크를 적어도 하나 활용했을 것입니다. 따라서 파란 코크를 1개만 사용합니다.<br/>
<br/>

5. 남은 파란 코크를 사용해서 answer 점수를 크게 만듭니다.
```Swift
// 남은 파란 코크를 사용해서 answer 점수를 크게 만드는 함수
void useRestBlueCoque() {
    int halfIdx = N / 2;                // 중간 index
    
    for (int i = 0; i < halfIdx; i++) {
        int maxCoqueSize = findBiggestBlueCoque(2);             // 2개 이상이며, 가장 크기가 큰 파란 코크를 구함

        if (maxCoqueSize > answer[i]) {
            // 크기가 가장 큰 파란 코크가 현재 index의 answer보다 큰 경우 바꿔줌!
            if (answer[i] == redCoque[i]) {
                // 만약 좌측 코크로 빨간 코크를 사용했다면(파란 코크를 사용하지 않았다면), 파란 코크 반납하지 않고 그냥 변경
                answer[i] = maxCoqueSize;
            } else {
                // 만약 좌측 코크로 파란 코크를 사용했다면, 이전 크기의 파란 코크를 반납하고 크기가 큰 파란 코크로 변경
                blueCoque[answer[i]] += 1;
                answer[i] = maxCoqueSize;
            }

            if (answer[N - 1 - i] == redCoque[N - 1 - i]) {
                // 만약 우측 코크로 빨간 코크를 사용했다면(파란 코크를 사용하지 않았다면), 파란 코크 반납하지 않고 그냥 변경
                answer[N - 1 - i] = maxCoqueSize;
            } else {
                // 만약 우측 코크로 파란 코크를 사용했다면, 이전 크기의 파란 코크를 반납하고 크기가 큰 파란 코크로 변경
                blueCoque[answer[N - 1 - i]] += 1;
                answer[N - 1 - i] = maxCoqueSize;
            }

            // 변경해준 크기가 큰 코크를 2개 사용했으므로 개수를 2개 줄임
            blueCoque[maxCoqueSize] -= 2;
        }
    }
    
    // 마지막으로, 남은 파란 코크 중 크기가 가장 큰 코크보다 빨간 코크의 중앙에 있는 코크 크기가 작을 수도 있음
    // 단, 홀수인 경우만 해당됨
    if (N % 2 != 0) {
        int maxCoqueSize = findBiggestBlueCoque(1);
        
        if (maxCoqueSize > answer[halfIdx]) {
            answer[halfIdx] = maxCoqueSize;
        }
    }
}
```
 - 만약 특정 크기의 파란 코크가 2개 이상 남았을 경우, 기존에 있는 answer의 한 지점 값을 변경해도 반대편 값 또한 변경시켜서 데칼코마니처럼 만들 수 있다.
     - 따라서, 남은 파란색 코크 중 개수가 2개 이상이고, 크기가 가장 큰 코크 크기를 구한다.
     - 앞 자리 수부터 비교해 N의 중간값 전까지 크기가 가장 크고 개수가 2개 이상인 파란 코크의 크기와 비교한다.
         - 점수가 가장 크려면 가장 큰 숫자가 앞자리에 올 수록 유리하다는 전제 조건이 깔려 있다.
     - 만약 파란 코크의 크기가 더 크다면 해당 지점의 answer값을 변경한다. 그리고 blueCoque에 저장된 파란 코크들의 개수를 조정한다.
         - 이때, 해당 지점 answer의 좌측 혹은 우측 코크가 빨간 코크에서 비롯된 것일 수 있다. 이런 경우에는 파란 코크의 개수를 증가시키면 안된다.
         - 만약, 파란 코크로 해당 지점 answer 코크의 크기를 지정했다면, 이제 사용하지 않으니 blueCoque 배열에서 해당 크기의 개수를 1 증가시킨다.
         - 이후, blueCoque 배열에서 파란 코크 2개를 사용해 answer에 적어주었기 때문에 그 크기의 파란 코크 개수를 2개 줄인다.
     - 마지막으로, 남은 파란 코크 중 크기가 가장 큰 코크와 answer 배열의 중간에 있는 코크 크기를 비교한다.
         - 남은 파란 코크 중 크기가 가장 큰 코크보다 중앙에 있는 빨간 코크의 코크 크기가 작을 수도 있기 때문이다.
         - 단, 홀수인 경우에만 해당된다.
<br/>

---
### 문제를 맨 처음에 틀렸던 이유<br/>
1. N이 홀수인 경우, 좌·우가 팰린드롬수처럼 잘 배치되었다. 그러나, 중앙에 있는 값이 남은 파란 코크를 사용하면 더 커질 수 있었다.
    - 실패한 테스트 케이스: 테스트 케이스 5
    - 이 때의 결과: 7897987
    
2. answer의 재설정 중, 기존 코크를 남은 파란 코크의 가장 큰 값으로 변경하는 부분에서, 기존 좌·우에 있는 코크들이 모두 파란 코크라고 생각하고 교환 후 파란 코크 배열(blueCoque)에 2개를 더 추가한 것에서 오류가 났다.
    - 실패한 테스트 케이스: 테스트 케이스 6
    - 이 때의 결과: 44333344
<br/>

---
### 시험한 테스트 케이스
<br/>

테스트 케이스 1
- 기본적으로 백준에 써 있는 테스트 케이스 입니다.
    ```Swift
    입력
        5
        12345
    출력
        54345
    ```
<br/>
    
테스트 케이스 2
- 기본적으로 백준에 써 있는 테스트 케이스 입니다.
    ```Swift
    입력
        7
        1234321
    출력
        3234323
    ```
<br/>

테스트 케이스 3
- N이 작아도 잘 작동하는지 확인하는 테스트 케이스 입니다.
    ```Swift
    입력
        1
        8
    출력
        8
    ```
<br/>

테스트 케이스 4
- 중간을 기준으로 좌·우가 같은 경우에도 오류 없이 잘 작동하는지 확인하는 테스트 케이스 입니다.
    ```Swift
    입력
        8
        32334321
    출력
        33344333
    ```
<br/>

테스트 케이스 5
- N이 홀수이고, 좌·우를 잘 배치했어도 중앙에 있는 값이 더 커질 수 있음을 확인하는 테스트 케이스 입니다.
    ```Swift
    입력
        7
        7897823
    출력
        7898987
    ```
<br/>

테스트 케이스 6
- answer를 재설정하는 과정에서, 남은 파란 코크의 개수가 파란 코크의 전체 개수보다 커지지 않음을 확인하는 테스트 케이스 입니다.
    ```Swift
    입력
        8
        43211234
    출력
        44322344
    ```
