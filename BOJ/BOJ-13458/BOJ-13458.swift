import Foundation

// N 입력 받음
let N = Int(readLine()!)!

// 각 시험장의 응시자 수 Aᵢ 입력 받음
var A = readLine()!.split(separator: " ").map{ Int($0)! }

// B와 C 입력 받음
let input = readLine()!.split(separator: " ").map{ Int($0)! }
let B = input[0]
let C = input[1]

// 감독관 수 변수 선언
var result = 0

// 감독관 수 구하기
for i in 0 ..< N {
    A[i] -= B
    result += 1
    
    if 0 < A[i] {
        result = result + (A[i] % C == 0 ? A[i] / C : A[i] / C + 1)
    }
}

print(result)
