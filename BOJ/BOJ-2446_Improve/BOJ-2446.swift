import Foundation

// N을 입력 받음
let N = Int(readLine() ?? "1") ?? 1

// 규칙에 따라 2 * N - 1 개의 줄 출력
for i in 0 ..< (N - 1) {
    print(String(repeating: " ", count: i), terminator: "")
    print(String(repeating: "*", count: (2 * (N - i) - 1)))
}

for i in 1 ... N {
    print(String(repeating: " ", count: (N - i)), terminator: "")
    print(String(repeating: "*", count: 2 * i - 1))
}
