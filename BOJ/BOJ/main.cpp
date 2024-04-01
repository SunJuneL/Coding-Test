#include <string>
#include <vector>
#include <stdio.h>

using namespace std;

int n;

int main() {
    // N와 input 입력 받음
    scanf("%d", &n);
    
    int max = 0;                        // 이동비용이 가장 큰 값을 저장할 변수
    int sum = 0;                        // 전체 이동비용을 모두 더한 값을 저장할 변수
    
    // n번 반복하면서 입력을 받고 아래의 명령을 실행함
    for (int i = 0; i < n; i++) {
        int num = 0;
        scanf("%d", &num);
        
        // sum에 입력 받은 이동비용을 더함
        sum += num;
        
        // 만약 max보다 입력 받은 이동비용이 더 크다면, max 값을 입력 받은 이동비용으로 변경
        if (max < num) {
            max = num;
        }
    }
    
    // 전체 이동비용을 모두 더한 값에서 이동비용이 가장 큰 값을 뺌
    sum -= max;
    printf("%d", sum);
}
