import Foundation

// N을 입력 받음
let N = Int(readLine() ?? "1") ?? 1

// 별 문자열 초기화
var stars = ""
for _ in 1 ... (2 * N - 1) {
    stars.append("*")
}

// 규칙에 따라 2 * N - 1 개의 줄 출력
for i in 1 ... (2 * N - 1) {
    // 첫 줄부터 N 줄까지, 별을 2개 줄이고 공백을 1개 추가
    if 1 < i && i <= N {
        stars.removeLast()
        stars.removeLast()
        stars = " " + stars
    }
    // N 줄 이후, 공백을 1개 줄이고 별 2개 추가
    if N < i {
        stars.removeFirst()
        stars.append("*")
        stars.append("*")
    }
    // 줄을 출력한다.
    print(stars)
}
