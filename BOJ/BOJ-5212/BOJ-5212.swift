//
//  main.swift
//  Swift_Language
//
//  Created by 이선준 on 1/23/24.
//

import Foundation

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

// 50년 후의 지도 결과 확인
for y in minY ... maxY {
    for x in minX ... maxX {
        print(resultMap[y][x], terminator: "")
    }
    print("")
}
