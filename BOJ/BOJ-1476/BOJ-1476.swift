import Foundation

// E, S, M 입력 받음
let input = readLine()!.split(separator: " ").map{ Int($0)! }
let E = input[0]
let S = input[1]
let M = input[2]

// 연도를 나타내는 변수를 설정하고, 해당 연도를 세 수로 변환한 변수 선언
var year = 1
var e = 1
var s = 1
var m = 1

// 입력받은 E, S, M 값이 각각 year 년도를 세 수로 변환한 값이 같을 때까지 반복
while !(E == e && S == s && M == m) {
    year += 1
    
    e = year % 15
    if e == 0 {
        e = 15
    }
    
    s = year % 28
    if s == 0 {
        s = 28
    }
    
    m = year % 19
    if m == 0 {
        m = 19
    }
}

// 얻은 연도 출력
print(year)
