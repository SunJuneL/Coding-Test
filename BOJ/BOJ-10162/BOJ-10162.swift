import Foundation

// 전자레인지 버튼 선언
let A = 60 * 5
let B = 60
let C = 10

// T 입력 받음
var T = Int(readLine() ?? "1") ?? 1

// A버튼을 몇 번 누를지 구하고, 남은 시간을 구함
let a = T / A
T %= A

// B버튼을 몇 번 누를지 구하고, 남은 시간을 구함
let b = T / B
T %= B

// C버튼을 몇 번 누를지 구하고, 남은 시간을 구함
let c = T / C
T %= C

// T의 값에 따라 다른 값을 출력
if T > 0 {
    print(-1)
} else {
    print("\(a) \(b) \(c)")
}
