import Foundation

// 최대공약수를 구하는 함수 선언
func GCD(_ num1: Int, _ num2: Int) -> Int {
    var big = max(num1, num2)
    var small = min(num1, num2)
    
    // 유클리드 호제법 이용
    while small != 0 {
        let temp = small
        small = big % small
        big = temp
    }
    
    return big
}

// 테스트케이스 개수 입력 받음
let T = Int(readLine() ?? "1") ?? 1

// 테스트케이스 개수 만큼 이하의 코드 반복
for _ in 1 ... T {
    // 두 자연수 A, B 입력 받음
    let input = (readLine() ?? "1 1").split(separator: " ").map{ Int($0) ?? 1 }
    let A = input[0]
    let B = input[1]
    
    // 최소공배수 구하고 출력
    let lcm = A * B / GCD(A, B)
    print(lcm)
}
