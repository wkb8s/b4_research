
_bufwrite:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  for (pi = 0; pi < FORK_NUM; pi++) {
    wait();
  }
}

int main(int argc, char *argv[]) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  calc_write_mix();
   6:	e8 85 04 00 00       	call   490 <calc_write_mix>

  exit();
   b:	e8 93 07 00 00       	call   7a3 <exit>

00000010 <forktest>:
void forktest(void) {
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fork test\n");
  16:	68 38 0c 00 00       	push   $0xc38
  1b:	6a 01                	push   $0x1
  1d:	e8 ee 08 00 00       	call   910 <printf>
    pid = fork();
  22:	e8 74 07 00 00       	call   79b <fork>
    if (pid < 0)
  27:	83 c4 10             	add    $0x10,%esp
  2a:	85 c0                	test   %eax,%eax
  2c:	78 2c                	js     5a <forktest+0x4a>
    if (pid == 0)
  2e:	74 6f                	je     9f <forktest+0x8f>
    pid = fork();
  30:	e8 66 07 00 00       	call   79b <fork>
    if (pid < 0)
  35:	85 c0                	test   %eax,%eax
  37:	78 18                	js     51 <forktest+0x41>
    if (pid == 0)
  39:	74 64                	je     9f <forktest+0x8f>
    printf(1, "fork claimed to work N times!\n", FORK_NUM);
  3b:	83 ec 04             	sub    $0x4,%esp
  3e:	6a 02                	push   $0x2
  40:	68 4c 0e 00 00       	push   $0xe4c
  45:	6a 01                	push   $0x1
  47:	e8 c4 08 00 00       	call   910 <printf>
    exit();
  4c:	e8 52 07 00 00       	call   7a3 <exit>
    if (wait() < 0) {
  51:	e8 55 07 00 00       	call   7ab <wait>
  56:	85 c0                	test   %eax,%eax
  58:	78 1e                	js     78 <forktest+0x68>
  if (wait() != -1) {
  5a:	e8 4c 07 00 00       	call   7ab <wait>
  5f:	83 f8 ff             	cmp    $0xffffffff,%eax
  62:	75 28                	jne    8c <forktest+0x7c>
  printf(1, "fork test OK\n");
  64:	83 ec 08             	sub    $0x8,%esp
  67:	68 6a 0c 00 00       	push   $0xc6a
  6c:	6a 01                	push   $0x1
  6e:	e8 9d 08 00 00       	call   910 <printf>
}
  73:	83 c4 10             	add    $0x10,%esp
  76:	c9                   	leave  
  77:	c3                   	ret    
      printf(1, "wait stopped early\n");
  78:	83 ec 08             	sub    $0x8,%esp
  7b:	68 43 0c 00 00       	push   $0xc43
  80:	6a 01                	push   $0x1
  82:	e8 89 08 00 00       	call   910 <printf>
      exit();
  87:	e8 17 07 00 00       	call   7a3 <exit>
    printf(1, "wait got too many\n");
  8c:	50                   	push   %eax
  8d:	50                   	push   %eax
  8e:	68 57 0c 00 00       	push   $0xc57
  93:	6a 01                	push   $0x1
  95:	e8 76 08 00 00       	call   910 <printf>
    exit();
  9a:	e8 04 07 00 00       	call   7a3 <exit>
      exit();
  9f:	e8 ff 06 00 00       	call   7a3 <exit>
  a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  af:	90                   	nop

000000b0 <smallwrite>:
void smallwrite(void) {
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	56                   	push   %esi
  b4:	53                   	push   %ebx
  printf(stdout, "small file test\n");
  b5:	83 ec 08             	sub    $0x8,%esp
  b8:	68 78 0c 00 00       	push   $0xc78
  bd:	ff 35 94 12 00 00    	push   0x1294
  c3:	e8 48 08 00 00       	call   910 <printf>
  fd = open("small", O_CREATE | O_RDWR);
  c8:	58                   	pop    %eax
  c9:	5a                   	pop    %edx
  ca:	68 02 02 00 00       	push   $0x202
  cf:	68 89 0c 00 00       	push   $0xc89
  d4:	e8 0a 07 00 00       	call   7e3 <open>
  if (fd >= 0) {
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	85 c0                	test   %eax,%eax
  de:	0f 88 88 01 00 00    	js     26c <smallwrite+0x1bc>
    printf(stdout, "creat small succeeded; ok\n");
  e4:	83 ec 08             	sub    $0x8,%esp
  e7:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 100; i++) {
  e9:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
  eb:	68 8f 0c 00 00       	push   $0xc8f
  f0:	ff 35 94 12 00 00    	push   0x1294
  f6:	e8 15 08 00 00       	call   910 <printf>
  fb:	83 c4 10             	add    $0x10,%esp
  fe:	66 90                	xchg   %ax,%ax
    if (write(fd, "aaaaaaaaaa", 10) != 10) {
 100:	83 ec 04             	sub    $0x4,%esp
 103:	6a 0a                	push   $0xa
 105:	68 c6 0c 00 00       	push   $0xcc6
 10a:	56                   	push   %esi
 10b:	e8 b3 06 00 00       	call   7c3 <write>
 110:	83 c4 10             	add    $0x10,%esp
 113:	83 f8 0a             	cmp    $0xa,%eax
 116:	0f 85 d9 00 00 00    	jne    1f5 <smallwrite+0x145>
    if (write(fd, "bbbbbbbbbb", 10) != 10) {
 11c:	83 ec 04             	sub    $0x4,%esp
 11f:	6a 0a                	push   $0xa
 121:	68 d1 0c 00 00       	push   $0xcd1
 126:	56                   	push   %esi
 127:	e8 97 06 00 00       	call   7c3 <write>
 12c:	83 c4 10             	add    $0x10,%esp
 12f:	83 f8 0a             	cmp    $0xa,%eax
 132:	0f 85 d6 00 00 00    	jne    20e <smallwrite+0x15e>
  for (i = 0; i < 100; i++) {
 138:	83 c3 01             	add    $0x1,%ebx
 13b:	83 fb 64             	cmp    $0x64,%ebx
 13e:	75 c0                	jne    100 <smallwrite+0x50>
  printf(stdout, "writes ok\n");
 140:	83 ec 08             	sub    $0x8,%esp
 143:	68 dc 0c 00 00       	push   $0xcdc
 148:	ff 35 94 12 00 00    	push   0x1294
 14e:	e8 bd 07 00 00       	call   910 <printf>
  close(fd);
 153:	89 34 24             	mov    %esi,(%esp)
 156:	e8 70 06 00 00       	call   7cb <close>
  fd = open("small", O_RDONLY);
 15b:	5b                   	pop    %ebx
 15c:	5e                   	pop    %esi
 15d:	6a 00                	push   $0x0
 15f:	68 89 0c 00 00       	push   $0xc89
 164:	e8 7a 06 00 00       	call   7e3 <open>
  if (fd >= 0) {
 169:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
 16c:	89 c3                	mov    %eax,%ebx
  if (fd >= 0) {
 16e:	85 c0                	test   %eax,%eax
 170:	0f 88 b1 00 00 00    	js     227 <smallwrite+0x177>
    printf(stdout, "open small succeeded ok\n");
 176:	83 ec 08             	sub    $0x8,%esp
 179:	68 e7 0c 00 00       	push   $0xce7
 17e:	ff 35 94 12 00 00    	push   0x1294
 184:	e8 87 07 00 00       	call   910 <printf>
  i = read(fd, buf, 2000);
 189:	83 c4 0c             	add    $0xc,%esp
 18c:	68 d0 07 00 00       	push   $0x7d0
 191:	68 a0 12 00 00       	push   $0x12a0
 196:	53                   	push   %ebx
 197:	e8 1f 06 00 00       	call   7bb <read>
  if (i == 2000) {
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
 1a4:	0f 85 94 00 00 00    	jne    23e <smallwrite+0x18e>
    printf(stdout, "read succeeded ok\n");
 1aa:	83 ec 08             	sub    $0x8,%esp
 1ad:	68 1b 0d 00 00       	push   $0xd1b
 1b2:	ff 35 94 12 00 00    	push   0x1294
 1b8:	e8 53 07 00 00       	call   910 <printf>
  close(fd);
 1bd:	89 1c 24             	mov    %ebx,(%esp)
 1c0:	e8 06 06 00 00       	call   7cb <close>
  if (unlink("small") < 0) {
 1c5:	c7 04 24 89 0c 00 00 	movl   $0xc89,(%esp)
 1cc:	e8 22 06 00 00       	call   7f3 <unlink>
 1d1:	83 c4 10             	add    $0x10,%esp
 1d4:	85 c0                	test   %eax,%eax
 1d6:	78 7d                	js     255 <smallwrite+0x1a5>
  printf(stdout, "small file test ok\n");
 1d8:	83 ec 08             	sub    $0x8,%esp
 1db:	68 50 0d 00 00       	push   $0xd50
 1e0:	ff 35 94 12 00 00    	push   0x1294
 1e6:	e8 25 07 00 00       	call   910 <printf>
}
 1eb:	83 c4 10             	add    $0x10,%esp
 1ee:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f1:	5b                   	pop    %ebx
 1f2:	5e                   	pop    %esi
 1f3:	5d                   	pop    %ebp
 1f4:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
 1f5:	83 ec 04             	sub    $0x4,%esp
 1f8:	53                   	push   %ebx
 1f9:	68 6c 0e 00 00       	push   $0xe6c
 1fe:	ff 35 94 12 00 00    	push   0x1294
 204:	e8 07 07 00 00       	call   910 <printf>
      exit();
 209:	e8 95 05 00 00       	call   7a3 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
 20e:	83 ec 04             	sub    $0x4,%esp
 211:	53                   	push   %ebx
 212:	68 90 0e 00 00       	push   $0xe90
 217:	ff 35 94 12 00 00    	push   0x1294
 21d:	e8 ee 06 00 00       	call   910 <printf>
      exit();
 222:	e8 7c 05 00 00       	call   7a3 <exit>
    printf(stdout, "error: open small failed!\n");
 227:	51                   	push   %ecx
 228:	51                   	push   %ecx
 229:	68 00 0d 00 00       	push   $0xd00
 22e:	ff 35 94 12 00 00    	push   0x1294
 234:	e8 d7 06 00 00       	call   910 <printf>
    exit();
 239:	e8 65 05 00 00       	call   7a3 <exit>
    printf(stdout, "read failed\n");
 23e:	52                   	push   %edx
 23f:	52                   	push   %edx
 240:	68 2e 0d 00 00       	push   $0xd2e
 245:	ff 35 94 12 00 00    	push   0x1294
 24b:	e8 c0 06 00 00       	call   910 <printf>
    exit();
 250:	e8 4e 05 00 00       	call   7a3 <exit>
    printf(stdout, "unlink small failed\n");
 255:	50                   	push   %eax
 256:	50                   	push   %eax
 257:	68 3b 0d 00 00       	push   $0xd3b
 25c:	ff 35 94 12 00 00    	push   0x1294
 262:	e8 a9 06 00 00       	call   910 <printf>
    exit();
 267:	e8 37 05 00 00       	call   7a3 <exit>
    printf(stdout, "error: creat small failed!\n");
 26c:	50                   	push   %eax
 26d:	50                   	push   %eax
 26e:	68 aa 0c 00 00       	push   $0xcaa
 273:	ff 35 94 12 00 00    	push   0x1294
 279:	e8 92 06 00 00       	call   910 <printf>
    exit();
 27e:	e8 20 05 00 00       	call   7a3 <exit>
 283:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <largewrite>:
void largewrite(void) {
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
  printf(stdout, "big files test\n");
 295:	83 ec 08             	sub    $0x8,%esp
 298:	68 64 0d 00 00       	push   $0xd64
 29d:	ff 35 94 12 00 00    	push   0x1294
 2a3:	e8 68 06 00 00       	call   910 <printf>
  fd = open("big", O_CREATE | O_RDWR);
 2a8:	58                   	pop    %eax
 2a9:	5a                   	pop    %edx
 2aa:	68 02 02 00 00       	push   $0x202
 2af:	68 de 0d 00 00       	push   $0xdde
 2b4:	e8 2a 05 00 00       	call   7e3 <open>
  if (fd < 0) {
 2b9:	83 c4 10             	add    $0x10,%esp
 2bc:	85 c0                	test   %eax,%eax
 2be:	0f 88 61 01 00 00    	js     425 <largewrite+0x195>
 2c4:	89 c6                	mov    %eax,%esi
  for (i = 0; i < MAXFILE; i++) {
 2c6:	31 db                	xor    %ebx,%ebx
 2c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop
    if (write(fd, buf, 512) != 512) {
 2d0:	83 ec 04             	sub    $0x4,%esp
    ((int *)buf)[0] = i;
 2d3:	89 1d a0 12 00 00    	mov    %ebx,0x12a0
    if (write(fd, buf, 512) != 512) {
 2d9:	68 00 02 00 00       	push   $0x200
 2de:	68 a0 12 00 00       	push   $0x12a0
 2e3:	56                   	push   %esi
 2e4:	e8 da 04 00 00       	call   7c3 <write>
 2e9:	83 c4 10             	add    $0x10,%esp
 2ec:	3d 00 02 00 00       	cmp    $0x200,%eax
 2f1:	0f 85 b3 00 00 00    	jne    3aa <largewrite+0x11a>
  for (i = 0; i < MAXFILE; i++) {
 2f7:	83 c3 01             	add    $0x1,%ebx
 2fa:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
 300:	75 ce                	jne    2d0 <largewrite+0x40>
  close(fd);
 302:	83 ec 0c             	sub    $0xc,%esp
 305:	56                   	push   %esi
 306:	e8 c0 04 00 00       	call   7cb <close>
  fd = open("big", O_RDONLY);
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	6a 00                	push   $0x0
 30f:	68 de 0d 00 00       	push   $0xdde
 314:	e8 ca 04 00 00       	call   7e3 <open>
  if (fd < 0) {
 319:	83 c4 10             	add    $0x10,%esp
  fd = open("big", O_RDONLY);
 31c:	89 c3                	mov    %eax,%ebx
  if (fd < 0) {
 31e:	85 c0                	test   %eax,%eax
 320:	0f 88 e8 00 00 00    	js     40e <largewrite+0x17e>
  n = 0;
 326:	31 f6                	xor    %esi,%esi
 328:	eb 1d                	jmp    347 <largewrite+0xb7>
 32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if (i != 512) {
 330:	3d 00 02 00 00       	cmp    $0x200,%eax
 335:	0f 85 9f 00 00 00    	jne    3da <largewrite+0x14a>
    if (((int *)buf)[0] != n) {
 33b:	a1 a0 12 00 00       	mov    0x12a0,%eax
 340:	39 f0                	cmp    %esi,%eax
 342:	75 7f                	jne    3c3 <largewrite+0x133>
    n++;
 344:	83 c6 01             	add    $0x1,%esi
    i = read(fd, buf, 512);
 347:	83 ec 04             	sub    $0x4,%esp
 34a:	68 00 02 00 00       	push   $0x200
 34f:	68 a0 12 00 00       	push   $0x12a0
 354:	53                   	push   %ebx
 355:	e8 61 04 00 00       	call   7bb <read>
    if (i == 0) {
 35a:	83 c4 10             	add    $0x10,%esp
 35d:	85 c0                	test   %eax,%eax
 35f:	75 cf                	jne    330 <largewrite+0xa0>
      if (n == MAXFILE - 1) {
 361:	81 fe 8b 00 00 00    	cmp    $0x8b,%esi
 367:	0f 84 86 00 00 00    	je     3f3 <largewrite+0x163>
  close(fd);
 36d:	83 ec 0c             	sub    $0xc,%esp
 370:	53                   	push   %ebx
 371:	e8 55 04 00 00       	call   7cb <close>
  if (unlink("big") < 0) {
 376:	c7 04 24 de 0d 00 00 	movl   $0xdde,(%esp)
 37d:	e8 71 04 00 00       	call   7f3 <unlink>
 382:	83 c4 10             	add    $0x10,%esp
 385:	85 c0                	test   %eax,%eax
 387:	0f 88 af 00 00 00    	js     43c <largewrite+0x1ac>
  printf(stdout, "big files ok\n");
 38d:	83 ec 08             	sub    $0x8,%esp
 390:	68 05 0e 00 00       	push   $0xe05
 395:	ff 35 94 12 00 00    	push   0x1294
 39b:	e8 70 05 00 00       	call   910 <printf>
}
 3a0:	83 c4 10             	add    $0x10,%esp
 3a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a6:	5b                   	pop    %ebx
 3a7:	5e                   	pop    %esi
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
 3aa:	83 ec 04             	sub    $0x4,%esp
 3ad:	53                   	push   %ebx
 3ae:	68 8e 0d 00 00       	push   $0xd8e
 3b3:	ff 35 94 12 00 00    	push   0x1294
 3b9:	e8 52 05 00 00       	call   910 <printf>
      exit();
 3be:	e8 e0 03 00 00       	call   7a3 <exit>
      printf(stdout, "read content of block %d is %d\n", n, ((int *)buf)[0]);
 3c3:	50                   	push   %eax
 3c4:	56                   	push   %esi
 3c5:	68 b4 0e 00 00       	push   $0xeb4
 3ca:	ff 35 94 12 00 00    	push   0x1294
 3d0:	e8 3b 05 00 00       	call   910 <printf>
      exit();
 3d5:	e8 c9 03 00 00       	call   7a3 <exit>
      printf(stdout, "read failed %d\n", i);
 3da:	83 ec 04             	sub    $0x4,%esp
 3dd:	50                   	push   %eax
 3de:	68 e2 0d 00 00       	push   $0xde2
 3e3:	ff 35 94 12 00 00    	push   0x1294
 3e9:	e8 22 05 00 00       	call   910 <printf>
      exit();
 3ee:	e8 b0 03 00 00       	call   7a3 <exit>
        printf(stdout, "read only %d blocks from big", n);
 3f3:	52                   	push   %edx
 3f4:	68 8b 00 00 00       	push   $0x8b
 3f9:	68 c5 0d 00 00       	push   $0xdc5
 3fe:	ff 35 94 12 00 00    	push   0x1294
 404:	e8 07 05 00 00       	call   910 <printf>
        exit();
 409:	e8 95 03 00 00       	call   7a3 <exit>
    printf(stdout, "error: open big failed!\n");
 40e:	51                   	push   %ecx
 40f:	51                   	push   %ecx
 410:	68 ac 0d 00 00       	push   $0xdac
 415:	ff 35 94 12 00 00    	push   0x1294
 41b:	e8 f0 04 00 00       	call   910 <printf>
    exit();
 420:	e8 7e 03 00 00       	call   7a3 <exit>
    printf(stdout, "error: creat big failed!\n");
 425:	50                   	push   %eax
 426:	50                   	push   %eax
 427:	68 74 0d 00 00       	push   $0xd74
 42c:	ff 35 94 12 00 00    	push   0x1294
 432:	e8 d9 04 00 00       	call   910 <printf>
    exit();
 437:	e8 67 03 00 00       	call   7a3 <exit>
    printf(stdout, "unlink big failed\n");
 43c:	50                   	push   %eax
 43d:	50                   	push   %eax
 43e:	68 f2 0d 00 00       	push   $0xdf2
 443:	ff 35 94 12 00 00    	push   0x1294
 449:	e8 c2 04 00 00       	call   910 <printf>
    exit();
 44e:	e8 50 03 00 00       	call   7a3 <exit>
 453:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000460 <calculation>:
void calculation() {
 460:	55                   	push   %ebp
  volatile int x = 0;
 461:	ba 00 e1 f5 05       	mov    $0x5f5e100,%edx
void calculation() {
 466:	89 e5                	mov    %esp,%ebp
 468:	83 ec 10             	sub    $0x10,%esp
  volatile int x = 0;
 46b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  for (int i = 0; i < CALC_LOOP; i++)
 472:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    x++;
 478:	8b 45 fc             	mov    -0x4(%ebp),%eax
 47b:	83 c0 01             	add    $0x1,%eax
 47e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for (int i = 0; i < CALC_LOOP; i++)
 481:	83 ea 01             	sub    $0x1,%edx
 484:	75 f2                	jne    478 <calculation+0x18>
}
 486:	c9                   	leave  
 487:	c3                   	ret    
 488:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <calc_write_mix>:
void calc_write_mix() {
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	83 ec 18             	sub    $0x18,%esp
    pid = fork();
 496:	e8 00 03 00 00       	call   79b <fork>
    if (pid < 0) {
 49b:	85 c0                	test   %eax,%eax
 49d:	78 18                	js     4b7 <calc_write_mix+0x27>
    if (pid == 0) {
 49f:	74 29                	je     4ca <calc_write_mix+0x3a>
    pid = fork();
 4a1:	e8 f5 02 00 00       	call   79b <fork>
    if (pid < 0) {
 4a6:	85 c0                	test   %eax,%eax
 4a8:	78 0d                	js     4b7 <calc_write_mix+0x27>
    if (pid == 0) {
 4aa:	74 1e                	je     4ca <calc_write_mix+0x3a>
    wait();
 4ac:	e8 fa 02 00 00       	call   7ab <wait>
}
 4b1:	c9                   	leave  
    wait();
 4b2:	e9 f4 02 00 00       	jmp    7ab <wait>
      printf(1, "fork failed\n");
 4b7:	51                   	push   %ecx
 4b8:	51                   	push   %ecx
 4b9:	68 13 0e 00 00       	push   $0xe13
 4be:	6a 01                	push   $0x1
 4c0:	e8 4b 04 00 00       	call   910 <printf>
      exit();
 4c5:	e8 d9 02 00 00       	call   7a3 <exit>
      if (getpid() <= 3 + CALC_NUM) {
 4ca:	e8 54 03 00 00       	call   823 <getpid>
 4cf:	83 f8 04             	cmp    $0x4,%eax
 4d2:	7f 37                	jg     50b <calc_write_mix+0x7b>
        printf(1, "calculation() called\n");
 4d4:	52                   	push   %edx
 4d5:	52                   	push   %edx
 4d6:	68 20 0e 00 00       	push   $0xe20
 4db:	6a 01                	push   $0x1
 4dd:	e8 2e 04 00 00       	call   910 <printf>
  volatile int x = 0;
 4e2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 4e9:	83 c4 10             	add    $0x10,%esp
 4ec:	ba 00 e1 f5 05       	mov    $0x5f5e100,%edx
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    x++;
 4f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4fb:	83 c0 01             	add    $0x1,%eax
 4fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for (int i = 0; i < CALC_LOOP; i++)
 501:	83 ea 01             	sub    $0x1,%edx
 504:	75 f2                	jne    4f8 <calc_write_mix+0x68>
      exit();
 506:	e8 98 02 00 00       	call   7a3 <exit>
        printf(1, "writetest() called\n");
 50b:	50                   	push   %eax
 50c:	50                   	push   %eax
 50d:	68 36 0e 00 00       	push   $0xe36
 512:	6a 01                	push   $0x1
 514:	e8 f7 03 00 00       	call   910 <printf>
        sleep(12);
 519:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 520:	e8 0e 03 00 00       	call   833 <sleep>
  volatile int x = 0;
 525:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 52c:	83 c4 10             	add    $0x10,%esp
 52f:	ba 00 e1 f5 05       	mov    $0x5f5e100,%edx
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x++;
 538:	8b 45 f0             	mov    -0x10(%ebp),%eax
 53b:	83 c0 01             	add    $0x1,%eax
 53e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for (int i = 0; i < CALC_LOOP; i++)
 541:	83 ea 01             	sub    $0x1,%edx
 544:	75 f2                	jne    538 <calc_write_mix+0xa8>
 546:	eb be                	jmp    506 <calc_write_mix+0x76>
 548:	66 90                	xchg   %ax,%ax
 54a:	66 90                	xchg   %ax,%ax
 54c:	66 90                	xchg   %ax,%ax
 54e:	66 90                	xchg   %ax,%ax

00000550 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 550:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 551:	31 c0                	xor    %eax,%eax
{
 553:	89 e5                	mov    %esp,%ebp
 555:	53                   	push   %ebx
 556:	8b 4d 08             	mov    0x8(%ebp),%ecx
 559:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 560:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 564:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 567:	83 c0 01             	add    $0x1,%eax
 56a:	84 d2                	test   %dl,%dl
 56c:	75 f2                	jne    560 <strcpy+0x10>
    ;
  return os;
}
 56e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 571:	89 c8                	mov    %ecx,%eax
 573:	c9                   	leave  
 574:	c3                   	ret    
 575:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000580 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	8b 55 08             	mov    0x8(%ebp),%edx
 587:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 58a:	0f b6 02             	movzbl (%edx),%eax
 58d:	84 c0                	test   %al,%al
 58f:	75 17                	jne    5a8 <strcmp+0x28>
 591:	eb 3a                	jmp    5cd <strcmp+0x4d>
 593:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 597:	90                   	nop
 598:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 59c:	83 c2 01             	add    $0x1,%edx
 59f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 5a2:	84 c0                	test   %al,%al
 5a4:	74 1a                	je     5c0 <strcmp+0x40>
    p++, q++;
 5a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 5a8:	0f b6 19             	movzbl (%ecx),%ebx
 5ab:	38 c3                	cmp    %al,%bl
 5ad:	74 e9                	je     598 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 5af:	29 d8                	sub    %ebx,%eax
}
 5b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5b4:	c9                   	leave  
 5b5:	c3                   	ret    
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 5c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 5c4:	31 c0                	xor    %eax,%eax
 5c6:	29 d8                	sub    %ebx,%eax
}
 5c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5cb:	c9                   	leave  
 5cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 5cd:	0f b6 19             	movzbl (%ecx),%ebx
 5d0:	31 c0                	xor    %eax,%eax
 5d2:	eb db                	jmp    5af <strcmp+0x2f>
 5d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <strlen>:

uint
strlen(const char *s)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 5e6:	80 3a 00             	cmpb   $0x0,(%edx)
 5e9:	74 15                	je     600 <strlen+0x20>
 5eb:	31 c0                	xor    %eax,%eax
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
 5f0:	83 c0 01             	add    $0x1,%eax
 5f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 5f7:	89 c1                	mov    %eax,%ecx
 5f9:	75 f5                	jne    5f0 <strlen+0x10>
    ;
  return n;
}
 5fb:	89 c8                	mov    %ecx,%eax
 5fd:	5d                   	pop    %ebp
 5fe:	c3                   	ret    
 5ff:	90                   	nop
  for(n = 0; s[n]; n++)
 600:	31 c9                	xor    %ecx,%ecx
}
 602:	5d                   	pop    %ebp
 603:	89 c8                	mov    %ecx,%eax
 605:	c3                   	ret    
 606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi

00000610 <memset>:

void*
memset(void *dst, int c, uint n)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 617:	8b 4d 10             	mov    0x10(%ebp),%ecx
 61a:	8b 45 0c             	mov    0xc(%ebp),%eax
 61d:	89 d7                	mov    %edx,%edi
 61f:	fc                   	cld    
 620:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 622:	8b 7d fc             	mov    -0x4(%ebp),%edi
 625:	89 d0                	mov    %edx,%eax
 627:	c9                   	leave  
 628:	c3                   	ret    
 629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000630 <strchr>:

char*
strchr(const char *s, char c)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 63a:	0f b6 10             	movzbl (%eax),%edx
 63d:	84 d2                	test   %dl,%dl
 63f:	75 12                	jne    653 <strchr+0x23>
 641:	eb 1d                	jmp    660 <strchr+0x30>
 643:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 647:	90                   	nop
 648:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 64c:	83 c0 01             	add    $0x1,%eax
 64f:	84 d2                	test   %dl,%dl
 651:	74 0d                	je     660 <strchr+0x30>
    if(*s == c)
 653:	38 d1                	cmp    %dl,%cl
 655:	75 f1                	jne    648 <strchr+0x18>
      return (char*)s;
  return 0;
}
 657:	5d                   	pop    %ebp
 658:	c3                   	ret    
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 660:	31 c0                	xor    %eax,%eax
}
 662:	5d                   	pop    %ebp
 663:	c3                   	ret    
 664:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop

00000670 <gets>:

char*
gets(char *buf, int max)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 675:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 678:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 679:	31 db                	xor    %ebx,%ebx
{
 67b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 67e:	eb 27                	jmp    6a7 <gets+0x37>
    cc = read(0, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
 683:	6a 01                	push   $0x1
 685:	57                   	push   %edi
 686:	6a 00                	push   $0x0
 688:	e8 2e 01 00 00       	call   7bb <read>
    if(cc < 1)
 68d:	83 c4 10             	add    $0x10,%esp
 690:	85 c0                	test   %eax,%eax
 692:	7e 1d                	jle    6b1 <gets+0x41>
      break;
    buf[i++] = c;
 694:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 698:	8b 55 08             	mov    0x8(%ebp),%edx
 69b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 69f:	3c 0a                	cmp    $0xa,%al
 6a1:	74 1d                	je     6c0 <gets+0x50>
 6a3:	3c 0d                	cmp    $0xd,%al
 6a5:	74 19                	je     6c0 <gets+0x50>
  for(i=0; i+1 < max; ){
 6a7:	89 de                	mov    %ebx,%esi
 6a9:	83 c3 01             	add    $0x1,%ebx
 6ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 6af:	7c cf                	jl     680 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 6b1:	8b 45 08             	mov    0x8(%ebp),%eax
 6b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 6b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bb:	5b                   	pop    %ebx
 6bc:	5e                   	pop    %esi
 6bd:	5f                   	pop    %edi
 6be:	5d                   	pop    %ebp
 6bf:	c3                   	ret    
  buf[i] = '\0';
 6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 6c3:	89 de                	mov    %ebx,%esi
 6c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 6c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cc:	5b                   	pop    %ebx
 6cd:	5e                   	pop    %esi
 6ce:	5f                   	pop    %edi
 6cf:	5d                   	pop    %ebp
 6d0:	c3                   	ret    
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop

000006e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	56                   	push   %esi
 6e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6e5:	83 ec 08             	sub    $0x8,%esp
 6e8:	6a 00                	push   $0x0
 6ea:	ff 75 08             	push   0x8(%ebp)
 6ed:	e8 f1 00 00 00       	call   7e3 <open>
  if(fd < 0)
 6f2:	83 c4 10             	add    $0x10,%esp
 6f5:	85 c0                	test   %eax,%eax
 6f7:	78 27                	js     720 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 6f9:	83 ec 08             	sub    $0x8,%esp
 6fc:	ff 75 0c             	push   0xc(%ebp)
 6ff:	89 c3                	mov    %eax,%ebx
 701:	50                   	push   %eax
 702:	e8 f4 00 00 00       	call   7fb <fstat>
  close(fd);
 707:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 70a:	89 c6                	mov    %eax,%esi
  close(fd);
 70c:	e8 ba 00 00 00       	call   7cb <close>
  return r;
 711:	83 c4 10             	add    $0x10,%esp
}
 714:	8d 65 f8             	lea    -0x8(%ebp),%esp
 717:	89 f0                	mov    %esi,%eax
 719:	5b                   	pop    %ebx
 71a:	5e                   	pop    %esi
 71b:	5d                   	pop    %ebp
 71c:	c3                   	ret    
 71d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 720:	be ff ff ff ff       	mov    $0xffffffff,%esi
 725:	eb ed                	jmp    714 <stat+0x34>
 727:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72e:	66 90                	xchg   %ax,%ax

00000730 <atoi>:

int
atoi(const char *s)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	53                   	push   %ebx
 734:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 737:	0f be 02             	movsbl (%edx),%eax
 73a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 73d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 740:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 745:	77 1e                	ja     765 <atoi+0x35>
 747:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 750:	83 c2 01             	add    $0x1,%edx
 753:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 756:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 75a:	0f be 02             	movsbl (%edx),%eax
 75d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 760:	80 fb 09             	cmp    $0x9,%bl
 763:	76 eb                	jbe    750 <atoi+0x20>
  return n;
}
 765:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 768:	89 c8                	mov    %ecx,%eax
 76a:	c9                   	leave  
 76b:	c3                   	ret    
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000770 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	8b 45 10             	mov    0x10(%ebp),%eax
 777:	8b 55 08             	mov    0x8(%ebp),%edx
 77a:	56                   	push   %esi
 77b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 77e:	85 c0                	test   %eax,%eax
 780:	7e 13                	jle    795 <memmove+0x25>
 782:	01 d0                	add    %edx,%eax
  dst = vdst;
 784:	89 d7                	mov    %edx,%edi
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 790:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 791:	39 f8                	cmp    %edi,%eax
 793:	75 fb                	jne    790 <memmove+0x20>
  return vdst;
}
 795:	5e                   	pop    %esi
 796:	89 d0                	mov    %edx,%eax
 798:	5f                   	pop    %edi
 799:	5d                   	pop    %ebp
 79a:	c3                   	ret    

0000079b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 79b:	b8 01 00 00 00       	mov    $0x1,%eax
 7a0:	cd 40                	int    $0x40
 7a2:	c3                   	ret    

000007a3 <exit>:
SYSCALL(exit)
 7a3:	b8 02 00 00 00       	mov    $0x2,%eax
 7a8:	cd 40                	int    $0x40
 7aa:	c3                   	ret    

000007ab <wait>:
SYSCALL(wait)
 7ab:	b8 03 00 00 00       	mov    $0x3,%eax
 7b0:	cd 40                	int    $0x40
 7b2:	c3                   	ret    

000007b3 <pipe>:
SYSCALL(pipe)
 7b3:	b8 04 00 00 00       	mov    $0x4,%eax
 7b8:	cd 40                	int    $0x40
 7ba:	c3                   	ret    

000007bb <read>:
SYSCALL(read)
 7bb:	b8 05 00 00 00       	mov    $0x5,%eax
 7c0:	cd 40                	int    $0x40
 7c2:	c3                   	ret    

000007c3 <write>:
SYSCALL(write)
 7c3:	b8 10 00 00 00       	mov    $0x10,%eax
 7c8:	cd 40                	int    $0x40
 7ca:	c3                   	ret    

000007cb <close>:
SYSCALL(close)
 7cb:	b8 15 00 00 00       	mov    $0x15,%eax
 7d0:	cd 40                	int    $0x40
 7d2:	c3                   	ret    

000007d3 <kill>:
SYSCALL(kill)
 7d3:	b8 06 00 00 00       	mov    $0x6,%eax
 7d8:	cd 40                	int    $0x40
 7da:	c3                   	ret    

000007db <exec>:
SYSCALL(exec)
 7db:	b8 07 00 00 00       	mov    $0x7,%eax
 7e0:	cd 40                	int    $0x40
 7e2:	c3                   	ret    

000007e3 <open>:
SYSCALL(open)
 7e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 7e8:	cd 40                	int    $0x40
 7ea:	c3                   	ret    

000007eb <mknod>:
SYSCALL(mknod)
 7eb:	b8 11 00 00 00       	mov    $0x11,%eax
 7f0:	cd 40                	int    $0x40
 7f2:	c3                   	ret    

000007f3 <unlink>:
SYSCALL(unlink)
 7f3:	b8 12 00 00 00       	mov    $0x12,%eax
 7f8:	cd 40                	int    $0x40
 7fa:	c3                   	ret    

000007fb <fstat>:
SYSCALL(fstat)
 7fb:	b8 08 00 00 00       	mov    $0x8,%eax
 800:	cd 40                	int    $0x40
 802:	c3                   	ret    

00000803 <link>:
SYSCALL(link)
 803:	b8 13 00 00 00       	mov    $0x13,%eax
 808:	cd 40                	int    $0x40
 80a:	c3                   	ret    

0000080b <mkdir>:
SYSCALL(mkdir)
 80b:	b8 14 00 00 00       	mov    $0x14,%eax
 810:	cd 40                	int    $0x40
 812:	c3                   	ret    

00000813 <chdir>:
SYSCALL(chdir)
 813:	b8 09 00 00 00       	mov    $0x9,%eax
 818:	cd 40                	int    $0x40
 81a:	c3                   	ret    

0000081b <dup>:
SYSCALL(dup)
 81b:	b8 0a 00 00 00       	mov    $0xa,%eax
 820:	cd 40                	int    $0x40
 822:	c3                   	ret    

00000823 <getpid>:
SYSCALL(getpid)
 823:	b8 0b 00 00 00       	mov    $0xb,%eax
 828:	cd 40                	int    $0x40
 82a:	c3                   	ret    

0000082b <sbrk>:
SYSCALL(sbrk)
 82b:	b8 0c 00 00 00       	mov    $0xc,%eax
 830:	cd 40                	int    $0x40
 832:	c3                   	ret    

00000833 <sleep>:
SYSCALL(sleep)
 833:	b8 0d 00 00 00       	mov    $0xd,%eax
 838:	cd 40                	int    $0x40
 83a:	c3                   	ret    

0000083b <uptime>:
SYSCALL(uptime)
 83b:	b8 0e 00 00 00       	mov    $0xe,%eax
 840:	cd 40                	int    $0x40
 842:	c3                   	ret    

00000843 <bufwrite>:
SYSCALL(bufwrite)
 843:	b8 16 00 00 00       	mov    $0x16,%eax
 848:	cd 40                	int    $0x40
 84a:	c3                   	ret    

0000084b <bufread>:
SYSCALL(bufread)
 84b:	b8 17 00 00 00       	mov    $0x17,%eax
 850:	cd 40                	int    $0x40
 852:	c3                   	ret    
 853:	66 90                	xchg   %ax,%ax
 855:	66 90                	xchg   %ax,%ax
 857:	66 90                	xchg   %ax,%ax
 859:	66 90                	xchg   %ax,%ax
 85b:	66 90                	xchg   %ax,%ax
 85d:	66 90                	xchg   %ax,%ax
 85f:	90                   	nop

00000860 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	57                   	push   %edi
 864:	56                   	push   %esi
 865:	53                   	push   %ebx
 866:	83 ec 3c             	sub    $0x3c,%esp
 869:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 86c:	89 d1                	mov    %edx,%ecx
{
 86e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 871:	85 d2                	test   %edx,%edx
 873:	0f 89 7f 00 00 00    	jns    8f8 <printint+0x98>
 879:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 87d:	74 79                	je     8f8 <printint+0x98>
    neg = 1;
 87f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 886:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 888:	31 db                	xor    %ebx,%ebx
 88a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 88d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 890:	89 c8                	mov    %ecx,%eax
 892:	31 d2                	xor    %edx,%edx
 894:	89 cf                	mov    %ecx,%edi
 896:	f7 75 c4             	divl   -0x3c(%ebp)
 899:	0f b6 92 34 0f 00 00 	movzbl 0xf34(%edx),%edx
 8a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8a3:	89 d8                	mov    %ebx,%eax
 8a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 8a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 8ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 8ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 8b1:	76 dd                	jbe    890 <printint+0x30>
  if(neg)
 8b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 8b6:	85 c9                	test   %ecx,%ecx
 8b8:	74 0c                	je     8c6 <printint+0x66>
    buf[i++] = '-';
 8ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 8bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 8c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 8c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 8c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 8cd:	eb 07                	jmp    8d6 <printint+0x76>
 8cf:	90                   	nop
    putc(fd, buf[i]);
 8d0:	0f b6 13             	movzbl (%ebx),%edx
 8d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 8d6:	83 ec 04             	sub    $0x4,%esp
 8d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 8dc:	6a 01                	push   $0x1
 8de:	56                   	push   %esi
 8df:	57                   	push   %edi
 8e0:	e8 de fe ff ff       	call   7c3 <write>
  while(--i >= 0)
 8e5:	83 c4 10             	add    $0x10,%esp
 8e8:	39 de                	cmp    %ebx,%esi
 8ea:	75 e4                	jne    8d0 <printint+0x70>
}
 8ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ef:	5b                   	pop    %ebx
 8f0:	5e                   	pop    %esi
 8f1:	5f                   	pop    %edi
 8f2:	5d                   	pop    %ebp
 8f3:	c3                   	ret    
 8f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 8f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 8ff:	eb 87                	jmp    888 <printint+0x28>
 901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 908:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90f:	90                   	nop

00000910 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
 914:	56                   	push   %esi
 915:	53                   	push   %ebx
 916:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 919:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 91c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 91f:	0f b6 13             	movzbl (%ebx),%edx
 922:	84 d2                	test   %dl,%dl
 924:	74 6a                	je     990 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 926:	8d 45 10             	lea    0x10(%ebp),%eax
 929:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 92c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 92f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 931:	89 45 d0             	mov    %eax,-0x30(%ebp)
 934:	eb 36                	jmp    96c <printf+0x5c>
 936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 93d:	8d 76 00             	lea    0x0(%esi),%esi
 940:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 943:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 948:	83 f8 25             	cmp    $0x25,%eax
 94b:	74 15                	je     962 <printf+0x52>
  write(fd, &c, 1);
 94d:	83 ec 04             	sub    $0x4,%esp
 950:	88 55 e7             	mov    %dl,-0x19(%ebp)
 953:	6a 01                	push   $0x1
 955:	57                   	push   %edi
 956:	56                   	push   %esi
 957:	e8 67 fe ff ff       	call   7c3 <write>
 95c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 95f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 962:	0f b6 13             	movzbl (%ebx),%edx
 965:	83 c3 01             	add    $0x1,%ebx
 968:	84 d2                	test   %dl,%dl
 96a:	74 24                	je     990 <printf+0x80>
    c = fmt[i] & 0xff;
 96c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 96f:	85 c9                	test   %ecx,%ecx
 971:	74 cd                	je     940 <printf+0x30>
      }
    } else if(state == '%'){
 973:	83 f9 25             	cmp    $0x25,%ecx
 976:	75 ea                	jne    962 <printf+0x52>
      if(c == 'd'){
 978:	83 f8 25             	cmp    $0x25,%eax
 97b:	0f 84 07 01 00 00    	je     a88 <printf+0x178>
 981:	83 e8 63             	sub    $0x63,%eax
 984:	83 f8 15             	cmp    $0x15,%eax
 987:	77 17                	ja     9a0 <printf+0x90>
 989:	ff 24 85 dc 0e 00 00 	jmp    *0xedc(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 990:	8d 65 f4             	lea    -0xc(%ebp),%esp
 993:	5b                   	pop    %ebx
 994:	5e                   	pop    %esi
 995:	5f                   	pop    %edi
 996:	5d                   	pop    %ebp
 997:	c3                   	ret    
 998:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99f:	90                   	nop
  write(fd, &c, 1);
 9a0:	83 ec 04             	sub    $0x4,%esp
 9a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 9a6:	6a 01                	push   $0x1
 9a8:	57                   	push   %edi
 9a9:	56                   	push   %esi
 9aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 9ae:	e8 10 fe ff ff       	call   7c3 <write>
        putc(fd, c);
 9b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 9b7:	83 c4 0c             	add    $0xc,%esp
 9ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
 9bd:	6a 01                	push   $0x1
 9bf:	57                   	push   %edi
 9c0:	56                   	push   %esi
 9c1:	e8 fd fd ff ff       	call   7c3 <write>
        putc(fd, c);
 9c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9c9:	31 c9                	xor    %ecx,%ecx
 9cb:	eb 95                	jmp    962 <printf+0x52>
 9cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 9d0:	83 ec 0c             	sub    $0xc,%esp
 9d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 9d8:	6a 00                	push   $0x0
 9da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9dd:	8b 10                	mov    (%eax),%edx
 9df:	89 f0                	mov    %esi,%eax
 9e1:	e8 7a fe ff ff       	call   860 <printint>
        ap++;
 9e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 9ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9ed:	31 c9                	xor    %ecx,%ecx
 9ef:	e9 6e ff ff ff       	jmp    962 <printf+0x52>
 9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 9f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9fb:	8b 10                	mov    (%eax),%edx
        ap++;
 9fd:	83 c0 04             	add    $0x4,%eax
 a00:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a03:	85 d2                	test   %edx,%edx
 a05:	0f 84 8d 00 00 00    	je     a98 <printf+0x188>
        while(*s != 0){
 a0b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 a0e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 a10:	84 c0                	test   %al,%al
 a12:	0f 84 4a ff ff ff    	je     962 <printf+0x52>
 a18:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 a1b:	89 d3                	mov    %edx,%ebx
 a1d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 a20:	83 ec 04             	sub    $0x4,%esp
          s++;
 a23:	83 c3 01             	add    $0x1,%ebx
 a26:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a29:	6a 01                	push   $0x1
 a2b:	57                   	push   %edi
 a2c:	56                   	push   %esi
 a2d:	e8 91 fd ff ff       	call   7c3 <write>
        while(*s != 0){
 a32:	0f b6 03             	movzbl (%ebx),%eax
 a35:	83 c4 10             	add    $0x10,%esp
 a38:	84 c0                	test   %al,%al
 a3a:	75 e4                	jne    a20 <printf+0x110>
      state = 0;
 a3c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 a3f:	31 c9                	xor    %ecx,%ecx
 a41:	e9 1c ff ff ff       	jmp    962 <printf+0x52>
 a46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a4d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 a50:	83 ec 0c             	sub    $0xc,%esp
 a53:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a58:	6a 01                	push   $0x1
 a5a:	e9 7b ff ff ff       	jmp    9da <printf+0xca>
 a5f:	90                   	nop
        putc(fd, *ap);
 a60:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 a63:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a66:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 a68:	6a 01                	push   $0x1
 a6a:	57                   	push   %edi
 a6b:	56                   	push   %esi
        putc(fd, *ap);
 a6c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a6f:	e8 4f fd ff ff       	call   7c3 <write>
        ap++;
 a74:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 a78:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a7b:	31 c9                	xor    %ecx,%ecx
 a7d:	e9 e0 fe ff ff       	jmp    962 <printf+0x52>
 a82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 a88:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 a8b:	83 ec 04             	sub    $0x4,%esp
 a8e:	e9 2a ff ff ff       	jmp    9bd <printf+0xad>
 a93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a97:	90                   	nop
          s = "(null)";
 a98:	ba d4 0e 00 00       	mov    $0xed4,%edx
        while(*s != 0){
 a9d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 aa0:	b8 28 00 00 00       	mov    $0x28,%eax
 aa5:	89 d3                	mov    %edx,%ebx
 aa7:	e9 74 ff ff ff       	jmp    a20 <printf+0x110>
 aac:	66 90                	xchg   %ax,%ax
 aae:	66 90                	xchg   %ax,%ax

00000ab0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ab0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab1:	a1 a0 32 00 00       	mov    0x32a0,%eax
{
 ab6:	89 e5                	mov    %esp,%ebp
 ab8:	57                   	push   %edi
 ab9:	56                   	push   %esi
 aba:	53                   	push   %ebx
 abb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 abe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ac8:	89 c2                	mov    %eax,%edx
 aca:	8b 00                	mov    (%eax),%eax
 acc:	39 ca                	cmp    %ecx,%edx
 ace:	73 30                	jae    b00 <free+0x50>
 ad0:	39 c1                	cmp    %eax,%ecx
 ad2:	72 04                	jb     ad8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ad4:	39 c2                	cmp    %eax,%edx
 ad6:	72 f0                	jb     ac8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ad8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 adb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ade:	39 f8                	cmp    %edi,%eax
 ae0:	74 30                	je     b12 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 ae2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 ae5:	8b 42 04             	mov    0x4(%edx),%eax
 ae8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 aeb:	39 f1                	cmp    %esi,%ecx
 aed:	74 3a                	je     b29 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 aef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 af1:	5b                   	pop    %ebx
  freep = p;
 af2:	89 15 a0 32 00 00    	mov    %edx,0x32a0
}
 af8:	5e                   	pop    %esi
 af9:	5f                   	pop    %edi
 afa:	5d                   	pop    %ebp
 afb:	c3                   	ret    
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b00:	39 c2                	cmp    %eax,%edx
 b02:	72 c4                	jb     ac8 <free+0x18>
 b04:	39 c1                	cmp    %eax,%ecx
 b06:	73 c0                	jae    ac8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 b08:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b0b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b0e:	39 f8                	cmp    %edi,%eax
 b10:	75 d0                	jne    ae2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 b12:	03 70 04             	add    0x4(%eax),%esi
 b15:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b18:	8b 02                	mov    (%edx),%eax
 b1a:	8b 00                	mov    (%eax),%eax
 b1c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 b1f:	8b 42 04             	mov    0x4(%edx),%eax
 b22:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 b25:	39 f1                	cmp    %esi,%ecx
 b27:	75 c6                	jne    aef <free+0x3f>
    p->s.size += bp->s.size;
 b29:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 b2c:	89 15 a0 32 00 00    	mov    %edx,0x32a0
    p->s.size += bp->s.size;
 b32:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 b35:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 b38:	89 0a                	mov    %ecx,(%edx)
}
 b3a:	5b                   	pop    %ebx
 b3b:	5e                   	pop    %esi
 b3c:	5f                   	pop    %edi
 b3d:	5d                   	pop    %ebp
 b3e:	c3                   	ret    
 b3f:	90                   	nop

00000b40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
 b43:	57                   	push   %edi
 b44:	56                   	push   %esi
 b45:	53                   	push   %ebx
 b46:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b49:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b4c:	8b 3d a0 32 00 00    	mov    0x32a0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b52:	8d 70 07             	lea    0x7(%eax),%esi
 b55:	c1 ee 03             	shr    $0x3,%esi
 b58:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b5b:	85 ff                	test   %edi,%edi
 b5d:	0f 84 9d 00 00 00    	je     c00 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b63:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 b65:	8b 4a 04             	mov    0x4(%edx),%ecx
 b68:	39 f1                	cmp    %esi,%ecx
 b6a:	73 6a                	jae    bd6 <malloc+0x96>
 b6c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b71:	39 de                	cmp    %ebx,%esi
 b73:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b76:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 b7d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b80:	eb 17                	jmp    b99 <malloc+0x59>
 b82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b88:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b8a:	8b 48 04             	mov    0x4(%eax),%ecx
 b8d:	39 f1                	cmp    %esi,%ecx
 b8f:	73 4f                	jae    be0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b91:	8b 3d a0 32 00 00    	mov    0x32a0,%edi
 b97:	89 c2                	mov    %eax,%edx
 b99:	39 d7                	cmp    %edx,%edi
 b9b:	75 eb                	jne    b88 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 b9d:	83 ec 0c             	sub    $0xc,%esp
 ba0:	ff 75 e4             	push   -0x1c(%ebp)
 ba3:	e8 83 fc ff ff       	call   82b <sbrk>
  if(p == (char*)-1)
 ba8:	83 c4 10             	add    $0x10,%esp
 bab:	83 f8 ff             	cmp    $0xffffffff,%eax
 bae:	74 1c                	je     bcc <malloc+0x8c>
  hp->s.size = nu;
 bb0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 bb3:	83 ec 0c             	sub    $0xc,%esp
 bb6:	83 c0 08             	add    $0x8,%eax
 bb9:	50                   	push   %eax
 bba:	e8 f1 fe ff ff       	call   ab0 <free>
  return freep;
 bbf:	8b 15 a0 32 00 00    	mov    0x32a0,%edx
      if((p = morecore(nunits)) == 0)
 bc5:	83 c4 10             	add    $0x10,%esp
 bc8:	85 d2                	test   %edx,%edx
 bca:	75 bc                	jne    b88 <malloc+0x48>
        return 0;
  }
}
 bcc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 bcf:	31 c0                	xor    %eax,%eax
}
 bd1:	5b                   	pop    %ebx
 bd2:	5e                   	pop    %esi
 bd3:	5f                   	pop    %edi
 bd4:	5d                   	pop    %ebp
 bd5:	c3                   	ret    
    if(p->s.size >= nunits){
 bd6:	89 d0                	mov    %edx,%eax
 bd8:	89 fa                	mov    %edi,%edx
 bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 be0:	39 ce                	cmp    %ecx,%esi
 be2:	74 4c                	je     c30 <malloc+0xf0>
        p->s.size -= nunits;
 be4:	29 f1                	sub    %esi,%ecx
 be6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 be9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 bec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 bef:	89 15 a0 32 00 00    	mov    %edx,0x32a0
}
 bf5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 bf8:	83 c0 08             	add    $0x8,%eax
}
 bfb:	5b                   	pop    %ebx
 bfc:	5e                   	pop    %esi
 bfd:	5f                   	pop    %edi
 bfe:	5d                   	pop    %ebp
 bff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 c00:	c7 05 a0 32 00 00 a4 	movl   $0x32a4,0x32a0
 c07:	32 00 00 
    base.s.size = 0;
 c0a:	bf a4 32 00 00       	mov    $0x32a4,%edi
    base.s.ptr = freep = prevp = &base;
 c0f:	c7 05 a4 32 00 00 a4 	movl   $0x32a4,0x32a4
 c16:	32 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c19:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 c1b:	c7 05 a8 32 00 00 00 	movl   $0x0,0x32a8
 c22:	00 00 00 
    if(p->s.size >= nunits){
 c25:	e9 42 ff ff ff       	jmp    b6c <malloc+0x2c>
 c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c30:	8b 08                	mov    (%eax),%ecx
 c32:	89 0a                	mov    %ecx,(%edx)
 c34:	eb b9                	jmp    bef <malloc+0xaf>
