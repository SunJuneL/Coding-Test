import Foundation

// 팩토리얼을 구하는 함수 선언
func factorial(_ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    return [Int](1 ... n).reduce(1){ $0 * $1 }
}

// 변수 N과 K를 입력 받음
let input = (readLine() ?? "1 0").components(separatedBy: " ")
let N = Int(input[0]) ?? 1
let K = Int(input[1]) ?? 0

// 분자 및 분모를 구함
let numerator = factorial(N)
let denominator = factorial(N - K) * factorial(K)

print(numerator / denominator)
