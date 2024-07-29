import Foundation

// N과 K를 입력 받음
let input = (readLine() ?? "1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }
let N = input[0]
let K = input[1]

// 사람들의 번호를 저장하는 배열과 요세푸스 결과를 저장할 문자열 선언
var people = [Int](1 ... N)
var josephus = "<"

// 사람들의 번호를 담은 배열이 빌 때까지 반복
var i = K - 1
while !people.isEmpty {
    // 현재 i 인덱스의 요소를 제거하고, 그 요소의 값을 요세푸스 문자열에 추가
    let num = people.remove(at: i)
    josephus += (String(num) + (people.isEmpty ? ">" : ", "))
    
    // i 에 K - 1 만큼 더하고 i 값을 조정
    // - 현재 index의 요소를 제거했기 때문에 다음 번호가 현재 index로 끌려옴
    // - 즉, 현재 index를 포함해 K 번째 번호를 제외하기 때문에 K - 1 만큼 더해줌
    i += (K - 1)
    if !people.isEmpty {
        i %= people.count
    }
}

print(josephus)
