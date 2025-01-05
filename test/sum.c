#include <stdio.h>
#include <immintrin.h>



extern int _m_32fetch(int *array, int len, int indexof);

int main()
{
        int array[16] = {
                2,23 ,42, 1,
                1, 13, 4, 7,
                3, 45, 227, 4,
                3, 8, 9, 5
        };
        
        int result = _m_32fetch(array, 16, 0);

        printf("%d\n", result);
}