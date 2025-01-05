rm_and_back() {
        rm *.bin 
        rm *.o
        rm p
        cd ..
}

echo "entering all dirs\n"
cd "128-bit"
rm_and_back

cd "asm"
rm_and_back

cd "FPU"
rm_and_back

cd "test"
rm_and_back


