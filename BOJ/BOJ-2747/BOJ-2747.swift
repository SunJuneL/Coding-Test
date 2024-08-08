import Foundation

// n을 입력 받음
let n = Int(readLine() ?? "1") ?? 1

// 피보나치 수를 리턴해주는 함수
func fibo(_ n: Int) -> Int {
    // f1, f2는 각각 F(n-2), F(n-1)를 뜻하는 변수
    var f1 = 0
    var f2 = 1
    
    // n이 0일 때, f1을 리턴
    if n == 0 {
        return f1
    }
    // n이 1일 때, f2를 리턴
    if n == 1 {
        return f2
    }
    
    // 그 외에는 f1에는 f2의 값을, f2에는 f1 + f2의 값을 저장한 후, 모든 반복이 끝났을 때 f2를 리턴
    for _ in 1 ..< n {
        let temp = f2
        f2 += f1
        f1 = temp
    }
    
    return f2
}

// 피보나치 수를 출력
print(fibo(n))
