import Foundation

// x와 y를 입력 받음
let input = (readLine() ?? "1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }
let x = input[0]
let y = input[1]

// 1월 1일로부터 x월 y일까지 지난 날짜를 계산함
var days = y
for month in 1 ..< x {
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
        days += 31
    case 4, 6, 9, 11:
        days += 30
    case 2:
        days += 28
    default:
        break
    }
}

// 계산한 날짜를 이용해 요일을 구해 출력함
days %= 7
switch days {
case 1:
    print("MON")
case 2:
    print("TUE")
case 3:
    print("WED")
case 4:
    print("THU")
case 5:
    print("FRI")
case 6:
    print("SAT")
case 0:
    print("SUN")
default:
    break
}
