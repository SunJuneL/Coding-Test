import Foundation

// A, B, C를 입력 받음
let input = readLine()!.split(separator: " ").map{ Int($0)! }
let A = input[0]
let B = input[1]
let C = input[2]

// 나머지 구하는 함수 선언
func findRemainder(b: Int) -> Int {
    // b가 1인경우, A를 C로 나눈 나머지를 리턴
    if b == 1 {
        return A % C
    }
    
    // (b / 2)를 매개변수로 하여, 재귀함수를 통해 구한 나머지 값
    let remainder = findRemainder(b: b / 2)
    
    // b가 짝수인 경우, 모듈러 연산에 따라 (나머지 × 나머지 % C)를 리턴
    if b % 2 == 0 {
        return remainder * remainder % C
    // b가 홀수인 경우, 모듈러 연산에 따라 ((나머지 × 나머지 % C) × A) % C를 리턴
    } else {
        return remainder * remainder % C * A % C
    }
}

// 구한 나머지를 출력
print(findRemainder(b: B))
