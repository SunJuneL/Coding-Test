import Foundation

// VPS인지 아닌지 판별하는 함수 선언
func checkVPS(PS: String) -> Bool {
    // 스택 선언
    var stack: [Character] = []
    
    // PS의 각 문자에 대해 반복
    for char in PS {
        // 스택이 비어있다면, 일단 스택에 추가
        if stack.isEmpty {
            stack.append(char)
            continue
        }
        
        // 스택이 비어있지 않고, 스택의 가장 마지막 값이 "("이며, 현재 문자가 ")"라면, 스택의 마지막 값을 없앰
        if char == ")" && stack.last! == "(" {
            stack.removeLast()
        // 스택이 비어있지 않지만, 위 조건이 아니라면 문자를 스택에 그냥 추가
        } else {
            stack.append(char)
        }
    }
    
    // 스택이 비어있다면 true, 아니라면 false 리턴
    return stack.isEmpty
}

// 테스트케이스 개수 입력 받음
let T = Int(readLine()!)!

// 테스트케이스 개수만큼 PS 입력 받아 checkVPS() 함수 실행
for _ in 1...T {
    print(checkVPS(PS: readLine()!) ? "YES" : "NO")
}
