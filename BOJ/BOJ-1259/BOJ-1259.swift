import Foundation

// String에 subscript를 extension해, String에서도 RA를 허용하도록 한다.
extension String {
  subscript(idx: Int) -> String? {
    guard(0..<count).contains(idx) else {
      return nil
    }
    let target = index(startIndex, offsetBy: idx)
    return String(self[target])
  }
}

// "0"이 입력될때까지 반복
while true {
    // 단어를 입력 받음
    let input = readLine() ?? ""

    if input == "0" {
        break
    }
    
    // 팰린드롬수인지 판별하는 변수
    var isPalindrome = true
    
    // 반복문을 통해 input이 팰린드롬수인지 확인
    for i in 0 ..< (input.count / 2) {
        if input[i] != input[input.count - i - 1] {
            isPalindrome = false
            break
        }
    }

    // 팰린드롬수라면 "yes", 아니라면 "no" 출력
    print(isPalindrome ? "yes" : "no")
}
