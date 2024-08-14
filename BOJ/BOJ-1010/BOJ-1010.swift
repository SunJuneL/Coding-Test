import Foundation

// 테스트케이스 개수 입력 받음
let T = Int(readLine() ?? "1") ?? 1

// 테스트케이스 개수 만큼 반복
for _ in 1 ... T {
    // N과 M 입력 받음
    let input = (readLine() ?? "1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }
    let N = input[0]
    let M = input[1]
    
    // 다리 놓는 경우의 수를 저장하는 배열 선언
    var bridgeCase = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
    
    // 배열을 DP로 완성시키기
    for n in 1 ... N {
        for m in n ... M {
            if n == 1 {
                bridgeCase[n][m] = m
            } else if n == m {
                bridgeCase[n][m] = 1
            } else {
                bridgeCase[n][m] = bridgeCase[n - 1][m - 1] + bridgeCase[n][m - 1]
            }
        }
    }
    // 경우의 수 출력
    print(bridgeCase[N][M])
}
