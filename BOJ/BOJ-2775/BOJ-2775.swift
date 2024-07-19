import Foundation

// 테스트 케이스의 개수를 입력 받음
let T = Int(readLine() ?? "1") ?? 1

// 테스트케이스 개수 만큼 반복함
for _ in 1 ... T {
    // k(아파트의 층 수)를 입력 받음
    let k = Int(readLine() ?? "1") ?? 1
    // n(아파트의 호 수)를 입력 받음
    let n = Int(readLine() ?? "1") ?? 1
    
    // 아파트는 0층부터 k층까지 총 k + 1개의 층으로 구성되어 있으며, 1호부터 n호까지 n개의 호로 구성되어 있음
    var apartment = Array(repeating: Array(repeating: 0, count: n), count: k + 1)
    
    // 0층을 호 숫자로 채움. (ex - 1호: 1명, 2호: 2명, 3호: 3명 ...)
    for room in 0 ..< n {
        apartment[0][room] = room + 1
    }
    
    // 1층부터 k층까지 순서대로 모든 방(호)에 대한 인원 데이터를 저장
    for floor in 1 ... k {
        // 1호라면 이전 층 1호의 인원 그대로 가져옴
        // 1호가 아니라면, 이전 층 1 ~ room호 까지의 인원을 모두 더함
        // 이때, [이전층 1 ~ (room - 1)호까지]의 모든 인원이 [현재층 (room - 1)]호에 저장되어 있기 때문에, 그냥 [현재층 (room - 1)호]의 인원과 [이전층 room호]의 인원을 더함
        for room in 0 ..< n {
            if room == 0 {
                apartment[floor][room] = apartment[floor - 1][room]
            } else {
                apartment[floor][room] = apartment[floor - 1][room] + apartment[floor][room - 1]
            }
        }
    }
    
    print(apartment[k][n - 1])
}
