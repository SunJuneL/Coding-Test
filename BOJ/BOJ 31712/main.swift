//
//  main.swift
//  Swift_Language
//
//  Created by 이선준 on 1/23/24.
//

import Foundation

/*

// 문제 시작
// N와 input을 입력받음
let N: Int = Int(readLine() ?? "0") ?? 0
let input: String = readLine() ?? ""

//print("")

var redCoque: [Int] = []
var blueCoque: [Int] = Array(repeating: 0, count: 10)
var answer: [Int] = Array(repeating: 0, count: N)

func printRedCoque() {
    print("Red Coque: ", terminator: "")
    for num in redCoque {
        print("[\(num)]", terminator: "")
    }
    print("")
}

func printBlueCoque() {
    print("Blue Coque: ", terminator: "")
    for num in 0 ..< blueCoque.count {
        print("[\(num): \(blueCoque[num])]", terminator: "")
    }
    print("")
}

func printAnswer() {
    print("Answer: ", terminator: "")
    for num in answer {
        print("[\(num)]", terminator: "")
    }
    print("\n")
}

func printRealAnswer() {
    for num in answer {
        print("\(num)", terminator: "")
    }
    print()
}


// redCoque와 blueCoque에 input 담기
for num in input {
    let intNum: Int = Int(String(num)) ?? 0
    redCoque.append(intNum)
    blueCoque[intNum] += 1
}

// N이 홀수일 때, answer[N / 2]에 대입한다.
if N % 2 != 0 {
    answer[N / 2] = redCoque[N / 2]
}

// 중간(N / 2) 기준으로 좌우를 확인하며, answer을 데칼코마니로 만든다.
for idx in 0 ..< (N / 2) {
    if redCoque[idx] == redCoque[N - 1 - idx] {
        // 좌·우가 동일하다면, blueCoque를 사용하지 않고, redCoque만 answer를 좌·우 대칭으로 만든다.
        answer[idx] = redCoque[idx]
        answer[N - 1 - idx] = answer[idx]
    } else {
        // 좌·우가 동일하지 않다면, blueCoque를 사용해서 answer를 큰 값으로 좌·우 대칭으로 만든다.
        var bigger: Int = 0
        
        if redCoque[idx] < redCoque[N - 1 - idx] {
            bigger = redCoque[N - 1 - idx]
        } else {
            bigger = redCoque[idx]
        }
        
        blueCoque[bigger] -= 1
        answer[idx] = bigger
        answer[N - 1 - idx] = bigger
    }
}

// blueCoque 중 개수가 count 이상의 가장 큰 코크를 구하는 함수
func getCoqueSizeWithMoreCount(_ count: Int) -> Int {
    var biggest: Int = 9
    
    while (biggest >= 0) {
        if blueCoque[biggest] >= count {
            return biggest
        }
        biggest -= 1
    }
    return -1
}

// 확인하면서 크키가 큰 파란 코크가 있다면 바꾼다.
for idx in 0 ..< (N / 2) {
    let maxBlueCoqueSize: Int = getCoqueSizeWithMoreCount(2)
    
    if maxBlueCoqueSize > answer[idx] {
        if answer[idx] == redCoque[idx] {
            answer[idx] = maxBlueCoqueSize
        } else {
            blueCoque[answer[idx]] += 1
            answer[idx] = maxBlueCoqueSize
        }
        
        if answer[N - 1 - idx] == redCoque[N - 1 - idx] {
            answer[N - 1 - idx] = maxBlueCoqueSize
        } else {
            blueCoque[answer[N - 1 - idx]] += 1
            answer[N - 1 - idx] = maxBlueCoqueSize
        }

        blueCoque[maxBlueCoqueSize] -= 2
    }
    
//    printRedCoque()
//    printBlueCoque()
//    printAnswer()
}

if N % 2 != 0 {
    let maxBlueCoqueSize: Int = getCoqueSizeWithMoreCount(1)
    
    if maxBlueCoqueSize > answer[N / 2] {
        answer[N / 2] = maxBlueCoqueSize
    }
}


//
//print("")
//printRedCoque()
//printBlueCoque()
//printAnswer()
printRealAnswer()


*/


// N와 input을 입력받음
let N: Int = Int(readLine() ?? "0") ?? 0
var answer: [Int] = []

for _ in 1 ... N {
    let input: [Int] = (readLine() ?? "").split(separator: " ").map{ Int($0) ?? 0 }
    
    func bj31713(input: [Int]) -> Int {
        let stem: Int = input[0]
        let leaf: Int = input[1]
        
        if stem * 3 <= leaf && leaf <= stem * 4 {
            return 0
        } else if leaf < stem * 3 {
            return stem * 3 - leaf
        } else if stem * 4 < leaf {
            var needStem: Int = 0
            var needLeaf: Int = 0
            
            while needStem * 4 < leaf {
                needStem += 1
            }
            
            if leaf < needStem * 3 {
                needLeaf = needStem * 3 - leaf
            }
            
            return needLeaf + (needStem - stem)
            
        } else {
            return -1
        }
    }
    
    answer.append(bj31713(input: input))
}

for ans in answer {
    print(ans)
}
