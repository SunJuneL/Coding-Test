import Foundation

// N과 K를 입력 받음
let input = (readLine() ?? "1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }
let N = input[0]
let K = input[1]

// 사람들의 번호를 저장하는 배열과 요세푸스의 결과를 저장하는 배열을 선언
var people = [Int](1 ... N)
var josephus: [Int] = []

// 요세푸스 배열이 N개가 될 때까지 반복
var i = -1
while josephus.count < N {
    // 이미 제외된 번호를 제외하고, K 만큼 추가될 때까지 반복해 i를 구함
    var count = 0
    while count < K {
        i += 1
        i %= N
        if people[i] != -1 {
            count += 1
        }
    }
    
    // 구한 i번째 사람 번호를 요세푸스 배열에 추가하고, 번호를 제외함
    josephus.append(people[i])
    people[i] = -1
}

// 형식에 맞도록 출력
print("<",terminator: "")
for i in 0 ..< N - 1 {
    print(josephus[i],terminator: ", ")
}
print("\(josephus[N - 1])>")
