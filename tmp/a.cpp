#include <iostream>
using namespace std;

int wktB_jam, wktB_menit, wktB_detik;
int tot_Detik;

int main()
{
        wktB_jam = 14;
        wktB_menit = 34;
        wktB_detik = 13;

        tot_Detik = (wktB_jam * 3600) + (wktB_menit * 60) + wktB_detik;
        cout << tot_Detik << endl;
}