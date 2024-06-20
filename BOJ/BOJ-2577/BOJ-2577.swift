import Foundation

// 숫자 A, B, C 입력받기
let A = Int(readLine() ?? "100") ?? 100
let B = Int(readLine() ?? "100") ?? 100
let C = Int(readLine() ?? "100") ?? 100

// 0부터 9까지 각 숫자가 사용된 횟수를 저장하는 배열
var numbers = Array(repeating: 0, count: 10)

// A, B, C를 모두 곱한 결과값
var result = A * B * C

// 곱셈의 결과를 10으로 나눈 나머지 값에 따라 배열에 추가
while result > 0 {
    let number = result % 10
    numbers[number] += 1
    result /= 10
}

// 배열을 출력
for i in numbers {
    print(i)
}
