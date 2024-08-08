import Foundation

// R1과 S를 입력 받음
let input = (readLine() ?? "0 0").components(separatedBy: " ").map{ Int($0) ?? 0 }
let R1 = input[0]
let S = input[1]

// R2 구하기
let R2 = (2 * S) - R1
print(R2)
