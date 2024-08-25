import Foundation

// n번째 피보나치 수를 구하는 함수 선언
func fibonacci(_ n: Int) -> Int {
    // Fn = Fn-2 + Fn-1 중 Fn-2에 해당
    var f0 = 0
    // Fn = Fn-2 + Fn-1 중 Fn-1에 해당
    var f1 = 1
    
    // n이 1보다 클 때, Fn = Fn-2 + Fn-1 수행
    if 1 < n {
        for _ in 2 ... n {
            let f2 = f0 + f1
            f0 = f1
            f1 = f2
        }
    }
    return f1
}

// n 입력 받음
let n = Int(readLine() ?? "1") ?? 1

// n번째 피보나치 수 출력
print(fibonacci(n))
