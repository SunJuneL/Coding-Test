import Foundation

// N을 입력 받음
let N = Int(readLine() ?? "0") ?? 0

// 1 부터 N개 까지 반복하며 한 줄을 찍음
// 역순으로 별찍기를 하기 위해서 0 이상 N - i 미만 개수의 별을 찍음
for i in 1 ... N {
    for _ in 0 ... (N - i) {
        print("*", terminator: "")
    }
    print("")
}
