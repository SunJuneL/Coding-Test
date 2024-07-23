import Foundation

// K 입력받음
let K = Int(readLine() ?? "1") ?? 1

// 숫자를 저장할 배열
var numbers: [Int] = []

// K번 만큼 반복해서 숫자를 입력 받음
for _ in 1 ... K {
    let number = Int(readLine() ?? "0") ?? 0
    if number == 0 {
        if numbers.isEmpty {
            continue
        } else {
            numbers.removeLast()
        }
    } else {
        numbers.append(number)
    }
}

// numbers 값들을 모두 더함
let sum = numbers.reduce(0) { $0 + $1 }
print(sum)
