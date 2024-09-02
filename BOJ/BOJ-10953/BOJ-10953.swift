import Foundation

// 테스트케이스 개수 T 입력 받음
let T = Int(readLine() ?? "1") ?? 1

for _ in 1 ... T {
    // 두 수 A, B를 입력 받음
    let input = (readLine() ?? "1,1").split(separator: ",").map{ Int($0) ?? 1 }
    print(input[0] + input[1])
}
