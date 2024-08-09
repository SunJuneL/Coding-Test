import Foundation

// 알파벳 배열 선언
let alphabets = [
    "a", "b", "c", "d", "e",
    "f", "g", "h", "i", "j",
    "k", "l", "m", "n", "o",
    "p", "q", "r", "s", "t",
    "u", "v", "w", "x", "y",
    "z"
]
// 결과 배열 선언
var result: [Int] = []

// 단어 S 입력 받음
let S = (readLine() ?? "")

// 알파벳마다 반복. 필터를 이용해 알파벳의 개수를 구하고 result에 추가
for alphabet in alphabets {
    result.append(S.filter{ String($0) == alphabet }.count)
}

// result 출력
for i in result {
    print(i, terminator: " ")
}
