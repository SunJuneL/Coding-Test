import Foundation

// 집합 S 선언
var S: Set<String> = []

// 변수 N, M을 입력 받고, 입력 받은 값을 저장함.
let input = (readLine() ?? "1 1").split(separator: " ").map{ Int($0) ?? 1 }
let N = input[0]
let M = input[1]

// N의 크기만큼 문자열들을 입력 받고, 집합 S에 저장
for _ in 1 ... N {
    let strInput = readLine() ?? ""
    S.insert(strInput)
}

//  count는 특정 문자열들이 집합 S에 몇개 있는지 나타내는 변수
var count = 0
// M의 크기만큼 문자열들을 입력 받음. 집합 S에 특정 문자열이 있다면 count 늘림
for _ in 1 ... M {
    let strInput = readLine() ?? ""
    if S.contains(strInput) {
        count += 1
    }
}

print(count)
