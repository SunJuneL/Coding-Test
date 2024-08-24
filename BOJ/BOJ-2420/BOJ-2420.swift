import Foundation

// N과 M 입력 받음
let input = (readLine() ?? "0 0").split(separator: " ").map{ Int($0) ?? 0 }
let N = input[0]
let M = input[1]

// N과 M의 차이를 구함
print(max(N, M) - min(N, M))
