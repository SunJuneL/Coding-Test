//
//  main.swift
//  Swift_Language
//
//  Created by 이선준 on 1/23/24.
//

import Foundation

// 조건
let MAX_COQUE_SIZE = 10                // 1 ≤ 코크 크기 ≤ 9

// MARK: - 입력 받기 및 기본 세팅

// N와 input을 입력받음
let N: Int = Int(readLine() ?? "0") ?? 0
let input: String = readLine() ?? ""

// 배열 설정
var redCoque: [Int] = []                                // [빨간 코크들]를 저장하는 배열
var blueCoque: [Int] = Array(repeating: 0, count: 10)   // [파란 코크들의 개수들]을 저장하는 배열   ex) index(크기 1): count(개수 2)
var answer: [Int] = Array(repeating: 0, count: N)       // [정답 점수]를 저장하는 배열


// MARK: - 함수 선언

// [빨간 코크들]을 출력하는 함수
func printRedCoque() {
    print("Red Coque: ", terminator: "")
    for num in redCoque {
        print("[\(num)]", terminator: "")
    }
    print("")
}

// [파란 코크들의 개수]를 출력하는 함수
func printBlueCoque() {
    print("Blue Coque: ", terminator: "")
    for num in 0 ..< blueCoque.count {
        print("[\(num): \(blueCoque[num])]", terminator: "")
    }
    print("")
}

// 정답 코크의 점수를 출력하는 함수
func printAnswer() {
//    print("Answer: ", terminator: "")
    for num in answer {
//        print("[\(num)]", terminator: "")
         print("\(num)", terminator: "")
    }
    print("")
}

// 입력(input)을 redCoque와 blueCoque 배열에 알맞게 저장하는 함수
func setInputToArrays() {
    for num in input {
        let coqueSize: Int = Int(String(num)) ?? 0             // 입력으로 받는 1개의 코크 크기
        
        // redCoque에는 입력 받은 순서대로 저장
        redCoque.append(coqueSize)
        // blueCoque에는 코크의 크기를 index로 해서 개수를 하나 올림
        blueCoque[coqueSize] += 1
    }
    
//    print("SetInputToArrays()")
//    printRedCoque()
//    printBlueCoque()
//    print("")
}

// redCoque에 따라, answer 배열을 데칼코마니 형태로 저장하는 함수
func setAnswerDecalcomani() {
    let halfIdx: Int = N / 2                // 중간 index
    
    // N이 홀수일 때, answer에 redCoque의 중앙에 있는 값을 저장
    if N % 2 != 0 {
        answer[halfIdx] = redCoque[halfIdx]
    }
    
    // 중간 index가 될 때까지 반복함
    for idx in 0 ..< halfIdx {
        if redCoque[idx] == redCoque[N - 1 - idx] {
            // 좌·우가 동일하다면, blueCoque를 사용하지 않고, answer를 좌·우 대칭으로 만듬
            answer[idx] = redCoque[idx]
            answer[N - 1 - idx] = answer[idx]
        } else {
            // 만약, redCoque의 좌·우가 다르다면, 둘 중 큰 크기를 기준으로 파란 코크를 사용하여, answer를 좌·우 대칭으로 만듬
            var biggerSize: Int = -1
            
            // 좌·우 중에서, 크기가 큰 코크를 정함
            if redCoque[idx] < redCoque[N - 1 - idx] {
                biggerSize = redCoque[N - 1 - idx]
            } else {
                biggerSize = redCoque[idx]
            }
            
            // answer를 설정
            answer[idx] = biggerSize
            answer[N - 1 - idx] = biggerSize
            
            // 좌·우 중에서 빨간 코크를 적어도 하나 활용했을 테니, 파란 코크를 1개만 사용했음
            blueCoque[biggerSize] -= 1
        }
    }
    
//    print("SetInputToArrays()")
//    printRedCoque()
//    printBlueCoque()
//    printAnswer()
//    print("")
}

// 남은 파란 코크 중에서 크기가 가장 크고, 개수가 count 이상인 코크 크기를 리턴하는 함수
// 남은 코크가 없다면 -1을 리턴
func findBiggestBlueCoque(_ count: Int) -> Int {
    var biggestSize: Int = MAX_COQUE_SIZE - 1
    
    while (biggestSize >= 0) {
        if blueCoque[biggestSize] >= count {
            return biggestSize
        }
        biggestSize -= 1
    }
    return -1
}

// 남은 파란 코크를 사용해서 answer 점수를 크게 만드는 함수
func useRestBlueCoque() {
    let halfIdx: Int = N / 2                // 중간 index
    
    for i in 0 ..< halfIdx {
        let maxCoqueSize: Int = findBiggestBlueCoque(2)                 // 2개 이상이며, 가장 크기가 큰 파란 코크를 구함
        
        if maxCoqueSize > answer[i] {
            // 크기가 가장 큰 파란 코크가 현재 index의 answer보다 큰 경우 바꿔줌!
            if answer[i] == redCoque[i] {
                // 만약 좌측 코크로 빨간 코크를 사용했다면(파란 코크를 사용하지 않았다면), 파란 코크 반납하지 않고 그냥 변경
                answer[i] = maxCoqueSize
            } else {
                // 만약 좌측 코크로 파란 코크를 사용했다면, 이전 크기의 파란 코크를 반납하고 크기가 큰 파란 코크로 변경
                blueCoque[answer[i]] += 1
                answer[i] = maxCoqueSize
            }
            
            if answer[N - 1 - i] == redCoque[N - 1 - i] {
                // 만약 우측 코크로 빨간 코크를 사용했다면(파란 코크를 사용하지 않았다면), 파란 코크 반납하지 않고 그냥 변경
                answer[N - 1 - i] = maxCoqueSize
            } else {
                // 만약 우측 코크로 파란 코크를 사용했다면, 이전 크기의 파란 코크를 반납하고 크기가 큰 파란 코크로 변경
                blueCoque[answer[N - 1 - i]] += 1
                answer[N - 1 - i] = maxCoqueSize
            }
            
            // 변경해준 크기가 큰 코크를 2개 사용했으므로 개수를 2개 줄임
            blueCoque[maxCoqueSize] -= 2
        }
    }
    
    // 마지막으로, 남은 파란 코크 중 크기가 가장 큰 코크보다 빨간 코크의 중앙에 있는 코크 크기가 작을 수도 있음
    // 단, 홀수인 경우만 해당됨
    if (N % 2 != 0) {
        let maxCoqueSize: Int = findBiggestBlueCoque(1);
        
        if (maxCoqueSize > answer[halfIdx]) {
            answer[halfIdx] = maxCoqueSize;
        }
    }
    
    
//    print("UseRestBlueCoque()")
//    printRedCoque()
//    printBlueCoque()
//    printAnswer()
//    print("")
}

// MARK: - 함수 실행
setInputToArrays()              // 입력(input)을 redCoque와 blueCoque 배열에 알맞게 저장
setAnswerDecalcomani()          // redCoque에 따라, answer 배열을 데칼코마니 형태로 저장
useRestBlueCoque()              // 남은 파란 코크를 사용해서 answer 점수를 크게 만듬
printAnswer()                   // 정답으로 설정한 점수 출력
