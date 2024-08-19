import Foundation

// 약수의 개수 입력 받음
let divisorsCount = Int(readLine() ?? "1") ?? 1
// 약수 입력 받음
let divisors = (readLine() ?? "2").split(separator: " ").map{ Int($0) ?? 2 }

// N 구하기
let N = (divisors.min() ?? 2) * (divisors.max() ?? 2)

// N 출력
print(N)
