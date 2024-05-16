import Foundation

// n의 최대값
let maxN = 1000001

// 소수인지 판별할 배열
var isPrimeNumber = Array(repeating: true, count: maxN)

// 에라토스테네스의 체를 이용해 소수들을 구하는 함수
func eratosthenes() {
    // 0과 1은 소수가 아님
    isPrimeNumber[0] = false
    isPrimeNumber[1] = false
    
    // 2부터 제한된 값 까지 확인하며, 해당 소수의 배수를 거름 (에라토스테네스의 체)
    var i = 2
    while (i * i < maxN) {
        if isPrimeNumber[i] == true {
            var j = 2
            while (i * j < maxN) {
                isPrimeNumber[i * j] = false
                j += 1
            }
        }
        i += 1
    }
}

// 소수들의 합(골드바흐 추측)을 구하는 함수
func goldbach(_ n: Int) -> String {
    // n의 절반
    let limit = n / 2
    
    // 3부터 limit까지 값 i와 n에서 i를 뺀 값 j를 소수인지 아닌지 확인해서 둘 다 소수이면 String을 리턴함
    for i in 3 ... stride(from: 3, through: limit, by: 2) {
        let j = n - i
        if isPrimeNumber[i] && isPrimeNumber[j] {
            return "\(n) = \(i) + \(j)"
        }
    }
    
    // 골드바흐의 추측이 틀렸다면 String 리턴
    return "Goldbach's conjecture is wrong."
}

// 정답을 출력할 함수
func answer() {
    while true {
        // n을 입력받음
        let n = Int(readLine() ?? "0") ?? 0
        
        // n의 값이 0이라면 리턴
        if n == 0 {
            return
        }
        
        // 골드바흐 추측 함수의 결과를 print
        print(goldbach(n))
    }
}

eratosthenes()
answer()
