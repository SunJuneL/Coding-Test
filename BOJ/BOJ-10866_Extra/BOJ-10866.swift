import Foundation

class Deque<TYPE> {
    /// 데이터
    private var datas: [TYPE] = []
    
    func push_front(_ data: TYPE) {
        datas.insert(data, at: 0)
    }
    
    func push_back(_ data: TYPE) {
        datas.append(data)
    }
    
    func pop_front() -> TYPE? {
        if datas.isEmpty {
            return nil
        }
        return datas.removeFirst()
    }
    
    func pop_back() -> TYPE? {
        if datas.isEmpty {
            return nil
        }
        return datas.removeLast()
    }
    
    func size() -> Int {
        datas.count
    }
    
    func empty() -> Bool {
        datas.isEmpty
    }
    
    func front() -> TYPE? {
        datas.first
    }
    
    func back() -> TYPE? {
        datas.last
    }
}

// N(명령어 수) 입력 받기
let N = Int(readLine() ?? "1") ?? 1

// 정수형 덱(deque) 선언
var deque = Deque<Int>()

// 명령어 입력 받기
for _ in 1 ... N {
    let command = (readLine() ?? "").components(separatedBy: " ")
    
    if command.count == 1 {
        switch command[0] {
        case "front":
            if let front = deque.front() {
                print(front)
            } else {
                print(-1)
            }
        case "pop_front":
            if let front = deque.pop_front() {
                print(front)
            } else {
                print(-1)
            }
        case "back":
            if let back = deque.back() {
                print(back)
            } else {
                print(-1)
            }
        case "pop_back":
            if let back = deque.pop_back() {
                print(back)
            } else {
                print(-1)
            }
        case "size":
            print(deque.size())
        case "empty":
            if deque.empty() {
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
            deque.push_front(data)
        case "push_back":
            deque.push_back(data)
        default:
            print("ERROR!!")
            break
        }
    } else {
        print("ERROR!!")
    }
}
