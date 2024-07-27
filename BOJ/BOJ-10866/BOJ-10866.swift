import Foundation

// N(명령어 수) 입력 받기
let N = Int(readLine() ?? "1") ?? 1

// 정수형 덱(deque) 선언
 var deque: [Int] = []

// 명령어 입력 받기
for _ in 1 ... N {
    let command = (readLine() ?? "").components(separatedBy: " ")
    
    if command.count == 1 {
        switch command[0] {
        case "front":
            if let front = deque.first {
                print(front)
            } else {
                print(-1)
            }
        case "pop_front":
            if !deque.isEmpty {
                print(deque.removeFirst())
            } else {
                print(-1)
            }
        case "back":
            if let back = deque.last {
                print(back)
            } else {
                print(-1)
            }
        case "pop_back":
            if !deque.isEmpty {
                print(deque.removeLast())
            } else {
                print(-1)
            }
        case "size":
            print(deque.count)
        case "empty":
            if deque.isEmpty {
                print(1)
            } else {
                print(0)
            }
        default:
            print("ERROR!!")
            break
        }
    } else if command.count == 2 {
        let data = Int(command[1]) ?? 0
        
        switch command[0] {
        case "push_front":
            deque.insert(data, at: 0)
        case "push_back":
            deque.append(data)
        default:
            print("ERROR!!")
            break
        }
    } else {
        print("ERROR!!")
    }
}
