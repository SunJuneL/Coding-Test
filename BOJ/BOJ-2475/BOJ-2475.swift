import Foundation

// 고유번호 배열 형식으로 입력 받기
let uniqueNumber = (readLine() ?? "0 0 0 0 0").components(separatedBy: " ").map{ Int($0) ?? 0 }

// sum: 각 고유번호 숫자들을 제곱한 합
var sum = 0
for n in uniqueNumber {
    sum += (n * n)
}
// 검증수
let verification = sum % 10

// 검증수 출력
print(verification)
