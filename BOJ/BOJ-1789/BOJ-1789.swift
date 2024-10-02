import Foundation

// 자연수 S 입력 받음
let S = Int(readLine() ?? "") ?? 1

// 자연수 개수 n 선언
var n = 1

// n값을 1씩 늘리면서, ∑n이 S보다 커지면 멈춤
while (n * (n + 1) / 2) <= S {
    n += 1
}

// 자연수들의 최대 개수 N 선언
let N = n - 1

// N 출력
print(N)
