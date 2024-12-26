static float test()
{
        float b = 0.2;
        float c = 0.34;
        float d = b + c;
        return d;


        /* 
        $5 = {
  v8_bfloat16 = {-1.075e+08, 0.1992, 0, 0, 0, 0, 0, 0},
  v8_half = {-19.203, 1.5742, 0, 0, 0, 0, 0, 0},
  v4_float = {0.200000003, 0, 0, 0},
  v2_double = {5.1640756954075245e-315, 0},
  v16_int8 = {0xcd, 0xcc, 0x4c, 0x3e, 0x0 <repeats 12 times>},
  v8_int16 = {0xcccd, 0x3e4c, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0},
  v4_int32 = {0x3e4ccccd, 0x0, 0x0, 0x0},
  v2_int64 = {0x3e4ccccd, 0x0},
  uint128 = 0x3e4ccccd
}
        */
}

int main()
{
        test();
}