import Foundation

// N을 입력 받음
let N = Int(readLine() ?? "0") ?? 0

// 0의 개수를 저장할 변수 선언
var count = 0

// 5가 곱해지는 횟수를 구함
for num in 0 ... N {
    var num = num
    while 5 <= num && num % 5 == 0 {
        num /= 5
        count += 1
    }
}

// 0의 개수 출력
print(count)
