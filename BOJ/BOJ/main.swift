//
//  main.swift
//  Swift_Language
//
//  Created by 이선준 on 1/23/24.
//

import Foundation

// n과 [이동비용들]을 입력 받음
let n: Int = Int(readLine() ?? "0") ?? 0
let costs: [Int] = (readLine() ?? "0").split(separator: " ").map({ Int($0) ?? 0 })

// [이동비용들]을 정렬시킨 후, 가장 마지막 값은 제외함
let sortedCostExceptLast: [Int] = costs.sorted().dropLast()

// 가장 큰 값을 제외하고 정렬시킨 [새 이동비용들]의 요소들을 모두 더함
var sum: Int = 0
for num in sortedCostExceptLast {
    sum += num
}

// 모두 더한 값을 출력함
print(sum)
