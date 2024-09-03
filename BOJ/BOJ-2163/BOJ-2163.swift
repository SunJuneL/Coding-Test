import Foundation

// N, M을 입력 받고, N × M - 1 출력
print(readLine()!.split(separator: " ").reduce(1){ $0 * Int($1)!} - 1)
