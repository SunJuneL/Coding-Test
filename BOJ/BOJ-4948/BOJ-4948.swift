import Foundation

// 소수를 확인할 범위의 최대값 선언
let limit = 2 * 123456

// 소수를 저장하는 배열
var isPrime = [false, false] + Array(repeating: true, count: limit - 1)

// 에라토스테네스의 체를 이용해 소수인지 아닌지 거름
for i in 0...Int(sqrt(Double(limit))) {
    // i가 소수라면, i를 제외한 i의 배수들은 모두 소수가 아님
    if isPrime[i] {
        for j in stride(from: (2 * i), through: limit, by: i) {
            isPrime[j] = false
        }
    }
}

while true {
    // 자연수 n 입력 받음
    let n = Int(readLine() ?? "1") ?? 1
    
    // n이 0이면 반복문 정지
    if n == 0 {
        break
    }
    
    // n보다 크고, 2n보다 작거나 같은 소수의 개수 출력
    print(isPrime[(n + 1) ... (2 * n)].filter{ $0 }.count)
}
