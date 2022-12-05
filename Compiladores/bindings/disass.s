
a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 92 2f 00 00    	push   QWORD PTR [rip+0x2f92]        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 93 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f93]        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nop    DWORD PTR [rax]
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop

Disassembly of section .plt.got:

0000000000001050 <__cxa_finalize@plt>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	f2 ff 25 9d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f9d]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    105b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001060 <__stack_chk_fail@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 5d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f5d]        # 3fc8 <__stack_chk_fail@GLIBC_2.4>
    106b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001070 <printf@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 55 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f55]        # 3fd0 <printf@GLIBC_2.2.5>
    107b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001080 <_start>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	31 ed                	xor    ebp,ebp
    1086:	49 89 d1             	mov    r9,rdx
    1089:	5e                   	pop    rsi
    108a:	48 89 e2             	mov    rdx,rsp
    108d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1091:	50                   	push   rax
    1092:	54                   	push   rsp
    1093:	45 31 c0             	xor    r8d,r8d
    1096:	31 c9                	xor    ecx,ecx
    1098:	48 8d 3d ca 00 00 00 	lea    rdi,[rip+0xca]        # 1169 <main>
    109f:	ff 15 33 2f 00 00    	call   QWORD PTR [rip+0x2f33]        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10a5:	f4                   	hlt    
    10a6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    10ad:	00 00 00 

00000000000010b0 <deregister_tm_clones>:
    10b0:	48 8d 3d 59 2f 00 00 	lea    rdi,[rip+0x2f59]        # 4010 <__TMC_END__>
    10b7:	48 8d 05 52 2f 00 00 	lea    rax,[rip+0x2f52]        # 4010 <__TMC_END__>
    10be:	48 39 f8             	cmp    rax,rdi
    10c1:	74 15                	je     10d8 <deregister_tm_clones+0x28>
    10c3:	48 8b 05 16 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f16]        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10ca:	48 85 c0             	test   rax,rax
    10cd:	74 09                	je     10d8 <deregister_tm_clones+0x28>
    10cf:	ff e0                	jmp    rax
    10d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    10d8:	c3                   	ret    
    10d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010e0 <register_tm_clones>:
    10e0:	48 8d 3d 29 2f 00 00 	lea    rdi,[rip+0x2f29]        # 4010 <__TMC_END__>
    10e7:	48 8d 35 22 2f 00 00 	lea    rsi,[rip+0x2f22]        # 4010 <__TMC_END__>
    10ee:	48 29 fe             	sub    rsi,rdi
    10f1:	48 89 f0             	mov    rax,rsi
    10f4:	48 c1 ee 3f          	shr    rsi,0x3f
    10f8:	48 c1 f8 03          	sar    rax,0x3
    10fc:	48 01 c6             	add    rsi,rax
    10ff:	48 d1 fe             	sar    rsi,1
    1102:	74 14                	je     1118 <register_tm_clones+0x38>
    1104:	48 8b 05 e5 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ee5]        # 3ff0 <_ITM_registerTMCloneTable@Base>
    110b:	48 85 c0             	test   rax,rax
    110e:	74 08                	je     1118 <register_tm_clones+0x38>
    1110:	ff e0                	jmp    rax
    1112:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1118:	c3                   	ret    
    1119:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001120 <__do_global_dtors_aux>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	80 3d e5 2e 00 00 00 	cmp    BYTE PTR [rip+0x2ee5],0x0        # 4010 <__TMC_END__>
    112b:	75 2b                	jne    1158 <__do_global_dtors_aux+0x38>
    112d:	55                   	push   rbp
    112e:	48 83 3d c2 2e 00 00 	cmp    QWORD PTR [rip+0x2ec2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1135:	00 
    1136:	48 89 e5             	mov    rbp,rsp
    1139:	74 0c                	je     1147 <__do_global_dtors_aux+0x27>
    113b:	48 8b 3d c6 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2ec6]        # 4008 <__dso_handle>
    1142:	e8 09 ff ff ff       	call   1050 <__cxa_finalize@plt>
    1147:	e8 64 ff ff ff       	call   10b0 <deregister_tm_clones>
    114c:	c6 05 bd 2e 00 00 01 	mov    BYTE PTR [rip+0x2ebd],0x1        # 4010 <__TMC_END__>
    1153:	5d                   	pop    rbp
    1154:	c3                   	ret    
    1155:	0f 1f 00             	nop    DWORD PTR [rax]
    1158:	c3                   	ret    
    1159:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001160 <frame_dummy>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	e9 77 ff ff ff       	jmp    10e0 <register_tm_clones>

