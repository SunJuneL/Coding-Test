import Foundation

// 막대 길이 X를 입력 받음
let X = Int(readLine()!)!

// 막대의 길이들을 저장할 배열
var sticks = [64]

// 모든 막대의 길이의 합이 `X`보다 크다면, 아래 과정을 반복
while X < sticks.reduce(0, +) {
    // 배열에서 가장 작은 값을 꺼내고 절반으로 나눔
    let half = sticks.popLast()! / 2
    // 나눈 절반 중 하나를 배열에 넣음
    sticks.append(half)
    
    // 배열에 저장된 막대들의 길이 합을 구하고 X와 비교해, `X`보다 크거나 같지 않다면 (`X`보다 작다면), 나눈 절반을 다시 배열에 넣음
    if !(X <= sticks.reduce(0, +)) {
        sticks.append(half)
    }
}

// 막대들의 개수 출력
print(sticks.count)
