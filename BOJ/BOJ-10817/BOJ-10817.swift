import Foundation

// 세 정수 A, B, C를 입력 받음
// numbers = [ A, B, C ]
let numbers = (readLine() ?? "1 1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }

// A, B, C의 값을 정렬
let sortedNumbers = numbers.sorted()

// 두 번째로 큰 정수를 출력
print(sortedNumbers[1])
