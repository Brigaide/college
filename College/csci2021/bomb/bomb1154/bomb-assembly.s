
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400b00 <_init>:
  400b00:	48 83 ec 08          	sub    $0x8,%rsp
  400b04:	48 8b 05 ed 34 20 00 	mov    0x2034ed(%rip),%rax        # 603ff8 <__gmon_start__>
  400b0b:	48 85 c0             	test   %rax,%rax
  400b0e:	74 05                	je     400b15 <_init+0x15>
  400b10:	e8 db 01 00 00       	callq  400cf0 <__gmon_start__@plt>
  400b15:	48 83 c4 08          	add    $0x8,%rsp
  400b19:	c3                   	retq   

Disassembly of section .plt:

0000000000400b20 <.plt>:
  400b20:	ff 35 e2 34 20 00    	pushq  0x2034e2(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400b26:	ff 25 e4 34 20 00    	jmpq   *0x2034e4(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400b2c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400b30 <getenv@plt>:
  400b30:	ff 25 e2 34 20 00    	jmpq   *0x2034e2(%rip)        # 604018 <getenv@GLIBC_2.2.5>
  400b36:	68 00 00 00 00       	pushq  $0x0
  400b3b:	e9 e0 ff ff ff       	jmpq   400b20 <.plt>

0000000000400b40 <strcasecmp@plt>:
  400b40:	ff 25 da 34 20 00    	jmpq   *0x2034da(%rip)        # 604020 <strcasecmp@GLIBC_2.2.5>
  400b46:	68 01 00 00 00       	pushq  $0x1
  400b4b:	e9 d0 ff ff ff       	jmpq   400b20 <.plt>

0000000000400b50 <__errno_location@plt>:
  400b50:	ff 25 d2 34 20 00    	jmpq   *0x2034d2(%rip)        # 604028 <__errno_location@GLIBC_2.2.5>
  400b56:	68 02 00 00 00       	pushq  $0x2
  400b5b:	e9 c0 ff ff ff       	jmpq   400b20 <.plt>

0000000000400b60 <strcpy@plt>:
  400b60:	ff 25 ca 34 20 00    	jmpq   *0x2034ca(%rip)        # 604030 <strcpy@GLIBC_2.2.5>
  400b66:	68 03 00 00 00       	pushq  $0x3
  400b6b:	e9 b0 ff ff ff       	jmpq   400b20 <.plt>

0000000000400b70 <puts@plt>:
  400b70:	ff 25 c2 34 20 00    	jmpq   *0x2034c2(%rip)        # 604038 <puts@GLIBC_2.2.5>
  400b76:	68 04 00 00 00       	pushq  $0x4
  400b7b:	e9 a0 ff ff ff       	jmpq   400b20 <.plt>

0000000000400b80 <write@plt>:
  400b80:	ff 25 ba 34 20 00    	jmpq   *0x2034ba(%rip)        # 604040 <write@GLIBC_2.2.5>
  400b86:	68 05 00 00 00       	pushq  $0x5
  400b8b:	e9 90 ff ff ff       	jmpq   400b20 <.plt>

0000000000400b90 <__stack_chk_fail@plt>:
  400b90:	ff 25 b2 34 20 00    	jmpq   *0x2034b2(%rip)        # 604048 <__stack_chk_fail@GLIBC_2.4>
  400b96:	68 06 00 00 00       	pushq  $0x6
  400b9b:	e9 80 ff ff ff       	jmpq   400b20 <.plt>

0000000000400ba0 <alarm@plt>:
  400ba0:	ff 25 aa 34 20 00    	jmpq   *0x2034aa(%rip)        # 604050 <alarm@GLIBC_2.2.5>
  400ba6:	68 07 00 00 00       	pushq  $0x7
  400bab:	e9 70 ff ff ff       	jmpq   400b20 <.plt>

0000000000400bb0 <close@plt>:
  400bb0:	ff 25 a2 34 20 00    	jmpq   *0x2034a2(%rip)        # 604058 <close@GLIBC_2.2.5>
  400bb6:	68 08 00 00 00       	pushq  $0x8
  400bbb:	e9 60 ff ff ff       	jmpq   400b20 <.plt>

0000000000400bc0 <read@plt>:
  400bc0:	ff 25 9a 34 20 00    	jmpq   *0x20349a(%rip)        # 604060 <read@GLIBC_2.2.5>
  400bc6:	68 09 00 00 00       	pushq  $0x9
  400bcb:	e9 50 ff ff ff       	jmpq   400b20 <.plt>

0000000000400bd0 <__libc_start_main@plt>:
  400bd0:	ff 25 92 34 20 00    	jmpq   *0x203492(%rip)        # 604068 <__libc_start_main@GLIBC_2.2.5>
  400bd6:	68 0a 00 00 00       	pushq  $0xa
  400bdb:	e9 40 ff ff ff       	jmpq   400b20 <.plt>

0000000000400be0 <fgets@plt>:
  400be0:	ff 25 8a 34 20 00    	jmpq   *0x20348a(%rip)        # 604070 <fgets@GLIBC_2.2.5>
  400be6:	68 0b 00 00 00       	pushq  $0xb
  400beb:	e9 30 ff ff ff       	jmpq   400b20 <.plt>

0000000000400bf0 <signal@plt>:
  400bf0:	ff 25 82 34 20 00    	jmpq   *0x203482(%rip)        # 604078 <signal@GLIBC_2.2.5>
  400bf6:	68 0c 00 00 00       	pushq  $0xc
  400bfb:	e9 20 ff ff ff       	jmpq   400b20 <.plt>

0000000000400c00 <gethostbyname@plt>:
  400c00:	ff 25 7a 34 20 00    	jmpq   *0x20347a(%rip)        # 604080 <gethostbyname@GLIBC_2.2.5>
  400c06:	68 0d 00 00 00       	pushq  $0xd
  400c0b:	e9 10 ff ff ff       	jmpq   400b20 <.plt>

0000000000400c10 <__memmove_chk@plt>:
  400c10:	ff 25 72 34 20 00    	jmpq   *0x203472(%rip)        # 604088 <__memmove_chk@GLIBC_2.3.4>
  400c16:	68 0e 00 00 00       	pushq  $0xe
  400c1b:	e9 00 ff ff ff       	jmpq   400b20 <.plt>

0000000000400c20 <strtol@plt>:
  400c20:	ff 25 6a 34 20 00    	jmpq   *0x20346a(%rip)        # 604090 <strtol@GLIBC_2.2.5>
  400c26:	68 0f 00 00 00       	pushq  $0xf
  400c2b:	e9 f0 fe ff ff       	jmpq   400b20 <.plt>

0000000000400c30 <fflush@plt>:
  400c30:	ff 25 62 34 20 00    	jmpq   *0x203462(%rip)        # 604098 <fflush@GLIBC_2.2.5>
  400c36:	68 10 00 00 00       	pushq  $0x10
  400c3b:	e9 e0 fe ff ff       	jmpq   400b20 <.plt>

0000000000400c40 <__isoc99_sscanf@plt>:
  400c40:	ff 25 5a 34 20 00    	jmpq   *0x20345a(%rip)        # 6040a0 <__isoc99_sscanf@GLIBC_2.7>
  400c46:	68 11 00 00 00       	pushq  $0x11
  400c4b:	e9 d0 fe ff ff       	jmpq   400b20 <.plt>

0000000000400c50 <__printf_chk@plt>:
  400c50:	ff 25 52 34 20 00    	jmpq   *0x203452(%rip)        # 6040a8 <__printf_chk@GLIBC_2.3.4>
  400c56:	68 12 00 00 00       	pushq  $0x12
  400c5b:	e9 c0 fe ff ff       	jmpq   400b20 <.plt>

0000000000400c60 <fopen@plt>:
  400c60:	ff 25 4a 34 20 00    	jmpq   *0x20344a(%rip)        # 6040b0 <fopen@GLIBC_2.2.5>
  400c66:	68 13 00 00 00       	pushq  $0x13
  400c6b:	e9 b0 fe ff ff       	jmpq   400b20 <.plt>

0000000000400c70 <gethostname@plt>:
  400c70:	ff 25 42 34 20 00    	jmpq   *0x203442(%rip)        # 6040b8 <gethostname@GLIBC_2.2.5>
  400c76:	68 14 00 00 00       	pushq  $0x14
  400c7b:	e9 a0 fe ff ff       	jmpq   400b20 <.plt>

0000000000400c80 <exit@plt>:
  400c80:	ff 25 3a 34 20 00    	jmpq   *0x20343a(%rip)        # 6040c0 <exit@GLIBC_2.2.5>
  400c86:	68 15 00 00 00       	pushq  $0x15
  400c8b:	e9 90 fe ff ff       	jmpq   400b20 <.plt>

0000000000400c90 <connect@plt>:
  400c90:	ff 25 32 34 20 00    	jmpq   *0x203432(%rip)        # 6040c8 <connect@GLIBC_2.2.5>
  400c96:	68 16 00 00 00       	pushq  $0x16
  400c9b:	e9 80 fe ff ff       	jmpq   400b20 <.plt>

0000000000400ca0 <__fprintf_chk@plt>:
  400ca0:	ff 25 2a 34 20 00    	jmpq   *0x20342a(%rip)        # 6040d0 <__fprintf_chk@GLIBC_2.3.4>
  400ca6:	68 17 00 00 00       	pushq  $0x17
  400cab:	e9 70 fe ff ff       	jmpq   400b20 <.plt>

0000000000400cb0 <sleep@plt>:
  400cb0:	ff 25 22 34 20 00    	jmpq   *0x203422(%rip)        # 6040d8 <sleep@GLIBC_2.2.5>
  400cb6:	68 18 00 00 00       	pushq  $0x18
  400cbb:	e9 60 fe ff ff       	jmpq   400b20 <.plt>

0000000000400cc0 <__ctype_b_loc@plt>:
  400cc0:	ff 25 1a 34 20 00    	jmpq   *0x20341a(%rip)        # 6040e0 <__ctype_b_loc@GLIBC_2.3>
  400cc6:	68 19 00 00 00       	pushq  $0x19
  400ccb:	e9 50 fe ff ff       	jmpq   400b20 <.plt>

0000000000400cd0 <__sprintf_chk@plt>:
  400cd0:	ff 25 12 34 20 00    	jmpq   *0x203412(%rip)        # 6040e8 <__sprintf_chk@GLIBC_2.3.4>
  400cd6:	68 1a 00 00 00       	pushq  $0x1a
  400cdb:	e9 40 fe ff ff       	jmpq   400b20 <.plt>

0000000000400ce0 <socket@plt>:
  400ce0:	ff 25 0a 34 20 00    	jmpq   *0x20340a(%rip)        # 6040f0 <socket@GLIBC_2.2.5>
  400ce6:	68 1b 00 00 00       	pushq  $0x1b
  400ceb:	e9 30 fe ff ff       	jmpq   400b20 <.plt>

Disassembly of section .plt.got:

0000000000400cf0 <__gmon_start__@plt>:
  400cf0:	ff 25 02 33 20 00    	jmpq   *0x203302(%rip)        # 603ff8 <__gmon_start__>
  400cf6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400d00 <_start>:
  400d00:	31 ed                	xor    %ebp,%ebp
  400d02:	49 89 d1             	mov    %rdx,%r9
  400d05:	5e                   	pop    %rsi
  400d06:	48 89 e2             	mov    %rsp,%rdx
  400d09:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400d0d:	50                   	push   %rax
  400d0e:	54                   	push   %rsp
  400d0f:	49 c7 c0 70 25 40 00 	mov    $0x402570,%r8
  400d16:	48 c7 c1 00 25 40 00 	mov    $0x402500,%rcx
  400d1d:	48 c7 c7 f6 0d 40 00 	mov    $0x400df6,%rdi
  400d24:	e8 a7 fe ff ff       	callq  400bd0 <__libc_start_main@plt>
  400d29:	f4                   	hlt    
  400d2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400d30 <deregister_tm_clones>:
  400d30:	b8 87 4b 60 00       	mov    $0x604b87,%eax
  400d35:	55                   	push   %rbp
  400d36:	48 2d 80 4b 60 00    	sub    $0x604b80,%rax
  400d3c:	48 83 f8 0e          	cmp    $0xe,%rax
  400d40:	48 89 e5             	mov    %rsp,%rbp
  400d43:	76 1b                	jbe    400d60 <deregister_tm_clones+0x30>
  400d45:	b8 00 00 00 00       	mov    $0x0,%eax
  400d4a:	48 85 c0             	test   %rax,%rax
  400d4d:	74 11                	je     400d60 <deregister_tm_clones+0x30>
  400d4f:	5d                   	pop    %rbp
  400d50:	bf 80 4b 60 00       	mov    $0x604b80,%edi
  400d55:	ff e0                	jmpq   *%rax
  400d57:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400d5e:	00 00 
  400d60:	5d                   	pop    %rbp
  400d61:	c3                   	retq   
  400d62:	0f 1f 40 00          	nopl   0x0(%rax)
  400d66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400d6d:	00 00 00 

0000000000400d70 <register_tm_clones>:
  400d70:	be 80 4b 60 00       	mov    $0x604b80,%esi
  400d75:	55                   	push   %rbp
  400d76:	48 81 ee 80 4b 60 00 	sub    $0x604b80,%rsi
  400d7d:	48 c1 fe 03          	sar    $0x3,%rsi
  400d81:	48 89 e5             	mov    %rsp,%rbp
  400d84:	48 89 f0             	mov    %rsi,%rax
  400d87:	48 c1 e8 3f          	shr    $0x3f,%rax
  400d8b:	48 01 c6             	add    %rax,%rsi
  400d8e:	48 d1 fe             	sar    %rsi
  400d91:	74 15                	je     400da8 <register_tm_clones+0x38>
  400d93:	b8 00 00 00 00       	mov    $0x0,%eax
  400d98:	48 85 c0             	test   %rax,%rax
  400d9b:	74 0b                	je     400da8 <register_tm_clones+0x38>
  400d9d:	5d                   	pop    %rbp
  400d9e:	bf 80 4b 60 00       	mov    $0x604b80,%edi
  400da3:	ff e0                	jmpq   *%rax
  400da5:	0f 1f 00             	nopl   (%rax)
  400da8:	5d                   	pop    %rbp
  400da9:	c3                   	retq   
  400daa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400db0 <__do_global_dtors_aux>:
  400db0:	80 3d f1 3d 20 00 00 	cmpb   $0x0,0x203df1(%rip)        # 604ba8 <completed.7594>
  400db7:	75 11                	jne    400dca <__do_global_dtors_aux+0x1a>
  400db9:	55                   	push   %rbp
  400dba:	48 89 e5             	mov    %rsp,%rbp
  400dbd:	e8 6e ff ff ff       	callq  400d30 <deregister_tm_clones>
  400dc2:	5d                   	pop    %rbp
  400dc3:	c6 05 de 3d 20 00 01 	movb   $0x1,0x203dde(%rip)        # 604ba8 <completed.7594>
  400dca:	f3 c3                	repz retq 
  400dcc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400dd0 <frame_dummy>:
  400dd0:	bf 20 3e 60 00       	mov    $0x603e20,%edi
  400dd5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400dd9:	75 05                	jne    400de0 <frame_dummy+0x10>
  400ddb:	eb 93                	jmp    400d70 <register_tm_clones>
  400ddd:	0f 1f 00             	nopl   (%rax)
  400de0:	b8 00 00 00 00       	mov    $0x0,%eax
  400de5:	48 85 c0             	test   %rax,%rax
  400de8:	74 f1                	je     400ddb <frame_dummy+0xb>
  400dea:	55                   	push   %rbp
  400deb:	48 89 e5             	mov    %rsp,%rbp
  400dee:	ff d0                	callq  *%rax
  400df0:	5d                   	pop    %rbp
  400df1:	e9 7a ff ff ff       	jmpq   400d70 <register_tm_clones>

0000000000400df6 <main>:
  400df6:	53                   	push   %rbx
  400df7:	83 ff 01             	cmp    $0x1,%edi
  400dfa:	75 10                	jne    400e0c <main+0x16>
  400dfc:	48 8b 05 8d 3d 20 00 	mov    0x203d8d(%rip),%rax        # 604b90 <stdin@@GLIBC_2.2.5>
  400e03:	48 89 05 a6 3d 20 00 	mov    %rax,0x203da6(%rip)        # 604bb0 <infile>
  400e0a:	eb 63                	jmp    400e6f <main+0x79>
  400e0c:	48 89 f3             	mov    %rsi,%rbx
  400e0f:	83 ff 02             	cmp    $0x2,%edi
  400e12:	75 3a                	jne    400e4e <main+0x58>
  400e14:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  400e18:	be 84 25 40 00       	mov    $0x402584,%esi
  400e1d:	e8 3e fe ff ff       	callq  400c60 <fopen@plt>
  400e22:	48 89 05 87 3d 20 00 	mov    %rax,0x203d87(%rip)        # 604bb0 <infile>
  400e29:	48 85 c0             	test   %rax,%rax
  400e2c:	75 41                	jne    400e6f <main+0x79>
  400e2e:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  400e32:	48 8b 13             	mov    (%rbx),%rdx
  400e35:	be 86 25 40 00       	mov    $0x402586,%esi
  400e3a:	bf 01 00 00 00       	mov    $0x1,%edi
  400e3f:	e8 0c fe ff ff       	callq  400c50 <__printf_chk@plt>
  400e44:	bf 08 00 00 00       	mov    $0x8,%edi
  400e49:	e8 32 fe ff ff       	callq  400c80 <exit@plt>
  400e4e:	48 8b 16             	mov    (%rsi),%rdx
  400e51:	be a3 25 40 00       	mov    $0x4025a3,%esi
  400e56:	bf 01 00 00 00       	mov    $0x1,%edi
  400e5b:	b8 00 00 00 00       	mov    $0x0,%eax
  400e60:	e8 eb fd ff ff       	callq  400c50 <__printf_chk@plt>
  400e65:	bf 08 00 00 00       	mov    $0x8,%edi
  400e6a:	e8 11 fe ff ff       	callq  400c80 <exit@plt>
  400e6f:	e8 e1 05 00 00       	callq  401455 <initialize_bomb>
  400e74:	bf 08 26 40 00       	mov    $0x402608,%edi
  400e79:	e8 f2 fc ff ff       	callq  400b70 <puts@plt>
  400e7e:	bf 48 26 40 00       	mov    $0x402648,%edi
  400e83:	e8 e8 fc ff ff       	callq  400b70 <puts@plt>
  400e88:	e8 ff 08 00 00       	callq  40178c <read_line>
  400e8d:	48 89 c7             	mov    %rax,%rdi
  400e90:	e8 98 00 00 00       	callq  400f2d <phase_1>
  400e95:	e8 18 0a 00 00       	callq  4018b2 <phase_defused>
  400e9a:	bf 78 26 40 00       	mov    $0x402678,%edi
  400e9f:	e8 cc fc ff ff       	callq  400b70 <puts@plt>
  400ea4:	e8 e3 08 00 00       	callq  40178c <read_line>
  400ea9:	48 89 c7             	mov    %rax,%rdi
  400eac:	e8 98 00 00 00       	callq  400f49 <phase_2>
  400eb1:	e8 fc 09 00 00       	callq  4018b2 <phase_defused>
  400eb6:	bf bd 25 40 00       	mov    $0x4025bd,%edi
  400ebb:	e8 b0 fc ff ff       	callq  400b70 <puts@plt>
  400ec0:	e8 c7 08 00 00       	callq  40178c <read_line>
  400ec5:	48 89 c7             	mov    %rax,%rdi
  400ec8:	e8 e8 00 00 00       	callq  400fb5 <phase_3>
  400ecd:	e8 e0 09 00 00       	callq  4018b2 <phase_defused>
  400ed2:	bf db 25 40 00       	mov    $0x4025db,%edi
  400ed7:	e8 94 fc ff ff       	callq  400b70 <puts@plt>
  400edc:	e8 ab 08 00 00       	callq  40178c <read_line>
  400ee1:	48 89 c7             	mov    %rax,%rdi
  400ee4:	e8 b1 01 00 00       	callq  40109a <phase_4>
  400ee9:	e8 c4 09 00 00       	callq  4018b2 <phase_defused>
  400eee:	bf a8 26 40 00       	mov    $0x4026a8,%edi
  400ef3:	e8 78 fc ff ff       	callq  400b70 <puts@plt>
  400ef8:	e8 8f 08 00 00       	callq  40178c <read_line>
  400efd:	48 89 c7             	mov    %rax,%rdi
  400f00:	e8 08 02 00 00       	callq  40110d <phase_5>
  400f05:	e8 a8 09 00 00       	callq  4018b2 <phase_defused>
  400f0a:	bf ea 25 40 00       	mov    $0x4025ea,%edi
  400f0f:	e8 5c fc ff ff       	callq  400b70 <puts@plt>
  400f14:	e8 73 08 00 00       	callq  40178c <read_line>
  400f19:	48 89 c7             	mov    %rax,%rdi
  400f1c:	e8 78 02 00 00       	callq  401199 <phase_6>
  400f21:	e8 8c 09 00 00       	callq  4018b2 <phase_defused>
  400f26:	b8 00 00 00 00       	mov    $0x0,%eax
  400f2b:	5b                   	pop    %rbx
  400f2c:	c3                   	retq   

0000000000400f2d <phase_1>:
  400f2d:	48 83 ec 08          	sub    $0x8,%rsp
  400f31:	be d0 26 40 00       	mov    $0x4026d0,%esi
  400f36:	e8 b3 04 00 00       	callq  4013ee <strings_not_equal>
  400f3b:	85 c0                	test   %eax,%eax
  400f3d:	74 05                	je     400f44 <phase_1+0x17>
  400f3f:	e8 d3 07 00 00       	callq  401717 <explode_bomb>
  400f44:	48 83 c4 08          	add    $0x8,%rsp
  400f48:	c3                   	retq   

0000000000400f49 <phase_2>:
  400f49:	55                   	push   %rbp
  400f4a:	53                   	push   %rbx
  400f4b:	48 83 ec 28          	sub    $0x28,%rsp
  400f4f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400f56:	00 00 
  400f58:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  400f5d:	31 c0                	xor    %eax,%eax
  400f5f:	48 89 e6             	mov    %rsp,%rsi
  400f62:	e8 e6 07 00 00       	callq  40174d <read_six_numbers>
  400f67:	83 3c 24 00          	cmpl   $0x0,(%rsp)
  400f6b:	75 07                	jne    400f74 <phase_2+0x2b>
  400f6d:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
  400f72:	74 05                	je     400f79 <phase_2+0x30>
  400f74:	e8 9e 07 00 00       	callq  401717 <explode_bomb>
  400f79:	48 89 e3             	mov    %rsp,%rbx
  400f7c:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
  400f81:	8b 43 04             	mov    0x4(%rbx),%eax
  400f84:	03 03                	add    (%rbx),%eax
  400f86:	39 43 08             	cmp    %eax,0x8(%rbx)
  400f89:	74 05                	je     400f90 <phase_2+0x47>
  400f8b:	e8 87 07 00 00       	callq  401717 <explode_bomb>
  400f90:	48 83 c3 04          	add    $0x4,%rbx
  400f94:	48 39 eb             	cmp    %rbp,%rbx
  400f97:	75 e8                	jne    400f81 <phase_2+0x38>
  400f99:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  400f9e:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  400fa5:	00 00 
  400fa7:	74 05                	je     400fae <phase_2+0x65>
  400fa9:	e8 e2 fb ff ff       	callq  400b90 <__stack_chk_fail@plt>
  400fae:	48 83 c4 28          	add    $0x28,%rsp
  400fb2:	5b                   	pop    %rbx
  400fb3:	5d                   	pop    %rbp
  400fb4:	c3                   	retq   

0000000000400fb5 <phase_3>:
  400fb5:	48 83 ec 18          	sub    $0x18,%rsp
  400fb9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400fc0:	00 00 
  400fc2:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  400fc7:	31 c0                	xor    %eax,%eax
  400fc9:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
  400fce:	48 89 e2             	mov    %rsp,%rdx
  400fd1:	be 27 2a 40 00       	mov    $0x402a27,%esi
  400fd6:	e8 65 fc ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  400fdb:	83 f8 01             	cmp    $0x1,%eax
  400fde:	7f 05                	jg     400fe5 <phase_3+0x30>
  400fe0:	e8 32 07 00 00       	callq  401717 <explode_bomb>
  400fe5:	83 3c 24 07          	cmpl   $0x7,(%rsp)
  400fe9:	77 3b                	ja     401026 <phase_3+0x71>
  400feb:	8b 04 24             	mov    (%rsp),%eax
  400fee:	ff 24 c5 40 27 40 00 	jmpq   *0x402740(,%rax,8)
  400ff5:	b8 f2 01 00 00       	mov    $0x1f2,%eax
  400ffa:	eb 3b                	jmp    401037 <phase_3+0x82>
  400ffc:	b8 97 02 00 00       	mov    $0x297,%eax
  401001:	eb 34                	jmp    401037 <phase_3+0x82>
  401003:	b8 8f 03 00 00       	mov    $0x38f,%eax
  401008:	eb 2d                	jmp    401037 <phase_3+0x82>
  40100a:	b8 dc 00 00 00       	mov    $0xdc,%eax
  40100f:	eb 26                	jmp    401037 <phase_3+0x82>
  401011:	b8 b0 00 00 00       	mov    $0xb0,%eax
  401016:	eb 1f                	jmp    401037 <phase_3+0x82>
  401018:	b8 b9 02 00 00       	mov    $0x2b9,%eax
  40101d:	eb 18                	jmp    401037 <phase_3+0x82>
  40101f:	b8 0b 02 00 00       	mov    $0x20b,%eax
  401024:	eb 11                	jmp    401037 <phase_3+0x82>
  401026:	e8 ec 06 00 00       	callq  401717 <explode_bomb>
  40102b:	b8 00 00 00 00       	mov    $0x0,%eax
  401030:	eb 05                	jmp    401037 <phase_3+0x82>
  401032:	b8 34 03 00 00       	mov    $0x334,%eax
  401037:	3b 44 24 04          	cmp    0x4(%rsp),%eax
  40103b:	74 05                	je     401042 <phase_3+0x8d>
  40103d:	e8 d5 06 00 00       	callq  401717 <explode_bomb>
  401042:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  401047:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40104e:	00 00 
  401050:	74 05                	je     401057 <phase_3+0xa2>
  401052:	e8 39 fb ff ff       	callq  400b90 <__stack_chk_fail@plt>
  401057:	48 83 c4 18          	add    $0x18,%rsp
  40105b:	c3                   	retq   

000000000040105c <func4>:
  40105c:	48 83 ec 08          	sub    $0x8,%rsp
  401060:	89 d0                	mov    %edx,%eax
  401062:	29 f0                	sub    %esi,%eax
  401064:	89 c1                	mov    %eax,%ecx
  401066:	c1 e9 1f             	shr    $0x1f,%ecx
  401069:	01 c8                	add    %ecx,%eax
  40106b:	d1 f8                	sar    %eax
  40106d:	8d 0c 30             	lea    (%rax,%rsi,1),%ecx
  401070:	39 f9                	cmp    %edi,%ecx
  401072:	7e 0c                	jle    401080 <func4+0x24>
  401074:	8d 51 ff             	lea    -0x1(%rcx),%edx
  401077:	e8 e0 ff ff ff       	callq  40105c <func4>
  40107c:	01 c0                	add    %eax,%eax
  40107e:	eb 15                	jmp    401095 <func4+0x39>
  401080:	b8 00 00 00 00       	mov    $0x0,%eax
  401085:	39 f9                	cmp    %edi,%ecx
  401087:	7d 0c                	jge    401095 <func4+0x39>
  401089:	8d 71 01             	lea    0x1(%rcx),%esi
  40108c:	e8 cb ff ff ff       	callq  40105c <func4>
  401091:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  401095:	48 83 c4 08          	add    $0x8,%rsp
  401099:	c3                   	retq   

000000000040109a <phase_4>:
  40109a:	48 83 ec 18          	sub    $0x18,%rsp
  40109e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4010a5:	00 00 
  4010a7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4010ac:	31 c0                	xor    %eax,%eax
  4010ae:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
  4010b3:	48 89 e2             	mov    %rsp,%rdx
  4010b6:	be 27 2a 40 00       	mov    $0x402a27,%esi
  4010bb:	e8 80 fb ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  4010c0:	83 f8 02             	cmp    $0x2,%eax
  4010c3:	75 06                	jne    4010cb <phase_4+0x31>
  4010c5:	83 3c 24 0e          	cmpl   $0xe,(%rsp)
  4010c9:	76 05                	jbe    4010d0 <phase_4+0x36>
  4010cb:	e8 47 06 00 00       	callq  401717 <explode_bomb>
  4010d0:	ba 0e 00 00 00       	mov    $0xe,%edx
  4010d5:	be 00 00 00 00       	mov    $0x0,%esi
  4010da:	8b 3c 24             	mov    (%rsp),%edi
  4010dd:	e8 7a ff ff ff       	callq  40105c <func4>
  4010e2:	83 f8 04             	cmp    $0x4,%eax
  4010e5:	75 07                	jne    4010ee <phase_4+0x54>
  4010e7:	83 7c 24 04 04       	cmpl   $0x4,0x4(%rsp)
  4010ec:	74 05                	je     4010f3 <phase_4+0x59>
  4010ee:	e8 24 06 00 00       	callq  401717 <explode_bomb>
  4010f3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4010f8:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4010ff:	00 00 
  401101:	74 05                	je     401108 <phase_4+0x6e>
  401103:	e8 88 fa ff ff       	callq  400b90 <__stack_chk_fail@plt>
  401108:	48 83 c4 18          	add    $0x18,%rsp
  40110c:	c3                   	retq   

000000000040110d <phase_5>:
  40110d:	48 83 ec 18          	sub    $0x18,%rsp
  401111:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401118:	00 00 
  40111a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40111f:	31 c0                	xor    %eax,%eax
  401121:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
  401126:	48 89 e2             	mov    %rsp,%rdx
  401129:	be 27 2a 40 00       	mov    $0x402a27,%esi
  40112e:	e8 0d fb ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  401133:	83 f8 01             	cmp    $0x1,%eax
  401136:	7f 05                	jg     40113d <phase_5+0x30>
  401138:	e8 da 05 00 00       	callq  401717 <explode_bomb>
  40113d:	8b 04 24             	mov    (%rsp),%eax
  401140:	83 e0 0f             	and    $0xf,%eax
  401143:	89 04 24             	mov    %eax,(%rsp)
  401146:	83 f8 0f             	cmp    $0xf,%eax
  401149:	74 2f                	je     40117a <phase_5+0x6d>
  40114b:	b9 00 00 00 00       	mov    $0x0,%ecx
  401150:	ba 00 00 00 00       	mov    $0x0,%edx
  401155:	83 c2 01             	add    $0x1,%edx
  401158:	48 98                	cltq   
  40115a:	8b 04 85 80 27 40 00 	mov    0x402780(,%rax,4),%eax
  401161:	01 c1                	add    %eax,%ecx
  401163:	83 f8 0f             	cmp    $0xf,%eax
  401166:	75 ed                	jne    401155 <phase_5+0x48>
  401168:	c7 04 24 0f 00 00 00 	movl   $0xf,(%rsp)
  40116f:	83 fa 0f             	cmp    $0xf,%edx
  401172:	75 06                	jne    40117a <phase_5+0x6d>
  401174:	3b 4c 24 04          	cmp    0x4(%rsp),%ecx
  401178:	74 05                	je     40117f <phase_5+0x72>
  40117a:	e8 98 05 00 00       	callq  401717 <explode_bomb>
  40117f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  401184:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40118b:	00 00 
  40118d:	74 05                	je     401194 <phase_5+0x87>
  40118f:	e8 fc f9 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  401194:	48 83 c4 18          	add    $0x18,%rsp
  401198:	c3                   	retq   

0000000000401199 <phase_6>:
  401199:	41 56                	push   %r14
  40119b:	41 55                	push   %r13
  40119d:	41 54                	push   %r12
  40119f:	55                   	push   %rbp
  4011a0:	53                   	push   %rbx
  4011a1:	48 83 ec 60          	sub    $0x60,%rsp
  4011a5:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4011ac:	00 00 
  4011ae:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
  4011b3:	31 c0                	xor    %eax,%eax
  4011b5:	48 89 e6             	mov    %rsp,%rsi
  4011b8:	e8 90 05 00 00       	callq  40174d <read_six_numbers>
  4011bd:	49 89 e4             	mov    %rsp,%r12
  4011c0:	49 89 e5             	mov    %rsp,%r13
  4011c3:	41 be 00 00 00 00    	mov    $0x0,%r14d
  4011c9:	4c 89 ed             	mov    %r13,%rbp
  4011cc:	41 8b 45 00          	mov    0x0(%r13),%eax
  4011d0:	83 e8 01             	sub    $0x1,%eax
  4011d3:	83 f8 05             	cmp    $0x5,%eax
  4011d6:	76 05                	jbe    4011dd <phase_6+0x44>
  4011d8:	e8 3a 05 00 00       	callq  401717 <explode_bomb>
  4011dd:	41 83 c6 01          	add    $0x1,%r14d
  4011e1:	41 83 fe 06          	cmp    $0x6,%r14d
  4011e5:	74 21                	je     401208 <phase_6+0x6f>
  4011e7:	44 89 f3             	mov    %r14d,%ebx
  4011ea:	48 63 c3             	movslq %ebx,%rax
  4011ed:	8b 04 84             	mov    (%rsp,%rax,4),%eax
  4011f0:	39 45 00             	cmp    %eax,0x0(%rbp)
  4011f3:	75 05                	jne    4011fa <phase_6+0x61>
  4011f5:	e8 1d 05 00 00       	callq  401717 <explode_bomb>
  4011fa:	83 c3 01             	add    $0x1,%ebx
  4011fd:	83 fb 05             	cmp    $0x5,%ebx
  401200:	7e e8                	jle    4011ea <phase_6+0x51>
  401202:	49 83 c5 04          	add    $0x4,%r13
  401206:	eb c1                	jmp    4011c9 <phase_6+0x30>
  401208:	48 8d 4c 24 18       	lea    0x18(%rsp),%rcx
  40120d:	ba 07 00 00 00       	mov    $0x7,%edx
  401212:	89 d0                	mov    %edx,%eax
  401214:	41 2b 04 24          	sub    (%r12),%eax
  401218:	41 89 04 24          	mov    %eax,(%r12)
  40121c:	49 83 c4 04          	add    $0x4,%r12
  401220:	4c 39 e1             	cmp    %r12,%rcx
  401223:	75 ed                	jne    401212 <phase_6+0x79>
  401225:	be 00 00 00 00       	mov    $0x0,%esi
  40122a:	eb 1a                	jmp    401246 <phase_6+0xad>
  40122c:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  401230:	83 c0 01             	add    $0x1,%eax
  401233:	39 c8                	cmp    %ecx,%eax
  401235:	75 f5                	jne    40122c <phase_6+0x93>
  401237:	48 89 54 74 20       	mov    %rdx,0x20(%rsp,%rsi,2)
  40123c:	48 83 c6 04          	add    $0x4,%rsi
  401240:	48 83 fe 18          	cmp    $0x18,%rsi
  401244:	74 14                	je     40125a <phase_6+0xc1>
  401246:	8b 0c 34             	mov    (%rsp,%rsi,1),%ecx
  401249:	b8 01 00 00 00       	mov    $0x1,%eax
  40124e:	ba f0 42 60 00       	mov    $0x6042f0,%edx
  401253:	83 f9 01             	cmp    $0x1,%ecx
  401256:	7f d4                	jg     40122c <phase_6+0x93>
  401258:	eb dd                	jmp    401237 <phase_6+0x9e>
  40125a:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  40125f:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  401264:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
  401269:	48 89 d9             	mov    %rbx,%rcx
  40126c:	48 8b 50 08          	mov    0x8(%rax),%rdx
  401270:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  401274:	48 83 c0 08          	add    $0x8,%rax
  401278:	48 89 d1             	mov    %rdx,%rcx
  40127b:	48 39 c6             	cmp    %rax,%rsi
  40127e:	75 ec                	jne    40126c <phase_6+0xd3>
  401280:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
  401287:	00 
  401288:	bd 05 00 00 00       	mov    $0x5,%ebp
  40128d:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401291:	8b 00                	mov    (%rax),%eax
  401293:	39 03                	cmp    %eax,(%rbx)
  401295:	7d 05                	jge    40129c <phase_6+0x103>
  401297:	e8 7b 04 00 00       	callq  401717 <explode_bomb>
  40129c:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  4012a0:	83 ed 01             	sub    $0x1,%ebp
  4012a3:	75 e8                	jne    40128d <phase_6+0xf4>
  4012a5:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
  4012aa:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4012b1:	00 00 
  4012b3:	74 05                	je     4012ba <phase_6+0x121>
  4012b5:	e8 d6 f8 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  4012ba:	48 83 c4 60          	add    $0x60,%rsp
  4012be:	5b                   	pop    %rbx
  4012bf:	5d                   	pop    %rbp
  4012c0:	41 5c                	pop    %r12
  4012c2:	41 5d                	pop    %r13
  4012c4:	41 5e                	pop    %r14
  4012c6:	c3                   	retq   

00000000004012c7 <fun7>:
  4012c7:	48 83 ec 08          	sub    $0x8,%rsp
  4012cb:	48 85 ff             	test   %rdi,%rdi
  4012ce:	74 2b                	je     4012fb <fun7+0x34>
  4012d0:	8b 17                	mov    (%rdi),%edx
  4012d2:	39 f2                	cmp    %esi,%edx
  4012d4:	7e 0d                	jle    4012e3 <fun7+0x1c>
  4012d6:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  4012da:	e8 e8 ff ff ff       	callq  4012c7 <fun7>
  4012df:	01 c0                	add    %eax,%eax
  4012e1:	eb 1d                	jmp    401300 <fun7+0x39>
  4012e3:	b8 00 00 00 00       	mov    $0x0,%eax
  4012e8:	39 f2                	cmp    %esi,%edx
  4012ea:	74 14                	je     401300 <fun7+0x39>
  4012ec:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  4012f0:	e8 d2 ff ff ff       	callq  4012c7 <fun7>
  4012f5:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  4012f9:	eb 05                	jmp    401300 <fun7+0x39>
  4012fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401300:	48 83 c4 08          	add    $0x8,%rsp
  401304:	c3                   	retq   

0000000000401305 <secret_phase>:
  401305:	53                   	push   %rbx
  401306:	e8 81 04 00 00       	callq  40178c <read_line>
  40130b:	ba 0a 00 00 00       	mov    $0xa,%edx
  401310:	be 00 00 00 00       	mov    $0x0,%esi
  401315:	48 89 c7             	mov    %rax,%rdi
  401318:	e8 03 f9 ff ff       	callq  400c20 <strtol@plt>
  40131d:	48 89 c3             	mov    %rax,%rbx
  401320:	8d 40 ff             	lea    -0x1(%rax),%eax
  401323:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  401328:	76 05                	jbe    40132f <secret_phase+0x2a>
  40132a:	e8 e8 03 00 00       	callq  401717 <explode_bomb>
  40132f:	89 de                	mov    %ebx,%esi
  401331:	bf 10 41 60 00       	mov    $0x604110,%edi
  401336:	e8 8c ff ff ff       	callq  4012c7 <fun7>
  40133b:	85 c0                	test   %eax,%eax
  40133d:	74 05                	je     401344 <secret_phase+0x3f>
  40133f:	e8 d3 03 00 00       	callq  401717 <explode_bomb>
  401344:	bf 00 27 40 00       	mov    $0x402700,%edi
  401349:	e8 22 f8 ff ff       	callq  400b70 <puts@plt>
  40134e:	e8 5f 05 00 00       	callq  4018b2 <phase_defused>
  401353:	5b                   	pop    %rbx
  401354:	c3                   	retq   

0000000000401355 <sig_handler>:
  401355:	48 83 ec 08          	sub    $0x8,%rsp
  401359:	bf c0 27 40 00       	mov    $0x4027c0,%edi
  40135e:	e8 0d f8 ff ff       	callq  400b70 <puts@plt>
  401363:	bf 03 00 00 00       	mov    $0x3,%edi
  401368:	e8 43 f9 ff ff       	callq  400cb0 <sleep@plt>
  40136d:	be 81 29 40 00       	mov    $0x402981,%esi
  401372:	bf 01 00 00 00       	mov    $0x1,%edi
  401377:	b8 00 00 00 00       	mov    $0x0,%eax
  40137c:	e8 cf f8 ff ff       	callq  400c50 <__printf_chk@plt>
  401381:	48 8b 3d f8 37 20 00 	mov    0x2037f8(%rip),%rdi        # 604b80 <stdout@@GLIBC_2.2.5>
  401388:	e8 a3 f8 ff ff       	callq  400c30 <fflush@plt>
  40138d:	bf 01 00 00 00       	mov    $0x1,%edi
  401392:	e8 19 f9 ff ff       	callq  400cb0 <sleep@plt>
  401397:	bf 89 29 40 00       	mov    $0x402989,%edi
  40139c:	e8 cf f7 ff ff       	callq  400b70 <puts@plt>
  4013a1:	bf 10 00 00 00       	mov    $0x10,%edi
  4013a6:	e8 d5 f8 ff ff       	callq  400c80 <exit@plt>

00000000004013ab <invalid_phase>:
  4013ab:	48 83 ec 08          	sub    $0x8,%rsp
  4013af:	48 89 fa             	mov    %rdi,%rdx
  4013b2:	be 91 29 40 00       	mov    $0x402991,%esi
  4013b7:	bf 01 00 00 00       	mov    $0x1,%edi
  4013bc:	b8 00 00 00 00       	mov    $0x0,%eax
  4013c1:	e8 8a f8 ff ff       	callq  400c50 <__printf_chk@plt>
  4013c6:	bf 08 00 00 00       	mov    $0x8,%edi
  4013cb:	e8 b0 f8 ff ff       	callq  400c80 <exit@plt>

00000000004013d0 <string_length>:
  4013d0:	80 3f 00             	cmpb   $0x0,(%rdi)
  4013d3:	74 13                	je     4013e8 <string_length+0x18>
  4013d5:	b8 00 00 00 00       	mov    $0x0,%eax
  4013da:	48 83 c7 01          	add    $0x1,%rdi
  4013de:	83 c0 01             	add    $0x1,%eax
  4013e1:	80 3f 00             	cmpb   $0x0,(%rdi)
  4013e4:	75 f4                	jne    4013da <string_length+0xa>
  4013e6:	f3 c3                	repz retq 
  4013e8:	b8 00 00 00 00       	mov    $0x0,%eax
  4013ed:	c3                   	retq   

00000000004013ee <strings_not_equal>:
  4013ee:	41 54                	push   %r12
  4013f0:	55                   	push   %rbp
  4013f1:	53                   	push   %rbx
  4013f2:	48 89 fb             	mov    %rdi,%rbx
  4013f5:	48 89 f5             	mov    %rsi,%rbp
  4013f8:	e8 d3 ff ff ff       	callq  4013d0 <string_length>
  4013fd:	41 89 c4             	mov    %eax,%r12d
  401400:	48 89 ef             	mov    %rbp,%rdi
  401403:	e8 c8 ff ff ff       	callq  4013d0 <string_length>
  401408:	ba 01 00 00 00       	mov    $0x1,%edx
  40140d:	41 39 c4             	cmp    %eax,%r12d
  401410:	75 3c                	jne    40144e <strings_not_equal+0x60>
  401412:	0f b6 03             	movzbl (%rbx),%eax
  401415:	84 c0                	test   %al,%al
  401417:	74 22                	je     40143b <strings_not_equal+0x4d>
  401419:	3a 45 00             	cmp    0x0(%rbp),%al
  40141c:	74 07                	je     401425 <strings_not_equal+0x37>
  40141e:	eb 22                	jmp    401442 <strings_not_equal+0x54>
  401420:	3a 45 00             	cmp    0x0(%rbp),%al
  401423:	75 24                	jne    401449 <strings_not_equal+0x5b>
  401425:	48 83 c3 01          	add    $0x1,%rbx
  401429:	48 83 c5 01          	add    $0x1,%rbp
  40142d:	0f b6 03             	movzbl (%rbx),%eax
  401430:	84 c0                	test   %al,%al
  401432:	75 ec                	jne    401420 <strings_not_equal+0x32>
  401434:	ba 00 00 00 00       	mov    $0x0,%edx
  401439:	eb 13                	jmp    40144e <strings_not_equal+0x60>
  40143b:	ba 00 00 00 00       	mov    $0x0,%edx
  401440:	eb 0c                	jmp    40144e <strings_not_equal+0x60>
  401442:	ba 01 00 00 00       	mov    $0x1,%edx
  401447:	eb 05                	jmp    40144e <strings_not_equal+0x60>
  401449:	ba 01 00 00 00       	mov    $0x1,%edx
  40144e:	89 d0                	mov    %edx,%eax
  401450:	5b                   	pop    %rbx
  401451:	5d                   	pop    %rbp
  401452:	41 5c                	pop    %r12
  401454:	c3                   	retq   

0000000000401455 <initialize_bomb>:
  401455:	53                   	push   %rbx
  401456:	48 81 ec 50 20 00 00 	sub    $0x2050,%rsp
  40145d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401464:	00 00 
  401466:	48 89 84 24 48 20 00 	mov    %rax,0x2048(%rsp)
  40146d:	00 
  40146e:	31 c0                	xor    %eax,%eax
  401470:	be 55 13 40 00       	mov    $0x401355,%esi
  401475:	bf 02 00 00 00       	mov    $0x2,%edi
  40147a:	e8 71 f7 ff ff       	callq  400bf0 <signal@plt>
  40147f:	be 40 00 00 00       	mov    $0x40,%esi
  401484:	48 89 e7             	mov    %rsp,%rdi
  401487:	e8 e4 f7 ff ff       	callq  400c70 <gethostname@plt>
  40148c:	85 c0                	test   %eax,%eax
  40148e:	75 16                	jne    4014a6 <initialize_bomb+0x51>
  401490:	48 8b 3d e9 2e 20 00 	mov    0x202ee9(%rip),%rdi        # 604380 <host_table>
  401497:	bb 88 43 60 00       	mov    $0x604388,%ebx
  40149c:	48 85 ff             	test   %rdi,%rdi
  40149f:	75 19                	jne    4014ba <initialize_bomb+0x65>
  4014a1:	e9 81 00 00 00       	jmpq   401527 <initialize_bomb+0xd2>
  4014a6:	bf f8 27 40 00       	mov    $0x4027f8,%edi
  4014ab:	e8 c0 f6 ff ff       	callq  400b70 <puts@plt>
  4014b0:	bf 08 00 00 00       	mov    $0x8,%edi
  4014b5:	e8 c6 f7 ff ff       	callq  400c80 <exit@plt>
  4014ba:	48 89 e6             	mov    %rsp,%rsi
  4014bd:	e8 7e f6 ff ff       	callq  400b40 <strcasecmp@plt>
  4014c2:	85 c0                	test   %eax,%eax
  4014c4:	0f 84 94 00 00 00    	je     40155e <initialize_bomb+0x109>
  4014ca:	48 83 c3 08          	add    $0x8,%rbx
  4014ce:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
  4014d2:	48 85 ff             	test   %rdi,%rdi
  4014d5:	75 e3                	jne    4014ba <initialize_bomb+0x65>
  4014d7:	eb 4e                	jmp    401527 <initialize_bomb+0xd2>
  4014d9:	be a2 29 40 00       	mov    $0x4029a2,%esi
  4014de:	bf 01 00 00 00       	mov    $0x1,%edi
  4014e3:	b8 00 00 00 00       	mov    $0x0,%eax
  4014e8:	e8 63 f7 ff ff       	callq  400c50 <__printf_chk@plt>
  4014ed:	48 83 c3 08          	add    $0x8,%rbx
  4014f1:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
  4014f5:	48 85 d2             	test   %rdx,%rdx
  4014f8:	75 df                	jne    4014d9 <initialize_bomb+0x84>
  4014fa:	bf 08 00 00 00       	mov    $0x8,%edi
  4014ff:	e8 7c f7 ff ff       	callq  400c80 <exit@plt>
  401504:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
  401509:	be a8 29 40 00       	mov    $0x4029a8,%esi
  40150e:	bf 01 00 00 00       	mov    $0x1,%edi
  401513:	b8 00 00 00 00       	mov    $0x0,%eax
  401518:	e8 33 f7 ff ff       	callq  400c50 <__printf_chk@plt>
  40151d:	bf 08 00 00 00       	mov    $0x8,%edi
  401522:	e8 59 f7 ff ff       	callq  400c80 <exit@plt>
  401527:	48 89 e2             	mov    %rsp,%rdx
  40152a:	be 30 28 40 00       	mov    $0x402830,%esi
  40152f:	bf 01 00 00 00       	mov    $0x1,%edi
  401534:	b8 00 00 00 00       	mov    $0x0,%eax
  401539:	e8 12 f7 ff ff       	callq  400c50 <__printf_chk@plt>
  40153e:	bf c2 29 40 00       	mov    $0x4029c2,%edi
  401543:	e8 28 f6 ff ff       	callq  400b70 <puts@plt>
  401548:	48 8b 15 31 2e 20 00 	mov    0x202e31(%rip),%rdx        # 604380 <host_table>
  40154f:	48 85 d2             	test   %rdx,%rdx
  401552:	74 a6                	je     4014fa <initialize_bomb+0xa5>
  401554:	bb 88 43 60 00       	mov    $0x604388,%ebx
  401559:	e9 7b ff ff ff       	jmpq   4014d9 <initialize_bomb+0x84>
  40155e:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  401563:	e8 49 0d 00 00       	callq  4022b1 <init_driver>
  401568:	85 c0                	test   %eax,%eax
  40156a:	78 98                	js     401504 <initialize_bomb+0xaf>
  40156c:	48 8b 84 24 48 20 00 	mov    0x2048(%rsp),%rax
  401573:	00 
  401574:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40157b:	00 00 
  40157d:	74 05                	je     401584 <initialize_bomb+0x12f>
  40157f:	e8 0c f6 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  401584:	48 81 c4 50 20 00 00 	add    $0x2050,%rsp
  40158b:	5b                   	pop    %rbx
  40158c:	c3                   	retq   

000000000040158d <initialize_bomb_solve>:
  40158d:	f3 c3                	repz retq 

000000000040158f <blank_line>:
  40158f:	55                   	push   %rbp
  401590:	53                   	push   %rbx
  401591:	48 83 ec 08          	sub    $0x8,%rsp
  401595:	48 89 fd             	mov    %rdi,%rbp
  401598:	eb 17                	jmp    4015b1 <blank_line+0x22>
  40159a:	e8 21 f7 ff ff       	callq  400cc0 <__ctype_b_loc@plt>
  40159f:	48 83 c5 01          	add    $0x1,%rbp
  4015a3:	48 0f be db          	movsbq %bl,%rbx
  4015a7:	48 8b 00             	mov    (%rax),%rax
  4015aa:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
  4015af:	74 0f                	je     4015c0 <blank_line+0x31>
  4015b1:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  4015b5:	84 db                	test   %bl,%bl
  4015b7:	75 e1                	jne    40159a <blank_line+0xb>
  4015b9:	b8 01 00 00 00       	mov    $0x1,%eax
  4015be:	eb 05                	jmp    4015c5 <blank_line+0x36>
  4015c0:	b8 00 00 00 00       	mov    $0x0,%eax
  4015c5:	48 83 c4 08          	add    $0x8,%rsp
  4015c9:	5b                   	pop    %rbx
  4015ca:	5d                   	pop    %rbp
  4015cb:	c3                   	retq   

00000000004015cc <skip>:
  4015cc:	53                   	push   %rbx
  4015cd:	48 63 05 d8 35 20 00 	movslq 0x2035d8(%rip),%rax        # 604bac <num_input_strings>
  4015d4:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  4015d8:	48 c1 e7 04          	shl    $0x4,%rdi
  4015dc:	48 81 c7 c0 4b 60 00 	add    $0x604bc0,%rdi
  4015e3:	48 8b 15 c6 35 20 00 	mov    0x2035c6(%rip),%rdx        # 604bb0 <infile>
  4015ea:	be 50 00 00 00       	mov    $0x50,%esi
  4015ef:	e8 ec f5 ff ff       	callq  400be0 <fgets@plt>
  4015f4:	48 89 c3             	mov    %rax,%rbx
  4015f7:	48 85 c0             	test   %rax,%rax
  4015fa:	74 0c                	je     401608 <skip+0x3c>
  4015fc:	48 89 c7             	mov    %rax,%rdi
  4015ff:	e8 8b ff ff ff       	callq  40158f <blank_line>
  401604:	85 c0                	test   %eax,%eax
  401606:	75 c5                	jne    4015cd <skip+0x1>
  401608:	48 89 d8             	mov    %rbx,%rax
  40160b:	5b                   	pop    %rbx
  40160c:	c3                   	retq   

000000000040160d <send_msg>:
  40160d:	48 81 ec 18 40 00 00 	sub    $0x4018,%rsp
  401614:	41 89 f8             	mov    %edi,%r8d
  401617:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40161e:	00 00 
  401620:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401627:	00 
  401628:	31 c0                	xor    %eax,%eax
  40162a:	8b 35 7c 35 20 00    	mov    0x20357c(%rip),%esi        # 604bac <num_input_strings>
  401630:	8d 46 ff             	lea    -0x1(%rsi),%eax
  401633:	48 98                	cltq   
  401635:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  401639:	48 c1 e2 04          	shl    $0x4,%rdx
  40163d:	48 81 c2 c0 4b 60 00 	add    $0x604bc0,%rdx
  401644:	b8 00 00 00 00       	mov    $0x0,%eax
  401649:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401650:	48 89 d7             	mov    %rdx,%rdi
  401653:	f2 ae                	repnz scas %es:(%rdi),%al
  401655:	48 f7 d1             	not    %rcx
  401658:	48 83 c1 63          	add    $0x63,%rcx
  40165c:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  401663:	76 19                	jbe    40167e <send_msg+0x71>
  401665:	be 60 28 40 00       	mov    $0x402860,%esi
  40166a:	bf 01 00 00 00       	mov    $0x1,%edi
  40166f:	e8 dc f5 ff ff       	callq  400c50 <__printf_chk@plt>
  401674:	bf 08 00 00 00       	mov    $0x8,%edi
  401679:	e8 02 f6 ff ff       	callq  400c80 <exit@plt>
  40167e:	45 85 c0             	test   %r8d,%r8d
  401681:	41 b9 e6 29 40 00    	mov    $0x4029e6,%r9d
  401687:	b8 de 29 40 00       	mov    $0x4029de,%eax
  40168c:	4c 0f 45 c8          	cmovne %rax,%r9
  401690:	52                   	push   %rdx
  401691:	56                   	push   %rsi
  401692:	44 8b 05 db 2c 20 00 	mov    0x202cdb(%rip),%r8d        # 604374 <bomb_id>
  401699:	b9 ef 29 40 00       	mov    $0x4029ef,%ecx
  40169e:	ba 00 20 00 00       	mov    $0x2000,%edx
  4016a3:	be 01 00 00 00       	mov    $0x1,%esi
  4016a8:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  4016ad:	b8 00 00 00 00       	mov    $0x0,%eax
  4016b2:	e8 19 f6 ff ff       	callq  400cd0 <__sprintf_chk@plt>
  4016b7:	4c 8d 84 24 10 20 00 	lea    0x2010(%rsp),%r8
  4016be:	00 
  4016bf:	b9 00 00 00 00       	mov    $0x0,%ecx
  4016c4:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  4016c9:	be 50 43 60 00       	mov    $0x604350,%esi
  4016ce:	bf 68 43 60 00       	mov    $0x604368,%edi
  4016d3:	e8 ae 0d 00 00       	callq  402486 <driver_post>
  4016d8:	48 83 c4 10          	add    $0x10,%rsp
  4016dc:	85 c0                	test   %eax,%eax
  4016de:	79 17                	jns    4016f7 <send_msg+0xea>
  4016e0:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  4016e7:	00 
  4016e8:	e8 83 f4 ff ff       	callq  400b70 <puts@plt>
  4016ed:	bf 00 00 00 00       	mov    $0x0,%edi
  4016f2:	e8 89 f5 ff ff       	callq  400c80 <exit@plt>
  4016f7:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  4016fe:	00 
  4016ff:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401706:	00 00 
  401708:	74 05                	je     40170f <send_msg+0x102>
  40170a:	e8 81 f4 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  40170f:	48 81 c4 18 40 00 00 	add    $0x4018,%rsp
  401716:	c3                   	retq   

0000000000401717 <explode_bomb>:
  401717:	48 83 ec 08          	sub    $0x8,%rsp
  40171b:	bf fb 29 40 00       	mov    $0x4029fb,%edi
  401720:	e8 4b f4 ff ff       	callq  400b70 <puts@plt>
  401725:	bf 04 2a 40 00       	mov    $0x402a04,%edi
  40172a:	e8 41 f4 ff ff       	callq  400b70 <puts@plt>
  40172f:	bf 00 00 00 00       	mov    $0x0,%edi
  401734:	e8 d4 fe ff ff       	callq  40160d <send_msg>
  401739:	bf 88 28 40 00       	mov    $0x402888,%edi
  40173e:	e8 2d f4 ff ff       	callq  400b70 <puts@plt>
  401743:	bf 08 00 00 00       	mov    $0x8,%edi
  401748:	e8 33 f5 ff ff       	callq  400c80 <exit@plt>

000000000040174d <read_six_numbers>:
  40174d:	48 83 ec 08          	sub    $0x8,%rsp
  401751:	48 89 f2             	mov    %rsi,%rdx
  401754:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  401758:	48 8d 46 14          	lea    0x14(%rsi),%rax
  40175c:	50                   	push   %rax
  40175d:	48 8d 46 10          	lea    0x10(%rsi),%rax
  401761:	50                   	push   %rax
  401762:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  401766:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  40176a:	be 1b 2a 40 00       	mov    $0x402a1b,%esi
  40176f:	b8 00 00 00 00       	mov    $0x0,%eax
  401774:	e8 c7 f4 ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  401779:	48 83 c4 10          	add    $0x10,%rsp
  40177d:	83 f8 05             	cmp    $0x5,%eax
  401780:	7f 05                	jg     401787 <read_six_numbers+0x3a>
  401782:	e8 90 ff ff ff       	callq  401717 <explode_bomb>
  401787:	48 83 c4 08          	add    $0x8,%rsp
  40178b:	c3                   	retq   

000000000040178c <read_line>:
  40178c:	48 83 ec 08          	sub    $0x8,%rsp
  401790:	b8 00 00 00 00       	mov    $0x0,%eax
  401795:	e8 32 fe ff ff       	callq  4015cc <skip>
  40179a:	48 85 c0             	test   %rax,%rax
  40179d:	75 6e                	jne    40180d <read_line+0x81>
  40179f:	48 8b 05 ea 33 20 00 	mov    0x2033ea(%rip),%rax        # 604b90 <stdin@@GLIBC_2.2.5>
  4017a6:	48 39 05 03 34 20 00 	cmp    %rax,0x203403(%rip)        # 604bb0 <infile>
  4017ad:	75 14                	jne    4017c3 <read_line+0x37>
  4017af:	bf 2d 2a 40 00       	mov    $0x402a2d,%edi
  4017b4:	e8 b7 f3 ff ff       	callq  400b70 <puts@plt>
  4017b9:	bf 08 00 00 00       	mov    $0x8,%edi
  4017be:	e8 bd f4 ff ff       	callq  400c80 <exit@plt>
  4017c3:	bf 4b 2a 40 00       	mov    $0x402a4b,%edi
  4017c8:	e8 63 f3 ff ff       	callq  400b30 <getenv@plt>
  4017cd:	48 85 c0             	test   %rax,%rax
  4017d0:	74 0a                	je     4017dc <read_line+0x50>
  4017d2:	bf 00 00 00 00       	mov    $0x0,%edi
  4017d7:	e8 a4 f4 ff ff       	callq  400c80 <exit@plt>
  4017dc:	48 8b 05 ad 33 20 00 	mov    0x2033ad(%rip),%rax        # 604b90 <stdin@@GLIBC_2.2.5>
  4017e3:	48 89 05 c6 33 20 00 	mov    %rax,0x2033c6(%rip)        # 604bb0 <infile>
  4017ea:	b8 00 00 00 00       	mov    $0x0,%eax
  4017ef:	e8 d8 fd ff ff       	callq  4015cc <skip>
  4017f4:	48 85 c0             	test   %rax,%rax
  4017f7:	75 14                	jne    40180d <read_line+0x81>
  4017f9:	bf 2d 2a 40 00       	mov    $0x402a2d,%edi
  4017fe:	e8 6d f3 ff ff       	callq  400b70 <puts@plt>
  401803:	bf 00 00 00 00       	mov    $0x0,%edi
  401808:	e8 73 f4 ff ff       	callq  400c80 <exit@plt>
  40180d:	8b 35 99 33 20 00    	mov    0x203399(%rip),%esi        # 604bac <num_input_strings>
  401813:	48 63 c6             	movslq %esi,%rax
  401816:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  40181a:	48 c1 e2 04          	shl    $0x4,%rdx
  40181e:	48 81 c2 c0 4b 60 00 	add    $0x604bc0,%rdx
  401825:	b8 00 00 00 00       	mov    $0x0,%eax
  40182a:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401831:	48 89 d7             	mov    %rdx,%rdi
  401834:	f2 ae                	repnz scas %es:(%rdi),%al
  401836:	48 f7 d1             	not    %rcx
  401839:	48 83 e9 01          	sub    $0x1,%rcx
  40183d:	83 f9 4e             	cmp    $0x4e,%ecx
  401840:	7e 46                	jle    401888 <read_line+0xfc>
  401842:	bf 56 2a 40 00       	mov    $0x402a56,%edi
  401847:	e8 24 f3 ff ff       	callq  400b70 <puts@plt>
  40184c:	8b 05 5a 33 20 00    	mov    0x20335a(%rip),%eax        # 604bac <num_input_strings>
  401852:	8d 50 01             	lea    0x1(%rax),%edx
  401855:	89 15 51 33 20 00    	mov    %edx,0x203351(%rip)        # 604bac <num_input_strings>
  40185b:	48 98                	cltq   
  40185d:	48 6b c0 50          	imul   $0x50,%rax,%rax
  401861:	48 bf 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rdi
  401868:	75 6e 63 
  40186b:	48 89 b8 c0 4b 60 00 	mov    %rdi,0x604bc0(%rax)
  401872:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
  401879:	2a 2a 00 
  40187c:	48 89 b8 c8 4b 60 00 	mov    %rdi,0x604bc8(%rax)
  401883:	e8 8f fe ff ff       	callq  401717 <explode_bomb>
  401888:	83 e9 01             	sub    $0x1,%ecx
  40188b:	48 63 c9             	movslq %ecx,%rcx
  40188e:	48 63 c6             	movslq %esi,%rax
  401891:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401895:	48 c1 e0 04          	shl    $0x4,%rax
  401899:	c6 84 01 c0 4b 60 00 	movb   $0x0,0x604bc0(%rcx,%rax,1)
  4018a0:	00 
  4018a1:	8d 46 01             	lea    0x1(%rsi),%eax
  4018a4:	89 05 02 33 20 00    	mov    %eax,0x203302(%rip)        # 604bac <num_input_strings>
  4018aa:	48 89 d0             	mov    %rdx,%rax
  4018ad:	48 83 c4 08          	add    $0x8,%rsp
  4018b1:	c3                   	retq   

00000000004018b2 <phase_defused>:
  4018b2:	48 83 ec 78          	sub    $0x78,%rsp
  4018b6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4018bd:	00 00 
  4018bf:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  4018c4:	31 c0                	xor    %eax,%eax
  4018c6:	bf 01 00 00 00       	mov    $0x1,%edi
  4018cb:	e8 3d fd ff ff       	callq  40160d <send_msg>
  4018d0:	83 3d d5 32 20 00 06 	cmpl   $0x6,0x2032d5(%rip)        # 604bac <num_input_strings>
  4018d7:	75 6d                	jne    401946 <phase_defused+0x94>
  4018d9:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  4018de:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  4018e3:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  4018e8:	be 71 2a 40 00       	mov    $0x402a71,%esi
  4018ed:	bf b0 4c 60 00       	mov    $0x604cb0,%edi
  4018f2:	b8 00 00 00 00       	mov    $0x0,%eax
  4018f7:	e8 44 f3 ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  4018fc:	83 f8 03             	cmp    $0x3,%eax
  4018ff:	75 31                	jne    401932 <phase_defused+0x80>
  401901:	be 7a 2a 40 00       	mov    $0x402a7a,%esi
  401906:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  40190b:	e8 de fa ff ff       	callq  4013ee <strings_not_equal>
  401910:	85 c0                	test   %eax,%eax
  401912:	75 1e                	jne    401932 <phase_defused+0x80>
  401914:	bf b0 28 40 00       	mov    $0x4028b0,%edi
  401919:	e8 52 f2 ff ff       	callq  400b70 <puts@plt>
  40191e:	bf d8 28 40 00       	mov    $0x4028d8,%edi
  401923:	e8 48 f2 ff ff       	callq  400b70 <puts@plt>
  401928:	b8 00 00 00 00       	mov    $0x0,%eax
  40192d:	e8 d3 f9 ff ff       	callq  401305 <secret_phase>
  401932:	bf 10 29 40 00       	mov    $0x402910,%edi
  401937:	e8 34 f2 ff ff       	callq  400b70 <puts@plt>
  40193c:	bf 40 29 40 00       	mov    $0x402940,%edi
  401941:	e8 2a f2 ff ff       	callq  400b70 <puts@plt>
  401946:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  40194b:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401952:	00 00 
  401954:	74 05                	je     40195b <phase_defused+0xa9>
  401956:	e8 35 f2 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  40195b:	48 83 c4 78          	add    $0x78,%rsp
  40195f:	c3                   	retq   

0000000000401960 <sigalrm_handler>:
  401960:	48 83 ec 08          	sub    $0x8,%rsp
  401964:	b9 00 00 00 00       	mov    $0x0,%ecx
  401969:	ba 08 33 40 00       	mov    $0x403308,%edx
  40196e:	be 01 00 00 00       	mov    $0x1,%esi
  401973:	48 8b 3d 26 32 20 00 	mov    0x203226(%rip),%rdi        # 604ba0 <stderr@@GLIBC_2.2.5>
  40197a:	b8 00 00 00 00       	mov    $0x0,%eax
  40197f:	e8 1c f3 ff ff       	callq  400ca0 <__fprintf_chk@plt>
  401984:	bf 01 00 00 00       	mov    $0x1,%edi
  401989:	e8 f2 f2 ff ff       	callq  400c80 <exit@plt>

000000000040198e <rio_readlineb>:
  40198e:	41 56                	push   %r14
  401990:	41 55                	push   %r13
  401992:	41 54                	push   %r12
  401994:	55                   	push   %rbp
  401995:	53                   	push   %rbx
  401996:	48 83 ec 10          	sub    $0x10,%rsp
  40199a:	48 89 fb             	mov    %rdi,%rbx
  40199d:	49 89 f5             	mov    %rsi,%r13
  4019a0:	49 89 d6             	mov    %rdx,%r14
  4019a3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4019aa:	00 00 
  4019ac:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4019b1:	31 c0                	xor    %eax,%eax
  4019b3:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  4019b9:	48 8d 6f 10          	lea    0x10(%rdi),%rbp
  4019bd:	48 83 fa 01          	cmp    $0x1,%rdx
  4019c1:	77 2c                	ja     4019ef <rio_readlineb+0x61>
  4019c3:	eb 6d                	jmp    401a32 <rio_readlineb+0xa4>
  4019c5:	ba 00 20 00 00       	mov    $0x2000,%edx
  4019ca:	48 89 ee             	mov    %rbp,%rsi
  4019cd:	8b 3b                	mov    (%rbx),%edi
  4019cf:	e8 ec f1 ff ff       	callq  400bc0 <read@plt>
  4019d4:	89 43 04             	mov    %eax,0x4(%rbx)
  4019d7:	85 c0                	test   %eax,%eax
  4019d9:	79 0c                	jns    4019e7 <rio_readlineb+0x59>
  4019db:	e8 70 f1 ff ff       	callq  400b50 <__errno_location@plt>
  4019e0:	83 38 04             	cmpl   $0x4,(%rax)
  4019e3:	74 0a                	je     4019ef <rio_readlineb+0x61>
  4019e5:	eb 6c                	jmp    401a53 <rio_readlineb+0xc5>
  4019e7:	85 c0                	test   %eax,%eax
  4019e9:	74 71                	je     401a5c <rio_readlineb+0xce>
  4019eb:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4019ef:	8b 43 04             	mov    0x4(%rbx),%eax
  4019f2:	85 c0                	test   %eax,%eax
  4019f4:	7e cf                	jle    4019c5 <rio_readlineb+0x37>
  4019f6:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  4019fa:	0f b6 0a             	movzbl (%rdx),%ecx
  4019fd:	88 4c 24 07          	mov    %cl,0x7(%rsp)
  401a01:	48 83 c2 01          	add    $0x1,%rdx
  401a05:	48 89 53 08          	mov    %rdx,0x8(%rbx)
  401a09:	83 e8 01             	sub    $0x1,%eax
  401a0c:	89 43 04             	mov    %eax,0x4(%rbx)
  401a0f:	49 83 c5 01          	add    $0x1,%r13
  401a13:	41 88 4d ff          	mov    %cl,-0x1(%r13)
  401a17:	80 f9 0a             	cmp    $0xa,%cl
  401a1a:	75 0a                	jne    401a26 <rio_readlineb+0x98>
  401a1c:	eb 14                	jmp    401a32 <rio_readlineb+0xa4>
  401a1e:	41 83 fc 01          	cmp    $0x1,%r12d
  401a22:	75 0e                	jne    401a32 <rio_readlineb+0xa4>
  401a24:	eb 16                	jmp    401a3c <rio_readlineb+0xae>
  401a26:	41 83 c4 01          	add    $0x1,%r12d
  401a2a:	49 63 c4             	movslq %r12d,%rax
  401a2d:	4c 39 f0             	cmp    %r14,%rax
  401a30:	72 bd                	jb     4019ef <rio_readlineb+0x61>
  401a32:	41 c6 45 00 00       	movb   $0x0,0x0(%r13)
  401a37:	49 63 c4             	movslq %r12d,%rax
  401a3a:	eb 05                	jmp    401a41 <rio_readlineb+0xb3>
  401a3c:	b8 00 00 00 00       	mov    $0x0,%eax
  401a41:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  401a46:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  401a4d:	00 00 
  401a4f:	74 22                	je     401a73 <rio_readlineb+0xe5>
  401a51:	eb 1b                	jmp    401a6e <rio_readlineb+0xe0>
  401a53:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401a5a:	eb 05                	jmp    401a61 <rio_readlineb+0xd3>
  401a5c:	b8 00 00 00 00       	mov    $0x0,%eax
  401a61:	85 c0                	test   %eax,%eax
  401a63:	74 b9                	je     401a1e <rio_readlineb+0x90>
  401a65:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401a6c:	eb d3                	jmp    401a41 <rio_readlineb+0xb3>
  401a6e:	e8 1d f1 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  401a73:	48 83 c4 10          	add    $0x10,%rsp
  401a77:	5b                   	pop    %rbx
  401a78:	5d                   	pop    %rbp
  401a79:	41 5c                	pop    %r12
  401a7b:	41 5d                	pop    %r13
  401a7d:	41 5e                	pop    %r14
  401a7f:	c3                   	retq   

0000000000401a80 <submitr>:
  401a80:	41 57                	push   %r15
  401a82:	41 56                	push   %r14
  401a84:	41 55                	push   %r13
  401a86:	41 54                	push   %r12
  401a88:	55                   	push   %rbp
  401a89:	53                   	push   %rbx
  401a8a:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  401a91:	49 89 fd             	mov    %rdi,%r13
  401a94:	89 f5                	mov    %esi,%ebp
  401a96:	48 89 14 24          	mov    %rdx,(%rsp)
  401a9a:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  401a9f:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  401aa4:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
  401aa9:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
  401ab0:	00 
  401ab1:	4c 8b bc 24 a8 a0 00 	mov    0xa0a8(%rsp),%r15
  401ab8:	00 
  401ab9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401ac0:	00 00 
  401ac2:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
  401ac9:	00 
  401aca:	31 c0                	xor    %eax,%eax
  401acc:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  401ad3:	00 
  401ad4:	ba 00 00 00 00       	mov    $0x0,%edx
  401ad9:	be 01 00 00 00       	mov    $0x1,%esi
  401ade:	bf 02 00 00 00       	mov    $0x2,%edi
  401ae3:	e8 f8 f1 ff ff       	callq  400ce0 <socket@plt>
  401ae8:	85 c0                	test   %eax,%eax
  401aea:	79 50                	jns    401b3c <submitr+0xbc>
  401aec:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401af3:	3a 20 43 
  401af6:	49 89 07             	mov    %rax,(%r15)
  401af9:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401b00:	20 75 6e 
  401b03:	49 89 47 08          	mov    %rax,0x8(%r15)
  401b07:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401b0e:	74 6f 20 
  401b11:	49 89 47 10          	mov    %rax,0x10(%r15)
  401b15:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  401b1c:	65 20 73 
  401b1f:	49 89 47 18          	mov    %rax,0x18(%r15)
  401b23:	41 c7 47 20 6f 63 6b 	movl   $0x656b636f,0x20(%r15)
  401b2a:	65 
  401b2b:	66 41 c7 47 24 74 00 	movw   $0x74,0x24(%r15)
  401b32:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b37:	e9 12 06 00 00       	jmpq   40214e <submitr+0x6ce>
  401b3c:	41 89 c4             	mov    %eax,%r12d
  401b3f:	4c 89 ef             	mov    %r13,%rdi
  401b42:	e8 b9 f0 ff ff       	callq  400c00 <gethostbyname@plt>
  401b47:	48 85 c0             	test   %rax,%rax
  401b4a:	75 6b                	jne    401bb7 <submitr+0x137>
  401b4c:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  401b53:	3a 20 44 
  401b56:	49 89 07             	mov    %rax,(%r15)
  401b59:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  401b60:	20 75 6e 
  401b63:	49 89 47 08          	mov    %rax,0x8(%r15)
  401b67:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401b6e:	74 6f 20 
  401b71:	49 89 47 10          	mov    %rax,0x10(%r15)
  401b75:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  401b7c:	76 65 20 
  401b7f:	49 89 47 18          	mov    %rax,0x18(%r15)
  401b83:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  401b8a:	72 20 61 
  401b8d:	49 89 47 20          	mov    %rax,0x20(%r15)
  401b91:	41 c7 47 28 64 64 72 	movl   $0x65726464,0x28(%r15)
  401b98:	65 
  401b99:	66 41 c7 47 2c 73 73 	movw   $0x7373,0x2c(%r15)
  401ba0:	41 c6 47 2e 00       	movb   $0x0,0x2e(%r15)
  401ba5:	44 89 e7             	mov    %r12d,%edi
  401ba8:	e8 03 f0 ff ff       	callq  400bb0 <close@plt>
  401bad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401bb2:	e9 97 05 00 00       	jmpq   40214e <submitr+0x6ce>
  401bb7:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
  401bbe:	00 00 
  401bc0:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  401bc7:	00 00 
  401bc9:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
  401bd0:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401bd4:	48 8b 40 18          	mov    0x18(%rax),%rax
  401bd8:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
  401bdd:	b9 0c 00 00 00       	mov    $0xc,%ecx
  401be2:	48 8b 30             	mov    (%rax),%rsi
  401be5:	e8 26 f0 ff ff       	callq  400c10 <__memmove_chk@plt>
  401bea:	66 c1 cd 08          	ror    $0x8,%bp
  401bee:	66 89 6c 24 32       	mov    %bp,0x32(%rsp)
  401bf3:	ba 10 00 00 00       	mov    $0x10,%edx
  401bf8:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  401bfd:	44 89 e7             	mov    %r12d,%edi
  401c00:	e8 8b f0 ff ff       	callq  400c90 <connect@plt>
  401c05:	85 c0                	test   %eax,%eax
  401c07:	79 5d                	jns    401c66 <submitr+0x1e6>
  401c09:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  401c10:	3a 20 55 
  401c13:	49 89 07             	mov    %rax,(%r15)
  401c16:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  401c1d:	20 74 6f 
  401c20:	49 89 47 08          	mov    %rax,0x8(%r15)
  401c24:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  401c2b:	65 63 74 
  401c2e:	49 89 47 10          	mov    %rax,0x10(%r15)
  401c32:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  401c39:	68 65 20 
  401c3c:	49 89 47 18          	mov    %rax,0x18(%r15)
  401c40:	41 c7 47 20 73 65 72 	movl   $0x76726573,0x20(%r15)
  401c47:	76 
  401c48:	66 41 c7 47 24 65 72 	movw   $0x7265,0x24(%r15)
  401c4f:	41 c6 47 26 00       	movb   $0x0,0x26(%r15)
  401c54:	44 89 e7             	mov    %r12d,%edi
  401c57:	e8 54 ef ff ff       	callq  400bb0 <close@plt>
  401c5c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c61:	e9 e8 04 00 00       	jmpq   40214e <submitr+0x6ce>
  401c66:	49 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%r9
  401c6d:	b8 00 00 00 00       	mov    $0x0,%eax
  401c72:	4c 89 c9             	mov    %r9,%rcx
  401c75:	48 89 df             	mov    %rbx,%rdi
  401c78:	f2 ae                	repnz scas %es:(%rdi),%al
  401c7a:	48 f7 d1             	not    %rcx
  401c7d:	48 89 ce             	mov    %rcx,%rsi
  401c80:	4c 89 c9             	mov    %r9,%rcx
  401c83:	48 8b 3c 24          	mov    (%rsp),%rdi
  401c87:	f2 ae                	repnz scas %es:(%rdi),%al
  401c89:	49 89 c8             	mov    %rcx,%r8
  401c8c:	4c 89 c9             	mov    %r9,%rcx
  401c8f:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  401c94:	f2 ae                	repnz scas %es:(%rdi),%al
  401c96:	48 f7 d1             	not    %rcx
  401c99:	48 89 ca             	mov    %rcx,%rdx
  401c9c:	4c 89 c9             	mov    %r9,%rcx
  401c9f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  401ca4:	f2 ae                	repnz scas %es:(%rdi),%al
  401ca6:	4c 29 c2             	sub    %r8,%rdx
  401ca9:	48 29 ca             	sub    %rcx,%rdx
  401cac:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  401cb1:	48 8d 44 02 7b       	lea    0x7b(%rdx,%rax,1),%rax
  401cb6:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  401cbc:	76 73                	jbe    401d31 <submitr+0x2b1>
  401cbe:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  401cc5:	3a 20 52 
  401cc8:	49 89 07             	mov    %rax,(%r15)
  401ccb:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  401cd2:	20 73 74 
  401cd5:	49 89 47 08          	mov    %rax,0x8(%r15)
  401cd9:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  401ce0:	74 6f 6f 
  401ce3:	49 89 47 10          	mov    %rax,0x10(%r15)
  401ce7:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  401cee:	65 2e 20 
  401cf1:	49 89 47 18          	mov    %rax,0x18(%r15)
  401cf5:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  401cfc:	61 73 65 
  401cff:	49 89 47 20          	mov    %rax,0x20(%r15)
  401d03:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  401d0a:	49 54 52 
  401d0d:	49 89 47 28          	mov    %rax,0x28(%r15)
  401d11:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  401d18:	55 46 00 
  401d1b:	49 89 47 30          	mov    %rax,0x30(%r15)
  401d1f:	44 89 e7             	mov    %r12d,%edi
  401d22:	e8 89 ee ff ff       	callq  400bb0 <close@plt>
  401d27:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401d2c:	e9 1d 04 00 00       	jmpq   40214e <submitr+0x6ce>
  401d31:	48 8d 94 24 50 40 00 	lea    0x4050(%rsp),%rdx
  401d38:	00 
  401d39:	b9 00 04 00 00       	mov    $0x400,%ecx
  401d3e:	b8 00 00 00 00       	mov    $0x0,%eax
  401d43:	48 89 d7             	mov    %rdx,%rdi
  401d46:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401d49:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401d50:	48 89 df             	mov    %rbx,%rdi
  401d53:	f2 ae                	repnz scas %es:(%rdi),%al
  401d55:	48 89 c8             	mov    %rcx,%rax
  401d58:	48 f7 d0             	not    %rax
  401d5b:	48 83 e8 01          	sub    $0x1,%rax
  401d5f:	85 c0                	test   %eax,%eax
  401d61:	0f 84 90 04 00 00    	je     4021f7 <submitr+0x777>
  401d67:	8d 40 ff             	lea    -0x1(%rax),%eax
  401d6a:	4c 8d 74 03 01       	lea    0x1(%rbx,%rax,1),%r14
  401d6f:	48 89 d5             	mov    %rdx,%rbp
  401d72:	49 bd d9 ff 00 00 00 	movabs $0x2000000000ffd9,%r13
  401d79:	00 20 00 
  401d7c:	44 0f b6 03          	movzbl (%rbx),%r8d
  401d80:	41 8d 40 d6          	lea    -0x2a(%r8),%eax
  401d84:	3c 35                	cmp    $0x35,%al
  401d86:	77 06                	ja     401d8e <submitr+0x30e>
  401d88:	49 0f a3 c5          	bt     %rax,%r13
  401d8c:	72 0d                	jb     401d9b <submitr+0x31b>
  401d8e:	44 89 c0             	mov    %r8d,%eax
  401d91:	83 e0 df             	and    $0xffffffdf,%eax
  401d94:	83 e8 41             	sub    $0x41,%eax
  401d97:	3c 19                	cmp    $0x19,%al
  401d99:	77 0a                	ja     401da5 <submitr+0x325>
  401d9b:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  401d9f:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401da3:	eb 6c                	jmp    401e11 <submitr+0x391>
  401da5:	41 80 f8 20          	cmp    $0x20,%r8b
  401da9:	75 0a                	jne    401db5 <submitr+0x335>
  401dab:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  401daf:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401db3:	eb 5c                	jmp    401e11 <submitr+0x391>
  401db5:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  401db9:	3c 5f                	cmp    $0x5f,%al
  401dbb:	76 0a                	jbe    401dc7 <submitr+0x347>
  401dbd:	41 80 f8 09          	cmp    $0x9,%r8b
  401dc1:	0f 85 a3 03 00 00    	jne    40216a <submitr+0x6ea>
  401dc7:	45 0f b6 c0          	movzbl %r8b,%r8d
  401dcb:	b9 e0 33 40 00       	mov    $0x4033e0,%ecx
  401dd0:	ba 08 00 00 00       	mov    $0x8,%edx
  401dd5:	be 01 00 00 00       	mov    $0x1,%esi
  401dda:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  401de1:	00 
  401de2:	b8 00 00 00 00       	mov    $0x0,%eax
  401de7:	e8 e4 ee ff ff       	callq  400cd0 <__sprintf_chk@plt>
  401dec:	0f b6 84 24 50 80 00 	movzbl 0x8050(%rsp),%eax
  401df3:	00 
  401df4:	88 45 00             	mov    %al,0x0(%rbp)
  401df7:	0f b6 84 24 51 80 00 	movzbl 0x8051(%rsp),%eax
  401dfe:	00 
  401dff:	88 45 01             	mov    %al,0x1(%rbp)
  401e02:	0f b6 84 24 52 80 00 	movzbl 0x8052(%rsp),%eax
  401e09:	00 
  401e0a:	88 45 02             	mov    %al,0x2(%rbp)
  401e0d:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  401e11:	48 83 c3 01          	add    $0x1,%rbx
  401e15:	49 39 de             	cmp    %rbx,%r14
  401e18:	0f 85 5e ff ff ff    	jne    401d7c <submitr+0x2fc>
  401e1e:	e9 d4 03 00 00       	jmpq   4021f7 <submitr+0x777>
  401e23:	48 89 da             	mov    %rbx,%rdx
  401e26:	48 89 ee             	mov    %rbp,%rsi
  401e29:	44 89 e7             	mov    %r12d,%edi
  401e2c:	e8 4f ed ff ff       	callq  400b80 <write@plt>
  401e31:	48 85 c0             	test   %rax,%rax
  401e34:	7f 0f                	jg     401e45 <submitr+0x3c5>
  401e36:	e8 15 ed ff ff       	callq  400b50 <__errno_location@plt>
  401e3b:	83 38 04             	cmpl   $0x4,(%rax)
  401e3e:	75 12                	jne    401e52 <submitr+0x3d2>
  401e40:	b8 00 00 00 00       	mov    $0x0,%eax
  401e45:	48 01 c5             	add    %rax,%rbp
  401e48:	48 29 c3             	sub    %rax,%rbx
  401e4b:	75 d6                	jne    401e23 <submitr+0x3a3>
  401e4d:	4d 85 ed             	test   %r13,%r13
  401e50:	79 5f                	jns    401eb1 <submitr+0x431>
  401e52:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401e59:	3a 20 43 
  401e5c:	49 89 07             	mov    %rax,(%r15)
  401e5f:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401e66:	20 75 6e 
  401e69:	49 89 47 08          	mov    %rax,0x8(%r15)
  401e6d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401e74:	74 6f 20 
  401e77:	49 89 47 10          	mov    %rax,0x10(%r15)
  401e7b:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  401e82:	20 74 6f 
  401e85:	49 89 47 18          	mov    %rax,0x18(%r15)
  401e89:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
  401e90:	73 65 72 
  401e93:	49 89 47 20          	mov    %rax,0x20(%r15)
  401e97:	41 c7 47 28 76 65 72 	movl   $0x726576,0x28(%r15)
  401e9e:	00 
  401e9f:	44 89 e7             	mov    %r12d,%edi
  401ea2:	e8 09 ed ff ff       	callq  400bb0 <close@plt>
  401ea7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401eac:	e9 9d 02 00 00       	jmpq   40214e <submitr+0x6ce>
  401eb1:	44 89 64 24 40       	mov    %r12d,0x40(%rsp)
  401eb6:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%rsp)
  401ebd:	00 
  401ebe:	48 8d 44 24 50       	lea    0x50(%rsp),%rax
  401ec3:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  401ec8:	ba 00 20 00 00       	mov    $0x2000,%edx
  401ecd:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  401ed4:	00 
  401ed5:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  401eda:	e8 af fa ff ff       	callq  40198e <rio_readlineb>
  401edf:	48 85 c0             	test   %rax,%rax
  401ee2:	7f 74                	jg     401f58 <submitr+0x4d8>
  401ee4:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401eeb:	3a 20 43 
  401eee:	49 89 07             	mov    %rax,(%r15)
  401ef1:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401ef8:	20 75 6e 
  401efb:	49 89 47 08          	mov    %rax,0x8(%r15)
  401eff:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401f06:	74 6f 20 
  401f09:	49 89 47 10          	mov    %rax,0x10(%r15)
  401f0d:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  401f14:	66 69 72 
  401f17:	49 89 47 18          	mov    %rax,0x18(%r15)
  401f1b:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  401f22:	61 64 65 
  401f25:	49 89 47 20          	mov    %rax,0x20(%r15)
  401f29:	48 b8 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rax
  401f30:	6d 20 73 
  401f33:	49 89 47 28          	mov    %rax,0x28(%r15)
  401f37:	41 c7 47 30 65 72 76 	movl   $0x65767265,0x30(%r15)
  401f3e:	65 
  401f3f:	66 41 c7 47 34 72 00 	movw   $0x72,0x34(%r15)
  401f46:	44 89 e7             	mov    %r12d,%edi
  401f49:	e8 62 ec ff ff       	callq  400bb0 <close@plt>
  401f4e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f53:	e9 f6 01 00 00       	jmpq   40214e <submitr+0x6ce>
  401f58:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
  401f5f:	00 
  401f60:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  401f65:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
  401f6c:	00 
  401f6d:	be e7 33 40 00       	mov    $0x4033e7,%esi
  401f72:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
  401f79:	00 
  401f7a:	b8 00 00 00 00       	mov    $0x0,%eax
  401f7f:	e8 bc ec ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  401f84:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
  401f89:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  401f90:	0f 84 be 00 00 00    	je     402054 <submitr+0x5d4>
  401f96:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
  401f9d:	00 
  401f9e:	b9 30 33 40 00       	mov    $0x403330,%ecx
  401fa3:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401faa:	be 01 00 00 00       	mov    $0x1,%esi
  401faf:	4c 89 ff             	mov    %r15,%rdi
  401fb2:	b8 00 00 00 00       	mov    $0x0,%eax
  401fb7:	e8 14 ed ff ff       	callq  400cd0 <__sprintf_chk@plt>
  401fbc:	44 89 e7             	mov    %r12d,%edi
  401fbf:	e8 ec eb ff ff       	callq  400bb0 <close@plt>
  401fc4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401fc9:	e9 80 01 00 00       	jmpq   40214e <submitr+0x6ce>
  401fce:	ba 00 20 00 00       	mov    $0x2000,%edx
  401fd3:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  401fda:	00 
  401fdb:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  401fe0:	e8 a9 f9 ff ff       	callq  40198e <rio_readlineb>
  401fe5:	48 85 c0             	test   %rax,%rax
  401fe8:	7f 6a                	jg     402054 <submitr+0x5d4>
  401fea:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401ff1:	3a 20 43 
  401ff4:	49 89 07             	mov    %rax,(%r15)
  401ff7:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401ffe:	20 75 6e 
  402001:	49 89 47 08          	mov    %rax,0x8(%r15)
  402005:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40200c:	74 6f 20 
  40200f:	49 89 47 10          	mov    %rax,0x10(%r15)
  402013:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  40201a:	68 65 61 
  40201d:	49 89 47 18          	mov    %rax,0x18(%r15)
  402021:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402028:	66 72 6f 
  40202b:	49 89 47 20          	mov    %rax,0x20(%r15)
  40202f:	48 b8 6d 20 73 65 72 	movabs $0x726576726573206d,%rax
  402036:	76 65 72 
  402039:	49 89 47 28          	mov    %rax,0x28(%r15)
  40203d:	41 c6 47 30 00       	movb   $0x0,0x30(%r15)
  402042:	44 89 e7             	mov    %r12d,%edi
  402045:	e8 66 eb ff ff       	callq  400bb0 <close@plt>
  40204a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40204f:	e9 fa 00 00 00       	jmpq   40214e <submitr+0x6ce>
  402054:	80 bc 24 50 20 00 00 	cmpb   $0xd,0x2050(%rsp)
  40205b:	0d 
  40205c:	0f 85 6c ff ff ff    	jne    401fce <submitr+0x54e>
  402062:	80 bc 24 51 20 00 00 	cmpb   $0xa,0x2051(%rsp)
  402069:	0a 
  40206a:	0f 85 5e ff ff ff    	jne    401fce <submitr+0x54e>
  402070:	80 bc 24 52 20 00 00 	cmpb   $0x0,0x2052(%rsp)
  402077:	00 
  402078:	0f 85 50 ff ff ff    	jne    401fce <submitr+0x54e>
  40207e:	ba 00 20 00 00       	mov    $0x2000,%edx
  402083:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  40208a:	00 
  40208b:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  402090:	e8 f9 f8 ff ff       	callq  40198e <rio_readlineb>
  402095:	48 85 c0             	test   %rax,%rax
  402098:	7f 70                	jg     40210a <submitr+0x68a>
  40209a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4020a1:	3a 20 43 
  4020a4:	49 89 07             	mov    %rax,(%r15)
  4020a7:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4020ae:	20 75 6e 
  4020b1:	49 89 47 08          	mov    %rax,0x8(%r15)
  4020b5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4020bc:	74 6f 20 
  4020bf:	49 89 47 10          	mov    %rax,0x10(%r15)
  4020c3:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4020ca:	73 74 61 
  4020cd:	49 89 47 18          	mov    %rax,0x18(%r15)
  4020d1:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4020d8:	65 73 73 
  4020db:	49 89 47 20          	mov    %rax,0x20(%r15)
  4020df:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  4020e6:	72 6f 6d 
  4020e9:	49 89 47 28          	mov    %rax,0x28(%r15)
  4020ed:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  4020f4:	65 72 00 
  4020f7:	49 89 47 30          	mov    %rax,0x30(%r15)
  4020fb:	44 89 e7             	mov    %r12d,%edi
  4020fe:	e8 ad ea ff ff       	callq  400bb0 <close@plt>
  402103:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402108:	eb 44                	jmp    40214e <submitr+0x6ce>
  40210a:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  402111:	00 
  402112:	4c 89 ff             	mov    %r15,%rdi
  402115:	e8 46 ea ff ff       	callq  400b60 <strcpy@plt>
  40211a:	44 89 e7             	mov    %r12d,%edi
  40211d:	e8 8e ea ff ff       	callq  400bb0 <close@plt>
  402122:	41 0f b6 17          	movzbl (%r15),%edx
  402126:	b8 4f 00 00 00       	mov    $0x4f,%eax
  40212b:	29 d0                	sub    %edx,%eax
  40212d:	75 15                	jne    402144 <submitr+0x6c4>
  40212f:	41 0f b6 57 01       	movzbl 0x1(%r15),%edx
  402134:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402139:	29 d0                	sub    %edx,%eax
  40213b:	75 07                	jne    402144 <submitr+0x6c4>
  40213d:	41 0f b6 47 02       	movzbl 0x2(%r15),%eax
  402142:	f7 d8                	neg    %eax
  402144:	85 c0                	test   %eax,%eax
  402146:	0f 95 c0             	setne  %al
  402149:	0f b6 c0             	movzbl %al,%eax
  40214c:	f7 d8                	neg    %eax
  40214e:	48 8b 8c 24 58 a0 00 	mov    0xa058(%rsp),%rcx
  402155:	00 
  402156:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40215d:	00 00 
  40215f:	0f 84 12 01 00 00    	je     402277 <submitr+0x7f7>
  402165:	e9 08 01 00 00       	jmpq   402272 <submitr+0x7f2>
  40216a:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402171:	3a 20 52 
  402174:	49 89 07             	mov    %rax,(%r15)
  402177:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  40217e:	20 73 74 
  402181:	49 89 47 08          	mov    %rax,0x8(%r15)
  402185:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  40218c:	63 6f 6e 
  40218f:	49 89 47 10          	mov    %rax,0x10(%r15)
  402193:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  40219a:	20 61 6e 
  40219d:	49 89 47 18          	mov    %rax,0x18(%r15)
  4021a1:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4021a8:	67 61 6c 
  4021ab:	49 89 47 20          	mov    %rax,0x20(%r15)
  4021af:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4021b6:	6e 70 72 
  4021b9:	49 89 47 28          	mov    %rax,0x28(%r15)
  4021bd:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4021c4:	6c 65 20 
  4021c7:	49 89 47 30          	mov    %rax,0x30(%r15)
  4021cb:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  4021d2:	63 74 65 
  4021d5:	49 89 47 38          	mov    %rax,0x38(%r15)
  4021d9:	66 41 c7 47 40 72 2e 	movw   $0x2e72,0x40(%r15)
  4021e0:	41 c6 47 42 00       	movb   $0x0,0x42(%r15)
  4021e5:	44 89 e7             	mov    %r12d,%edi
  4021e8:	e8 c3 e9 ff ff       	callq  400bb0 <close@plt>
  4021ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4021f2:	e9 57 ff ff ff       	jmpq   40214e <submitr+0x6ce>
  4021f7:	48 8d 9c 24 50 20 00 	lea    0x2050(%rsp),%rbx
  4021fe:	00 
  4021ff:	48 83 ec 08          	sub    $0x8,%rsp
  402203:	48 8d 84 24 58 40 00 	lea    0x4058(%rsp),%rax
  40220a:	00 
  40220b:	50                   	push   %rax
  40220c:	ff 74 24 20          	pushq  0x20(%rsp)
  402210:	ff 74 24 30          	pushq  0x30(%rsp)
  402214:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
  402219:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
  40221e:	b9 60 33 40 00       	mov    $0x403360,%ecx
  402223:	ba 00 20 00 00       	mov    $0x2000,%edx
  402228:	be 01 00 00 00       	mov    $0x1,%esi
  40222d:	48 89 df             	mov    %rbx,%rdi
  402230:	b8 00 00 00 00       	mov    $0x0,%eax
  402235:	e8 96 ea ff ff       	callq  400cd0 <__sprintf_chk@plt>
  40223a:	b8 00 00 00 00       	mov    $0x0,%eax
  40223f:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402246:	48 89 df             	mov    %rbx,%rdi
  402249:	f2 ae                	repnz scas %es:(%rdi),%al
  40224b:	48 89 c8             	mov    %rcx,%rax
  40224e:	48 f7 d0             	not    %rax
  402251:	4c 8d 68 ff          	lea    -0x1(%rax),%r13
  402255:	48 83 c4 20          	add    $0x20,%rsp
  402259:	4c 89 eb             	mov    %r13,%rbx
  40225c:	48 8d ac 24 50 20 00 	lea    0x2050(%rsp),%rbp
  402263:	00 
  402264:	4d 85 ed             	test   %r13,%r13
  402267:	0f 85 b6 fb ff ff    	jne    401e23 <submitr+0x3a3>
  40226d:	e9 3f fc ff ff       	jmpq   401eb1 <submitr+0x431>
  402272:	e8 19 e9 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  402277:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  40227e:	5b                   	pop    %rbx
  40227f:	5d                   	pop    %rbp
  402280:	41 5c                	pop    %r12
  402282:	41 5d                	pop    %r13
  402284:	41 5e                	pop    %r14
  402286:	41 5f                	pop    %r15
  402288:	c3                   	retq   

0000000000402289 <init_timeout>:
  402289:	85 ff                	test   %edi,%edi
  40228b:	74 22                	je     4022af <init_timeout+0x26>
  40228d:	53                   	push   %rbx
  40228e:	89 fb                	mov    %edi,%ebx
  402290:	be 60 19 40 00       	mov    $0x401960,%esi
  402295:	bf 0e 00 00 00       	mov    $0xe,%edi
  40229a:	e8 51 e9 ff ff       	callq  400bf0 <signal@plt>
  40229f:	85 db                	test   %ebx,%ebx
  4022a1:	bf 00 00 00 00       	mov    $0x0,%edi
  4022a6:	0f 49 fb             	cmovns %ebx,%edi
  4022a9:	e8 f2 e8 ff ff       	callq  400ba0 <alarm@plt>
  4022ae:	5b                   	pop    %rbx
  4022af:	f3 c3                	repz retq 

00000000004022b1 <init_driver>:
  4022b1:	55                   	push   %rbp
  4022b2:	53                   	push   %rbx
  4022b3:	48 83 ec 28          	sub    $0x28,%rsp
  4022b7:	48 89 fd             	mov    %rdi,%rbp
  4022ba:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4022c1:	00 00 
  4022c3:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  4022c8:	31 c0                	xor    %eax,%eax
  4022ca:	be 01 00 00 00       	mov    $0x1,%esi
  4022cf:	bf 0d 00 00 00       	mov    $0xd,%edi
  4022d4:	e8 17 e9 ff ff       	callq  400bf0 <signal@plt>
  4022d9:	be 01 00 00 00       	mov    $0x1,%esi
  4022de:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4022e3:	e8 08 e9 ff ff       	callq  400bf0 <signal@plt>
  4022e8:	be 01 00 00 00       	mov    $0x1,%esi
  4022ed:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4022f2:	e8 f9 e8 ff ff       	callq  400bf0 <signal@plt>
  4022f7:	ba 00 00 00 00       	mov    $0x0,%edx
  4022fc:	be 01 00 00 00       	mov    $0x1,%esi
  402301:	bf 02 00 00 00       	mov    $0x2,%edi
  402306:	e8 d5 e9 ff ff       	callq  400ce0 <socket@plt>
  40230b:	85 c0                	test   %eax,%eax
  40230d:	79 4f                	jns    40235e <init_driver+0xad>
  40230f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402316:	3a 20 43 
  402319:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40231d:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402324:	20 75 6e 
  402327:	48 89 45 08          	mov    %rax,0x8(%rbp)
  40232b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402332:	74 6f 20 
  402335:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402339:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402340:	65 20 73 
  402343:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402347:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  40234e:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402354:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402359:	e9 0c 01 00 00       	jmpq   40246a <init_driver+0x1b9>
  40235e:	89 c3                	mov    %eax,%ebx
  402360:	bf f8 33 40 00       	mov    $0x4033f8,%edi
  402365:	e8 96 e8 ff ff       	callq  400c00 <gethostbyname@plt>
  40236a:	48 85 c0             	test   %rax,%rax
  40236d:	75 68                	jne    4023d7 <init_driver+0x126>
  40236f:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402376:	3a 20 44 
  402379:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40237d:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402384:	20 75 6e 
  402387:	48 89 45 08          	mov    %rax,0x8(%rbp)
  40238b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402392:	74 6f 20 
  402395:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402399:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4023a0:	76 65 20 
  4023a3:	48 89 45 18          	mov    %rax,0x18(%rbp)
  4023a7:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4023ae:	72 20 61 
  4023b1:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4023b5:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  4023bc:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  4023c2:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  4023c6:	89 df                	mov    %ebx,%edi
  4023c8:	e8 e3 e7 ff ff       	callq  400bb0 <close@plt>
  4023cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023d2:	e9 93 00 00 00       	jmpq   40246a <init_driver+0x1b9>
  4023d7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4023de:	00 
  4023df:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  4023e6:	00 00 
  4023e8:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  4023ee:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4023f2:	48 8b 40 18          	mov    0x18(%rax),%rax
  4023f6:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  4023fb:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402400:	48 8b 30             	mov    (%rax),%rsi
  402403:	e8 08 e8 ff ff       	callq  400c10 <__memmove_chk@plt>
  402408:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
  40240f:	ba 10 00 00 00       	mov    $0x10,%edx
  402414:	48 89 e6             	mov    %rsp,%rsi
  402417:	89 df                	mov    %ebx,%edi
  402419:	e8 72 e8 ff ff       	callq  400c90 <connect@plt>
  40241e:	85 c0                	test   %eax,%eax
  402420:	79 32                	jns    402454 <init_driver+0x1a3>
  402422:	41 b8 f8 33 40 00    	mov    $0x4033f8,%r8d
  402428:	b9 b8 33 40 00       	mov    $0x4033b8,%ecx
  40242d:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402434:	be 01 00 00 00       	mov    $0x1,%esi
  402439:	48 89 ef             	mov    %rbp,%rdi
  40243c:	b8 00 00 00 00       	mov    $0x0,%eax
  402441:	e8 8a e8 ff ff       	callq  400cd0 <__sprintf_chk@plt>
  402446:	89 df                	mov    %ebx,%edi
  402448:	e8 63 e7 ff ff       	callq  400bb0 <close@plt>
  40244d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402452:	eb 16                	jmp    40246a <init_driver+0x1b9>
  402454:	89 df                	mov    %ebx,%edi
  402456:	e8 55 e7 ff ff       	callq  400bb0 <close@plt>
  40245b:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402461:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402465:	b8 00 00 00 00       	mov    $0x0,%eax
  40246a:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  40246f:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402476:	00 00 
  402478:	74 05                	je     40247f <init_driver+0x1ce>
  40247a:	e8 11 e7 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  40247f:	48 83 c4 28          	add    $0x28,%rsp
  402483:	5b                   	pop    %rbx
  402484:	5d                   	pop    %rbp
  402485:	c3                   	retq   

0000000000402486 <driver_post>:
  402486:	53                   	push   %rbx
  402487:	4c 89 c3             	mov    %r8,%rbx
  40248a:	85 c9                	test   %ecx,%ecx
  40248c:	74 24                	je     4024b2 <driver_post+0x2c>
  40248e:	be 14 34 40 00       	mov    $0x403414,%esi
  402493:	bf 01 00 00 00       	mov    $0x1,%edi
  402498:	b8 00 00 00 00       	mov    $0x0,%eax
  40249d:	e8 ae e7 ff ff       	callq  400c50 <__printf_chk@plt>
  4024a2:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4024a7:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4024ab:	b8 00 00 00 00       	mov    $0x0,%eax
  4024b0:	eb 41                	jmp    4024f3 <driver_post+0x6d>
  4024b2:	48 85 ff             	test   %rdi,%rdi
  4024b5:	74 2e                	je     4024e5 <driver_post+0x5f>
  4024b7:	80 3f 00             	cmpb   $0x0,(%rdi)
  4024ba:	74 29                	je     4024e5 <driver_post+0x5f>
  4024bc:	41 50                	push   %r8
  4024be:	52                   	push   %rdx
  4024bf:	41 b9 2b 34 40 00    	mov    $0x40342b,%r9d
  4024c5:	49 89 f0             	mov    %rsi,%r8
  4024c8:	48 89 f9             	mov    %rdi,%rcx
  4024cb:	ba 2f 34 40 00       	mov    $0x40342f,%edx
  4024d0:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
  4024d5:	bf f8 33 40 00       	mov    $0x4033f8,%edi
  4024da:	e8 a1 f5 ff ff       	callq  401a80 <submitr>
  4024df:	48 83 c4 10          	add    $0x10,%rsp
  4024e3:	eb 0e                	jmp    4024f3 <driver_post+0x6d>
  4024e5:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4024ea:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4024ee:	b8 00 00 00 00       	mov    $0x0,%eax
  4024f3:	5b                   	pop    %rbx
  4024f4:	c3                   	retq   
  4024f5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4024fc:	00 00 00 
  4024ff:	90                   	nop

0000000000402500 <__libc_csu_init>:
  402500:	41 57                	push   %r15
  402502:	41 56                	push   %r14
  402504:	41 89 ff             	mov    %edi,%r15d
  402507:	41 55                	push   %r13
  402509:	41 54                	push   %r12
  40250b:	4c 8d 25 fe 18 20 00 	lea    0x2018fe(%rip),%r12        # 603e10 <__frame_dummy_init_array_entry>
  402512:	55                   	push   %rbp
  402513:	48 8d 2d fe 18 20 00 	lea    0x2018fe(%rip),%rbp        # 603e18 <__init_array_end>
  40251a:	53                   	push   %rbx
  40251b:	49 89 f6             	mov    %rsi,%r14
  40251e:	49 89 d5             	mov    %rdx,%r13
  402521:	4c 29 e5             	sub    %r12,%rbp
  402524:	48 83 ec 08          	sub    $0x8,%rsp
  402528:	48 c1 fd 03          	sar    $0x3,%rbp
  40252c:	e8 cf e5 ff ff       	callq  400b00 <_init>
  402531:	48 85 ed             	test   %rbp,%rbp
  402534:	74 20                	je     402556 <__libc_csu_init+0x56>
  402536:	31 db                	xor    %ebx,%ebx
  402538:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40253f:	00 
  402540:	4c 89 ea             	mov    %r13,%rdx
  402543:	4c 89 f6             	mov    %r14,%rsi
  402546:	44 89 ff             	mov    %r15d,%edi
  402549:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40254d:	48 83 c3 01          	add    $0x1,%rbx
  402551:	48 39 eb             	cmp    %rbp,%rbx
  402554:	75 ea                	jne    402540 <__libc_csu_init+0x40>
  402556:	48 83 c4 08          	add    $0x8,%rsp
  40255a:	5b                   	pop    %rbx
  40255b:	5d                   	pop    %rbp
  40255c:	41 5c                	pop    %r12
  40255e:	41 5d                	pop    %r13
  402560:	41 5e                	pop    %r14
  402562:	41 5f                	pop    %r15
  402564:	c3                   	retq   
  402565:	90                   	nop
  402566:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40256d:	00 00 00 

0000000000402570 <__libc_csu_fini>:
  402570:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402574 <_fini>:
  402574:	48 83 ec 08          	sub    $0x8,%rsp
  402578:	48 83 c4 08          	add    $0x8,%rsp
  40257c:	c3                   	retq   
