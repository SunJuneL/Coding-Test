import Foundation

// 로프의 개수 입력 받음
let N = Int(readLine()!)!

// 로프들이 들 수 있는 무게를 입력 받음
var ropes = [Int]()
for _ in 1 ... N {
    ropes.append(Int(readLine()!)!)
}

// 로프들을 들 수 있는 무게의 크기 순으로 정렬시킴
ropes.sort()
// 각 로프가 꼭 포함되어야 한다고 가정할 때, 들 수 있는 물체의 최대 무게를 구함
for i in 0 ..< N {
    ropes[i] *= (N - i)
}

// 구한 최대 무게들 중, 가장 큰 값을 출력
print(ropes.max()!)
