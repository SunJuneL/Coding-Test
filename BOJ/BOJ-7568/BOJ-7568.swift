import Foundation

// 사람 수 N 입력 받음
let N = Int(readLine() ?? "2") ?? 2

// 사람의 키와 몸무게 데이터를 저장할 튜플 배열
var personDatas: [(x: Int, y: Int)] = []

// 사람들의 키, 몸무게 데이터 입력 받기
for _ in 1 ... N {
    let data = (readLine() ?? "10 10").components(separatedBy: " ").map{ Int($0) ?? 10 }
    personDatas.append((x: data[0], y: data[1]))
}

// 레벨 계산해서 출력하기
for i in 0 ..< N {
    var level = 1
    
    // 만약, i번째 데이터가 j의 데이터보다 작으면 level을 1 올리고, j 를 모든 데이터에 대해 반복함
    for j in 0 ..< N {
        if personDatas[i].x < personDatas[j].x && personDatas[i].y < personDatas[j].y {
            level += 1
        }
    }
    
    print(level, terminator: " ")
}
