//
//  main.swift
//  Swift_Language
//
//  Created by 이선준 on 1/23/24.
//

import Foundation

func solution(_ price: Int) -> Int {
    if price >= 500000 {
        // 50 만원 이상 사면 20% 할인
        return price * 4 / 5
    } else if price >= 300000 {
        // 30 만원 이상 사면 10% 할인
        return price * 9 / 10
    } else if price >= 100000 {
        // 10 만원 이상 사면 5% 할인
        return price * 19 / 20
    } else {
        // 그 이하라면 본래 가격대로임
        return price
    }
}
