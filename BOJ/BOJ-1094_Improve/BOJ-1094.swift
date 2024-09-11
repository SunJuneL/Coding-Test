import Foundation

// 막대 길이 X를 입력 받음
let X = Int8(readLine()!)!

// 값이 1인 비트의 개수를 저장할 변수 선언
var count = 0

// 비트마스크를 활용해, X에서 비트가 1인 비트의 개수를 구함
for i in 0 ..< 8 {
    if X & (1 << i) != 0 {
        count += 1
    }
}

// 1인 비트의 개수 출력
print(count)