0000000000001169 <main>:
    unsigned int count;
    struct Node * first;
};

int main()
{
    1169:	f3 0f 1e fa          	endbr64 
    116d:	55                   	push   rbp
    116e:	48 89 e5             	mov    rbp,rsp
    1171:	48 83 ec 40          	sub    rsp,0x40
    1175:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    117c:	00 00 
    117e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1182:	31 c0                	xor    eax,eax
    struct Node next;
    struct Node first;

    struct List list;
    list.count = 0;
    1184:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0

    next.value = 7;
    118b:	c7 45 c0 07 00 00 00 	mov    DWORD PTR [rbp-0x40],0x7
    next.next = NULL;
    1192:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    1199:	00 

    first.value = 5;
    119a:	c7 45 d0 05 00 00 00 	mov    DWORD PTR [rbp-0x30],0x5
    first.next = &next;
    11a1:	48 8d 45 c0          	lea    rax,[rbp-0x40]
    11a5:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

    list.first = &first;
    11a9:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    11ad:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    list.count++;
    11b1:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
    11b4:	83 c0 01             	add    eax,0x1
    11b7:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    list.count++;
    11ba:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
    11bd:	83 c0 01             	add    eax,0x1
    11c0:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax

    printf("list[%d]: ", list.count);
    11c3:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
    11c6:	89 c6                	mov    esi,eax
    11c8:	48 8d 05 35 0e 00 00 	lea    rax,[rip+0xe35]        # 2004 <_IO_stdin_used+0x4>
    11cf:	48 89 c7             	mov    rdi,rax
    11d2:	b8 00 00 00 00       	mov    eax,0x0
    11d7:	e8 94 fe ff ff       	call   1070 <printf@plt>
    printf("%d -> ", list.first->value);
    11dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    11e0:	8b 00                	mov    eax,DWORD PTR [rax]
    11e2:	89 c6                	mov    esi,eax
    11e4:	48 8d 05 24 0e 00 00 	lea    rax,[rip+0xe24]        # 200f <_IO_stdin_used+0xf>
    11eb:	48 89 c7             	mov    rdi,rax
    11ee:	b8 00 00 00 00       	mov    eax,0x0
    11f3:	e8 78 fe ff ff       	call   1070 <printf@plt>
    printf("%d\n", list.first->next->value);
    11f8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    11fc:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1200:	8b 00                	mov    eax,DWORD PTR [rax]
    1202:	89 c6                	mov    esi,eax
    1204:	48 8d 05 0b 0e 00 00 	lea    rax,[rip+0xe0b]        # 2016 <_IO_stdin_used+0x16>
    120b:	48 89 c7             	mov    rdi,rax
    120e:	b8 00 00 00 00       	mov    eax,0x0
    1213:	e8 58 fe ff ff       	call   1070 <printf@plt>

    return 0;
    1218:	b8 00 00 00 00       	mov    eax,0x0
    121d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    1221:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    1228:	00 00 
    122a:	74 05                	je     1231 <main+0xc8>
    122c:	e8 2f fe ff ff       	call   1060 <__stack_chk_fail@plt>
    1231:	c9                   	leave  
    1232:	c3                   	ret    

Disassembly of section .fini:

0000000000001234 <_fini>:
    1234:	f3 0f 1e fa          	endbr64 
    1238:	48 83 ec 08          	sub    rsp,0x8
    123c:	48 83 c4 08          	add    rsp,0x8
    1240:	c3                   	ret    
