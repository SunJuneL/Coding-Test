import Foundation

// 테스트케이스 개수를 입력 받음
let T = Int(readLine() ?? "1") ?? 1

// 테스트케이스 개수만큼 반복함
for _ in 1 ... T {
    // 문서의 개수 N과 몇 번쨰로 인쇄되는지 궁금한 문서 M을 입력 받음
    let input = (readLine() ?? "1 0").components(separatedBy: " ")
    let N = Int(input[0]) ?? 1
    let M = Int(input[1]) ?? 0
    
    // 중요도를 입력 받음
    let importances = (readLine() ?? "1").components(separatedBy: " ").map{ Int($0) ?? 1 }
    
    // 중요도 배열을 사용하기 위해 선언한 임시 배열
    var arr = importances
    // 현재 중요도 배열에서의 최대값
    var max = arr.max() ?? 1
    // 인쇄된 문서의 개수
    var count = 0
    // 현재 문서의 index를 나타내는 변수
    var m = M
    
    // 현재 중요도 배열에서의 최대값이 찾으려는 문서의 중요도보다 크면 반복함
    while importances[M] < max {
        // 현재 배열에서 가장 첫번째 값이 최대값이 아니라면 맨 뒤로 보냄
        if arr[0] != max {
            arr.append(arr.removeFirst())
        // 현재 배열에서 가장 첫번째 값을 제거한 이후 배열의 최대값을 변경
        } else {
            arr.removeFirst()
            max = arr.max() ?? 1
            count += 1
        }
        
        // 찾는 문서의 인덱스를 현재 배열에 맞게 설정
        m -= 1
        if m < 0 {
            m += arr.count
        }
    }
    
    // 현재 배열에서 찾는 문서가 몇 번째로 출력되는지 확인
    for i in 0 ... m {
        if arr[i] == importances[M] {
            count += 1
        }
    }
    
    print(count)
}
