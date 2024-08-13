import Foundation

while true {
    // 입력 받음
    let input = readLine() ?? "0 0 0"
    
    // "0 0 0"을 입력 받으면 정지
    if input == "0 0 0" {
        break
    }
    
    // 입력을 삼각형 변으로 변경
    let triangle = input.components(separatedBy: " ").map{ Int($0) ?? 1 }.sorted()
    let x = triangle[0]
    let y = triangle[1]
    let z = triangle[2]
    
    // 피타고라스 정리에 부합한지 확인
    if x * x + y * y == z * z {
        print("right")
    } else {
        print("wrong")
    }
}
