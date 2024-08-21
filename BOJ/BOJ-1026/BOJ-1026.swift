import Foundation

// N 입력 받음
let N = Int(readLine() ?? "1") ?? 1

// 배열 A, B 입력 받음
let A = (readLine() ?? "0").split(separator: " ").map{ Int($0) ?? 0 }
let B = (readLine() ?? "0").split(separator: " ").map{ Int($0) ?? 0 }

// A 배열은 오름차순으로, B 배열은 내림차순으로 정렬
let ascendingA = A.sorted(by: <)
let descendingB = B.sorted(by: >)

// 함수 S 선언
var S = 0

// S 값 구하기
for i in 0 ..< N {
    S += (ascendingA[i] * descendingB[i])
}

// S 출력
print(S)
