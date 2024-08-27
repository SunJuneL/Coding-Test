import Foundation

// key값의 거듭제곱의 반복되는 일의 자리 숫자들을 배열로 value에 저장한 딕셔너리 선언
let powered = [
    1: [1],
    2: [6, 2, 4, 8],
    3: [1, 3, 9, 7],
    4: [6, 4],
    5: [5],
    6: [6],
    7: [1, 7, 9, 3],
    8: [6, 8, 4, 2],
    9: [1, 9],
    0: [10],
]

// 테스트케이스 개수 입력 받음
let T = Int(readLine() ?? "1") ?? 1

for _ in 1...T {
    // a와 b를 입력 받음
    let input = (readLine() ?? "1 1").split(separator: " ").map{ Int($0) ?? 1 }
    // 입력 받은 a를 10으로 나눈 나머지로 변경
    let a = input[0] % 10
    
    // 변경된 a값을 키 값으로 딕셔너리에서 배열을 구함
    let firstPlaces = powered[a] ?? [10]
    // 입력 받은 b값을 배열의 크기로 나눈 나머지를 구함
    let b = input[1] % firstPlaces.count
    
    // 나눈 나머지에 따라 배열에서 알맞은 결과를 출력
    print(firstPlaces[b])
}
