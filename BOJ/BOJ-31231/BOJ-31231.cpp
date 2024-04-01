#include <string>
#include <vector>
#include <stdio.h>

using namespace std;

// MARK: - 기본 세팅

enum {
    MAX_N = 401,
    COQUE_SIZE = 10,
};

int N;
char input[MAX_N];
int redCoque[MAX_N];
int blueCoque[COQUE_SIZE];
int answer[MAX_N];


// MARK: - 함수 선언

// 빨간 코크 출력
void printRedCoque() {
    printf("RedCoque: ");
    for (int i = 0; i < N; i++) {
        printf("[%d]", redCoque[i]);
    }
    printf("\n");
}

// 사용하지 않은 코크 개수 출력
void printBlueCoque() {
    printf("blueCoque: ");
    for (int i = 0; i < COQUE_SIZE; i++) {
        printf("[%d: %d]", i, blueCoque[i]);
    }
    printf("\n");
}

// 정답 코크 크기 출력
void printAnswer() {
    printf("Answer: ");
    for (int i = 0; i < N; i++) {
        printf("[%d]", answer[i]);
    }
    printf("\n");
}

// 입력(input)을 redCoque와 blueCoque 배열에 알맞게 저장하는 함수
void setInputToArrays() {
    for (int i = 0; i < N; i++) {
        int coqueSize = int(input[i] - 48);                 // 입력으로 받는 1개의 코크 크기
        
        // redCoque에는 입력 받은 순서대로 저장
        redCoque[i] = coqueSize;
        // blueCoque에는 코크의 크기를 index로 해서 개수를 하나 올림
        blueCoque[coqueSize]++;
    }
}

// answer 배열을 redCoque에 따라 데칼코마니 형태로 만드는 함수
void makeDecalcomani() {
    int halfIdx = N / 2;
    
    for (int i = 0; i < halfIdx; i++) {
        if (redCoque[i] == redCoque[N - 1 - i]) {
            // 만약, redCoque의 좌·우가 원래 같았다면, blue코크를 사용하지 않고 answer를 설정
            answer[i] = redCoque[i];
            answer[N - 1 - i] = answer[i];
        } else {
            // 만약, redCoque의 좌·우가 다르다면, 둘 중 큰 크기를 기준으로 blue코크를 사용하여 answer를 설정
            int biggerSize = -1;
            
            if (redCoque[i] < redCoque[N - 1 - i]) {
                biggerSize = redCoque[N - 1 - i];
            } else {
                biggerSize = redCoque[i];
            }
            
            answer[i] = biggerSize;
            answer[N - 1 - i] = biggerSize;
            
            // 좌·우 중에서 적어도 하나는 빨간 코크를 사용했을테니, 파란 코크는 1개만 사용함.
            blueCoque[biggerSize]--;
        }
    }
    
    // N이 짝수일 때, answer에 중간값 저장
    if (N % 2 != 0) {
        answer[halfIdx] = redCoque[halfIdx];
    }
    
    printAnswer();
    printBlueCoque();
}

// 남은 파란 코크 중에서 크기가 가장 크고, 개수가 count 이상인 코크 크기를 리턴하는 함수
// 남은 코크가 없다면 0을 리턴
int findBiggestRestBlueCoque(int count) {
    int biggestSize = 9;
    
    while (biggestSize >= 0) {
        if (blueCoque[biggestSize] >= count) {
            return biggestSize;
        }
        biggestSize--;
    }
    
    return -1;
}

// 남은 파란 코크를 사용해서 answer 점수를 크게 만드는 함수
void useRestBlueCoque() {
    int halfIdx = N / 2;
    
    // answer를 앞에서부터 중앙 직전까지 반복한다.
    // 2개 이상의 크기가 파란 코크
    
}


// MARK: - 함수 실행

int main() {
    scanf("%d", &N);
    scanf("%s", input);
    
    // 받아온 코코를 redCoque에 저장
    setInputToArrays();
    makeDecalcomani();
}
