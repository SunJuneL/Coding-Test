import Foundation

// N을 입력 받음 (1 이상 500000 이하)
let N = Int(readLine() ?? "1") ?? 1

// 숫자들을 저장할 딕셔너리
var dict: [Int: Int] = [:]
// 숫자들을 저장할 배열
var arr: [Int] = []
// 산술평균
var aver = 0.0

// 숫자들을 입력받아 배열, 딕셔너리에 저장
for _ in 1 ... N {
    let num = Int(readLine() ?? "0") ?? 0
    arr.append(num)
    dict[num] = (dict[num] ?? 0) + 1
    aver += Double(num)
}

// 산술평균 구하기
aver /= Double(N)
let average = Int(aver.rounded())

// 중앙값 구하기
arr.sort()
let middle = arr[N / 2]

// 최빈값 구하기
let maxCount = dict.values.max() ?? 0
var maximums: [Int] = []
for e in dict {
    if e.value == maxCount {
        maximums.append(e.key)
    }
}
maximums.sort()
var max = 0
if 1 < maximums.count {
    max = maximums[1]
} else {
    max = maximums[0]
}

// 범위 구하기
let range = arr[N - 1] - arr[0]

// 산술평균
print(average)
// 중앙값
print(middle)
// 최빈값
print(max)
// 범위
print(range)
