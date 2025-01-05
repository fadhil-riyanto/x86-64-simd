#include <stdio.h>
#include <immintrin.h>

                        // rdi, rsi, rdx
// int _m_32fetch(int *array, int len, int indexof)
// {
//         int rcx = 0;

//         for(int i = 0; i < len; i++) {
//                 int curindex = i % 4;

//                 if (curindex == 0 && rcx == indexof) {
//                         return *(array + (rcx * 4) + 0) + *(array + (rcx * 4) + 1) + *(array + (rcx * 4) + 2) + *(array + (rcx * 4) + 3);
//                 }

//                 if (curindex == 0) {
//                         rcx++;
//                 }
//         }
// }

                        // rdi, rsi, rdx
extern int _m_32fetch(int *array, int len, int indexof);
extern int sum_all(int *array, int len, int indexof);

int main()
{
        int array[16] = {
                2,3 ,4, 2,
                1, 3, 4, 7,
                3, 1, 2, 3,                       // 
                3, 8, 9, 5                      // 25
        };
        
        int result = sum_all(array, 16, 0);

        printf("%d\n", result);
}