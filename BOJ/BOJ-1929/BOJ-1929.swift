import Foundation

// M, N을 입력 받음
let input = (readLine() ?? "1 1000000").components(separatedBy: " ")
let M = Int(input[0]) ?? 1
let N = Int(input[1]) ?? 1000000

// 에라토스테네스의 체
var eratosthenes = [Bool](repeating: true, count: N + 1)

for i in 0 ... Int(sqrt(Double(N))) {
    if i == 0 || i == 1 {
        eratosthenes[i] = false
    }
    
    if !eratosthenes[i] {
        continue
    }
    
    for j in i + 1 ... N {
        if j % i == 0 {
            eratosthenes[j] = false
        }
    }
}

// 소수 출력
for i in M ... N {
    if eratosthenes[i] {
        print(i)
    }
}
