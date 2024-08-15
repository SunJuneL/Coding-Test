import Foundation

// 식 입력 받음
let input = ((readLine() ?? "") + ".").map{ String($0) }

// 공식 배열
var equation: [Int] = []
// 숫자 문자열
var numString = ""

// 입력 받은 모든 문자에 대해 반복
for w in input {
    if w == "+" || w == "." {
        // 숫자 문자열 캐스팅 후 공식에 저장
        let number = Int(numString) ?? 0
        equation.append(number)
        if number < 0 {
            numString = "-"
        } else {
            numString = ""
        }
    } else if w == "-" {
        // 숫자 문자열 캐스팅 후 공식에 저장
        let number = Int(numString) ?? 0
        equation.append(number)
        numString = "-"
    } else {
        // 숫자 문자열 뒤에 숫자 추가
        numString += w
    }
}

// 최소값 변수 선언
var min = 0
// 변경한 모든 정수에 대해 반복
for x in equation {
    min += x
}

// 최소값 출력
print(min)
