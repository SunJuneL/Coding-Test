import Foundation

// 점수의 합을 나타낼 변수 선언
var sum = 0

// 5명의 점수를 받고, 점수들을 더함
for _ in 1 ... 5 {
    let score = Int(readLine() ?? "0") ?? 0
    
    if score < 40 {
        sum += 40
    } else {
        sum += score
    }
}

// 평균 출력
print(sum / 5)
