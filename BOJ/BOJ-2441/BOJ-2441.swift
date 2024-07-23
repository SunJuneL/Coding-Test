import Foundation

// N 입력받음
let N = Int(readLine() ?? "1") ?? 1

// for문을 이용해 별 출력
// 첫 번째 for문은 한 줄을 의미함
for i in 0 ..< N {
    // 빈 칸을 print함
    for _ in 0 ..< i {
        print(" ", terminator: "")
    }
    // 별을 찍음
    for _ in 0 ..< (N - i) {
        print("*", terminator: "")
    }
    print()
}
