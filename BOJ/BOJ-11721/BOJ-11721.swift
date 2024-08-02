import Foundation

// 단어를 입력 받음
let input = readLine() ?? ""

// 문자 10개까지 저장할 한 줄을 의미하는 문자열
var line = ""

// 단어의 모든 문자에 대해 반복
for ch in input {
    // 임시 문자열에 단어 추가
    line.append(ch)
    // 임시 문자열의 길이가 10이 될때마다 출력 후 문자열을 초기화
    if line.count == 10 {
        print(line)
        line.removeAll()
    }
}

// 아직 출력 안된 문자가 있는지 확인 후 출력
if !line.isEmpty {
    print(line)
}
