# [BOJ 5212 - 지구 온난화](https://www.acmicpc.net/problem/5212)

### 본문
참고 자료: 아직 없음<br/>
예시는 Swift로 들었습니다.<br/>
Swift로만 풀었습니다.(C++로는 안했습니다.)<br/>
<br/>

기본 전제
 - 지도 외부는 모두 바다이다.<br/>
     - 즉, 지도 모서리에 있는 섬은 바다가 2개 있다는 전제로 시작한다.<br/>
<br/>

1. 기본적으로 사용할 변수 및 배열을 저장합니다.<br/>
```Swift
// 지도의 크기 R과 C를 입력 받음
let mapSize: [Int] = (readLine() ?? "0").split(separator: " ").map({ Int($0) ?? 0 })
let R: Int = mapSize[0]
let C: Int = mapSize[1]

// 지도를 입력 받음
var map: [[String]] = Array(repeating: [], count: R)
for i in 0 ..< R {
    let line: [String] = (readLine() ?? "").map({ String($0) })
    map[i] = line
}

// 50년 뒤의 지도 결과를 담을 배열
var resultMap: [[String]] = Array(repeating: Array(repeating: ".", count: C), count: R)
```
 - `R`: 지도의 세로 크기<br/>
 - `C`: 지도의 가로 크기<br/>
 - `map`: 지도의 내용을 받아올 배열<br/>
 - `resultMap`: 50년 뒤의 지도 결과를 저장할 배열<br/>
 <br/>

2. 현재 있는 각 섬들을 방문하면서, 50년 뒤에 없어질지 아닐지 확인합니다.<br/>
```Swift
// 현재 섬이 50년 뒤에 없어질지 아닐지 확인하는 함수
func checkIsStillLand(x: Int, y: Int) {
    // x가 범위 밖이라면 리턴
    if x < 0 || C <= x {
        return
    }
    // y가 범위 밖이라면 리턴
    if y < 0 || R <= y {
        return
    }
    
    // 방향을 나타냄 (왼쪽, 위쪽, 오른쪽, 아래쪽 순)
    let dx: [Int] = [-1, 0, 1, 0]
    let dy: [Int] = [0, -1, 0, 1]
 
    // 바다를 카운트하기 위한 변수
    var oceanCount: Int = 0
    
    // 4방향을 체크해서, 3 방향 이상이 바다라면 없어짐을, 아니라면 계속 섬임을 확인
    for dir in 0 ..< 4 {
        // 현재 방향으로 바라보는 한칸 앞
        let dirX: Int = x + dx[dir]
        let dirY: Int = y + dy[dir]
        
        // 현재 바라보는 곳이 지도 범위 이외라면 바다이므로 바다 카운트를 1 올림
        if dirX < 0 || C <= dirX {
            oceanCount += 1
            continue
        }
        if dirY < 0 || R <= dirY {
            oceanCount += 1
            continue
        }
        
        // 현재 바라보는 곳이 바다라면 바다 카운트를 1 올림, 섬이라면 넘어감.
        if map[dirY][dirX] == "." {
            oceanCount += 1
        } else if map[dirY][dirX] != "X" {
            print("map[\(dirY)][\(dirX)] 값이 \".\"도, \"X\"도 아닙니다...")
        } else {
            // print("map[\(dirY)][\(dirX)] 값이 \"X\"입니다!")
        }
    }
    
    // 바다 카운트가 3 이상이라면 resultMap에 바다로, 아니라면 섬이라고 작성
    if oceanCount >= 3 {
        resultMap[y][x] = "."
    } else {
        resultMap[y][x] = "X"
    }
}

// 지도의 모든 섬을 방문하면서 아직 섬인지, 아니면 바다가 되는지 확인 후 resultMap에 작성함
for y in 0 ..< R {
    for x in 0 ..< C {
        if map[y][x] == "X" {
            checkIsStillLand(x: x, y: y)
        }
    }
}
```
 - 현재 섬인 곳에서 동서남북(`dirX`, `dirY`)를 바라봅니다.<br/>
 - 바라본 곳이 바다라면 바다 카운트(`oceanCount`)를 `1` 올립니다.<br/>
    - 이때, 바라본 곳이 지도 범위 밖이라도 바다이므로 바다 카운트를 `1` 올립니다.<br/>
 - 동서남북 한 바퀴를 돌았을 때, 바다 카운트가 `3` 이상이라면 바다로 변합니다.<br/>
    - 따라서, `resultMap`에 현재 장소를 `"."`으로 저장합니다.<br/>
    - `3` 이하라면 그대로 섬이므로, `resultMap`에 현재 장소를 `"X"`로 저장합니다.<br/>
 - 위 행동을 현재의 모든 섬에 대하여 반복합니다.<br/>
<br/>

3. 50년 뒤의 지도의 범위를 줄입니다.<br/>
``` Swift
// 새로운 지도의 범위를 구할 변수들 설정
var minX = C, minY = R, maxX = 0, maxY = 0

// 새 지도를 확인하면서 범위를 줄임
for y in 0 ..< R {
    for x in 0 ..< C {
        if resultMap[y][x] == "X" {
            // x 범위 조절
            if minX > x {
                minX = x
            }
            if maxX < x {
                maxX = x
            }
            
            // y 범위 조절
            if minY > y {
                minY = y
            }
            if maxY < y {
                maxY = y
            }
        }
    }
}
```
 - `minX`, `minY`는 지도의 가로, 세로의 최대 크기인 `C`와 `R`로 설정해준다.<br/>
 - `maxX`, `maxY`는 둘 다 지도의 가로, 세로의 최소 크기인 `0`으로 설정해준다.<br/>
 - `resultMap`의 모든 요소를 확인하면서, `"X"`가 있는 지점이 되었을 때 `minX`, `minY`, `maxX`, `maxY`를 모두 확인하고, 변경사항이 있다면 수정한다.<br/>
<br/>

4. 범위를 줄인, 50년 뒤 지도를 출력합니다.<br/>
``` Swift
// 50년 후의 지도 결과 확인
for y in minY ... maxY {
    for x in minX ... maxX {
        print(resultMap[y][x], terminator: "")
    }
    print("")
}
```
 - 구한 새로운 지도 범위인 `minX`, `maxX`, `minY`, `maxY`를 활용하여 50년 뒤 지도인 `resultMap`을 출력합니다.<br/>
 - `x`의 범위는 `minX`부터 `maxX`까지, `y`의 범위는 `minY`부터 `maxY`까지 입니다.<br/> 
<br/>

---
### 문제를 맨 처음에 틀렸던 이유<br/>
- 없습니다.<br/>
<br/>

---
### 시험한 테스트 케이스
<br/>

테스트 케이스 1<br/>
- 기본적으로 백준에 써 있는 테스트 케이스 입니다.<br/>
    ```Swift
    입력
        5 3
        ...
        .X.
        .X.
        .X.
        ...
    출력
        X
    ```
<br/>

테스트 케이스 2<br/>
- 기본적으로 백준에 써 있는 테스트 케이스 입니다.<br/>
    ```Swift
    입력
        3 10
        ..........
        ..XXX.XXX.
        XXX.......
    출력
        .XX...X
        XX.....
    ```
<br/>

테스트 케이스 3<br/>
- 50년 뒤 새로운 지도에서 중간에 바다만 있는 부분이 스킵되는지 확인하는 테스트 케이스 입니다.<br/>
    ```Swift
    입력
        3 3
        XXX
        ...
        XXX
    출력
        X
        .
        X
    ```
<br/>
