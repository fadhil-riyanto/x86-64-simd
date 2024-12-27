
./add128:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 c1 2f 00 00 	mov    0x2fc1(%rip),%rax        # 3fd0 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <__stack_chk_fail@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <__stack_chk_fail@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <__stack_chk_fail@GLIBC_2.4>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <printf@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <printf@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .text:

0000000000001050 <_start>:
    1050:	f3 0f 1e fa          	endbr64
    1054:	31 ed                	xor    %ebp,%ebp
    1056:	49 89 d1             	mov    %rdx,%r9
    1059:	5e                   	pop    %rsi
    105a:	48 89 e2             	mov    %rsp,%rdx
    105d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1061:	50                   	push   %rax
    1062:	54                   	push   %rsp
    1063:	45 31 c0             	xor    %r8d,%r8d
    1066:	31 c9                	xor    %ecx,%ecx
    1068:	48 8d 3d da 00 00 00 	lea    0xda(%rip),%rdi        # 1149 <main>
    106f:	ff 15 4b 2f 00 00    	call   *0x2f4b(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1075:	f4                   	hlt
    1076:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    107d:	00 00 00 
    1080:	48 8d 3d b9 2f 00 00 	lea    0x2fb9(%rip),%rdi        # 4040 <__TMC_END__>
    1087:	48 8d 05 b2 2f 00 00 	lea    0x2fb2(%rip),%rax        # 4040 <__TMC_END__>
    108e:	48 39 f8             	cmp    %rdi,%rax
    1091:	74 15                	je     10a8 <_start+0x58>
    1093:	48 8b 05 2e 2f 00 00 	mov    0x2f2e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    109a:	48 85 c0             	test   %rax,%rax
    109d:	74 09                	je     10a8 <_start+0x58>
    109f:	ff e0                	jmp    *%rax
    10a1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10a8:	c3                   	ret
    10a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10b0:	48 8d 3d 89 2f 00 00 	lea    0x2f89(%rip),%rdi        # 4040 <__TMC_END__>
    10b7:	48 8d 35 82 2f 00 00 	lea    0x2f82(%rip),%rsi        # 4040 <__TMC_END__>
    10be:	48 29 fe             	sub    %rdi,%rsi
    10c1:	48 89 f0             	mov    %rsi,%rax
    10c4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10c8:	48 c1 f8 03          	sar    $0x3,%rax
    10cc:	48 01 c6             	add    %rax,%rsi
    10cf:	48 d1 fe             	sar    $1,%rsi
    10d2:	74 14                	je     10e8 <_start+0x98>
    10d4:	48 8b 05 fd 2e 00 00 	mov    0x2efd(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10db:	48 85 c0             	test   %rax,%rax
    10de:	74 08                	je     10e8 <_start+0x98>
    10e0:	ff e0                	jmp    *%rax
    10e2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10e8:	c3                   	ret
    10e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10f0:	f3 0f 1e fa          	endbr64
    10f4:	80 3d 45 2f 00 00 00 	cmpb   $0x0,0x2f45(%rip)        # 4040 <__TMC_END__>
    10fb:	75 33                	jne    1130 <_start+0xe0>
    10fd:	55                   	push   %rbp
    10fe:	48 83 3d da 2e 00 00 	cmpq   $0x0,0x2eda(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1105:	00 
    1106:	48 89 e5             	mov    %rsp,%rbp
    1109:	74 0d                	je     1118 <_start+0xc8>
    110b:	48 8b 3d 06 2f 00 00 	mov    0x2f06(%rip),%rdi        # 4018 <__dso_handle>
    1112:	ff 15 c8 2e 00 00    	call   *0x2ec8(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1118:	e8 63 ff ff ff       	call   1080 <_start+0x30>
    111d:	c6 05 1c 2f 00 00 01 	movb   $0x1,0x2f1c(%rip)        # 4040 <__TMC_END__>
    1124:	5d                   	pop    %rbp
    1125:	c3                   	ret
    1126:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    112d:	00 00 00 
    1130:	c3                   	ret
    1131:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1138:	00 00 00 00 
    113c:	0f 1f 40 00          	nopl   0x0(%rax)
    1140:	f3 0f 1e fa          	endbr64
    1144:	e9 67 ff ff ff       	jmp    10b0 <_start+0x60>

0000000000001149 <main>:
    1149:	55                   	push   %rbp
    114a:	48 89 e5             	mov    %rsp,%rbp
    114d:	48 83 ec 40          	sub    $0x40,%rsp
    1151:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1158:	00 00 
    115a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    115e:	31 c0                	xor    %eax,%eax
    1160:	48 8d 05 b9 2e 00 00 	lea    0x2eb9(%rip),%rax        # 4020 <data>
    1167:	48 89 c7             	mov    %rax,%rdi
    116a:	e8 d3 00 00 00       	call   1242 <simd_128_arr32_ns>
    116f:	0f 29 45 c0          	movaps %xmm0,-0x40(%rbp)
    1173:	48 8d 05 b6 2e 00 00 	lea    0x2eb6(%rip),%rax        # 4030 <data2>
    117a:	48 89 c7             	mov    %rax,%rdi
    117d:	e8 c0 00 00 00       	call   1242 <simd_128_arr32_ns>
    1182:	0f 29 45 d0          	movaps %xmm0,-0x30(%rbp)
    1186:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
    118a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    118e:	48 89 d6             	mov    %rdx,%rsi
    1191:	48 89 c7             	mov    %rax,%rdi
    1194:	e8 20 01 00 00       	call   12b9 <simd_128_add_ns>
    1199:	0f 29 45 e0          	movaps %xmm0,-0x20(%rbp)
    119d:	66 0f 6f 45 e0       	movdqa -0x20(%rbp),%xmm0
    11a2:	66 0f 7e c0          	movd   %xmm0,%eax
    11a6:	89 c6                	mov    %eax,%esi
    11a8:	48 8d 05 55 0e 00 00 	lea    0xe55(%rip),%rax        # 2004 <_IO_stdin_used+0x4>
    11af:	48 89 c7             	mov    %rax,%rdi
    11b2:	b8 00 00 00 00       	mov    $0x0,%eax
    11b7:	e8 84 fe ff ff       	call   1040 <printf@plt>
    11bc:	66 0f 6f 45 e0       	movdqa -0x20(%rbp),%xmm0
    11c1:	66 0f 70 c0 55       	pshufd $0x55,%xmm0,%xmm0
    11c6:	66 0f 7e c0          	movd   %xmm0,%eax
    11ca:	89 c6                	mov    %eax,%esi
    11cc:	48 8d 05 39 0e 00 00 	lea    0xe39(%rip),%rax        # 200c <_IO_stdin_used+0xc>
    11d3:	48 89 c7             	mov    %rax,%rdi
    11d6:	b8 00 00 00 00       	mov    $0x0,%eax
    11db:	e8 60 fe ff ff       	call   1040 <printf@plt>
    11e0:	66 0f 6f 45 e0       	movdqa -0x20(%rbp),%xmm0
    11e5:	66 0f 6a c0          	punpckhdq %xmm0,%xmm0
    11e9:	66 0f 7e c0          	movd   %xmm0,%eax
    11ed:	89 c6                	mov    %eax,%esi
    11ef:	48 8d 05 1e 0e 00 00 	lea    0xe1e(%rip),%rax        # 2014 <_IO_stdin_used+0x14>
    11f6:	48 89 c7             	mov    %rax,%rdi
    11f9:	b8 00 00 00 00       	mov    $0x0,%eax
    11fe:	e8 3d fe ff ff       	call   1040 <printf@plt>
    1203:	66 0f 6f 45 e0       	movdqa -0x20(%rbp),%xmm0
    1208:	66 0f 70 c0 ff       	pshufd $0xff,%xmm0,%xmm0
    120d:	66 0f 7e c0          	movd   %xmm0,%eax
    1211:	89 c6                	mov    %eax,%esi
    1213:	48 8d 05 02 0e 00 00 	lea    0xe02(%rip),%rax        # 201c <_IO_stdin_used+0x1c>
    121a:	48 89 c7             	mov    %rax,%rdi
    121d:	b8 00 00 00 00       	mov    $0x0,%eax
    1222:	e8 19 fe ff ff       	call   1040 <printf@plt>
    1227:	b8 00 00 00 00       	mov    $0x0,%eax
    122c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1230:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
    1237:	00 00 
    1239:	74 05                	je     1240 <main+0xf7>
    123b:	e8 f0 fd ff ff       	call   1030 <__stack_chk_fail@plt>
    1240:	c9                   	leave
    1241:	c3                   	ret

0000000000001242 <simd_128_arr32_ns>:
    1242:	55                   	push   %rbp
    1243:	48 89 e5             	mov    %rsp,%rbp
    1246:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    124a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    124e:	8b 40 0c             	mov    0xc(%rax),%eax
    1251:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    1255:	8b 52 08             	mov    0x8(%rdx),%edx
    1258:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    125c:	8b 49 04             	mov    0x4(%rcx),%ecx
    125f:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    1263:	8b 36                	mov    (%rsi),%esi
    1265:	89 75 d0             	mov    %esi,-0x30(%rbp)
    1268:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
    126b:	89 55 d8             	mov    %edx,-0x28(%rbp)
    126e:	89 45 dc             	mov    %eax,-0x24(%rbp)
    1271:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1274:	89 45 e0             	mov    %eax,-0x20(%rbp)
    1277:	8b 45 d8             	mov    -0x28(%rbp),%eax
    127a:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    127d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    1280:	89 45 e8             	mov    %eax,-0x18(%rbp)
    1283:	8b 45 d0             	mov    -0x30(%rbp),%eax
    1286:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1289:	66 0f 6e 45 e0       	movd   -0x20(%rbp),%xmm0
    128e:	66 0f 6e 4d e4       	movd   -0x1c(%rbp),%xmm1
    1293:	66 0f 6f d1          	movdqa %xmm1,%xmm2
    1297:	66 0f 62 d0          	punpckldq %xmm0,%xmm2
    129b:	66 0f 6e 4d e8       	movd   -0x18(%rbp),%xmm1
    12a0:	66 0f 6e 45 ec       	movd   -0x14(%rbp),%xmm0
    12a5:	66 0f 62 c1          	punpckldq %xmm1,%xmm0
    12a9:	66 0f 6c c2          	punpcklqdq %xmm2,%xmm0
    12ad:	90                   	nop
    12ae:	0f 29 45 f0          	movaps %xmm0,-0x10(%rbp)
    12b2:	66 0f 6f 45 f0       	movdqa -0x10(%rbp),%xmm0
    12b7:	5d                   	pop    %rbp
    12b8:	c3                   	ret

00000000000012b9 <simd_128_add_ns>:
    12b9:	55                   	push   %rbp
    12ba:	48 89 e5             	mov    %rsp,%rbp
    12bd:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    12c1:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    12c5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    12c9:	66 0f 6f 00          	movdqa (%rax),%xmm0
    12cd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    12d1:	66 0f 6f 08          	movdqa (%rax),%xmm1
    12d5:	0f 29 4d e0          	movaps %xmm1,-0x20(%rbp)
    12d9:	0f 29 45 f0          	movaps %xmm0,-0x10(%rbp)
    12dd:	66 0f 6f 4d e0       	movdqa -0x20(%rbp),%xmm1
    12e2:	66 0f 6f 45 f0       	movdqa -0x10(%rbp),%xmm0
    12e7:	66 0f fe c1          	paddd  %xmm1,%xmm0
    12eb:	0f 29 45 d0          	movaps %xmm0,-0x30(%rbp)
    12ef:	66 0f 6f 45 d0       	movdqa -0x30(%rbp),%xmm0
    12f4:	5d                   	pop    %rbp
    12f5:	c3                   	ret

Disassembly of section .fini:

00000000000012f8 <_fini>:
    12f8:	f3 0f 1e fa          	endbr64
    12fc:	48 83 ec 08          	sub    $0x8,%rsp
    1300:	48 83 c4 08          	add    $0x8,%rsp
    1304:	c3                   	ret
