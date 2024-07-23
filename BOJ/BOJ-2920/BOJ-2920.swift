import Foundation

// 음계 입력 받음
let input = readLine() ?? "0 0 0 0 0 0 0 0"

// 저장된 값에 따라 다른 결고를 출력한다.
if input == "1 2 3 4 5 6 7 8" {
    print("ascending")
} else if input == "8 7 6 5 4 3 2 1" {
    print("descending")
} else {
    print("mixed")
}
