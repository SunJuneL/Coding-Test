import Foundation

// 두 자연수를 입력 받음
let input = (readLine() ?? "1 1").components(separatedBy: " ").map{ Int($0) ?? 1 }
let num1 = input[0]
let num2 = input[1]

// 최대공약수를 구하는 함수 선언
func GCD(num1: Int, num2: Int) -> Int {
    var big = num1 >= num2 ? num1 : num2
    var small = num1 >= num2 ? num2 : num1
    
    // 유클리드 호제법 이용
    while small != 0 {
        let temp = small
        small = big % small
        big = temp
    }
    
    return big
}

// gcd, lcm을 구함
let gcd = GCD(num1: num1, num2: num2)
let lcm = num1 * num2 / gcd

// 최대공약수, 최소공배수 출력
print(gcd)
print(lcm)
