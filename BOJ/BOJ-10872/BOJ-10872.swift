import Foundation

// N을 입력 받는다
let N = Int(readLine() ?? "0") ?? 0

// N!의 결과를 저장할 변수
var result = 1

// N이 0보다 크다면 1부터 N까지 모든 값들을 다 곱해 result에 저장
if 0 < N {
    for n in 1 ... N {
        result *= n
    }
}

// result 출력
print(result)
