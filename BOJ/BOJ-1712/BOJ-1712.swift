import Foundation

// A, B, C 입력 받음
let input = (readLine() ?? "0 0 0").components(separatedBy: " ").map{ Int($0) ?? 0 }
let A = input[0]
let B = input[1]
let C = input[2]

// 노트북 1대로 얻을 수 있는 이익
let profit = C - B

// 이익에 따라 다른 값을 출력
if profit > 0 {
    print((A / profit) + 1)
} else {
    print(-1)
}
