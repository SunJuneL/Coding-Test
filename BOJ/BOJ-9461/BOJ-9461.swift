import Foundation

// 테스트케이스 개수 입력 받음
let T = Int(readLine() ?? "1") ?? 1

// 테스트케이스 개수만큼 반복
for _ in 1 ... T {
    // 숫자 N을 입력 받음
    let N = Int(readLine() ?? "1") ?? 1
    
    // P 수열을 저장할 배열 선언
    var P: [Int] = [0]
    
    // P[N] 구하기
    for i in 1 ... N {
        if i <= 3 {
            P.append(1)
        } else if i <= 5 {
            P.append(2)
        } else {
            P.append(P[i - 1] + P[i - 5])
        }
    }
    
    // P[N] 출력
    print(P[N])
}
