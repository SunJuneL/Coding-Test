import Foundation

// 테스트 케이스의 개수를 입력 받음
let T = Int(readLine() ?? "1") ?? 1

// 테스트케이스 개수 만큼 반복함
for _ in 1 ... T {
    // 세 정수 H, W, N을 입력 받음
    // H: 호텔의 층수, W: 각 층의 방 수, N: 몇 번째 손님
    // W는 코드에 딱히 사용되지 않아, 따로 상수 선언을 해주지 않음.
    let numbers = (readLine() ?? "1 1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }
    let H = numbers[0]
    let N = numbers[2]

    // X: 방 번호
    // 방 번호는 N - 1을 H로 나눈 몫에 1을 더하면 구할 수 있다.
    let X = ((N - 1) / H) + 1

    // Y: 층 번호
    // 층 번호는 N을 H로 나눈 나머지를 통해 구할 수 있다. 만약 나머지가 0이라면 가장 최고 층이다.
    let Y = N % H == 0 ? H : N % H

    // 만약, X 값이 10 미만이라면 "Y0X" 형태로 출력해야 한다.
    if X < 10 {
        print("\(Y)0\(X)")
    } else {
        print("\(Y)\(X)")
    }
}
