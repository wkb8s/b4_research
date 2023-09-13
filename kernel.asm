
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc 30 ce 11 80       	mov    $0x8011ce30,%esp
8010002d:	b8 60 30 10 80       	mov    $0x80103060,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb 54 a5 10 80       	mov    $0x8010a554,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 20 75 10 80       	push   $0x80107520
80100051:	68 20 a5 10 80       	push   $0x8010a520
80100056:	e8 b5 45 00 00       	call   80104610 <initlock>
8010005b:	83 c4 10             	add    $0x10,%esp
8010005e:	b8 1c ec 10 80       	mov    $0x8010ec1c,%eax
80100063:	c7 05 6c ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec6c
8010006a:	ec 10 80 
8010006d:	c7 05 70 ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec70
80100074:	ec 10 80 
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 d3                	mov    %edx,%ebx
80100082:	89 43 54             	mov    %eax,0x54(%ebx)
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	8d 43 0c             	lea    0xc(%ebx),%eax
8010008b:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
80100092:	68 27 75 10 80       	push   $0x80107527
80100097:	50                   	push   %eax
80100098:	e8 43 44 00 00       	call   801044e0 <initsleeplock>
8010009d:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
801000a2:	8d 93 5c 02 00 00    	lea    0x25c(%ebx),%edx
801000a8:	83 c4 10             	add    $0x10,%esp
801000ab:	89 58 50             	mov    %ebx,0x50(%eax)
801000ae:	89 d8                	mov    %ebx,%eax
801000b0:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
801000b6:	81 fb c0 e9 10 80    	cmp    $0x8010e9c0,%ebx
801000bc:	75 c2                	jne    80100080 <binit+0x40>
801000be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c1:	c9                   	leave  
801000c2:	c3                   	ret    
801000c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 20 a5 10 80       	push   $0x8010a520
801000e4:	e8 f7 46 00 00       	call   801047e0 <acquire>
801000e9:	8b 1d 70 ec 10 80    	mov    0x8010ec70,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010011f:	90                   	nop
80100120:	8b 1d 6c ec 10 80    	mov    0x8010ec6c,%ebx
80100126:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 6e                	jmp    8010019e <bread+0xce>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100139:	74 63                	je     8010019e <bread+0xce>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 20 a5 10 80       	push   $0x8010a520
80100162:	e8 19 46 00 00       	call   80104780 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 ae 43 00 00       	call   80104520 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	74 0e                	je     80100188 <bread+0xb8>
8010017a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010017d:	89 d8                	mov    %ebx,%eax
8010017f:	5b                   	pop    %ebx
80100180:	5e                   	pop    %esi
80100181:	5f                   	pop    %edi
80100182:	5d                   	pop    %ebp
80100183:	c3                   	ret    
80100184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100188:	83 ec 0c             	sub    $0xc,%esp
8010018b:	53                   	push   %ebx
8010018c:	e8 4f 21 00 00       	call   801022e0 <iderw>
80100191:	83 c4 10             	add    $0x10,%esp
80100194:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100197:	89 d8                	mov    %ebx,%eax
80100199:	5b                   	pop    %ebx
8010019a:	5e                   	pop    %esi
8010019b:	5f                   	pop    %edi
8010019c:	5d                   	pop    %ebp
8010019d:	c3                   	ret    
8010019e:	83 ec 0c             	sub    $0xc,%esp
801001a1:	68 2e 75 10 80       	push   $0x8010752e
801001a6:	e8 d5 01 00 00       	call   80100380 <panic>
801001ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001af:	90                   	nop

801001b0 <bwrite>:
801001b0:	55                   	push   %ebp
801001b1:	89 e5                	mov    %esp,%ebp
801001b3:	53                   	push   %ebx
801001b4:	83 ec 10             	sub    $0x10,%esp
801001b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001ba:	8d 43 0c             	lea    0xc(%ebx),%eax
801001bd:	50                   	push   %eax
801001be:	e8 fd 43 00 00       	call   801045c0 <holdingsleep>
801001c3:	83 c4 10             	add    $0x10,%esp
801001c6:	85 c0                	test   %eax,%eax
801001c8:	74 0f                	je     801001d9 <bwrite+0x29>
801001ca:	83 0b 04             	orl    $0x4,(%ebx)
801001cd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001d3:	c9                   	leave  
801001d4:	e9 07 21 00 00       	jmp    801022e0 <iderw>
801001d9:	83 ec 0c             	sub    $0xc,%esp
801001dc:	68 3f 75 10 80       	push   $0x8010753f
801001e1:	e8 9a 01 00 00       	call   80100380 <panic>
801001e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801001ed:	8d 76 00             	lea    0x0(%esi),%esi

801001f0 <brelse>:
801001f0:	55                   	push   %ebp
801001f1:	89 e5                	mov    %esp,%ebp
801001f3:	56                   	push   %esi
801001f4:	53                   	push   %ebx
801001f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001f8:	8d 73 0c             	lea    0xc(%ebx),%esi
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 bc 43 00 00       	call   801045c0 <holdingsleep>
80100204:	83 c4 10             	add    $0x10,%esp
80100207:	85 c0                	test   %eax,%eax
80100209:	74 66                	je     80100271 <brelse+0x81>
8010020b:	83 ec 0c             	sub    $0xc,%esp
8010020e:	56                   	push   %esi
8010020f:	e8 6c 43 00 00       	call   80104580 <releasesleep>
80100214:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010021b:	e8 c0 45 00 00       	call   801047e0 <acquire>
80100220:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100223:	83 c4 10             	add    $0x10,%esp
80100226:	83 e8 01             	sub    $0x1,%eax
80100229:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010022c:	85 c0                	test   %eax,%eax
8010022e:	75 2f                	jne    8010025f <brelse+0x6f>
80100230:	8b 43 54             	mov    0x54(%ebx),%eax
80100233:	8b 53 50             	mov    0x50(%ebx),%edx
80100236:	89 50 50             	mov    %edx,0x50(%eax)
80100239:	8b 43 50             	mov    0x50(%ebx),%eax
8010023c:	8b 53 54             	mov    0x54(%ebx),%edx
8010023f:	89 50 54             	mov    %edx,0x54(%eax)
80100242:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
80100247:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
8010024e:	89 43 54             	mov    %eax,0x54(%ebx)
80100251:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
80100256:	89 58 50             	mov    %ebx,0x50(%eax)
80100259:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
8010025f:	c7 45 08 20 a5 10 80 	movl   $0x8010a520,0x8(%ebp)
80100266:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100269:	5b                   	pop    %ebx
8010026a:	5e                   	pop    %esi
8010026b:	5d                   	pop    %ebp
8010026c:	e9 0f 45 00 00       	jmp    80104780 <release>
80100271:	83 ec 0c             	sub    $0xc,%esp
80100274:	68 46 75 10 80       	push   $0x80107546
80100279:	e8 02 01 00 00       	call   80100380 <panic>
8010027e:	66 90                	xchg   %ax,%ax

80100280 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100280:	55                   	push   %ebp
80100281:	89 e5                	mov    %esp,%ebp
80100283:	57                   	push   %edi
80100284:	56                   	push   %esi
80100285:	53                   	push   %ebx
80100286:	83 ec 18             	sub    $0x18,%esp
80100289:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010028c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010028f:	ff 75 08             	push   0x8(%ebp)
  target = n;
80100292:	89 df                	mov    %ebx,%edi
  iunlock(ip);
80100294:	e8 c7 15 00 00       	call   80101860 <iunlock>
  acquire(&cons.lock);
80100299:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
801002a0:	e8 3b 45 00 00       	call   801047e0 <acquire>
  while(n > 0){
801002a5:	83 c4 10             	add    $0x10,%esp
801002a8:	85 db                	test   %ebx,%ebx
801002aa:	0f 8e 94 00 00 00    	jle    80100344 <consoleread+0xc4>
    while(input.r == input.w){
801002b0:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
801002b5:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801002bb:	74 25                	je     801002e2 <consoleread+0x62>
801002bd:	eb 59                	jmp    80100318 <consoleread+0x98>
801002bf:	90                   	nop
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002c0:	83 ec 08             	sub    $0x8,%esp
801002c3:	68 20 ef 10 80       	push   $0x8010ef20
801002c8:	68 00 ef 10 80       	push   $0x8010ef00
801002cd:	e8 8e 3e 00 00       	call   80104160 <sleep>
    while(input.r == input.w){
801002d2:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
801002d7:	83 c4 10             	add    $0x10,%esp
801002da:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801002e0:	75 36                	jne    80100318 <consoleread+0x98>
      if(myproc()->killed){
801002e2:	e8 c9 35 00 00       	call   801038b0 <myproc>
801002e7:	8b 48 24             	mov    0x24(%eax),%ecx
801002ea:	85 c9                	test   %ecx,%ecx
801002ec:	74 d2                	je     801002c0 <consoleread+0x40>
        release(&cons.lock);
801002ee:	83 ec 0c             	sub    $0xc,%esp
801002f1:	68 20 ef 10 80       	push   $0x8010ef20
801002f6:	e8 85 44 00 00       	call   80104780 <release>
        ilock(ip);
801002fb:	5a                   	pop    %edx
801002fc:	ff 75 08             	push   0x8(%ebp)
801002ff:	e8 7c 14 00 00       	call   80101780 <ilock>
        return -1;
80100304:	83 c4 10             	add    $0x10,%esp
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
80100307:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
8010030a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010030f:	5b                   	pop    %ebx
80100310:	5e                   	pop    %esi
80100311:	5f                   	pop    %edi
80100312:	5d                   	pop    %ebp
80100313:	c3                   	ret    
80100314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = input.buf[input.r++ % INPUT_BUF];
80100318:	8d 50 01             	lea    0x1(%eax),%edx
8010031b:	89 15 00 ef 10 80    	mov    %edx,0x8010ef00
80100321:	89 c2                	mov    %eax,%edx
80100323:	83 e2 7f             	and    $0x7f,%edx
80100326:	0f be 8a 80 ee 10 80 	movsbl -0x7fef1180(%edx),%ecx
    if(c == C('D')){  // EOF
8010032d:	80 f9 04             	cmp    $0x4,%cl
80100330:	74 37                	je     80100369 <consoleread+0xe9>
    *dst++ = c;
80100332:	83 c6 01             	add    $0x1,%esi
    --n;
80100335:	83 eb 01             	sub    $0x1,%ebx
    *dst++ = c;
80100338:	88 4e ff             	mov    %cl,-0x1(%esi)
    if(c == '\n')
8010033b:	83 f9 0a             	cmp    $0xa,%ecx
8010033e:	0f 85 64 ff ff ff    	jne    801002a8 <consoleread+0x28>
  release(&cons.lock);
80100344:	83 ec 0c             	sub    $0xc,%esp
80100347:	68 20 ef 10 80       	push   $0x8010ef20
8010034c:	e8 2f 44 00 00       	call   80104780 <release>
  ilock(ip);
80100351:	58                   	pop    %eax
80100352:	ff 75 08             	push   0x8(%ebp)
80100355:	e8 26 14 00 00       	call   80101780 <ilock>
  return target - n;
8010035a:	89 f8                	mov    %edi,%eax
8010035c:	83 c4 10             	add    $0x10,%esp
}
8010035f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return target - n;
80100362:	29 d8                	sub    %ebx,%eax
}
80100364:	5b                   	pop    %ebx
80100365:	5e                   	pop    %esi
80100366:	5f                   	pop    %edi
80100367:	5d                   	pop    %ebp
80100368:	c3                   	ret    
      if(n < target){
80100369:	39 fb                	cmp    %edi,%ebx
8010036b:	73 d7                	jae    80100344 <consoleread+0xc4>
        input.r--;
8010036d:	a3 00 ef 10 80       	mov    %eax,0x8010ef00
80100372:	eb d0                	jmp    80100344 <consoleread+0xc4>
80100374:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010037b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010037f:	90                   	nop

80100380 <panic>:
{
80100380:	55                   	push   %ebp
80100381:	89 e5                	mov    %esp,%ebp
80100383:	56                   	push   %esi
80100384:	53                   	push   %ebx
80100385:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100388:	fa                   	cli    
  cons.locking = 0;
80100389:	c7 05 54 ef 10 80 00 	movl   $0x0,0x8010ef54
80100390:	00 00 00 
  getcallerpcs(&s, pcs);
80100393:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100396:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("lapicid %d: panic: ", lapicid());
80100399:	e8 52 25 00 00       	call   801028f0 <lapicid>
8010039e:	83 ec 08             	sub    $0x8,%esp
801003a1:	50                   	push   %eax
801003a2:	68 4d 75 10 80       	push   $0x8010754d
801003a7:	e8 f4 02 00 00       	call   801006a0 <cprintf>
  cprintf(s);
801003ac:	58                   	pop    %eax
801003ad:	ff 75 08             	push   0x8(%ebp)
801003b0:	e8 eb 02 00 00       	call   801006a0 <cprintf>
  cprintf("\n");
801003b5:	c7 04 24 ef 7e 10 80 	movl   $0x80107eef,(%esp)
801003bc:	e8 df 02 00 00       	call   801006a0 <cprintf>
  getcallerpcs(&s, pcs);
801003c1:	8d 45 08             	lea    0x8(%ebp),%eax
801003c4:	5a                   	pop    %edx
801003c5:	59                   	pop    %ecx
801003c6:	53                   	push   %ebx
801003c7:	50                   	push   %eax
801003c8:	e8 63 42 00 00       	call   80104630 <getcallerpcs>
  for(i=0; i<10; i++)
801003cd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003d0:	83 ec 08             	sub    $0x8,%esp
801003d3:	ff 33                	push   (%ebx)
  for(i=0; i<10; i++)
801003d5:	83 c3 04             	add    $0x4,%ebx
    cprintf(" %p", pcs[i]);
801003d8:	68 61 75 10 80       	push   $0x80107561
801003dd:	e8 be 02 00 00       	call   801006a0 <cprintf>
  for(i=0; i<10; i++)
801003e2:	83 c4 10             	add    $0x10,%esp
801003e5:	39 f3                	cmp    %esi,%ebx
801003e7:	75 e7                	jne    801003d0 <panic+0x50>
  panicked = 1; // freeze other CPU
801003e9:	c7 05 58 ef 10 80 01 	movl   $0x1,0x8010ef58
801003f0:	00 00 00 
  for(;;)
801003f3:	eb fe                	jmp    801003f3 <panic+0x73>
801003f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801003fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100400 <consputc.part.0>:
consputc(int c)
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 1c             	sub    $0x1c,%esp
  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 ea 00 00 00    	je     80100500 <consputc.part.0+0x100>
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 11 5c 00 00       	call   80106030 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c8             	movzbl %al,%ecx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	b8 0f 00 00 00       	mov    $0xf,%eax
80100441:	c1 e1 08             	shl    $0x8,%ecx
80100444:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100445:	89 f2                	mov    %esi,%edx
80100447:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
80100448:	0f b6 c0             	movzbl %al,%eax
8010044b:	09 c8                	or     %ecx,%eax
  if(c == '\n')
8010044d:	83 fb 0a             	cmp    $0xa,%ebx
80100450:	0f 84 92 00 00 00    	je     801004e8 <consputc.part.0+0xe8>
  else if(c == BACKSPACE){
80100456:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045c:	74 72                	je     801004d0 <consputc.part.0+0xd0>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
8010045e:	0f b6 db             	movzbl %bl,%ebx
80100461:	8d 70 01             	lea    0x1(%eax),%esi
80100464:	80 cf 07             	or     $0x7,%bh
80100467:	66 89 9c 00 00 80 0b 	mov    %bx,-0x7ff48000(%eax,%eax,1)
8010046e:	80 
  if(pos < 0 || pos > 25*80)
8010046f:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
80100475:	0f 8f fb 00 00 00    	jg     80100576 <consputc.part.0+0x176>
  if((pos/80) >= 24){  // Scroll up.
8010047b:	81 fe 7f 07 00 00    	cmp    $0x77f,%esi
80100481:	0f 8f a9 00 00 00    	jg     80100530 <consputc.part.0+0x130>
  outb(CRTPORT+1, pos>>8);
80100487:	89 f0                	mov    %esi,%eax
  crt[pos] = ' ' | 0x0700;
80100489:	8d b4 36 00 80 0b 80 	lea    -0x7ff48000(%esi,%esi,1),%esi
  outb(CRTPORT+1, pos);
80100490:	88 45 e7             	mov    %al,-0x19(%ebp)
  outb(CRTPORT+1, pos>>8);
80100493:	0f b6 fc             	movzbl %ah,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100496:	bb d4 03 00 00       	mov    $0x3d4,%ebx
8010049b:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a0:	89 da                	mov    %ebx,%edx
801004a2:	ee                   	out    %al,(%dx)
801004a3:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004a8:	89 f8                	mov    %edi,%eax
801004aa:	89 ca                	mov    %ecx,%edx
801004ac:	ee                   	out    %al,(%dx)
801004ad:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b2:	89 da                	mov    %ebx,%edx
801004b4:	ee                   	out    %al,(%dx)
801004b5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
801004b9:	89 ca                	mov    %ecx,%edx
801004bb:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004bc:	b8 20 07 00 00       	mov    $0x720,%eax
801004c1:	66 89 06             	mov    %ax,(%esi)
}
801004c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c7:	5b                   	pop    %ebx
801004c8:	5e                   	pop    %esi
801004c9:	5f                   	pop    %edi
801004ca:	5d                   	pop    %ebp
801004cb:	c3                   	ret    
801004cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pos > 0) --pos;
801004d0:	8d 70 ff             	lea    -0x1(%eax),%esi
801004d3:	85 c0                	test   %eax,%eax
801004d5:	75 98                	jne    8010046f <consputc.part.0+0x6f>
801004d7:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
801004db:	be 00 80 0b 80       	mov    $0x800b8000,%esi
801004e0:	31 ff                	xor    %edi,%edi
801004e2:	eb b2                	jmp    80100496 <consputc.part.0+0x96>
801004e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pos += 80 - pos%80;
801004e8:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
801004ed:	f7 e2                	mul    %edx
801004ef:	c1 ea 06             	shr    $0x6,%edx
801004f2:	8d 04 92             	lea    (%edx,%edx,4),%eax
801004f5:	c1 e0 04             	shl    $0x4,%eax
801004f8:	8d 70 50             	lea    0x50(%eax),%esi
801004fb:	e9 6f ff ff ff       	jmp    8010046f <consputc.part.0+0x6f>
    uartputc('\b'); uartputc(' '); uartputc('\b');
80100500:	83 ec 0c             	sub    $0xc,%esp
80100503:	6a 08                	push   $0x8
80100505:	e8 26 5b 00 00       	call   80106030 <uartputc>
8010050a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100511:	e8 1a 5b 00 00       	call   80106030 <uartputc>
80100516:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010051d:	e8 0e 5b 00 00       	call   80106030 <uartputc>
80100522:	83 c4 10             	add    $0x10,%esp
80100525:	e9 f8 fe ff ff       	jmp    80100422 <consputc.part.0+0x22>
8010052a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100530:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
80100533:	8d 5e b0             	lea    -0x50(%esi),%ebx
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100536:	8d b4 36 60 7f 0b 80 	lea    -0x7ff480a0(%esi,%esi,1),%esi
  outb(CRTPORT+1, pos);
8010053d:	bf 07 00 00 00       	mov    $0x7,%edi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100542:	68 60 0e 00 00       	push   $0xe60
80100547:	68 a0 80 0b 80       	push   $0x800b80a0
8010054c:	68 00 80 0b 80       	push   $0x800b8000
80100551:	e8 ea 43 00 00       	call   80104940 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100556:	b8 80 07 00 00       	mov    $0x780,%eax
8010055b:	83 c4 0c             	add    $0xc,%esp
8010055e:	29 d8                	sub    %ebx,%eax
80100560:	01 c0                	add    %eax,%eax
80100562:	50                   	push   %eax
80100563:	6a 00                	push   $0x0
80100565:	56                   	push   %esi
80100566:	e8 35 43 00 00       	call   801048a0 <memset>
  outb(CRTPORT+1, pos);
8010056b:	88 5d e7             	mov    %bl,-0x19(%ebp)
8010056e:	83 c4 10             	add    $0x10,%esp
80100571:	e9 20 ff ff ff       	jmp    80100496 <consputc.part.0+0x96>
    panic("pos under/overflow");
80100576:	83 ec 0c             	sub    $0xc,%esp
80100579:	68 65 75 10 80       	push   $0x80107565
8010057e:	e8 fd fd ff ff       	call   80100380 <panic>
80100583:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010058a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100590 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100590:	55                   	push   %ebp
80100591:	89 e5                	mov    %esp,%ebp
80100593:	57                   	push   %edi
80100594:	56                   	push   %esi
80100595:	53                   	push   %ebx
80100596:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100599:	ff 75 08             	push   0x8(%ebp)
{
8010059c:	8b 75 10             	mov    0x10(%ebp),%esi
  iunlock(ip);
8010059f:	e8 bc 12 00 00       	call   80101860 <iunlock>
  acquire(&cons.lock);
801005a4:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
801005ab:	e8 30 42 00 00       	call   801047e0 <acquire>
  for(i = 0; i < n; i++)
801005b0:	83 c4 10             	add    $0x10,%esp
801005b3:	85 f6                	test   %esi,%esi
801005b5:	7e 25                	jle    801005dc <consolewrite+0x4c>
801005b7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801005ba:	8d 3c 33             	lea    (%ebx,%esi,1),%edi
  if(panicked){
801005bd:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
    consputc(buf[i] & 0xff);
801005c3:	0f b6 03             	movzbl (%ebx),%eax
  if(panicked){
801005c6:	85 d2                	test   %edx,%edx
801005c8:	74 06                	je     801005d0 <consolewrite+0x40>
  asm volatile("cli");
801005ca:	fa                   	cli    
    for(;;)
801005cb:	eb fe                	jmp    801005cb <consolewrite+0x3b>
801005cd:	8d 76 00             	lea    0x0(%esi),%esi
801005d0:	e8 2b fe ff ff       	call   80100400 <consputc.part.0>
  for(i = 0; i < n; i++)
801005d5:	83 c3 01             	add    $0x1,%ebx
801005d8:	39 df                	cmp    %ebx,%edi
801005da:	75 e1                	jne    801005bd <consolewrite+0x2d>
  release(&cons.lock);
801005dc:	83 ec 0c             	sub    $0xc,%esp
801005df:	68 20 ef 10 80       	push   $0x8010ef20
801005e4:	e8 97 41 00 00       	call   80104780 <release>
  ilock(ip);
801005e9:	58                   	pop    %eax
801005ea:	ff 75 08             	push   0x8(%ebp)
801005ed:	e8 8e 11 00 00       	call   80101780 <ilock>

  return n;
}
801005f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801005f5:	89 f0                	mov    %esi,%eax
801005f7:	5b                   	pop    %ebx
801005f8:	5e                   	pop    %esi
801005f9:	5f                   	pop    %edi
801005fa:	5d                   	pop    %ebp
801005fb:	c3                   	ret    
801005fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100600 <printint>:
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 2c             	sub    $0x2c,%esp
80100609:	89 55 d4             	mov    %edx,-0x2c(%ebp)
8010060c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  if(sign && (sign = xx < 0))
8010060f:	85 c9                	test   %ecx,%ecx
80100611:	74 04                	je     80100617 <printint+0x17>
80100613:	85 c0                	test   %eax,%eax
80100615:	78 6d                	js     80100684 <printint+0x84>
    x = xx;
80100617:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
8010061e:	89 c1                	mov    %eax,%ecx
  i = 0;
80100620:	31 db                	xor    %ebx,%ebx
80100622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    buf[i++] = digits[x % base];
80100628:	89 c8                	mov    %ecx,%eax
8010062a:	31 d2                	xor    %edx,%edx
8010062c:	89 de                	mov    %ebx,%esi
8010062e:	89 cf                	mov    %ecx,%edi
80100630:	f7 75 d4             	divl   -0x2c(%ebp)
80100633:	8d 5b 01             	lea    0x1(%ebx),%ebx
80100636:	0f b6 92 90 75 10 80 	movzbl -0x7fef8a70(%edx),%edx
  }while((x /= base) != 0);
8010063d:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
8010063f:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
  }while((x /= base) != 0);
80100643:	3b 7d d4             	cmp    -0x2c(%ebp),%edi
80100646:	73 e0                	jae    80100628 <printint+0x28>
  if(sign)
80100648:	8b 4d d0             	mov    -0x30(%ebp),%ecx
8010064b:	85 c9                	test   %ecx,%ecx
8010064d:	74 0c                	je     8010065b <printint+0x5b>
    buf[i++] = '-';
8010064f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
80100654:	89 de                	mov    %ebx,%esi
    buf[i++] = '-';
80100656:	ba 2d 00 00 00       	mov    $0x2d,%edx
  while(--i >= 0)
8010065b:	8d 5c 35 d7          	lea    -0x29(%ebp,%esi,1),%ebx
8010065f:	0f be c2             	movsbl %dl,%eax
  if(panicked){
80100662:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
80100668:	85 d2                	test   %edx,%edx
8010066a:	74 04                	je     80100670 <printint+0x70>
8010066c:	fa                   	cli    
    for(;;)
8010066d:	eb fe                	jmp    8010066d <printint+0x6d>
8010066f:	90                   	nop
80100670:	e8 8b fd ff ff       	call   80100400 <consputc.part.0>
  while(--i >= 0)
80100675:	8d 45 d7             	lea    -0x29(%ebp),%eax
80100678:	39 c3                	cmp    %eax,%ebx
8010067a:	74 0e                	je     8010068a <printint+0x8a>
    consputc(buf[i]);
8010067c:	0f be 03             	movsbl (%ebx),%eax
8010067f:	83 eb 01             	sub    $0x1,%ebx
80100682:	eb de                	jmp    80100662 <printint+0x62>
    x = -xx;
80100684:	f7 d8                	neg    %eax
80100686:	89 c1                	mov    %eax,%ecx
80100688:	eb 96                	jmp    80100620 <printint+0x20>
}
8010068a:	83 c4 2c             	add    $0x2c,%esp
8010068d:	5b                   	pop    %ebx
8010068e:	5e                   	pop    %esi
8010068f:	5f                   	pop    %edi
80100690:	5d                   	pop    %ebp
80100691:	c3                   	ret    
80100692:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801006a0 <cprintf>:
{
801006a0:	55                   	push   %ebp
801006a1:	89 e5                	mov    %esp,%ebp
801006a3:	57                   	push   %edi
801006a4:	56                   	push   %esi
801006a5:	53                   	push   %ebx
801006a6:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
801006a9:	a1 54 ef 10 80       	mov    0x8010ef54,%eax
801006ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(locking)
801006b1:	85 c0                	test   %eax,%eax
801006b3:	0f 85 27 01 00 00    	jne    801007e0 <cprintf+0x140>
  if (fmt == 0)
801006b9:	8b 75 08             	mov    0x8(%ebp),%esi
801006bc:	85 f6                	test   %esi,%esi
801006be:	0f 84 ac 01 00 00    	je     80100870 <cprintf+0x1d0>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006c4:	0f b6 06             	movzbl (%esi),%eax
  argp = (uint*)(void*)(&fmt + 1);
801006c7:	8d 7d 0c             	lea    0xc(%ebp),%edi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006ca:	31 db                	xor    %ebx,%ebx
801006cc:	85 c0                	test   %eax,%eax
801006ce:	74 56                	je     80100726 <cprintf+0x86>
    if(c != '%'){
801006d0:	83 f8 25             	cmp    $0x25,%eax
801006d3:	0f 85 cf 00 00 00    	jne    801007a8 <cprintf+0x108>
    c = fmt[++i] & 0xff;
801006d9:	83 c3 01             	add    $0x1,%ebx
801006dc:	0f b6 14 1e          	movzbl (%esi,%ebx,1),%edx
    if(c == 0)
801006e0:	85 d2                	test   %edx,%edx
801006e2:	74 42                	je     80100726 <cprintf+0x86>
    switch(c){
801006e4:	83 fa 70             	cmp    $0x70,%edx
801006e7:	0f 84 90 00 00 00    	je     8010077d <cprintf+0xdd>
801006ed:	7f 51                	jg     80100740 <cprintf+0xa0>
801006ef:	83 fa 25             	cmp    $0x25,%edx
801006f2:	0f 84 c0 00 00 00    	je     801007b8 <cprintf+0x118>
801006f8:	83 fa 64             	cmp    $0x64,%edx
801006fb:	0f 85 f4 00 00 00    	jne    801007f5 <cprintf+0x155>
      printint(*argp++, 10, 1);
80100701:	8d 47 04             	lea    0x4(%edi),%eax
80100704:	b9 01 00 00 00       	mov    $0x1,%ecx
80100709:	ba 0a 00 00 00       	mov    $0xa,%edx
8010070e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100711:	8b 07                	mov    (%edi),%eax
80100713:	e8 e8 fe ff ff       	call   80100600 <printint>
80100718:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
8010071b:	83 c3 01             	add    $0x1,%ebx
8010071e:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
80100722:	85 c0                	test   %eax,%eax
80100724:	75 aa                	jne    801006d0 <cprintf+0x30>
  if(locking)
80100726:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100729:	85 c0                	test   %eax,%eax
8010072b:	0f 85 22 01 00 00    	jne    80100853 <cprintf+0x1b3>
}
80100731:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100734:	5b                   	pop    %ebx
80100735:	5e                   	pop    %esi
80100736:	5f                   	pop    %edi
80100737:	5d                   	pop    %ebp
80100738:	c3                   	ret    
80100739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    switch(c){
80100740:	83 fa 73             	cmp    $0x73,%edx
80100743:	75 33                	jne    80100778 <cprintf+0xd8>
      if((s = (char*)*argp++) == 0)
80100745:	8d 47 04             	lea    0x4(%edi),%eax
80100748:	8b 3f                	mov    (%edi),%edi
8010074a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010074d:	85 ff                	test   %edi,%edi
8010074f:	0f 84 e3 00 00 00    	je     80100838 <cprintf+0x198>
      for(; *s; s++)
80100755:	0f be 07             	movsbl (%edi),%eax
80100758:	84 c0                	test   %al,%al
8010075a:	0f 84 08 01 00 00    	je     80100868 <cprintf+0x1c8>
  if(panicked){
80100760:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
80100766:	85 d2                	test   %edx,%edx
80100768:	0f 84 b2 00 00 00    	je     80100820 <cprintf+0x180>
8010076e:	fa                   	cli    
    for(;;)
8010076f:	eb fe                	jmp    8010076f <cprintf+0xcf>
80100771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    switch(c){
80100778:	83 fa 78             	cmp    $0x78,%edx
8010077b:	75 78                	jne    801007f5 <cprintf+0x155>
      printint(*argp++, 16, 0);
8010077d:	8d 47 04             	lea    0x4(%edi),%eax
80100780:	31 c9                	xor    %ecx,%ecx
80100782:	ba 10 00 00 00       	mov    $0x10,%edx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100787:	83 c3 01             	add    $0x1,%ebx
      printint(*argp++, 16, 0);
8010078a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010078d:	8b 07                	mov    (%edi),%eax
8010078f:	e8 6c fe ff ff       	call   80100600 <printint>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100794:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
      printint(*argp++, 16, 0);
80100798:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
8010079b:	85 c0                	test   %eax,%eax
8010079d:	0f 85 2d ff ff ff    	jne    801006d0 <cprintf+0x30>
801007a3:	eb 81                	jmp    80100726 <cprintf+0x86>
801007a5:	8d 76 00             	lea    0x0(%esi),%esi
  if(panicked){
801007a8:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
801007ae:	85 c9                	test   %ecx,%ecx
801007b0:	74 14                	je     801007c6 <cprintf+0x126>
801007b2:	fa                   	cli    
    for(;;)
801007b3:	eb fe                	jmp    801007b3 <cprintf+0x113>
801007b5:	8d 76 00             	lea    0x0(%esi),%esi
  if(panicked){
801007b8:	a1 58 ef 10 80       	mov    0x8010ef58,%eax
801007bd:	85 c0                	test   %eax,%eax
801007bf:	75 6c                	jne    8010082d <cprintf+0x18d>
801007c1:	b8 25 00 00 00       	mov    $0x25,%eax
801007c6:	e8 35 fc ff ff       	call   80100400 <consputc.part.0>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801007cb:	83 c3 01             	add    $0x1,%ebx
801007ce:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801007d2:	85 c0                	test   %eax,%eax
801007d4:	0f 85 f6 fe ff ff    	jne    801006d0 <cprintf+0x30>
801007da:	e9 47 ff ff ff       	jmp    80100726 <cprintf+0x86>
801007df:	90                   	nop
    acquire(&cons.lock);
801007e0:	83 ec 0c             	sub    $0xc,%esp
801007e3:	68 20 ef 10 80       	push   $0x8010ef20
801007e8:	e8 f3 3f 00 00       	call   801047e0 <acquire>
801007ed:	83 c4 10             	add    $0x10,%esp
801007f0:	e9 c4 fe ff ff       	jmp    801006b9 <cprintf+0x19>
  if(panicked){
801007f5:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
801007fb:	85 c9                	test   %ecx,%ecx
801007fd:	75 31                	jne    80100830 <cprintf+0x190>
801007ff:	b8 25 00 00 00       	mov    $0x25,%eax
80100804:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100807:	e8 f4 fb ff ff       	call   80100400 <consputc.part.0>
8010080c:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
80100812:	85 d2                	test   %edx,%edx
80100814:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100817:	74 2e                	je     80100847 <cprintf+0x1a7>
80100819:	fa                   	cli    
    for(;;)
8010081a:	eb fe                	jmp    8010081a <cprintf+0x17a>
8010081c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100820:	e8 db fb ff ff       	call   80100400 <consputc.part.0>
      for(; *s; s++)
80100825:	83 c7 01             	add    $0x1,%edi
80100828:	e9 28 ff ff ff       	jmp    80100755 <cprintf+0xb5>
8010082d:	fa                   	cli    
    for(;;)
8010082e:	eb fe                	jmp    8010082e <cprintf+0x18e>
80100830:	fa                   	cli    
80100831:	eb fe                	jmp    80100831 <cprintf+0x191>
80100833:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100837:	90                   	nop
        s = "(null)";
80100838:	bf 78 75 10 80       	mov    $0x80107578,%edi
      for(; *s; s++)
8010083d:	b8 28 00 00 00       	mov    $0x28,%eax
80100842:	e9 19 ff ff ff       	jmp    80100760 <cprintf+0xc0>
80100847:	89 d0                	mov    %edx,%eax
80100849:	e8 b2 fb ff ff       	call   80100400 <consputc.part.0>
8010084e:	e9 c8 fe ff ff       	jmp    8010071b <cprintf+0x7b>
    release(&cons.lock);
80100853:	83 ec 0c             	sub    $0xc,%esp
80100856:	68 20 ef 10 80       	push   $0x8010ef20
8010085b:	e8 20 3f 00 00       	call   80104780 <release>
80100860:	83 c4 10             	add    $0x10,%esp
}
80100863:	e9 c9 fe ff ff       	jmp    80100731 <cprintf+0x91>
      if((s = (char*)*argp++) == 0)
80100868:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010086b:	e9 ab fe ff ff       	jmp    8010071b <cprintf+0x7b>
    panic("null fmt");
80100870:	83 ec 0c             	sub    $0xc,%esp
80100873:	68 7f 75 10 80       	push   $0x8010757f
80100878:	e8 03 fb ff ff       	call   80100380 <panic>
8010087d:	8d 76 00             	lea    0x0(%esi),%esi

80100880 <consoleintr>:
{
80100880:	55                   	push   %ebp
80100881:	89 e5                	mov    %esp,%ebp
80100883:	57                   	push   %edi
80100884:	56                   	push   %esi
  int c, doprocdump = 0;
80100885:	31 f6                	xor    %esi,%esi
{
80100887:	53                   	push   %ebx
80100888:	83 ec 18             	sub    $0x18,%esp
8010088b:	8b 7d 08             	mov    0x8(%ebp),%edi
  acquire(&cons.lock);
8010088e:	68 20 ef 10 80       	push   $0x8010ef20
80100893:	e8 48 3f 00 00       	call   801047e0 <acquire>
  while((c = getc()) >= 0){
80100898:	83 c4 10             	add    $0x10,%esp
8010089b:	eb 1a                	jmp    801008b7 <consoleintr+0x37>
8010089d:	8d 76 00             	lea    0x0(%esi),%esi
    switch(c){
801008a0:	83 fb 08             	cmp    $0x8,%ebx
801008a3:	0f 84 d7 00 00 00    	je     80100980 <consoleintr+0x100>
801008a9:	83 fb 10             	cmp    $0x10,%ebx
801008ac:	0f 85 32 01 00 00    	jne    801009e4 <consoleintr+0x164>
801008b2:	be 01 00 00 00       	mov    $0x1,%esi
  while((c = getc()) >= 0){
801008b7:	ff d7                	call   *%edi
801008b9:	89 c3                	mov    %eax,%ebx
801008bb:	85 c0                	test   %eax,%eax
801008bd:	0f 88 05 01 00 00    	js     801009c8 <consoleintr+0x148>
    switch(c){
801008c3:	83 fb 15             	cmp    $0x15,%ebx
801008c6:	74 78                	je     80100940 <consoleintr+0xc0>
801008c8:	7e d6                	jle    801008a0 <consoleintr+0x20>
801008ca:	83 fb 7f             	cmp    $0x7f,%ebx
801008cd:	0f 84 ad 00 00 00    	je     80100980 <consoleintr+0x100>
      if(c != 0 && input.e-input.r < INPUT_BUF){
801008d3:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
801008d8:	89 c2                	mov    %eax,%edx
801008da:	2b 15 00 ef 10 80    	sub    0x8010ef00,%edx
801008e0:	83 fa 7f             	cmp    $0x7f,%edx
801008e3:	77 d2                	ja     801008b7 <consoleintr+0x37>
        input.buf[input.e++ % INPUT_BUF] = c;
801008e5:	8d 48 01             	lea    0x1(%eax),%ecx
  if(panicked){
801008e8:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
        input.buf[input.e++ % INPUT_BUF] = c;
801008ee:	83 e0 7f             	and    $0x7f,%eax
801008f1:	89 0d 08 ef 10 80    	mov    %ecx,0x8010ef08
        c = (c == '\r') ? '\n' : c;
801008f7:	83 fb 0d             	cmp    $0xd,%ebx
801008fa:	0f 84 13 01 00 00    	je     80100a13 <consoleintr+0x193>
        input.buf[input.e++ % INPUT_BUF] = c;
80100900:	88 98 80 ee 10 80    	mov    %bl,-0x7fef1180(%eax)
  if(panicked){
80100906:	85 d2                	test   %edx,%edx
80100908:	0f 85 10 01 00 00    	jne    80100a1e <consoleintr+0x19e>
8010090e:	89 d8                	mov    %ebx,%eax
80100910:	e8 eb fa ff ff       	call   80100400 <consputc.part.0>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
80100915:	83 fb 0a             	cmp    $0xa,%ebx
80100918:	0f 84 14 01 00 00    	je     80100a32 <consoleintr+0x1b2>
8010091e:	83 fb 04             	cmp    $0x4,%ebx
80100921:	0f 84 0b 01 00 00    	je     80100a32 <consoleintr+0x1b2>
80100927:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
8010092c:	83 e8 80             	sub    $0xffffff80,%eax
8010092f:	39 05 08 ef 10 80    	cmp    %eax,0x8010ef08
80100935:	75 80                	jne    801008b7 <consoleintr+0x37>
80100937:	e9 fb 00 00 00       	jmp    80100a37 <consoleintr+0x1b7>
8010093c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      while(input.e != input.w &&
80100940:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
80100945:	39 05 04 ef 10 80    	cmp    %eax,0x8010ef04
8010094b:	0f 84 66 ff ff ff    	je     801008b7 <consoleintr+0x37>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100951:	83 e8 01             	sub    $0x1,%eax
80100954:	89 c2                	mov    %eax,%edx
80100956:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100959:	80 ba 80 ee 10 80 0a 	cmpb   $0xa,-0x7fef1180(%edx)
80100960:	0f 84 51 ff ff ff    	je     801008b7 <consoleintr+0x37>
  if(panicked){
80100966:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
        input.e--;
8010096c:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
  if(panicked){
80100971:	85 d2                	test   %edx,%edx
80100973:	74 33                	je     801009a8 <consoleintr+0x128>
80100975:	fa                   	cli    
    for(;;)
80100976:	eb fe                	jmp    80100976 <consoleintr+0xf6>
80100978:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010097f:	90                   	nop
      if(input.e != input.w){
80100980:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
80100985:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
8010098b:	0f 84 26 ff ff ff    	je     801008b7 <consoleintr+0x37>
        input.e--;
80100991:	83 e8 01             	sub    $0x1,%eax
80100994:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
  if(panicked){
80100999:	a1 58 ef 10 80       	mov    0x8010ef58,%eax
8010099e:	85 c0                	test   %eax,%eax
801009a0:	74 56                	je     801009f8 <consoleintr+0x178>
801009a2:	fa                   	cli    
    for(;;)
801009a3:	eb fe                	jmp    801009a3 <consoleintr+0x123>
801009a5:	8d 76 00             	lea    0x0(%esi),%esi
801009a8:	b8 00 01 00 00       	mov    $0x100,%eax
801009ad:	e8 4e fa ff ff       	call   80100400 <consputc.part.0>
      while(input.e != input.w &&
801009b2:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
801009b7:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801009bd:	75 92                	jne    80100951 <consoleintr+0xd1>
801009bf:	e9 f3 fe ff ff       	jmp    801008b7 <consoleintr+0x37>
801009c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&cons.lock);
801009c8:	83 ec 0c             	sub    $0xc,%esp
801009cb:	68 20 ef 10 80       	push   $0x8010ef20
801009d0:	e8 ab 3d 00 00       	call   80104780 <release>
  if(doprocdump) {
801009d5:	83 c4 10             	add    $0x10,%esp
801009d8:	85 f6                	test   %esi,%esi
801009da:	75 2b                	jne    80100a07 <consoleintr+0x187>
}
801009dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009df:	5b                   	pop    %ebx
801009e0:	5e                   	pop    %esi
801009e1:	5f                   	pop    %edi
801009e2:	5d                   	pop    %ebp
801009e3:	c3                   	ret    
      if(c != 0 && input.e-input.r < INPUT_BUF){
801009e4:	85 db                	test   %ebx,%ebx
801009e6:	0f 84 cb fe ff ff    	je     801008b7 <consoleintr+0x37>
801009ec:	e9 e2 fe ff ff       	jmp    801008d3 <consoleintr+0x53>
801009f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801009f8:	b8 00 01 00 00       	mov    $0x100,%eax
801009fd:	e8 fe f9 ff ff       	call   80100400 <consputc.part.0>
80100a02:	e9 b0 fe ff ff       	jmp    801008b7 <consoleintr+0x37>
}
80100a07:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a0a:	5b                   	pop    %ebx
80100a0b:	5e                   	pop    %esi
80100a0c:	5f                   	pop    %edi
80100a0d:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100a0e:	e9 0d 3a 00 00       	jmp    80104420 <procdump>
        input.buf[input.e++ % INPUT_BUF] = c;
80100a13:	c6 80 80 ee 10 80 0a 	movb   $0xa,-0x7fef1180(%eax)
  if(panicked){
80100a1a:	85 d2                	test   %edx,%edx
80100a1c:	74 0a                	je     80100a28 <consoleintr+0x1a8>
80100a1e:	fa                   	cli    
    for(;;)
80100a1f:	eb fe                	jmp    80100a1f <consoleintr+0x19f>
80100a21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a28:	b8 0a 00 00 00       	mov    $0xa,%eax
80100a2d:	e8 ce f9 ff ff       	call   80100400 <consputc.part.0>
          input.w = input.e;
80100a32:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
          wakeup(&input.r);
80100a37:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
80100a3a:	a3 04 ef 10 80       	mov    %eax,0x8010ef04
          wakeup(&input.r);
80100a3f:	68 00 ef 10 80       	push   $0x8010ef00
80100a44:	e8 27 39 00 00       	call   80104370 <wakeup>
80100a49:	83 c4 10             	add    $0x10,%esp
80100a4c:	e9 66 fe ff ff       	jmp    801008b7 <consoleintr+0x37>
80100a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a5f:	90                   	nop

80100a60 <consoleinit>:

void
consoleinit(void)
{
80100a60:	55                   	push   %ebp
80100a61:	89 e5                	mov    %esp,%ebp
80100a63:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
80100a66:	68 88 75 10 80       	push   $0x80107588
80100a6b:	68 20 ef 10 80       	push   $0x8010ef20
80100a70:	e8 9b 3b 00 00       	call   80104610 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
80100a75:	58                   	pop    %eax
80100a76:	5a                   	pop    %edx
80100a77:	6a 00                	push   $0x0
80100a79:	6a 01                	push   $0x1
  devsw[CONSOLE].write = consolewrite;
80100a7b:	c7 05 0c f9 10 80 90 	movl   $0x80100590,0x8010f90c
80100a82:	05 10 80 
  devsw[CONSOLE].read = consoleread;
80100a85:	c7 05 08 f9 10 80 80 	movl   $0x80100280,0x8010f908
80100a8c:	02 10 80 
  cons.locking = 1;
80100a8f:	c7 05 54 ef 10 80 01 	movl   $0x1,0x8010ef54
80100a96:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
80100a99:	e8 e2 19 00 00       	call   80102480 <ioapicenable>
}
80100a9e:	83 c4 10             	add    $0x10,%esp
80100aa1:	c9                   	leave  
80100aa2:	c3                   	ret    
80100aa3:	66 90                	xchg   %ax,%ax
80100aa5:	66 90                	xchg   %ax,%ax
80100aa7:	66 90                	xchg   %ax,%ax
80100aa9:	66 90                	xchg   %ax,%ax
80100aab:	66 90                	xchg   %ax,%ax
80100aad:	66 90                	xchg   %ax,%ax
80100aaf:	90                   	nop

80100ab0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100ab0:	55                   	push   %ebp
80100ab1:	89 e5                	mov    %esp,%ebp
80100ab3:	57                   	push   %edi
80100ab4:	56                   	push   %esi
80100ab5:	53                   	push   %ebx
80100ab6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
80100abc:	e8 ef 2d 00 00       	call   801038b0 <myproc>
80100ac1:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)

  begin_op();
80100ac7:	e8 94 22 00 00       	call   80102d60 <begin_op>

  if((ip = namei(path)) == 0){
80100acc:	83 ec 0c             	sub    $0xc,%esp
80100acf:	ff 75 08             	push   0x8(%ebp)
80100ad2:	e8 c9 15 00 00       	call   801020a0 <namei>
80100ad7:	83 c4 10             	add    $0x10,%esp
80100ada:	85 c0                	test   %eax,%eax
80100adc:	0f 84 02 03 00 00    	je     80100de4 <exec+0x334>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100ae2:	83 ec 0c             	sub    $0xc,%esp
80100ae5:	89 c3                	mov    %eax,%ebx
80100ae7:	50                   	push   %eax
80100ae8:	e8 93 0c 00 00       	call   80101780 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100aed:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100af3:	6a 34                	push   $0x34
80100af5:	6a 00                	push   $0x0
80100af7:	50                   	push   %eax
80100af8:	53                   	push   %ebx
80100af9:	e8 92 0f 00 00       	call   80101a90 <readi>
80100afe:	83 c4 20             	add    $0x20,%esp
80100b01:	83 f8 34             	cmp    $0x34,%eax
80100b04:	74 22                	je     80100b28 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100b06:	83 ec 0c             	sub    $0xc,%esp
80100b09:	53                   	push   %ebx
80100b0a:	e8 01 0f 00 00       	call   80101a10 <iunlockput>
    end_op();
80100b0f:	e8 bc 22 00 00       	call   80102dd0 <end_op>
80100b14:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100b17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100b1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100b1f:	5b                   	pop    %ebx
80100b20:	5e                   	pop    %esi
80100b21:	5f                   	pop    %edi
80100b22:	5d                   	pop    %ebp
80100b23:	c3                   	ret    
80100b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(elf.magic != ELF_MAGIC)
80100b28:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100b2f:	45 4c 46 
80100b32:	75 d2                	jne    80100b06 <exec+0x56>
  if((pgdir = setupkvm()) == 0)
80100b34:	e8 87 66 00 00       	call   801071c0 <setupkvm>
80100b39:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100b3f:	85 c0                	test   %eax,%eax
80100b41:	74 c3                	je     80100b06 <exec+0x56>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b43:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100b4a:	00 
80100b4b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100b51:	0f 84 ac 02 00 00    	je     80100e03 <exec+0x353>
  sz = 0;
80100b57:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100b5e:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b61:	31 ff                	xor    %edi,%edi
80100b63:	e9 8e 00 00 00       	jmp    80100bf6 <exec+0x146>
80100b68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100b6f:	90                   	nop
    if(ph.type != ELF_PROG_LOAD)
80100b70:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b77:	75 6c                	jne    80100be5 <exec+0x135>
    if(ph.memsz < ph.filesz)
80100b79:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b7f:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b85:	0f 82 87 00 00 00    	jb     80100c12 <exec+0x162>
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100b8b:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b91:	72 7f                	jb     80100c12 <exec+0x162>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100b93:	83 ec 04             	sub    $0x4,%esp
80100b96:	50                   	push   %eax
80100b97:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
80100b9d:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100ba3:	e8 38 64 00 00       	call   80106fe0 <allocuvm>
80100ba8:	83 c4 10             	add    $0x10,%esp
80100bab:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100bb1:	85 c0                	test   %eax,%eax
80100bb3:	74 5d                	je     80100c12 <exec+0x162>
    if(ph.vaddr % PGSIZE != 0)
80100bb5:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100bbb:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100bc0:	75 50                	jne    80100c12 <exec+0x162>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100bc2:	83 ec 0c             	sub    $0xc,%esp
80100bc5:	ff b5 14 ff ff ff    	push   -0xec(%ebp)
80100bcb:	ff b5 08 ff ff ff    	push   -0xf8(%ebp)
80100bd1:	53                   	push   %ebx
80100bd2:	50                   	push   %eax
80100bd3:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100bd9:	e8 12 63 00 00       	call   80106ef0 <loaduvm>
80100bde:	83 c4 20             	add    $0x20,%esp
80100be1:	85 c0                	test   %eax,%eax
80100be3:	78 2d                	js     80100c12 <exec+0x162>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100be5:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100bec:	83 c7 01             	add    $0x1,%edi
80100bef:	83 c6 20             	add    $0x20,%esi
80100bf2:	39 f8                	cmp    %edi,%eax
80100bf4:	7e 3a                	jle    80100c30 <exec+0x180>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100bf6:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100bfc:	6a 20                	push   $0x20
80100bfe:	56                   	push   %esi
80100bff:	50                   	push   %eax
80100c00:	53                   	push   %ebx
80100c01:	e8 8a 0e 00 00       	call   80101a90 <readi>
80100c06:	83 c4 10             	add    $0x10,%esp
80100c09:	83 f8 20             	cmp    $0x20,%eax
80100c0c:	0f 84 5e ff ff ff    	je     80100b70 <exec+0xc0>
    freevm(pgdir);
80100c12:	83 ec 0c             	sub    $0xc,%esp
80100c15:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100c1b:	e8 20 65 00 00       	call   80107140 <freevm>
  if(ip){
80100c20:	83 c4 10             	add    $0x10,%esp
80100c23:	e9 de fe ff ff       	jmp    80100b06 <exec+0x56>
80100c28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100c2f:	90                   	nop
  sz = PGROUNDUP(sz);
80100c30:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100c36:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100c3c:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c42:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
  iunlockput(ip);
80100c48:	83 ec 0c             	sub    $0xc,%esp
80100c4b:	53                   	push   %ebx
80100c4c:	e8 bf 0d 00 00       	call   80101a10 <iunlockput>
  end_op();
80100c51:	e8 7a 21 00 00       	call   80102dd0 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c56:	83 c4 0c             	add    $0xc,%esp
80100c59:	56                   	push   %esi
80100c5a:	57                   	push   %edi
80100c5b:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100c61:	57                   	push   %edi
80100c62:	e8 79 63 00 00       	call   80106fe0 <allocuvm>
80100c67:	83 c4 10             	add    $0x10,%esp
80100c6a:	89 c6                	mov    %eax,%esi
80100c6c:	85 c0                	test   %eax,%eax
80100c6e:	0f 84 94 00 00 00    	je     80100d08 <exec+0x258>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c74:	83 ec 08             	sub    $0x8,%esp
80100c77:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
  for(argc = 0; argv[argc]; argc++) {
80100c7d:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c7f:	50                   	push   %eax
80100c80:	57                   	push   %edi
  for(argc = 0; argv[argc]; argc++) {
80100c81:	31 ff                	xor    %edi,%edi
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c83:	e8 d8 65 00 00       	call   80107260 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100c88:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c8b:	83 c4 10             	add    $0x10,%esp
80100c8e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c94:	8b 00                	mov    (%eax),%eax
80100c96:	85 c0                	test   %eax,%eax
80100c98:	0f 84 8b 00 00 00    	je     80100d29 <exec+0x279>
80100c9e:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100ca4:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100caa:	eb 23                	jmp    80100ccf <exec+0x21f>
80100cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100cb0:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100cb3:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100cba:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100cbd:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100cc3:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100cc6:	85 c0                	test   %eax,%eax
80100cc8:	74 59                	je     80100d23 <exec+0x273>
    if(argc >= MAXARG)
80100cca:	83 ff 20             	cmp    $0x20,%edi
80100ccd:	74 39                	je     80100d08 <exec+0x258>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100ccf:	83 ec 0c             	sub    $0xc,%esp
80100cd2:	50                   	push   %eax
80100cd3:	e8 c8 3d 00 00       	call   80104aa0 <strlen>
80100cd8:	29 c3                	sub    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cda:	58                   	pop    %eax
80100cdb:	8b 45 0c             	mov    0xc(%ebp),%eax
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100cde:	83 eb 01             	sub    $0x1,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100ce1:	ff 34 b8             	push   (%eax,%edi,4)
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100ce4:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100ce7:	e8 b4 3d 00 00       	call   80104aa0 <strlen>
80100cec:	83 c0 01             	add    $0x1,%eax
80100cef:	50                   	push   %eax
80100cf0:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cf3:	ff 34 b8             	push   (%eax,%edi,4)
80100cf6:	53                   	push   %ebx
80100cf7:	56                   	push   %esi
80100cf8:	e8 33 67 00 00       	call   80107430 <copyout>
80100cfd:	83 c4 20             	add    $0x20,%esp
80100d00:	85 c0                	test   %eax,%eax
80100d02:	79 ac                	jns    80100cb0 <exec+0x200>
80100d04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    freevm(pgdir);
80100d08:	83 ec 0c             	sub    $0xc,%esp
80100d0b:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100d11:	e8 2a 64 00 00       	call   80107140 <freevm>
80100d16:	83 c4 10             	add    $0x10,%esp
  return -1;
80100d19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100d1e:	e9 f9 fd ff ff       	jmp    80100b1c <exec+0x6c>
80100d23:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d29:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100d30:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100d32:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100d39:	00 00 00 00 
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d3d:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100d3f:	83 c0 0c             	add    $0xc,%eax
  ustack[1] = argc;
80100d42:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  sp -= (3+argc+1) * 4;
80100d48:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d4a:	50                   	push   %eax
80100d4b:	52                   	push   %edx
80100d4c:	53                   	push   %ebx
80100d4d:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
  ustack[0] = 0xffffffff;  // fake return PC
80100d53:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100d5a:	ff ff ff 
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d5d:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d63:	e8 c8 66 00 00       	call   80107430 <copyout>
80100d68:	83 c4 10             	add    $0x10,%esp
80100d6b:	85 c0                	test   %eax,%eax
80100d6d:	78 99                	js     80100d08 <exec+0x258>
  for(last=s=path; *s; s++)
80100d6f:	8b 45 08             	mov    0x8(%ebp),%eax
80100d72:	8b 55 08             	mov    0x8(%ebp),%edx
80100d75:	0f b6 00             	movzbl (%eax),%eax
80100d78:	84 c0                	test   %al,%al
80100d7a:	74 13                	je     80100d8f <exec+0x2df>
80100d7c:	89 d1                	mov    %edx,%ecx
80100d7e:	66 90                	xchg   %ax,%ax
      last = s+1;
80100d80:	83 c1 01             	add    $0x1,%ecx
80100d83:	3c 2f                	cmp    $0x2f,%al
  for(last=s=path; *s; s++)
80100d85:	0f b6 01             	movzbl (%ecx),%eax
      last = s+1;
80100d88:	0f 44 d1             	cmove  %ecx,%edx
  for(last=s=path; *s; s++)
80100d8b:	84 c0                	test   %al,%al
80100d8d:	75 f1                	jne    80100d80 <exec+0x2d0>
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100d8f:	8b bd ec fe ff ff    	mov    -0x114(%ebp),%edi
80100d95:	83 ec 04             	sub    $0x4,%esp
80100d98:	6a 10                	push   $0x10
80100d9a:	89 f8                	mov    %edi,%eax
80100d9c:	52                   	push   %edx
80100d9d:	83 c0 6c             	add    $0x6c,%eax
80100da0:	50                   	push   %eax
80100da1:	e8 ba 3c 00 00       	call   80104a60 <safestrcpy>
  curproc->pgdir = pgdir;
80100da6:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
  oldpgdir = curproc->pgdir;
80100dac:	89 f8                	mov    %edi,%eax
80100dae:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->sz = sz;
80100db1:	89 30                	mov    %esi,(%eax)
  curproc->pgdir = pgdir;
80100db3:	89 48 04             	mov    %ecx,0x4(%eax)
  curproc->tf->eip = elf.entry;  // main
80100db6:	89 c1                	mov    %eax,%ecx
80100db8:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100dbe:	8b 40 18             	mov    0x18(%eax),%eax
80100dc1:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100dc4:	8b 41 18             	mov    0x18(%ecx),%eax
80100dc7:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100dca:	89 0c 24             	mov    %ecx,(%esp)
80100dcd:	e8 8e 5f 00 00       	call   80106d60 <switchuvm>
  freevm(oldpgdir);
80100dd2:	89 3c 24             	mov    %edi,(%esp)
80100dd5:	e8 66 63 00 00       	call   80107140 <freevm>
  return 0;
80100dda:	83 c4 10             	add    $0x10,%esp
80100ddd:	31 c0                	xor    %eax,%eax
80100ddf:	e9 38 fd ff ff       	jmp    80100b1c <exec+0x6c>
    end_op();
80100de4:	e8 e7 1f 00 00       	call   80102dd0 <end_op>
    cprintf("exec: fail\n");
80100de9:	83 ec 0c             	sub    $0xc,%esp
80100dec:	68 a1 75 10 80       	push   $0x801075a1
80100df1:	e8 aa f8 ff ff       	call   801006a0 <cprintf>
    return -1;
80100df6:	83 c4 10             	add    $0x10,%esp
80100df9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100dfe:	e9 19 fd ff ff       	jmp    80100b1c <exec+0x6c>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100e03:	be 00 20 00 00       	mov    $0x2000,%esi
80100e08:	31 ff                	xor    %edi,%edi
80100e0a:	e9 39 fe ff ff       	jmp    80100c48 <exec+0x198>
80100e0f:	90                   	nop

80100e10 <fileinit>:
80100e10:	55                   	push   %ebp
80100e11:	89 e5                	mov    %esp,%ebp
80100e13:	83 ec 10             	sub    $0x10,%esp
80100e16:	68 ad 75 10 80       	push   $0x801075ad
80100e1b:	68 60 ef 10 80       	push   $0x8010ef60
80100e20:	e8 eb 37 00 00       	call   80104610 <initlock>
80100e25:	83 c4 10             	add    $0x10,%esp
80100e28:	c9                   	leave  
80100e29:	c3                   	ret    
80100e2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100e30 <filealloc>:
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	53                   	push   %ebx
80100e34:	bb 94 ef 10 80       	mov    $0x8010ef94,%ebx
80100e39:	83 ec 10             	sub    $0x10,%esp
80100e3c:	68 60 ef 10 80       	push   $0x8010ef60
80100e41:	e8 9a 39 00 00       	call   801047e0 <acquire>
80100e46:	83 c4 10             	add    $0x10,%esp
80100e49:	eb 10                	jmp    80100e5b <filealloc+0x2b>
80100e4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e4f:	90                   	nop
80100e50:	83 c3 18             	add    $0x18,%ebx
80100e53:	81 fb f4 f8 10 80    	cmp    $0x8010f8f4,%ebx
80100e59:	74 25                	je     80100e80 <filealloc+0x50>
80100e5b:	8b 43 04             	mov    0x4(%ebx),%eax
80100e5e:	85 c0                	test   %eax,%eax
80100e60:	75 ee                	jne    80100e50 <filealloc+0x20>
80100e62:	83 ec 0c             	sub    $0xc,%esp
80100e65:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100e6c:	68 60 ef 10 80       	push   $0x8010ef60
80100e71:	e8 0a 39 00 00       	call   80104780 <release>
80100e76:	89 d8                	mov    %ebx,%eax
80100e78:	83 c4 10             	add    $0x10,%esp
80100e7b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e7e:	c9                   	leave  
80100e7f:	c3                   	ret    
80100e80:	83 ec 0c             	sub    $0xc,%esp
80100e83:	31 db                	xor    %ebx,%ebx
80100e85:	68 60 ef 10 80       	push   $0x8010ef60
80100e8a:	e8 f1 38 00 00       	call   80104780 <release>
80100e8f:	89 d8                	mov    %ebx,%eax
80100e91:	83 c4 10             	add    $0x10,%esp
80100e94:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e97:	c9                   	leave  
80100e98:	c3                   	ret    
80100e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100ea0 <filedup>:
80100ea0:	55                   	push   %ebp
80100ea1:	89 e5                	mov    %esp,%ebp
80100ea3:	53                   	push   %ebx
80100ea4:	83 ec 10             	sub    $0x10,%esp
80100ea7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100eaa:	68 60 ef 10 80       	push   $0x8010ef60
80100eaf:	e8 2c 39 00 00       	call   801047e0 <acquire>
80100eb4:	8b 43 04             	mov    0x4(%ebx),%eax
80100eb7:	83 c4 10             	add    $0x10,%esp
80100eba:	85 c0                	test   %eax,%eax
80100ebc:	7e 1a                	jle    80100ed8 <filedup+0x38>
80100ebe:	83 c0 01             	add    $0x1,%eax
80100ec1:	83 ec 0c             	sub    $0xc,%esp
80100ec4:	89 43 04             	mov    %eax,0x4(%ebx)
80100ec7:	68 60 ef 10 80       	push   $0x8010ef60
80100ecc:	e8 af 38 00 00       	call   80104780 <release>
80100ed1:	89 d8                	mov    %ebx,%eax
80100ed3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100ed6:	c9                   	leave  
80100ed7:	c3                   	ret    
80100ed8:	83 ec 0c             	sub    $0xc,%esp
80100edb:	68 b4 75 10 80       	push   $0x801075b4
80100ee0:	e8 9b f4 ff ff       	call   80100380 <panic>
80100ee5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ef0 <fileclose>:
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	57                   	push   %edi
80100ef4:	56                   	push   %esi
80100ef5:	53                   	push   %ebx
80100ef6:	83 ec 28             	sub    $0x28,%esp
80100ef9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100efc:	68 60 ef 10 80       	push   $0x8010ef60
80100f01:	e8 da 38 00 00       	call   801047e0 <acquire>
80100f06:	8b 53 04             	mov    0x4(%ebx),%edx
80100f09:	83 c4 10             	add    $0x10,%esp
80100f0c:	85 d2                	test   %edx,%edx
80100f0e:	0f 8e a5 00 00 00    	jle    80100fb9 <fileclose+0xc9>
80100f14:	83 ea 01             	sub    $0x1,%edx
80100f17:	89 53 04             	mov    %edx,0x4(%ebx)
80100f1a:	75 44                	jne    80100f60 <fileclose+0x70>
80100f1c:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100f20:	83 ec 0c             	sub    $0xc,%esp
80100f23:	8b 3b                	mov    (%ebx),%edi
80100f25:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100f2b:	8b 73 0c             	mov    0xc(%ebx),%esi
80100f2e:	88 45 e7             	mov    %al,-0x19(%ebp)
80100f31:	8b 43 10             	mov    0x10(%ebx),%eax
80100f34:	68 60 ef 10 80       	push   $0x8010ef60
80100f39:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100f3c:	e8 3f 38 00 00       	call   80104780 <release>
80100f41:	83 c4 10             	add    $0x10,%esp
80100f44:	83 ff 01             	cmp    $0x1,%edi
80100f47:	74 57                	je     80100fa0 <fileclose+0xb0>
80100f49:	83 ff 02             	cmp    $0x2,%edi
80100f4c:	74 2a                	je     80100f78 <fileclose+0x88>
80100f4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f51:	5b                   	pop    %ebx
80100f52:	5e                   	pop    %esi
80100f53:	5f                   	pop    %edi
80100f54:	5d                   	pop    %ebp
80100f55:	c3                   	ret    
80100f56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f5d:	8d 76 00             	lea    0x0(%esi),%esi
80100f60:	c7 45 08 60 ef 10 80 	movl   $0x8010ef60,0x8(%ebp)
80100f67:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f6a:	5b                   	pop    %ebx
80100f6b:	5e                   	pop    %esi
80100f6c:	5f                   	pop    %edi
80100f6d:	5d                   	pop    %ebp
80100f6e:	e9 0d 38 00 00       	jmp    80104780 <release>
80100f73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f77:	90                   	nop
80100f78:	e8 e3 1d 00 00       	call   80102d60 <begin_op>
80100f7d:	83 ec 0c             	sub    $0xc,%esp
80100f80:	ff 75 e0             	push   -0x20(%ebp)
80100f83:	e8 28 09 00 00       	call   801018b0 <iput>
80100f88:	83 c4 10             	add    $0x10,%esp
80100f8b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f8e:	5b                   	pop    %ebx
80100f8f:	5e                   	pop    %esi
80100f90:	5f                   	pop    %edi
80100f91:	5d                   	pop    %ebp
80100f92:	e9 39 1e 00 00       	jmp    80102dd0 <end_op>
80100f97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f9e:	66 90                	xchg   %ax,%ax
80100fa0:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100fa4:	83 ec 08             	sub    $0x8,%esp
80100fa7:	53                   	push   %ebx
80100fa8:	56                   	push   %esi
80100fa9:	e8 92 25 00 00       	call   80103540 <pipeclose>
80100fae:	83 c4 10             	add    $0x10,%esp
80100fb1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb4:	5b                   	pop    %ebx
80100fb5:	5e                   	pop    %esi
80100fb6:	5f                   	pop    %edi
80100fb7:	5d                   	pop    %ebp
80100fb8:	c3                   	ret    
80100fb9:	83 ec 0c             	sub    $0xc,%esp
80100fbc:	68 bc 75 10 80       	push   $0x801075bc
80100fc1:	e8 ba f3 ff ff       	call   80100380 <panic>
80100fc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100fcd:	8d 76 00             	lea    0x0(%esi),%esi

80100fd0 <filestat>:
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	53                   	push   %ebx
80100fd4:	83 ec 04             	sub    $0x4,%esp
80100fd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fda:	83 3b 02             	cmpl   $0x2,(%ebx)
80100fdd:	75 31                	jne    80101010 <filestat+0x40>
80100fdf:	83 ec 0c             	sub    $0xc,%esp
80100fe2:	ff 73 10             	push   0x10(%ebx)
80100fe5:	e8 96 07 00 00       	call   80101780 <ilock>
80100fea:	58                   	pop    %eax
80100feb:	5a                   	pop    %edx
80100fec:	ff 75 0c             	push   0xc(%ebp)
80100fef:	ff 73 10             	push   0x10(%ebx)
80100ff2:	e8 69 0a 00 00       	call   80101a60 <stati>
80100ff7:	59                   	pop    %ecx
80100ff8:	ff 73 10             	push   0x10(%ebx)
80100ffb:	e8 60 08 00 00       	call   80101860 <iunlock>
80101000:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101003:	83 c4 10             	add    $0x10,%esp
80101006:	31 c0                	xor    %eax,%eax
80101008:	c9                   	leave  
80101009:	c3                   	ret    
8010100a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101010:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101013:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101018:	c9                   	leave  
80101019:	c3                   	ret    
8010101a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101020 <fileread>:
80101020:	55                   	push   %ebp
80101021:	89 e5                	mov    %esp,%ebp
80101023:	57                   	push   %edi
80101024:	56                   	push   %esi
80101025:	53                   	push   %ebx
80101026:	83 ec 0c             	sub    $0xc,%esp
80101029:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010102c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010102f:	8b 7d 10             	mov    0x10(%ebp),%edi
80101032:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80101036:	74 60                	je     80101098 <fileread+0x78>
80101038:	8b 03                	mov    (%ebx),%eax
8010103a:	83 f8 01             	cmp    $0x1,%eax
8010103d:	74 41                	je     80101080 <fileread+0x60>
8010103f:	83 f8 02             	cmp    $0x2,%eax
80101042:	75 5b                	jne    8010109f <fileread+0x7f>
80101044:	83 ec 0c             	sub    $0xc,%esp
80101047:	ff 73 10             	push   0x10(%ebx)
8010104a:	e8 31 07 00 00       	call   80101780 <ilock>
8010104f:	57                   	push   %edi
80101050:	ff 73 14             	push   0x14(%ebx)
80101053:	56                   	push   %esi
80101054:	ff 73 10             	push   0x10(%ebx)
80101057:	e8 34 0a 00 00       	call   80101a90 <readi>
8010105c:	83 c4 20             	add    $0x20,%esp
8010105f:	89 c6                	mov    %eax,%esi
80101061:	85 c0                	test   %eax,%eax
80101063:	7e 03                	jle    80101068 <fileread+0x48>
80101065:	01 43 14             	add    %eax,0x14(%ebx)
80101068:	83 ec 0c             	sub    $0xc,%esp
8010106b:	ff 73 10             	push   0x10(%ebx)
8010106e:	e8 ed 07 00 00       	call   80101860 <iunlock>
80101073:	83 c4 10             	add    $0x10,%esp
80101076:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101079:	89 f0                	mov    %esi,%eax
8010107b:	5b                   	pop    %ebx
8010107c:	5e                   	pop    %esi
8010107d:	5f                   	pop    %edi
8010107e:	5d                   	pop    %ebp
8010107f:	c3                   	ret    
80101080:	8b 43 0c             	mov    0xc(%ebx),%eax
80101083:	89 45 08             	mov    %eax,0x8(%ebp)
80101086:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101089:	5b                   	pop    %ebx
8010108a:	5e                   	pop    %esi
8010108b:	5f                   	pop    %edi
8010108c:	5d                   	pop    %ebp
8010108d:	e9 4e 26 00 00       	jmp    801036e0 <piperead>
80101092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101098:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010109d:	eb d7                	jmp    80101076 <fileread+0x56>
8010109f:	83 ec 0c             	sub    $0xc,%esp
801010a2:	68 c6 75 10 80       	push   $0x801075c6
801010a7:	e8 d4 f2 ff ff       	call   80100380 <panic>
801010ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801010b0 <filewrite>:
801010b0:	55                   	push   %ebp
801010b1:	89 e5                	mov    %esp,%ebp
801010b3:	57                   	push   %edi
801010b4:	56                   	push   %esi
801010b5:	53                   	push   %ebx
801010b6:	83 ec 1c             	sub    $0x1c,%esp
801010b9:	8b 45 0c             	mov    0xc(%ebp),%eax
801010bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801010bf:	89 45 dc             	mov    %eax,-0x24(%ebp)
801010c2:	8b 45 10             	mov    0x10(%ebp),%eax
801010c5:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
801010c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801010cc:	0f 84 bd 00 00 00    	je     8010118f <filewrite+0xdf>
801010d2:	8b 03                	mov    (%ebx),%eax
801010d4:	83 f8 01             	cmp    $0x1,%eax
801010d7:	0f 84 bf 00 00 00    	je     8010119c <filewrite+0xec>
801010dd:	83 f8 02             	cmp    $0x2,%eax
801010e0:	0f 85 c8 00 00 00    	jne    801011ae <filewrite+0xfe>
801010e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801010e9:	31 f6                	xor    %esi,%esi
801010eb:	85 c0                	test   %eax,%eax
801010ed:	7f 30                	jg     8010111f <filewrite+0x6f>
801010ef:	e9 94 00 00 00       	jmp    80101188 <filewrite+0xd8>
801010f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801010f8:	01 43 14             	add    %eax,0x14(%ebx)
801010fb:	83 ec 0c             	sub    $0xc,%esp
801010fe:	ff 73 10             	push   0x10(%ebx)
80101101:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101104:	e8 57 07 00 00       	call   80101860 <iunlock>
80101109:	e8 c2 1c 00 00       	call   80102dd0 <end_op>
8010110e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101111:	83 c4 10             	add    $0x10,%esp
80101114:	39 c7                	cmp    %eax,%edi
80101116:	75 5c                	jne    80101174 <filewrite+0xc4>
80101118:	01 fe                	add    %edi,%esi
8010111a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
8010111d:	7e 69                	jle    80101188 <filewrite+0xd8>
8010111f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101122:	b8 00 06 00 00       	mov    $0x600,%eax
80101127:	29 f7                	sub    %esi,%edi
80101129:	39 c7                	cmp    %eax,%edi
8010112b:	0f 4f f8             	cmovg  %eax,%edi
8010112e:	e8 2d 1c 00 00       	call   80102d60 <begin_op>
80101133:	83 ec 0c             	sub    $0xc,%esp
80101136:	ff 73 10             	push   0x10(%ebx)
80101139:	e8 42 06 00 00       	call   80101780 <ilock>
8010113e:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101141:	57                   	push   %edi
80101142:	ff 73 14             	push   0x14(%ebx)
80101145:	01 f0                	add    %esi,%eax
80101147:	50                   	push   %eax
80101148:	ff 73 10             	push   0x10(%ebx)
8010114b:	e8 40 0a 00 00       	call   80101b90 <writei>
80101150:	83 c4 20             	add    $0x20,%esp
80101153:	85 c0                	test   %eax,%eax
80101155:	7f a1                	jg     801010f8 <filewrite+0x48>
80101157:	83 ec 0c             	sub    $0xc,%esp
8010115a:	ff 73 10             	push   0x10(%ebx)
8010115d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101160:	e8 fb 06 00 00       	call   80101860 <iunlock>
80101165:	e8 66 1c 00 00       	call   80102dd0 <end_op>
8010116a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010116d:	83 c4 10             	add    $0x10,%esp
80101170:	85 c0                	test   %eax,%eax
80101172:	75 1b                	jne    8010118f <filewrite+0xdf>
80101174:	83 ec 0c             	sub    $0xc,%esp
80101177:	68 cf 75 10 80       	push   $0x801075cf
8010117c:	e8 ff f1 ff ff       	call   80100380 <panic>
80101181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101188:	89 f0                	mov    %esi,%eax
8010118a:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
8010118d:	74 05                	je     80101194 <filewrite+0xe4>
8010118f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101194:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101197:	5b                   	pop    %ebx
80101198:	5e                   	pop    %esi
80101199:	5f                   	pop    %edi
8010119a:	5d                   	pop    %ebp
8010119b:	c3                   	ret    
8010119c:	8b 43 0c             	mov    0xc(%ebx),%eax
8010119f:	89 45 08             	mov    %eax,0x8(%ebp)
801011a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011a5:	5b                   	pop    %ebx
801011a6:	5e                   	pop    %esi
801011a7:	5f                   	pop    %edi
801011a8:	5d                   	pop    %ebp
801011a9:	e9 32 24 00 00       	jmp    801035e0 <pipewrite>
801011ae:	83 ec 0c             	sub    $0xc,%esp
801011b1:	68 d5 75 10 80       	push   $0x801075d5
801011b6:	e8 c5 f1 ff ff       	call   80100380 <panic>
801011bb:	66 90                	xchg   %ax,%ax
801011bd:	66 90                	xchg   %ax,%ax
801011bf:	90                   	nop

801011c0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801011c0:	55                   	push   %ebp
801011c1:	89 c1                	mov    %eax,%ecx
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
801011c3:	89 d0                	mov    %edx,%eax
801011c5:	c1 e8 0c             	shr    $0xc,%eax
801011c8:	03 05 cc 15 11 80    	add    0x801115cc,%eax
{
801011ce:	89 e5                	mov    %esp,%ebp
801011d0:	56                   	push   %esi
801011d1:	53                   	push   %ebx
801011d2:	89 d3                	mov    %edx,%ebx
  bp = bread(dev, BBLOCK(b, sb));
801011d4:	83 ec 08             	sub    $0x8,%esp
801011d7:	50                   	push   %eax
801011d8:	51                   	push   %ecx
801011d9:	e8 f2 ee ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
801011de:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
801011e0:	c1 fb 03             	sar    $0x3,%ebx
801011e3:	83 c4 10             	add    $0x10,%esp
  bp = bread(dev, BBLOCK(b, sb));
801011e6:	89 c6                	mov    %eax,%esi
  m = 1 << (bi % 8);
801011e8:	83 e1 07             	and    $0x7,%ecx
801011eb:	b8 01 00 00 00       	mov    $0x1,%eax
  if((bp->data[bi/8] & m) == 0)
801011f0:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
  m = 1 << (bi % 8);
801011f6:	d3 e0                	shl    %cl,%eax
  if((bp->data[bi/8] & m) == 0)
801011f8:	0f b6 4c 1e 5c       	movzbl 0x5c(%esi,%ebx,1),%ecx
801011fd:	85 c1                	test   %eax,%ecx
801011ff:	74 23                	je     80101224 <bfree+0x64>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101201:	f7 d0                	not    %eax
  log_write(bp);
80101203:	83 ec 0c             	sub    $0xc,%esp
  bp->data[bi/8] &= ~m;
80101206:	21 c8                	and    %ecx,%eax
80101208:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010120c:	56                   	push   %esi
8010120d:	e8 2e 1d 00 00       	call   80102f40 <log_write>
  brelse(bp);
80101212:	89 34 24             	mov    %esi,(%esp)
80101215:	e8 d6 ef ff ff       	call   801001f0 <brelse>
}
8010121a:	83 c4 10             	add    $0x10,%esp
8010121d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101220:	5b                   	pop    %ebx
80101221:	5e                   	pop    %esi
80101222:	5d                   	pop    %ebp
80101223:	c3                   	ret    
    panic("freeing free block");
80101224:	83 ec 0c             	sub    $0xc,%esp
80101227:	68 df 75 10 80       	push   $0x801075df
8010122c:	e8 4f f1 ff ff       	call   80100380 <panic>
80101231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101238:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010123f:	90                   	nop

80101240 <balloc>:
{
80101240:	55                   	push   %ebp
80101241:	89 e5                	mov    %esp,%ebp
80101243:	57                   	push   %edi
80101244:	56                   	push   %esi
80101245:	53                   	push   %ebx
80101246:	83 ec 1c             	sub    $0x1c,%esp
  for(b = 0; b < sb.size; b += BPB){
80101249:	8b 0d b4 15 11 80    	mov    0x801115b4,%ecx
{
8010124f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
80101252:	85 c9                	test   %ecx,%ecx
80101254:	0f 84 87 00 00 00    	je     801012e1 <balloc+0xa1>
8010125a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101261:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101264:	83 ec 08             	sub    $0x8,%esp
80101267:	89 f0                	mov    %esi,%eax
80101269:	c1 f8 0c             	sar    $0xc,%eax
8010126c:	03 05 cc 15 11 80    	add    0x801115cc,%eax
80101272:	50                   	push   %eax
80101273:	ff 75 d8             	push   -0x28(%ebp)
80101276:	e8 55 ee ff ff       	call   801000d0 <bread>
8010127b:	83 c4 10             	add    $0x10,%esp
8010127e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101281:	a1 b4 15 11 80       	mov    0x801115b4,%eax
80101286:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101289:	31 c0                	xor    %eax,%eax
8010128b:	eb 2f                	jmp    801012bc <balloc+0x7c>
8010128d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101290:	89 c1                	mov    %eax,%ecx
80101292:	bb 01 00 00 00       	mov    $0x1,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101297:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
8010129a:	83 e1 07             	and    $0x7,%ecx
8010129d:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010129f:	89 c1                	mov    %eax,%ecx
801012a1:	c1 f9 03             	sar    $0x3,%ecx
801012a4:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
801012a9:	89 fa                	mov    %edi,%edx
801012ab:	85 df                	test   %ebx,%edi
801012ad:	74 41                	je     801012f0 <balloc+0xb0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801012af:	83 c0 01             	add    $0x1,%eax
801012b2:	83 c6 01             	add    $0x1,%esi
801012b5:	3d 00 10 00 00       	cmp    $0x1000,%eax
801012ba:	74 05                	je     801012c1 <balloc+0x81>
801012bc:	39 75 e0             	cmp    %esi,-0x20(%ebp)
801012bf:	77 cf                	ja     80101290 <balloc+0x50>
    brelse(bp);
801012c1:	83 ec 0c             	sub    $0xc,%esp
801012c4:	ff 75 e4             	push   -0x1c(%ebp)
801012c7:	e8 24 ef ff ff       	call   801001f0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
801012cc:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801012d3:	83 c4 10             	add    $0x10,%esp
801012d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801012d9:	39 05 b4 15 11 80    	cmp    %eax,0x801115b4
801012df:	77 80                	ja     80101261 <balloc+0x21>
  panic("balloc: out of blocks");
801012e1:	83 ec 0c             	sub    $0xc,%esp
801012e4:	68 f2 75 10 80       	push   $0x801075f2
801012e9:	e8 92 f0 ff ff       	call   80100380 <panic>
801012ee:	66 90                	xchg   %ax,%ax
        bp->data[bi/8] |= m;  // Mark block in use.
801012f0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801012f3:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
801012f6:	09 da                	or     %ebx,%edx
801012f8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801012fc:	57                   	push   %edi
801012fd:	e8 3e 1c 00 00       	call   80102f40 <log_write>
        brelse(bp);
80101302:	89 3c 24             	mov    %edi,(%esp)
80101305:	e8 e6 ee ff ff       	call   801001f0 <brelse>
  bp = bread(dev, bno);
8010130a:	58                   	pop    %eax
8010130b:	5a                   	pop    %edx
8010130c:	56                   	push   %esi
8010130d:	ff 75 d8             	push   -0x28(%ebp)
80101310:	e8 bb ed ff ff       	call   801000d0 <bread>
  memset(bp->data, 0, BSIZE);
80101315:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, bno);
80101318:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
8010131a:	8d 40 5c             	lea    0x5c(%eax),%eax
8010131d:	68 00 02 00 00       	push   $0x200
80101322:	6a 00                	push   $0x0
80101324:	50                   	push   %eax
80101325:	e8 76 35 00 00       	call   801048a0 <memset>
  log_write(bp);
8010132a:	89 1c 24             	mov    %ebx,(%esp)
8010132d:	e8 0e 1c 00 00       	call   80102f40 <log_write>
  brelse(bp);
80101332:	89 1c 24             	mov    %ebx,(%esp)
80101335:	e8 b6 ee ff ff       	call   801001f0 <brelse>
}
8010133a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010133d:	89 f0                	mov    %esi,%eax
8010133f:	5b                   	pop    %ebx
80101340:	5e                   	pop    %esi
80101341:	5f                   	pop    %edi
80101342:	5d                   	pop    %ebp
80101343:	c3                   	ret    
80101344:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010134b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010134f:	90                   	nop

80101350 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101350:	55                   	push   %ebp
80101351:	89 e5                	mov    %esp,%ebp
80101353:	57                   	push   %edi
80101354:	89 c7                	mov    %eax,%edi
80101356:	56                   	push   %esi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101357:	31 f6                	xor    %esi,%esi
{
80101359:	53                   	push   %ebx
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010135a:	bb 94 f9 10 80       	mov    $0x8010f994,%ebx
{
8010135f:	83 ec 28             	sub    $0x28,%esp
80101362:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
80101365:	68 60 f9 10 80       	push   $0x8010f960
8010136a:	e8 71 34 00 00       	call   801047e0 <acquire>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010136f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  acquire(&icache.lock);
80101372:	83 c4 10             	add    $0x10,%esp
80101375:	eb 1b                	jmp    80101392 <iget+0x42>
80101377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010137e:	66 90                	xchg   %ax,%ax
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101380:	39 3b                	cmp    %edi,(%ebx)
80101382:	74 6c                	je     801013f0 <iget+0xa0>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101384:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010138a:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101390:	73 26                	jae    801013b8 <iget+0x68>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101392:	8b 43 08             	mov    0x8(%ebx),%eax
80101395:	85 c0                	test   %eax,%eax
80101397:	7f e7                	jg     80101380 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101399:	85 f6                	test   %esi,%esi
8010139b:	75 e7                	jne    80101384 <iget+0x34>
8010139d:	85 c0                	test   %eax,%eax
8010139f:	75 76                	jne    80101417 <iget+0xc7>
801013a1:	89 de                	mov    %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801013a3:	81 c3 90 00 00 00    	add    $0x90,%ebx
801013a9:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
801013af:	72 e1                	jb     80101392 <iget+0x42>
801013b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801013b8:	85 f6                	test   %esi,%esi
801013ba:	74 79                	je     80101435 <iget+0xe5>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
801013bc:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
801013bf:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801013c1:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801013c4:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
801013cb:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801013d2:	68 60 f9 10 80       	push   $0x8010f960
801013d7:	e8 a4 33 00 00       	call   80104780 <release>

  return ip;
801013dc:	83 c4 10             	add    $0x10,%esp
}
801013df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013e2:	89 f0                	mov    %esi,%eax
801013e4:	5b                   	pop    %ebx
801013e5:	5e                   	pop    %esi
801013e6:	5f                   	pop    %edi
801013e7:	5d                   	pop    %ebp
801013e8:	c3                   	ret    
801013e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801013f0:	39 53 04             	cmp    %edx,0x4(%ebx)
801013f3:	75 8f                	jne    80101384 <iget+0x34>
      release(&icache.lock);
801013f5:	83 ec 0c             	sub    $0xc,%esp
      ip->ref++;
801013f8:	83 c0 01             	add    $0x1,%eax
      return ip;
801013fb:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
801013fd:	68 60 f9 10 80       	push   $0x8010f960
      ip->ref++;
80101402:	89 43 08             	mov    %eax,0x8(%ebx)
      release(&icache.lock);
80101405:	e8 76 33 00 00       	call   80104780 <release>
      return ip;
8010140a:	83 c4 10             	add    $0x10,%esp
}
8010140d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101410:	89 f0                	mov    %esi,%eax
80101412:	5b                   	pop    %ebx
80101413:	5e                   	pop    %esi
80101414:	5f                   	pop    %edi
80101415:	5d                   	pop    %ebp
80101416:	c3                   	ret    
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101417:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010141d:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101423:	73 10                	jae    80101435 <iget+0xe5>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101425:	8b 43 08             	mov    0x8(%ebx),%eax
80101428:	85 c0                	test   %eax,%eax
8010142a:	0f 8f 50 ff ff ff    	jg     80101380 <iget+0x30>
80101430:	e9 68 ff ff ff       	jmp    8010139d <iget+0x4d>
    panic("iget: no inodes");
80101435:	83 ec 0c             	sub    $0xc,%esp
80101438:	68 08 76 10 80       	push   $0x80107608
8010143d:	e8 3e ef ff ff       	call   80100380 <panic>
80101442:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101450 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101450:	55                   	push   %ebp
80101451:	89 e5                	mov    %esp,%ebp
80101453:	57                   	push   %edi
80101454:	56                   	push   %esi
80101455:	89 c6                	mov    %eax,%esi
80101457:	53                   	push   %ebx
80101458:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
8010145b:	83 fa 0b             	cmp    $0xb,%edx
8010145e:	0f 86 8c 00 00 00    	jbe    801014f0 <bmap+0xa0>
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101464:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
80101467:	83 fb 7f             	cmp    $0x7f,%ebx
8010146a:	0f 87 a2 00 00 00    	ja     80101512 <bmap+0xc2>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101470:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101476:	85 c0                	test   %eax,%eax
80101478:	74 5e                	je     801014d8 <bmap+0x88>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010147a:	83 ec 08             	sub    $0x8,%esp
8010147d:	50                   	push   %eax
8010147e:	ff 36                	push   (%esi)
80101480:	e8 4b ec ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101485:	83 c4 10             	add    $0x10,%esp
80101488:	8d 5c 98 5c          	lea    0x5c(%eax,%ebx,4),%ebx
    bp = bread(ip->dev, addr);
8010148c:	89 c2                	mov    %eax,%edx
    if((addr = a[bn]) == 0){
8010148e:	8b 3b                	mov    (%ebx),%edi
80101490:	85 ff                	test   %edi,%edi
80101492:	74 1c                	je     801014b0 <bmap+0x60>
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101494:	83 ec 0c             	sub    $0xc,%esp
80101497:	52                   	push   %edx
80101498:	e8 53 ed ff ff       	call   801001f0 <brelse>
8010149d:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
801014a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801014a3:	89 f8                	mov    %edi,%eax
801014a5:	5b                   	pop    %ebx
801014a6:	5e                   	pop    %esi
801014a7:	5f                   	pop    %edi
801014a8:	5d                   	pop    %ebp
801014a9:	c3                   	ret    
801014aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801014b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      a[bn] = addr = balloc(ip->dev);
801014b3:	8b 06                	mov    (%esi),%eax
801014b5:	e8 86 fd ff ff       	call   80101240 <balloc>
      log_write(bp);
801014ba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801014bd:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
801014c0:	89 03                	mov    %eax,(%ebx)
801014c2:	89 c7                	mov    %eax,%edi
      log_write(bp);
801014c4:	52                   	push   %edx
801014c5:	e8 76 1a 00 00       	call   80102f40 <log_write>
801014ca:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801014cd:	83 c4 10             	add    $0x10,%esp
801014d0:	eb c2                	jmp    80101494 <bmap+0x44>
801014d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801014d8:	8b 06                	mov    (%esi),%eax
801014da:	e8 61 fd ff ff       	call   80101240 <balloc>
801014df:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801014e5:	eb 93                	jmp    8010147a <bmap+0x2a>
801014e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801014ee:	66 90                	xchg   %ax,%ax
    if((addr = ip->addrs[bn]) == 0)
801014f0:	8d 5a 14             	lea    0x14(%edx),%ebx
801014f3:	8b 7c 98 0c          	mov    0xc(%eax,%ebx,4),%edi
801014f7:	85 ff                	test   %edi,%edi
801014f9:	75 a5                	jne    801014a0 <bmap+0x50>
      ip->addrs[bn] = addr = balloc(ip->dev);
801014fb:	8b 00                	mov    (%eax),%eax
801014fd:	e8 3e fd ff ff       	call   80101240 <balloc>
80101502:	89 44 9e 0c          	mov    %eax,0xc(%esi,%ebx,4)
80101506:	89 c7                	mov    %eax,%edi
}
80101508:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010150b:	5b                   	pop    %ebx
8010150c:	89 f8                	mov    %edi,%eax
8010150e:	5e                   	pop    %esi
8010150f:	5f                   	pop    %edi
80101510:	5d                   	pop    %ebp
80101511:	c3                   	ret    
  panic("bmap: out of range");
80101512:	83 ec 0c             	sub    $0xc,%esp
80101515:	68 18 76 10 80       	push   $0x80107618
8010151a:	e8 61 ee ff ff       	call   80100380 <panic>
8010151f:	90                   	nop

80101520 <readsb>:
{
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	56                   	push   %esi
80101524:	53                   	push   %ebx
80101525:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
80101528:	83 ec 08             	sub    $0x8,%esp
8010152b:	6a 01                	push   $0x1
8010152d:	ff 75 08             	push   0x8(%ebp)
80101530:	e8 9b eb ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
80101535:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, 1);
80101538:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
8010153a:	8d 40 5c             	lea    0x5c(%eax),%eax
8010153d:	6a 1c                	push   $0x1c
8010153f:	50                   	push   %eax
80101540:	56                   	push   %esi
80101541:	e8 fa 33 00 00       	call   80104940 <memmove>
  brelse(bp);
80101546:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101549:	83 c4 10             	add    $0x10,%esp
}
8010154c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010154f:	5b                   	pop    %ebx
80101550:	5e                   	pop    %esi
80101551:	5d                   	pop    %ebp
  brelse(bp);
80101552:	e9 99 ec ff ff       	jmp    801001f0 <brelse>
80101557:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010155e:	66 90                	xchg   %ax,%ax

80101560 <iinit>:
{
80101560:	55                   	push   %ebp
80101561:	89 e5                	mov    %esp,%ebp
80101563:	53                   	push   %ebx
80101564:	bb a0 f9 10 80       	mov    $0x8010f9a0,%ebx
80101569:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
8010156c:	68 2b 76 10 80       	push   $0x8010762b
80101571:	68 60 f9 10 80       	push   $0x8010f960
80101576:	e8 95 30 00 00       	call   80104610 <initlock>
  for(i = 0; i < NINODE; i++) {
8010157b:	83 c4 10             	add    $0x10,%esp
8010157e:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
80101580:	83 ec 08             	sub    $0x8,%esp
80101583:	68 32 76 10 80       	push   $0x80107632
80101588:	53                   	push   %ebx
  for(i = 0; i < NINODE; i++) {
80101589:	81 c3 90 00 00 00    	add    $0x90,%ebx
    initsleeplock(&icache.inode[i].lock, "inode");
8010158f:	e8 4c 2f 00 00       	call   801044e0 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
80101594:	83 c4 10             	add    $0x10,%esp
80101597:	81 fb c0 15 11 80    	cmp    $0x801115c0,%ebx
8010159d:	75 e1                	jne    80101580 <iinit+0x20>
  bp = bread(dev, 1);
8010159f:	83 ec 08             	sub    $0x8,%esp
801015a2:	6a 01                	push   $0x1
801015a4:	ff 75 08             	push   0x8(%ebp)
801015a7:	e8 24 eb ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
801015ac:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, 1);
801015af:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801015b1:	8d 40 5c             	lea    0x5c(%eax),%eax
801015b4:	6a 1c                	push   $0x1c
801015b6:	50                   	push   %eax
801015b7:	68 b4 15 11 80       	push   $0x801115b4
801015bc:	e8 7f 33 00 00       	call   80104940 <memmove>
  brelse(bp);
801015c1:	89 1c 24             	mov    %ebx,(%esp)
801015c4:	e8 27 ec ff ff       	call   801001f0 <brelse>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801015c9:	ff 35 cc 15 11 80    	push   0x801115cc
801015cf:	ff 35 c8 15 11 80    	push   0x801115c8
801015d5:	ff 35 c4 15 11 80    	push   0x801115c4
801015db:	ff 35 c0 15 11 80    	push   0x801115c0
801015e1:	ff 35 bc 15 11 80    	push   0x801115bc
801015e7:	ff 35 b8 15 11 80    	push   0x801115b8
801015ed:	ff 35 b4 15 11 80    	push   0x801115b4
801015f3:	68 98 76 10 80       	push   $0x80107698
801015f8:	e8 a3 f0 ff ff       	call   801006a0 <cprintf>
}
801015fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101600:	83 c4 30             	add    $0x30,%esp
80101603:	c9                   	leave  
80101604:	c3                   	ret    
80101605:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010160c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101610 <ialloc>:
{
80101610:	55                   	push   %ebp
80101611:	89 e5                	mov    %esp,%ebp
80101613:	57                   	push   %edi
80101614:	56                   	push   %esi
80101615:	53                   	push   %ebx
80101616:	83 ec 1c             	sub    $0x1c,%esp
80101619:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(inum = 1; inum < sb.ninodes; inum++){
8010161c:	83 3d bc 15 11 80 01 	cmpl   $0x1,0x801115bc
{
80101623:	8b 75 08             	mov    0x8(%ebp),%esi
80101626:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101629:	0f 86 91 00 00 00    	jbe    801016c0 <ialloc+0xb0>
8010162f:	bf 01 00 00 00       	mov    $0x1,%edi
80101634:	eb 21                	jmp    80101657 <ialloc+0x47>
80101636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010163d:	8d 76 00             	lea    0x0(%esi),%esi
    brelse(bp);
80101640:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101643:	83 c7 01             	add    $0x1,%edi
    brelse(bp);
80101646:	53                   	push   %ebx
80101647:	e8 a4 eb ff ff       	call   801001f0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010164c:	83 c4 10             	add    $0x10,%esp
8010164f:	3b 3d bc 15 11 80    	cmp    0x801115bc,%edi
80101655:	73 69                	jae    801016c0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101657:	89 f8                	mov    %edi,%eax
80101659:	83 ec 08             	sub    $0x8,%esp
8010165c:	c1 e8 03             	shr    $0x3,%eax
8010165f:	03 05 c8 15 11 80    	add    0x801115c8,%eax
80101665:	50                   	push   %eax
80101666:	56                   	push   %esi
80101667:	e8 64 ea ff ff       	call   801000d0 <bread>
    if(dip->type == 0){  // a free inode
8010166c:	83 c4 10             	add    $0x10,%esp
    bp = bread(dev, IBLOCK(inum, sb));
8010166f:	89 c3                	mov    %eax,%ebx
    dip = (struct dinode*)bp->data + inum%IPB;
80101671:	89 f8                	mov    %edi,%eax
80101673:	83 e0 07             	and    $0x7,%eax
80101676:	c1 e0 06             	shl    $0x6,%eax
80101679:	8d 4c 03 5c          	lea    0x5c(%ebx,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010167d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101681:	75 bd                	jne    80101640 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101683:	83 ec 04             	sub    $0x4,%esp
80101686:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101689:	6a 40                	push   $0x40
8010168b:	6a 00                	push   $0x0
8010168d:	51                   	push   %ecx
8010168e:	e8 0d 32 00 00       	call   801048a0 <memset>
      dip->type = type;
80101693:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101697:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010169a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010169d:	89 1c 24             	mov    %ebx,(%esp)
801016a0:	e8 9b 18 00 00       	call   80102f40 <log_write>
      brelse(bp);
801016a5:	89 1c 24             	mov    %ebx,(%esp)
801016a8:	e8 43 eb ff ff       	call   801001f0 <brelse>
      return iget(dev, inum);
801016ad:	83 c4 10             	add    $0x10,%esp
}
801016b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
801016b3:	89 fa                	mov    %edi,%edx
}
801016b5:	5b                   	pop    %ebx
      return iget(dev, inum);
801016b6:	89 f0                	mov    %esi,%eax
}
801016b8:	5e                   	pop    %esi
801016b9:	5f                   	pop    %edi
801016ba:	5d                   	pop    %ebp
      return iget(dev, inum);
801016bb:	e9 90 fc ff ff       	jmp    80101350 <iget>
  panic("ialloc: no inodes");
801016c0:	83 ec 0c             	sub    $0xc,%esp
801016c3:	68 38 76 10 80       	push   $0x80107638
801016c8:	e8 b3 ec ff ff       	call   80100380 <panic>
801016cd:	8d 76 00             	lea    0x0(%esi),%esi

801016d0 <iupdate>:
{
801016d0:	55                   	push   %ebp
801016d1:	89 e5                	mov    %esp,%ebp
801016d3:	56                   	push   %esi
801016d4:	53                   	push   %ebx
801016d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016d8:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016db:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016de:	83 ec 08             	sub    $0x8,%esp
801016e1:	c1 e8 03             	shr    $0x3,%eax
801016e4:	03 05 c8 15 11 80    	add    0x801115c8,%eax
801016ea:	50                   	push   %eax
801016eb:	ff 73 a4             	push   -0x5c(%ebx)
801016ee:	e8 dd e9 ff ff       	call   801000d0 <bread>
  dip->type = ip->type;
801016f3:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016f7:	83 c4 0c             	add    $0xc,%esp
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016fa:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801016fc:	8b 43 a8             	mov    -0x58(%ebx),%eax
801016ff:	83 e0 07             	and    $0x7,%eax
80101702:	c1 e0 06             	shl    $0x6,%eax
80101705:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101709:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010170c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101710:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
80101713:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101717:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010171b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010171f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101723:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101727:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010172a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010172d:	6a 34                	push   $0x34
8010172f:	53                   	push   %ebx
80101730:	50                   	push   %eax
80101731:	e8 0a 32 00 00       	call   80104940 <memmove>
  log_write(bp);
80101736:	89 34 24             	mov    %esi,(%esp)
80101739:	e8 02 18 00 00       	call   80102f40 <log_write>
  brelse(bp);
8010173e:	89 75 08             	mov    %esi,0x8(%ebp)
80101741:	83 c4 10             	add    $0x10,%esp
}
80101744:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101747:	5b                   	pop    %ebx
80101748:	5e                   	pop    %esi
80101749:	5d                   	pop    %ebp
  brelse(bp);
8010174a:	e9 a1 ea ff ff       	jmp    801001f0 <brelse>
8010174f:	90                   	nop

80101750 <idup>:
{
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	53                   	push   %ebx
80101754:	83 ec 10             	sub    $0x10,%esp
80101757:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010175a:	68 60 f9 10 80       	push   $0x8010f960
8010175f:	e8 7c 30 00 00       	call   801047e0 <acquire>
  ip->ref++;
80101764:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101768:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
8010176f:	e8 0c 30 00 00       	call   80104780 <release>
}
80101774:	89 d8                	mov    %ebx,%eax
80101776:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101779:	c9                   	leave  
8010177a:	c3                   	ret    
8010177b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010177f:	90                   	nop

80101780 <ilock>:
{
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	56                   	push   %esi
80101784:	53                   	push   %ebx
80101785:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
80101788:	85 db                	test   %ebx,%ebx
8010178a:	0f 84 b7 00 00 00    	je     80101847 <ilock+0xc7>
80101790:	8b 53 08             	mov    0x8(%ebx),%edx
80101793:	85 d2                	test   %edx,%edx
80101795:	0f 8e ac 00 00 00    	jle    80101847 <ilock+0xc7>
  acquiresleep(&ip->lock);
8010179b:	83 ec 0c             	sub    $0xc,%esp
8010179e:	8d 43 0c             	lea    0xc(%ebx),%eax
801017a1:	50                   	push   %eax
801017a2:	e8 79 2d 00 00       	call   80104520 <acquiresleep>
  if(ip->valid == 0){
801017a7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801017aa:	83 c4 10             	add    $0x10,%esp
801017ad:	85 c0                	test   %eax,%eax
801017af:	74 0f                	je     801017c0 <ilock+0x40>
}
801017b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017b4:	5b                   	pop    %ebx
801017b5:	5e                   	pop    %esi
801017b6:	5d                   	pop    %ebp
801017b7:	c3                   	ret    
801017b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801017bf:	90                   	nop
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801017c0:	8b 43 04             	mov    0x4(%ebx),%eax
801017c3:	83 ec 08             	sub    $0x8,%esp
801017c6:	c1 e8 03             	shr    $0x3,%eax
801017c9:	03 05 c8 15 11 80    	add    0x801115c8,%eax
801017cf:	50                   	push   %eax
801017d0:	ff 33                	push   (%ebx)
801017d2:	e8 f9 e8 ff ff       	call   801000d0 <bread>
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017d7:	83 c4 0c             	add    $0xc,%esp
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801017da:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801017dc:	8b 43 04             	mov    0x4(%ebx),%eax
801017df:	83 e0 07             	and    $0x7,%eax
801017e2:	c1 e0 06             	shl    $0x6,%eax
801017e5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801017e9:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017ec:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
801017ef:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801017f3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801017f7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801017fb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801017ff:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101803:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101807:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010180b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010180e:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101811:	6a 34                	push   $0x34
80101813:	50                   	push   %eax
80101814:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101817:	50                   	push   %eax
80101818:	e8 23 31 00 00       	call   80104940 <memmove>
    brelse(bp);
8010181d:	89 34 24             	mov    %esi,(%esp)
80101820:	e8 cb e9 ff ff       	call   801001f0 <brelse>
    if(ip->type == 0)
80101825:	83 c4 10             	add    $0x10,%esp
80101828:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
8010182d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101834:	0f 85 77 ff ff ff    	jne    801017b1 <ilock+0x31>
      panic("ilock: no type");
8010183a:	83 ec 0c             	sub    $0xc,%esp
8010183d:	68 50 76 10 80       	push   $0x80107650
80101842:	e8 39 eb ff ff       	call   80100380 <panic>
    panic("ilock");
80101847:	83 ec 0c             	sub    $0xc,%esp
8010184a:	68 4a 76 10 80       	push   $0x8010764a
8010184f:	e8 2c eb ff ff       	call   80100380 <panic>
80101854:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010185b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010185f:	90                   	nop

80101860 <iunlock>:
{
80101860:	55                   	push   %ebp
80101861:	89 e5                	mov    %esp,%ebp
80101863:	56                   	push   %esi
80101864:	53                   	push   %ebx
80101865:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101868:	85 db                	test   %ebx,%ebx
8010186a:	74 28                	je     80101894 <iunlock+0x34>
8010186c:	83 ec 0c             	sub    $0xc,%esp
8010186f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101872:	56                   	push   %esi
80101873:	e8 48 2d 00 00       	call   801045c0 <holdingsleep>
80101878:	83 c4 10             	add    $0x10,%esp
8010187b:	85 c0                	test   %eax,%eax
8010187d:	74 15                	je     80101894 <iunlock+0x34>
8010187f:	8b 43 08             	mov    0x8(%ebx),%eax
80101882:	85 c0                	test   %eax,%eax
80101884:	7e 0e                	jle    80101894 <iunlock+0x34>
  releasesleep(&ip->lock);
80101886:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101889:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010188c:	5b                   	pop    %ebx
8010188d:	5e                   	pop    %esi
8010188e:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
8010188f:	e9 ec 2c 00 00       	jmp    80104580 <releasesleep>
    panic("iunlock");
80101894:	83 ec 0c             	sub    $0xc,%esp
80101897:	68 5f 76 10 80       	push   $0x8010765f
8010189c:	e8 df ea ff ff       	call   80100380 <panic>
801018a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018af:	90                   	nop

801018b0 <iput>:
{
801018b0:	55                   	push   %ebp
801018b1:	89 e5                	mov    %esp,%ebp
801018b3:	57                   	push   %edi
801018b4:	56                   	push   %esi
801018b5:	53                   	push   %ebx
801018b6:	83 ec 28             	sub    $0x28,%esp
801018b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquiresleep(&ip->lock);
801018bc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801018bf:	57                   	push   %edi
801018c0:	e8 5b 2c 00 00       	call   80104520 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801018c5:	8b 53 4c             	mov    0x4c(%ebx),%edx
801018c8:	83 c4 10             	add    $0x10,%esp
801018cb:	85 d2                	test   %edx,%edx
801018cd:	74 07                	je     801018d6 <iput+0x26>
801018cf:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801018d4:	74 32                	je     80101908 <iput+0x58>
  releasesleep(&ip->lock);
801018d6:	83 ec 0c             	sub    $0xc,%esp
801018d9:	57                   	push   %edi
801018da:	e8 a1 2c 00 00       	call   80104580 <releasesleep>
  acquire(&icache.lock);
801018df:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
801018e6:	e8 f5 2e 00 00       	call   801047e0 <acquire>
  ip->ref--;
801018eb:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
  release(&icache.lock);
801018ef:	83 c4 10             	add    $0x10,%esp
801018f2:	c7 45 08 60 f9 10 80 	movl   $0x8010f960,0x8(%ebp)
}
801018f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018fc:	5b                   	pop    %ebx
801018fd:	5e                   	pop    %esi
801018fe:	5f                   	pop    %edi
801018ff:	5d                   	pop    %ebp
  release(&icache.lock);
80101900:	e9 7b 2e 00 00       	jmp    80104780 <release>
80101905:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101908:	83 ec 0c             	sub    $0xc,%esp
8010190b:	68 60 f9 10 80       	push   $0x8010f960
80101910:	e8 cb 2e 00 00       	call   801047e0 <acquire>
    int r = ip->ref;
80101915:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101918:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
8010191f:	e8 5c 2e 00 00       	call   80104780 <release>
    if(r == 1){
80101924:	83 c4 10             	add    $0x10,%esp
80101927:	83 fe 01             	cmp    $0x1,%esi
8010192a:	75 aa                	jne    801018d6 <iput+0x26>
8010192c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101932:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101935:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101938:	89 cf                	mov    %ecx,%edi
8010193a:	eb 0b                	jmp    80101947 <iput+0x97>
8010193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101940:	83 c6 04             	add    $0x4,%esi
80101943:	39 fe                	cmp    %edi,%esi
80101945:	74 19                	je     80101960 <iput+0xb0>
    if(ip->addrs[i]){
80101947:	8b 16                	mov    (%esi),%edx
80101949:	85 d2                	test   %edx,%edx
8010194b:	74 f3                	je     80101940 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010194d:	8b 03                	mov    (%ebx),%eax
8010194f:	e8 6c f8 ff ff       	call   801011c0 <bfree>
      ip->addrs[i] = 0;
80101954:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010195a:	eb e4                	jmp    80101940 <iput+0x90>
8010195c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101960:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101966:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101969:	85 c0                	test   %eax,%eax
8010196b:	75 2d                	jne    8010199a <iput+0xea>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010196d:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
80101970:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  iupdate(ip);
80101977:	53                   	push   %ebx
80101978:	e8 53 fd ff ff       	call   801016d0 <iupdate>
      ip->type = 0;
8010197d:	31 c0                	xor    %eax,%eax
8010197f:	66 89 43 50          	mov    %ax,0x50(%ebx)
      iupdate(ip);
80101983:	89 1c 24             	mov    %ebx,(%esp)
80101986:	e8 45 fd ff ff       	call   801016d0 <iupdate>
      ip->valid = 0;
8010198b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
80101992:	83 c4 10             	add    $0x10,%esp
80101995:	e9 3c ff ff ff       	jmp    801018d6 <iput+0x26>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
8010199a:	83 ec 08             	sub    $0x8,%esp
8010199d:	50                   	push   %eax
8010199e:	ff 33                	push   (%ebx)
801019a0:	e8 2b e7 ff ff       	call   801000d0 <bread>
801019a5:	89 7d e0             	mov    %edi,-0x20(%ebp)
801019a8:	83 c4 10             	add    $0x10,%esp
801019ab:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801019b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(j = 0; j < NINDIRECT; j++){
801019b4:	8d 70 5c             	lea    0x5c(%eax),%esi
801019b7:	89 cf                	mov    %ecx,%edi
801019b9:	eb 0c                	jmp    801019c7 <iput+0x117>
801019bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801019bf:	90                   	nop
801019c0:	83 c6 04             	add    $0x4,%esi
801019c3:	39 f7                	cmp    %esi,%edi
801019c5:	74 0f                	je     801019d6 <iput+0x126>
      if(a[j])
801019c7:	8b 16                	mov    (%esi),%edx
801019c9:	85 d2                	test   %edx,%edx
801019cb:	74 f3                	je     801019c0 <iput+0x110>
        bfree(ip->dev, a[j]);
801019cd:	8b 03                	mov    (%ebx),%eax
801019cf:	e8 ec f7 ff ff       	call   801011c0 <bfree>
801019d4:	eb ea                	jmp    801019c0 <iput+0x110>
    brelse(bp);
801019d6:	83 ec 0c             	sub    $0xc,%esp
801019d9:	ff 75 e4             	push   -0x1c(%ebp)
801019dc:	8b 7d e0             	mov    -0x20(%ebp),%edi
801019df:	e8 0c e8 ff ff       	call   801001f0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801019e4:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
801019ea:	8b 03                	mov    (%ebx),%eax
801019ec:	e8 cf f7 ff ff       	call   801011c0 <bfree>
    ip->addrs[NDIRECT] = 0;
801019f1:	83 c4 10             	add    $0x10,%esp
801019f4:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
801019fb:	00 00 00 
801019fe:	e9 6a ff ff ff       	jmp    8010196d <iput+0xbd>
80101a03:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101a10 <iunlockput>:
{
80101a10:	55                   	push   %ebp
80101a11:	89 e5                	mov    %esp,%ebp
80101a13:	56                   	push   %esi
80101a14:	53                   	push   %ebx
80101a15:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101a18:	85 db                	test   %ebx,%ebx
80101a1a:	74 34                	je     80101a50 <iunlockput+0x40>
80101a1c:	83 ec 0c             	sub    $0xc,%esp
80101a1f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101a22:	56                   	push   %esi
80101a23:	e8 98 2b 00 00       	call   801045c0 <holdingsleep>
80101a28:	83 c4 10             	add    $0x10,%esp
80101a2b:	85 c0                	test   %eax,%eax
80101a2d:	74 21                	je     80101a50 <iunlockput+0x40>
80101a2f:	8b 43 08             	mov    0x8(%ebx),%eax
80101a32:	85 c0                	test   %eax,%eax
80101a34:	7e 1a                	jle    80101a50 <iunlockput+0x40>
  releasesleep(&ip->lock);
80101a36:	83 ec 0c             	sub    $0xc,%esp
80101a39:	56                   	push   %esi
80101a3a:	e8 41 2b 00 00       	call   80104580 <releasesleep>
  iput(ip);
80101a3f:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101a42:	83 c4 10             	add    $0x10,%esp
}
80101a45:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101a48:	5b                   	pop    %ebx
80101a49:	5e                   	pop    %esi
80101a4a:	5d                   	pop    %ebp
  iput(ip);
80101a4b:	e9 60 fe ff ff       	jmp    801018b0 <iput>
    panic("iunlock");
80101a50:	83 ec 0c             	sub    $0xc,%esp
80101a53:	68 5f 76 10 80       	push   $0x8010765f
80101a58:	e8 23 e9 ff ff       	call   80100380 <panic>
80101a5d:	8d 76 00             	lea    0x0(%esi),%esi

80101a60 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101a60:	55                   	push   %ebp
80101a61:	89 e5                	mov    %esp,%ebp
80101a63:	8b 55 08             	mov    0x8(%ebp),%edx
80101a66:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101a69:	8b 0a                	mov    (%edx),%ecx
80101a6b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
80101a6e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101a71:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101a74:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101a78:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
80101a7b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101a7f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101a83:	8b 52 58             	mov    0x58(%edx),%edx
80101a86:	89 50 10             	mov    %edx,0x10(%eax)
}
80101a89:	5d                   	pop    %ebp
80101a8a:	c3                   	ret    
80101a8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101a8f:	90                   	nop

80101a90 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101a90:	55                   	push   %ebp
80101a91:	89 e5                	mov    %esp,%ebp
80101a93:	57                   	push   %edi
80101a94:	56                   	push   %esi
80101a95:	53                   	push   %ebx
80101a96:	83 ec 1c             	sub    $0x1c,%esp
80101a99:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101a9c:	8b 45 08             	mov    0x8(%ebp),%eax
80101a9f:	8b 75 10             	mov    0x10(%ebp),%esi
80101aa2:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101aa5:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101aa8:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101aad:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101ab0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  if(ip->type == T_DEV){
80101ab3:	0f 84 a7 00 00 00    	je     80101b60 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101ab9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101abc:	8b 40 58             	mov    0x58(%eax),%eax
80101abf:	39 c6                	cmp    %eax,%esi
80101ac1:	0f 87 ba 00 00 00    	ja     80101b81 <readi+0xf1>
80101ac7:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101aca:	31 c9                	xor    %ecx,%ecx
80101acc:	89 da                	mov    %ebx,%edx
80101ace:	01 f2                	add    %esi,%edx
80101ad0:	0f 92 c1             	setb   %cl
80101ad3:	89 cf                	mov    %ecx,%edi
80101ad5:	0f 82 a6 00 00 00    	jb     80101b81 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101adb:	89 c1                	mov    %eax,%ecx
80101add:	29 f1                	sub    %esi,%ecx
80101adf:	39 d0                	cmp    %edx,%eax
80101ae1:	0f 43 cb             	cmovae %ebx,%ecx
80101ae4:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101ae7:	85 c9                	test   %ecx,%ecx
80101ae9:	74 67                	je     80101b52 <readi+0xc2>
80101aeb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101aef:	90                   	nop
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101af0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101af3:	89 f2                	mov    %esi,%edx
80101af5:	c1 ea 09             	shr    $0x9,%edx
80101af8:	89 d8                	mov    %ebx,%eax
80101afa:	e8 51 f9 ff ff       	call   80101450 <bmap>
80101aff:	83 ec 08             	sub    $0x8,%esp
80101b02:	50                   	push   %eax
80101b03:	ff 33                	push   (%ebx)
80101b05:	e8 c6 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101b0a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101b0d:	b9 00 02 00 00       	mov    $0x200,%ecx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b12:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101b14:	89 f0                	mov    %esi,%eax
80101b16:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b1b:	29 fb                	sub    %edi,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101b1d:	89 55 dc             	mov    %edx,-0x24(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101b20:	29 c1                	sub    %eax,%ecx
    memmove(dst, bp->data + off%BSIZE, m);
80101b22:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101b26:	39 d9                	cmp    %ebx,%ecx
80101b28:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101b2b:	83 c4 0c             	add    $0xc,%esp
80101b2e:	53                   	push   %ebx
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b2f:	01 df                	add    %ebx,%edi
80101b31:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
80101b33:	50                   	push   %eax
80101b34:	ff 75 e0             	push   -0x20(%ebp)
80101b37:	e8 04 2e 00 00       	call   80104940 <memmove>
    brelse(bp);
80101b3c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101b3f:	89 14 24             	mov    %edx,(%esp)
80101b42:	e8 a9 e6 ff ff       	call   801001f0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b47:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101b4a:	83 c4 10             	add    $0x10,%esp
80101b4d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101b50:	77 9e                	ja     80101af0 <readi+0x60>
  }
  return n;
80101b52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101b55:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b58:	5b                   	pop    %ebx
80101b59:	5e                   	pop    %esi
80101b5a:	5f                   	pop    %edi
80101b5b:	5d                   	pop    %ebp
80101b5c:	c3                   	ret    
80101b5d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101b60:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b64:	66 83 f8 09          	cmp    $0x9,%ax
80101b68:	77 17                	ja     80101b81 <readi+0xf1>
80101b6a:	8b 04 c5 00 f9 10 80 	mov    -0x7fef0700(,%eax,8),%eax
80101b71:	85 c0                	test   %eax,%eax
80101b73:	74 0c                	je     80101b81 <readi+0xf1>
    return devsw[ip->major].read(ip, dst, n);
80101b75:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101b78:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b7b:	5b                   	pop    %ebx
80101b7c:	5e                   	pop    %esi
80101b7d:	5f                   	pop    %edi
80101b7e:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101b7f:	ff e0                	jmp    *%eax
      return -1;
80101b81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b86:	eb cd                	jmp    80101b55 <readi+0xc5>
80101b88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b8f:	90                   	nop

80101b90 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101b90:	55                   	push   %ebp
80101b91:	89 e5                	mov    %esp,%ebp
80101b93:	57                   	push   %edi
80101b94:	56                   	push   %esi
80101b95:	53                   	push   %ebx
80101b96:	83 ec 1c             	sub    $0x1c,%esp
80101b99:	8b 45 08             	mov    0x8(%ebp),%eax
80101b9c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101b9f:	8b 55 14             	mov    0x14(%ebp),%edx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101ba2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101ba7:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101baa:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101bad:	8b 75 10             	mov    0x10(%ebp),%esi
80101bb0:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(ip->type == T_DEV){
80101bb3:	0f 84 b7 00 00 00    	je     80101c70 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101bb9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101bbc:	3b 70 58             	cmp    0x58(%eax),%esi
80101bbf:	0f 87 e7 00 00 00    	ja     80101cac <writei+0x11c>
80101bc5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101bc8:	31 d2                	xor    %edx,%edx
80101bca:	89 f8                	mov    %edi,%eax
80101bcc:	01 f0                	add    %esi,%eax
80101bce:	0f 92 c2             	setb   %dl
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101bd1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101bd6:	0f 87 d0 00 00 00    	ja     80101cac <writei+0x11c>
80101bdc:	85 d2                	test   %edx,%edx
80101bde:	0f 85 c8 00 00 00    	jne    80101cac <writei+0x11c>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101be4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101beb:	85 ff                	test   %edi,%edi
80101bed:	74 72                	je     80101c61 <writei+0xd1>
80101bef:	90                   	nop
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101bf0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101bf3:	89 f2                	mov    %esi,%edx
80101bf5:	c1 ea 09             	shr    $0x9,%edx
80101bf8:	89 f8                	mov    %edi,%eax
80101bfa:	e8 51 f8 ff ff       	call   80101450 <bmap>
80101bff:	83 ec 08             	sub    $0x8,%esp
80101c02:	50                   	push   %eax
80101c03:	ff 37                	push   (%edi)
80101c05:	e8 c6 e4 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101c0a:	b9 00 02 00 00       	mov    $0x200,%ecx
80101c0f:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101c12:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101c15:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101c17:	89 f0                	mov    %esi,%eax
80101c19:	25 ff 01 00 00       	and    $0x1ff,%eax
80101c1e:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101c20:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101c24:	39 d9                	cmp    %ebx,%ecx
80101c26:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101c29:	83 c4 0c             	add    $0xc,%esp
80101c2c:	53                   	push   %ebx
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101c2d:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101c2f:	ff 75 dc             	push   -0x24(%ebp)
80101c32:	50                   	push   %eax
80101c33:	e8 08 2d 00 00       	call   80104940 <memmove>
    log_write(bp);
80101c38:	89 3c 24             	mov    %edi,(%esp)
80101c3b:	e8 00 13 00 00       	call   80102f40 <log_write>
    brelse(bp);
80101c40:	89 3c 24             	mov    %edi,(%esp)
80101c43:	e8 a8 e5 ff ff       	call   801001f0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101c48:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101c4b:	83 c4 10             	add    $0x10,%esp
80101c4e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101c51:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101c54:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101c57:	77 97                	ja     80101bf0 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101c59:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101c5c:	3b 70 58             	cmp    0x58(%eax),%esi
80101c5f:	77 37                	ja     80101c98 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101c61:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101c64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c67:	5b                   	pop    %ebx
80101c68:	5e                   	pop    %esi
80101c69:	5f                   	pop    %edi
80101c6a:	5d                   	pop    %ebp
80101c6b:	c3                   	ret    
80101c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101c70:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101c74:	66 83 f8 09          	cmp    $0x9,%ax
80101c78:	77 32                	ja     80101cac <writei+0x11c>
80101c7a:	8b 04 c5 04 f9 10 80 	mov    -0x7fef06fc(,%eax,8),%eax
80101c81:	85 c0                	test   %eax,%eax
80101c83:	74 27                	je     80101cac <writei+0x11c>
    return devsw[ip->major].write(ip, src, n);
80101c85:	89 55 10             	mov    %edx,0x10(%ebp)
}
80101c88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c8b:	5b                   	pop    %ebx
80101c8c:	5e                   	pop    %esi
80101c8d:	5f                   	pop    %edi
80101c8e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101c8f:	ff e0                	jmp    *%eax
80101c91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101c98:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101c9b:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101c9e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101ca1:	50                   	push   %eax
80101ca2:	e8 29 fa ff ff       	call   801016d0 <iupdate>
80101ca7:	83 c4 10             	add    $0x10,%esp
80101caa:	eb b5                	jmp    80101c61 <writei+0xd1>
      return -1;
80101cac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101cb1:	eb b1                	jmp    80101c64 <writei+0xd4>
80101cb3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101cc0 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101cc0:	55                   	push   %ebp
80101cc1:	89 e5                	mov    %esp,%ebp
80101cc3:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101cc6:	6a 0e                	push   $0xe
80101cc8:	ff 75 0c             	push   0xc(%ebp)
80101ccb:	ff 75 08             	push   0x8(%ebp)
80101cce:	e8 dd 2c 00 00       	call   801049b0 <strncmp>
}
80101cd3:	c9                   	leave  
80101cd4:	c3                   	ret    
80101cd5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101ce0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101ce0:	55                   	push   %ebp
80101ce1:	89 e5                	mov    %esp,%ebp
80101ce3:	57                   	push   %edi
80101ce4:	56                   	push   %esi
80101ce5:	53                   	push   %ebx
80101ce6:	83 ec 1c             	sub    $0x1c,%esp
80101ce9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101cec:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101cf1:	0f 85 85 00 00 00    	jne    80101d7c <dirlookup+0x9c>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101cf7:	8b 53 58             	mov    0x58(%ebx),%edx
80101cfa:	31 ff                	xor    %edi,%edi
80101cfc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101cff:	85 d2                	test   %edx,%edx
80101d01:	74 3e                	je     80101d41 <dirlookup+0x61>
80101d03:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d07:	90                   	nop
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101d08:	6a 10                	push   $0x10
80101d0a:	57                   	push   %edi
80101d0b:	56                   	push   %esi
80101d0c:	53                   	push   %ebx
80101d0d:	e8 7e fd ff ff       	call   80101a90 <readi>
80101d12:	83 c4 10             	add    $0x10,%esp
80101d15:	83 f8 10             	cmp    $0x10,%eax
80101d18:	75 55                	jne    80101d6f <dirlookup+0x8f>
      panic("dirlookup read");
    if(de.inum == 0)
80101d1a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101d1f:	74 18                	je     80101d39 <dirlookup+0x59>
  return strncmp(s, t, DIRSIZ);
80101d21:	83 ec 04             	sub    $0x4,%esp
80101d24:	8d 45 da             	lea    -0x26(%ebp),%eax
80101d27:	6a 0e                	push   $0xe
80101d29:	50                   	push   %eax
80101d2a:	ff 75 0c             	push   0xc(%ebp)
80101d2d:	e8 7e 2c 00 00       	call   801049b0 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101d32:	83 c4 10             	add    $0x10,%esp
80101d35:	85 c0                	test   %eax,%eax
80101d37:	74 17                	je     80101d50 <dirlookup+0x70>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101d39:	83 c7 10             	add    $0x10,%edi
80101d3c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101d3f:	72 c7                	jb     80101d08 <dirlookup+0x28>
      return iget(dp->dev, inum);
    }
  }

  return 0;
}
80101d41:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101d44:	31 c0                	xor    %eax,%eax
}
80101d46:	5b                   	pop    %ebx
80101d47:	5e                   	pop    %esi
80101d48:	5f                   	pop    %edi
80101d49:	5d                   	pop    %ebp
80101d4a:	c3                   	ret    
80101d4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d4f:	90                   	nop
      if(poff)
80101d50:	8b 45 10             	mov    0x10(%ebp),%eax
80101d53:	85 c0                	test   %eax,%eax
80101d55:	74 05                	je     80101d5c <dirlookup+0x7c>
        *poff = off;
80101d57:	8b 45 10             	mov    0x10(%ebp),%eax
80101d5a:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101d5c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101d60:	8b 03                	mov    (%ebx),%eax
80101d62:	e8 e9 f5 ff ff       	call   80101350 <iget>
}
80101d67:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d6a:	5b                   	pop    %ebx
80101d6b:	5e                   	pop    %esi
80101d6c:	5f                   	pop    %edi
80101d6d:	5d                   	pop    %ebp
80101d6e:	c3                   	ret    
      panic("dirlookup read");
80101d6f:	83 ec 0c             	sub    $0xc,%esp
80101d72:	68 79 76 10 80       	push   $0x80107679
80101d77:	e8 04 e6 ff ff       	call   80100380 <panic>
    panic("dirlookup not DIR");
80101d7c:	83 ec 0c             	sub    $0xc,%esp
80101d7f:	68 67 76 10 80       	push   $0x80107667
80101d84:	e8 f7 e5 ff ff       	call   80100380 <panic>
80101d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101d90 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101d90:	55                   	push   %ebp
80101d91:	89 e5                	mov    %esp,%ebp
80101d93:	57                   	push   %edi
80101d94:	56                   	push   %esi
80101d95:	53                   	push   %ebx
80101d96:	89 c3                	mov    %eax,%ebx
80101d98:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101d9b:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101d9e:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101da1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  if(*path == '/')
80101da4:	0f 84 64 01 00 00    	je     80101f0e <namex+0x17e>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101daa:	e8 01 1b 00 00       	call   801038b0 <myproc>
  acquire(&icache.lock);
80101daf:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101db2:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101db5:	68 60 f9 10 80       	push   $0x8010f960
80101dba:	e8 21 2a 00 00       	call   801047e0 <acquire>
  ip->ref++;
80101dbf:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101dc3:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
80101dca:	e8 b1 29 00 00       	call   80104780 <release>
80101dcf:	83 c4 10             	add    $0x10,%esp
80101dd2:	eb 07                	jmp    80101ddb <namex+0x4b>
80101dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101dd8:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101ddb:	0f b6 03             	movzbl (%ebx),%eax
80101dde:	3c 2f                	cmp    $0x2f,%al
80101de0:	74 f6                	je     80101dd8 <namex+0x48>
  if(*path == 0)
80101de2:	84 c0                	test   %al,%al
80101de4:	0f 84 06 01 00 00    	je     80101ef0 <namex+0x160>
  while(*path != '/' && *path != 0)
80101dea:	0f b6 03             	movzbl (%ebx),%eax
80101ded:	84 c0                	test   %al,%al
80101def:	0f 84 10 01 00 00    	je     80101f05 <namex+0x175>
80101df5:	89 df                	mov    %ebx,%edi
80101df7:	3c 2f                	cmp    $0x2f,%al
80101df9:	0f 84 06 01 00 00    	je     80101f05 <namex+0x175>
80101dff:	90                   	nop
80101e00:	0f b6 47 01          	movzbl 0x1(%edi),%eax
    path++;
80101e04:	83 c7 01             	add    $0x1,%edi
  while(*path != '/' && *path != 0)
80101e07:	3c 2f                	cmp    $0x2f,%al
80101e09:	74 04                	je     80101e0f <namex+0x7f>
80101e0b:	84 c0                	test   %al,%al
80101e0d:	75 f1                	jne    80101e00 <namex+0x70>
  len = path - s;
80101e0f:	89 f8                	mov    %edi,%eax
80101e11:	29 d8                	sub    %ebx,%eax
  if(len >= DIRSIZ)
80101e13:	83 f8 0d             	cmp    $0xd,%eax
80101e16:	0f 8e ac 00 00 00    	jle    80101ec8 <namex+0x138>
    memmove(name, s, DIRSIZ);
80101e1c:	83 ec 04             	sub    $0x4,%esp
80101e1f:	6a 0e                	push   $0xe
80101e21:	53                   	push   %ebx
    path++;
80101e22:	89 fb                	mov    %edi,%ebx
    memmove(name, s, DIRSIZ);
80101e24:	ff 75 e4             	push   -0x1c(%ebp)
80101e27:	e8 14 2b 00 00       	call   80104940 <memmove>
80101e2c:	83 c4 10             	add    $0x10,%esp
  while(*path == '/')
80101e2f:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101e32:	75 0c                	jne    80101e40 <namex+0xb0>
80101e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101e38:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101e3b:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101e3e:	74 f8                	je     80101e38 <namex+0xa8>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101e40:	83 ec 0c             	sub    $0xc,%esp
80101e43:	56                   	push   %esi
80101e44:	e8 37 f9 ff ff       	call   80101780 <ilock>
    if(ip->type != T_DIR){
80101e49:	83 c4 10             	add    $0x10,%esp
80101e4c:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101e51:	0f 85 cd 00 00 00    	jne    80101f24 <namex+0x194>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101e57:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101e5a:	85 c0                	test   %eax,%eax
80101e5c:	74 09                	je     80101e67 <namex+0xd7>
80101e5e:	80 3b 00             	cmpb   $0x0,(%ebx)
80101e61:	0f 84 22 01 00 00    	je     80101f89 <namex+0x1f9>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101e67:	83 ec 04             	sub    $0x4,%esp
80101e6a:	6a 00                	push   $0x0
80101e6c:	ff 75 e4             	push   -0x1c(%ebp)
80101e6f:	56                   	push   %esi
80101e70:	e8 6b fe ff ff       	call   80101ce0 <dirlookup>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101e75:	8d 56 0c             	lea    0xc(%esi),%edx
    if((next = dirlookup(ip, name, 0)) == 0){
80101e78:	83 c4 10             	add    $0x10,%esp
80101e7b:	89 c7                	mov    %eax,%edi
80101e7d:	85 c0                	test   %eax,%eax
80101e7f:	0f 84 e1 00 00 00    	je     80101f66 <namex+0x1d6>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101e85:	83 ec 0c             	sub    $0xc,%esp
80101e88:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101e8b:	52                   	push   %edx
80101e8c:	e8 2f 27 00 00       	call   801045c0 <holdingsleep>
80101e91:	83 c4 10             	add    $0x10,%esp
80101e94:	85 c0                	test   %eax,%eax
80101e96:	0f 84 30 01 00 00    	je     80101fcc <namex+0x23c>
80101e9c:	8b 56 08             	mov    0x8(%esi),%edx
80101e9f:	85 d2                	test   %edx,%edx
80101ea1:	0f 8e 25 01 00 00    	jle    80101fcc <namex+0x23c>
  releasesleep(&ip->lock);
80101ea7:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101eaa:	83 ec 0c             	sub    $0xc,%esp
80101ead:	52                   	push   %edx
80101eae:	e8 cd 26 00 00       	call   80104580 <releasesleep>
  iput(ip);
80101eb3:	89 34 24             	mov    %esi,(%esp)
80101eb6:	89 fe                	mov    %edi,%esi
80101eb8:	e8 f3 f9 ff ff       	call   801018b0 <iput>
80101ebd:	83 c4 10             	add    $0x10,%esp
80101ec0:	e9 16 ff ff ff       	jmp    80101ddb <namex+0x4b>
80101ec5:	8d 76 00             	lea    0x0(%esi),%esi
    name[len] = 0;
80101ec8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101ecb:	8d 14 01             	lea    (%ecx,%eax,1),%edx
    memmove(name, s, len);
80101ece:	83 ec 04             	sub    $0x4,%esp
80101ed1:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101ed4:	50                   	push   %eax
80101ed5:	53                   	push   %ebx
    name[len] = 0;
80101ed6:	89 fb                	mov    %edi,%ebx
    memmove(name, s, len);
80101ed8:	ff 75 e4             	push   -0x1c(%ebp)
80101edb:	e8 60 2a 00 00       	call   80104940 <memmove>
    name[len] = 0;
80101ee0:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101ee3:	83 c4 10             	add    $0x10,%esp
80101ee6:	c6 02 00             	movb   $0x0,(%edx)
80101ee9:	e9 41 ff ff ff       	jmp    80101e2f <namex+0x9f>
80101eee:	66 90                	xchg   %ax,%ax
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101ef0:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101ef3:	85 c0                	test   %eax,%eax
80101ef5:	0f 85 be 00 00 00    	jne    80101fb9 <namex+0x229>
    iput(ip);
    return 0;
  }
  return ip;
}
80101efb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101efe:	89 f0                	mov    %esi,%eax
80101f00:	5b                   	pop    %ebx
80101f01:	5e                   	pop    %esi
80101f02:	5f                   	pop    %edi
80101f03:	5d                   	pop    %ebp
80101f04:	c3                   	ret    
  while(*path != '/' && *path != 0)
80101f05:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101f08:	89 df                	mov    %ebx,%edi
80101f0a:	31 c0                	xor    %eax,%eax
80101f0c:	eb c0                	jmp    80101ece <namex+0x13e>
    ip = iget(ROOTDEV, ROOTINO);
80101f0e:	ba 01 00 00 00       	mov    $0x1,%edx
80101f13:	b8 01 00 00 00       	mov    $0x1,%eax
80101f18:	e8 33 f4 ff ff       	call   80101350 <iget>
80101f1d:	89 c6                	mov    %eax,%esi
80101f1f:	e9 b7 fe ff ff       	jmp    80101ddb <namex+0x4b>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101f24:	83 ec 0c             	sub    $0xc,%esp
80101f27:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101f2a:	53                   	push   %ebx
80101f2b:	e8 90 26 00 00       	call   801045c0 <holdingsleep>
80101f30:	83 c4 10             	add    $0x10,%esp
80101f33:	85 c0                	test   %eax,%eax
80101f35:	0f 84 91 00 00 00    	je     80101fcc <namex+0x23c>
80101f3b:	8b 46 08             	mov    0x8(%esi),%eax
80101f3e:	85 c0                	test   %eax,%eax
80101f40:	0f 8e 86 00 00 00    	jle    80101fcc <namex+0x23c>
  releasesleep(&ip->lock);
80101f46:	83 ec 0c             	sub    $0xc,%esp
80101f49:	53                   	push   %ebx
80101f4a:	e8 31 26 00 00       	call   80104580 <releasesleep>
  iput(ip);
80101f4f:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101f52:	31 f6                	xor    %esi,%esi
  iput(ip);
80101f54:	e8 57 f9 ff ff       	call   801018b0 <iput>
      return 0;
80101f59:	83 c4 10             	add    $0x10,%esp
}
80101f5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f5f:	89 f0                	mov    %esi,%eax
80101f61:	5b                   	pop    %ebx
80101f62:	5e                   	pop    %esi
80101f63:	5f                   	pop    %edi
80101f64:	5d                   	pop    %ebp
80101f65:	c3                   	ret    
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101f66:	83 ec 0c             	sub    $0xc,%esp
80101f69:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101f6c:	52                   	push   %edx
80101f6d:	e8 4e 26 00 00       	call   801045c0 <holdingsleep>
80101f72:	83 c4 10             	add    $0x10,%esp
80101f75:	85 c0                	test   %eax,%eax
80101f77:	74 53                	je     80101fcc <namex+0x23c>
80101f79:	8b 4e 08             	mov    0x8(%esi),%ecx
80101f7c:	85 c9                	test   %ecx,%ecx
80101f7e:	7e 4c                	jle    80101fcc <namex+0x23c>
  releasesleep(&ip->lock);
80101f80:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101f83:	83 ec 0c             	sub    $0xc,%esp
80101f86:	52                   	push   %edx
80101f87:	eb c1                	jmp    80101f4a <namex+0x1ba>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101f89:	83 ec 0c             	sub    $0xc,%esp
80101f8c:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101f8f:	53                   	push   %ebx
80101f90:	e8 2b 26 00 00       	call   801045c0 <holdingsleep>
80101f95:	83 c4 10             	add    $0x10,%esp
80101f98:	85 c0                	test   %eax,%eax
80101f9a:	74 30                	je     80101fcc <namex+0x23c>
80101f9c:	8b 7e 08             	mov    0x8(%esi),%edi
80101f9f:	85 ff                	test   %edi,%edi
80101fa1:	7e 29                	jle    80101fcc <namex+0x23c>
  releasesleep(&ip->lock);
80101fa3:	83 ec 0c             	sub    $0xc,%esp
80101fa6:	53                   	push   %ebx
80101fa7:	e8 d4 25 00 00       	call   80104580 <releasesleep>
}
80101fac:	83 c4 10             	add    $0x10,%esp
}
80101faf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fb2:	89 f0                	mov    %esi,%eax
80101fb4:	5b                   	pop    %ebx
80101fb5:	5e                   	pop    %esi
80101fb6:	5f                   	pop    %edi
80101fb7:	5d                   	pop    %ebp
80101fb8:	c3                   	ret    
    iput(ip);
80101fb9:	83 ec 0c             	sub    $0xc,%esp
80101fbc:	56                   	push   %esi
    return 0;
80101fbd:	31 f6                	xor    %esi,%esi
    iput(ip);
80101fbf:	e8 ec f8 ff ff       	call   801018b0 <iput>
    return 0;
80101fc4:	83 c4 10             	add    $0x10,%esp
80101fc7:	e9 2f ff ff ff       	jmp    80101efb <namex+0x16b>
    panic("iunlock");
80101fcc:	83 ec 0c             	sub    $0xc,%esp
80101fcf:	68 5f 76 10 80       	push   $0x8010765f
80101fd4:	e8 a7 e3 ff ff       	call   80100380 <panic>
80101fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101fe0 <dirlink>:
{
80101fe0:	55                   	push   %ebp
80101fe1:	89 e5                	mov    %esp,%ebp
80101fe3:	57                   	push   %edi
80101fe4:	56                   	push   %esi
80101fe5:	53                   	push   %ebx
80101fe6:	83 ec 20             	sub    $0x20,%esp
80101fe9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101fec:	6a 00                	push   $0x0
80101fee:	ff 75 0c             	push   0xc(%ebp)
80101ff1:	53                   	push   %ebx
80101ff2:	e8 e9 fc ff ff       	call   80101ce0 <dirlookup>
80101ff7:	83 c4 10             	add    $0x10,%esp
80101ffa:	85 c0                	test   %eax,%eax
80101ffc:	75 67                	jne    80102065 <dirlink+0x85>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101ffe:	8b 7b 58             	mov    0x58(%ebx),%edi
80102001:	8d 75 d8             	lea    -0x28(%ebp),%esi
80102004:	85 ff                	test   %edi,%edi
80102006:	74 29                	je     80102031 <dirlink+0x51>
80102008:	31 ff                	xor    %edi,%edi
8010200a:	8d 75 d8             	lea    -0x28(%ebp),%esi
8010200d:	eb 09                	jmp    80102018 <dirlink+0x38>
8010200f:	90                   	nop
80102010:	83 c7 10             	add    $0x10,%edi
80102013:	3b 7b 58             	cmp    0x58(%ebx),%edi
80102016:	73 19                	jae    80102031 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80102018:	6a 10                	push   $0x10
8010201a:	57                   	push   %edi
8010201b:	56                   	push   %esi
8010201c:	53                   	push   %ebx
8010201d:	e8 6e fa ff ff       	call   80101a90 <readi>
80102022:	83 c4 10             	add    $0x10,%esp
80102025:	83 f8 10             	cmp    $0x10,%eax
80102028:	75 4e                	jne    80102078 <dirlink+0x98>
    if(de.inum == 0)
8010202a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
8010202f:	75 df                	jne    80102010 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80102031:	83 ec 04             	sub    $0x4,%esp
80102034:	8d 45 da             	lea    -0x26(%ebp),%eax
80102037:	6a 0e                	push   $0xe
80102039:	ff 75 0c             	push   0xc(%ebp)
8010203c:	50                   	push   %eax
8010203d:	e8 be 29 00 00       	call   80104a00 <strncpy>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80102042:	6a 10                	push   $0x10
  de.inum = inum;
80102044:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80102047:	57                   	push   %edi
80102048:	56                   	push   %esi
80102049:	53                   	push   %ebx
  de.inum = inum;
8010204a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010204e:	e8 3d fb ff ff       	call   80101b90 <writei>
80102053:	83 c4 20             	add    $0x20,%esp
80102056:	83 f8 10             	cmp    $0x10,%eax
80102059:	75 2a                	jne    80102085 <dirlink+0xa5>
  return 0;
8010205b:	31 c0                	xor    %eax,%eax
}
8010205d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102060:	5b                   	pop    %ebx
80102061:	5e                   	pop    %esi
80102062:	5f                   	pop    %edi
80102063:	5d                   	pop    %ebp
80102064:	c3                   	ret    
    iput(ip);
80102065:	83 ec 0c             	sub    $0xc,%esp
80102068:	50                   	push   %eax
80102069:	e8 42 f8 ff ff       	call   801018b0 <iput>
    return -1;
8010206e:	83 c4 10             	add    $0x10,%esp
80102071:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102076:	eb e5                	jmp    8010205d <dirlink+0x7d>
      panic("dirlink read");
80102078:	83 ec 0c             	sub    $0xc,%esp
8010207b:	68 88 76 10 80       	push   $0x80107688
80102080:	e8 fb e2 ff ff       	call   80100380 <panic>
    panic("dirlink");
80102085:	83 ec 0c             	sub    $0xc,%esp
80102088:	68 86 7c 10 80       	push   $0x80107c86
8010208d:	e8 ee e2 ff ff       	call   80100380 <panic>
80102092:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801020a0 <namei>:

struct inode*
namei(char *path)
{
801020a0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
801020a1:	31 d2                	xor    %edx,%edx
{
801020a3:	89 e5                	mov    %esp,%ebp
801020a5:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
801020a8:	8b 45 08             	mov    0x8(%ebp),%eax
801020ab:	8d 4d ea             	lea    -0x16(%ebp),%ecx
801020ae:	e8 dd fc ff ff       	call   80101d90 <namex>
}
801020b3:	c9                   	leave  
801020b4:	c3                   	ret    
801020b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801020bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020c0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
801020c0:	55                   	push   %ebp
  return namex(path, 1, name);
801020c1:	ba 01 00 00 00       	mov    $0x1,%edx
{
801020c6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
801020c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801020cb:	8b 45 08             	mov    0x8(%ebp),%eax
}
801020ce:	5d                   	pop    %ebp
  return namex(path, 1, name);
801020cf:	e9 bc fc ff ff       	jmp    80101d90 <namex>
801020d4:	66 90                	xchg   %ax,%ax
801020d6:	66 90                	xchg   %ax,%ax
801020d8:	66 90                	xchg   %ax,%ax
801020da:	66 90                	xchg   %ax,%ax
801020dc:	66 90                	xchg   %ax,%ax
801020de:	66 90                	xchg   %ax,%ax

801020e0 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
801020e0:	55                   	push   %ebp
801020e1:	89 e5                	mov    %esp,%ebp
801020e3:	57                   	push   %edi
801020e4:	56                   	push   %esi
801020e5:	53                   	push   %ebx
801020e6:	83 ec 0c             	sub    $0xc,%esp
  if(b == 0)
801020e9:	85 c0                	test   %eax,%eax
801020eb:	0f 84 b4 00 00 00    	je     801021a5 <idestart+0xc5>
    panic("idestart");
  if(b->blockno >= FSSIZE)
801020f1:	8b 70 08             	mov    0x8(%eax),%esi
801020f4:	89 c3                	mov    %eax,%ebx
801020f6:	81 fe e7 03 00 00    	cmp    $0x3e7,%esi
801020fc:	0f 87 96 00 00 00    	ja     80102198 <idestart+0xb8>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102102:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80102107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010210e:	66 90                	xchg   %ax,%ax
80102110:	89 ca                	mov    %ecx,%edx
80102112:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102113:	83 e0 c0             	and    $0xffffffc0,%eax
80102116:	3c 40                	cmp    $0x40,%al
80102118:	75 f6                	jne    80102110 <idestart+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010211a:	31 ff                	xor    %edi,%edi
8010211c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102121:	89 f8                	mov    %edi,%eax
80102123:	ee                   	out    %al,(%dx)
80102124:	b8 01 00 00 00       	mov    $0x1,%eax
80102129:	ba f2 01 00 00       	mov    $0x1f2,%edx
8010212e:	ee                   	out    %al,(%dx)
8010212f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80102134:	89 f0                	mov    %esi,%eax
80102136:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80102137:	89 f0                	mov    %esi,%eax
80102139:	ba f4 01 00 00       	mov    $0x1f4,%edx
8010213e:	c1 f8 08             	sar    $0x8,%eax
80102141:	ee                   	out    %al,(%dx)
80102142:	ba f5 01 00 00       	mov    $0x1f5,%edx
80102147:	89 f8                	mov    %edi,%eax
80102149:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
8010214a:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
8010214e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102153:	c1 e0 04             	shl    $0x4,%eax
80102156:	83 e0 10             	and    $0x10,%eax
80102159:	83 c8 e0             	or     $0xffffffe0,%eax
8010215c:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
8010215d:	f6 03 04             	testb  $0x4,(%ebx)
80102160:	75 16                	jne    80102178 <idestart+0x98>
80102162:	b8 20 00 00 00       	mov    $0x20,%eax
80102167:	89 ca                	mov    %ecx,%edx
80102169:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
8010216a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010216d:	5b                   	pop    %ebx
8010216e:	5e                   	pop    %esi
8010216f:	5f                   	pop    %edi
80102170:	5d                   	pop    %ebp
80102171:	c3                   	ret    
80102172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102178:	b8 30 00 00 00       	mov    $0x30,%eax
8010217d:	89 ca                	mov    %ecx,%edx
8010217f:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80102180:	b9 80 00 00 00       	mov    $0x80,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
80102185:	8d 73 5c             	lea    0x5c(%ebx),%esi
80102188:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010218d:	fc                   	cld    
8010218e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80102190:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102193:	5b                   	pop    %ebx
80102194:	5e                   	pop    %esi
80102195:	5f                   	pop    %edi
80102196:	5d                   	pop    %ebp
80102197:	c3                   	ret    
    panic("incorrect blockno");
80102198:	83 ec 0c             	sub    $0xc,%esp
8010219b:	68 f4 76 10 80       	push   $0x801076f4
801021a0:	e8 db e1 ff ff       	call   80100380 <panic>
    panic("idestart");
801021a5:	83 ec 0c             	sub    $0xc,%esp
801021a8:	68 eb 76 10 80       	push   $0x801076eb
801021ad:	e8 ce e1 ff ff       	call   80100380 <panic>
801021b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801021c0 <ideinit>:
{
801021c0:	55                   	push   %ebp
801021c1:	89 e5                	mov    %esp,%ebp
801021c3:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
801021c6:	68 06 77 10 80       	push   $0x80107706
801021cb:	68 00 16 11 80       	push   $0x80111600
801021d0:	e8 3b 24 00 00       	call   80104610 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
801021d5:	58                   	pop    %eax
801021d6:	a1 84 17 11 80       	mov    0x80111784,%eax
801021db:	5a                   	pop    %edx
801021dc:	83 e8 01             	sub    $0x1,%eax
801021df:	50                   	push   %eax
801021e0:	6a 0e                	push   $0xe
801021e2:	e8 99 02 00 00       	call   80102480 <ioapicenable>
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801021e7:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801021ea:	ba f7 01 00 00       	mov    $0x1f7,%edx
801021ef:	90                   	nop
801021f0:	ec                   	in     (%dx),%al
801021f1:	83 e0 c0             	and    $0xffffffc0,%eax
801021f4:	3c 40                	cmp    $0x40,%al
801021f6:	75 f8                	jne    801021f0 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801021f8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
801021fd:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102202:	ee                   	out    %al,(%dx)
80102203:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102208:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010220d:	eb 06                	jmp    80102215 <ideinit+0x55>
8010220f:	90                   	nop
  for(i=0; i<1000; i++){
80102210:	83 e9 01             	sub    $0x1,%ecx
80102213:	74 0f                	je     80102224 <ideinit+0x64>
80102215:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102216:	84 c0                	test   %al,%al
80102218:	74 f6                	je     80102210 <ideinit+0x50>
      havedisk1 = 1;
8010221a:	c7 05 e0 15 11 80 01 	movl   $0x1,0x801115e0
80102221:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102224:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102229:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010222e:	ee                   	out    %al,(%dx)
}
8010222f:	c9                   	leave  
80102230:	c3                   	ret    
80102231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102238:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010223f:	90                   	nop

80102240 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
80102240:	55                   	push   %ebp
80102241:	89 e5                	mov    %esp,%ebp
80102243:	57                   	push   %edi
80102244:	56                   	push   %esi
80102245:	53                   	push   %ebx
80102246:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102249:	68 00 16 11 80       	push   $0x80111600
8010224e:	e8 8d 25 00 00       	call   801047e0 <acquire>

  if((b = idequeue) == 0){
80102253:	8b 1d e4 15 11 80    	mov    0x801115e4,%ebx
80102259:	83 c4 10             	add    $0x10,%esp
8010225c:	85 db                	test   %ebx,%ebx
8010225e:	74 63                	je     801022c3 <ideintr+0x83>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102260:	8b 43 58             	mov    0x58(%ebx),%eax
80102263:	a3 e4 15 11 80       	mov    %eax,0x801115e4

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102268:	8b 33                	mov    (%ebx),%esi
8010226a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102270:	75 2f                	jne    801022a1 <ideintr+0x61>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102272:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010227e:	66 90                	xchg   %ax,%ax
80102280:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102281:	89 c1                	mov    %eax,%ecx
80102283:	83 e1 c0             	and    $0xffffffc0,%ecx
80102286:	80 f9 40             	cmp    $0x40,%cl
80102289:	75 f5                	jne    80102280 <ideintr+0x40>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
8010228b:	a8 21                	test   $0x21,%al
8010228d:	75 12                	jne    801022a1 <ideintr+0x61>
    insl(0x1f0, b->data, BSIZE/4);
8010228f:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
80102292:	b9 80 00 00 00       	mov    $0x80,%ecx
80102297:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010229c:	fc                   	cld    
8010229d:	f3 6d                	rep insl (%dx),%es:(%edi)

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
8010229f:	8b 33                	mov    (%ebx),%esi
  b->flags &= ~B_DIRTY;
801022a1:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
801022a4:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
801022a7:	83 ce 02             	or     $0x2,%esi
801022aa:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801022ac:	53                   	push   %ebx
801022ad:	e8 be 20 00 00       	call   80104370 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
801022b2:	a1 e4 15 11 80       	mov    0x801115e4,%eax
801022b7:	83 c4 10             	add    $0x10,%esp
801022ba:	85 c0                	test   %eax,%eax
801022bc:	74 05                	je     801022c3 <ideintr+0x83>
    idestart(idequeue);
801022be:	e8 1d fe ff ff       	call   801020e0 <idestart>
    release(&idelock);
801022c3:	83 ec 0c             	sub    $0xc,%esp
801022c6:	68 00 16 11 80       	push   $0x80111600
801022cb:	e8 b0 24 00 00       	call   80104780 <release>

  release(&idelock);
}
801022d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801022d3:	5b                   	pop    %ebx
801022d4:	5e                   	pop    %esi
801022d5:	5f                   	pop    %edi
801022d6:	5d                   	pop    %ebp
801022d7:	c3                   	ret    
801022d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801022df:	90                   	nop

801022e0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	53                   	push   %ebx
801022e4:	83 ec 10             	sub    $0x10,%esp
801022e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801022ea:	8d 43 0c             	lea    0xc(%ebx),%eax
801022ed:	50                   	push   %eax
801022ee:	e8 cd 22 00 00       	call   801045c0 <holdingsleep>
801022f3:	83 c4 10             	add    $0x10,%esp
801022f6:	85 c0                	test   %eax,%eax
801022f8:	0f 84 c3 00 00 00    	je     801023c1 <iderw+0xe1>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801022fe:	8b 03                	mov    (%ebx),%eax
80102300:	83 e0 06             	and    $0x6,%eax
80102303:	83 f8 02             	cmp    $0x2,%eax
80102306:	0f 84 a8 00 00 00    	je     801023b4 <iderw+0xd4>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010230c:	8b 53 04             	mov    0x4(%ebx),%edx
8010230f:	85 d2                	test   %edx,%edx
80102311:	74 0d                	je     80102320 <iderw+0x40>
80102313:	a1 e0 15 11 80       	mov    0x801115e0,%eax
80102318:	85 c0                	test   %eax,%eax
8010231a:	0f 84 87 00 00 00    	je     801023a7 <iderw+0xc7>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102320:	83 ec 0c             	sub    $0xc,%esp
80102323:	68 00 16 11 80       	push   $0x80111600
80102328:	e8 b3 24 00 00       	call   801047e0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010232d:	a1 e4 15 11 80       	mov    0x801115e4,%eax
  b->qnext = 0;
80102332:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102339:	83 c4 10             	add    $0x10,%esp
8010233c:	85 c0                	test   %eax,%eax
8010233e:	74 60                	je     801023a0 <iderw+0xc0>
80102340:	89 c2                	mov    %eax,%edx
80102342:	8b 40 58             	mov    0x58(%eax),%eax
80102345:	85 c0                	test   %eax,%eax
80102347:	75 f7                	jne    80102340 <iderw+0x60>
80102349:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
8010234c:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
8010234e:	39 1d e4 15 11 80    	cmp    %ebx,0x801115e4
80102354:	74 3a                	je     80102390 <iderw+0xb0>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102356:	8b 03                	mov    (%ebx),%eax
80102358:	83 e0 06             	and    $0x6,%eax
8010235b:	83 f8 02             	cmp    $0x2,%eax
8010235e:	74 1b                	je     8010237b <iderw+0x9b>
    sleep(b, &idelock);
80102360:	83 ec 08             	sub    $0x8,%esp
80102363:	68 00 16 11 80       	push   $0x80111600
80102368:	53                   	push   %ebx
80102369:	e8 f2 1d 00 00       	call   80104160 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010236e:	8b 03                	mov    (%ebx),%eax
80102370:	83 c4 10             	add    $0x10,%esp
80102373:	83 e0 06             	and    $0x6,%eax
80102376:	83 f8 02             	cmp    $0x2,%eax
80102379:	75 e5                	jne    80102360 <iderw+0x80>
  }


  release(&idelock);
8010237b:	c7 45 08 00 16 11 80 	movl   $0x80111600,0x8(%ebp)
}
80102382:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102385:	c9                   	leave  
  release(&idelock);
80102386:	e9 f5 23 00 00       	jmp    80104780 <release>
8010238b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010238f:	90                   	nop
    idestart(b);
80102390:	89 d8                	mov    %ebx,%eax
80102392:	e8 49 fd ff ff       	call   801020e0 <idestart>
80102397:	eb bd                	jmp    80102356 <iderw+0x76>
80102399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801023a0:	ba e4 15 11 80       	mov    $0x801115e4,%edx
801023a5:	eb a5                	jmp    8010234c <iderw+0x6c>
    panic("iderw: ide disk 1 not present");
801023a7:	83 ec 0c             	sub    $0xc,%esp
801023aa:	68 35 77 10 80       	push   $0x80107735
801023af:	e8 cc df ff ff       	call   80100380 <panic>
    panic("iderw: nothing to do");
801023b4:	83 ec 0c             	sub    $0xc,%esp
801023b7:	68 20 77 10 80       	push   $0x80107720
801023bc:	e8 bf df ff ff       	call   80100380 <panic>
    panic("iderw: buf not locked");
801023c1:	83 ec 0c             	sub    $0xc,%esp
801023c4:	68 0a 77 10 80       	push   $0x8010770a
801023c9:	e8 b2 df ff ff       	call   80100380 <panic>
801023ce:	66 90                	xchg   %ax,%ax

801023d0 <ioapicinit>:
801023d0:	55                   	push   %ebp
801023d1:	c7 05 34 16 11 80 00 	movl   $0xfec00000,0x80111634
801023d8:	00 c0 fe 
801023db:	89 e5                	mov    %esp,%ebp
801023dd:	56                   	push   %esi
801023de:	53                   	push   %ebx
801023df:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801023e6:	00 00 00 
801023e9:	8b 15 34 16 11 80    	mov    0x80111634,%edx
801023ef:	8b 72 10             	mov    0x10(%edx),%esi
801023f2:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
801023f8:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
801023fe:	0f b6 15 80 17 11 80 	movzbl 0x80111780,%edx
80102405:	c1 ee 10             	shr    $0x10,%esi
80102408:	89 f0                	mov    %esi,%eax
8010240a:	0f b6 f0             	movzbl %al,%esi
8010240d:	8b 41 10             	mov    0x10(%ecx),%eax
80102410:	c1 e8 18             	shr    $0x18,%eax
80102413:	39 c2                	cmp    %eax,%edx
80102415:	74 16                	je     8010242d <ioapicinit+0x5d>
80102417:	83 ec 0c             	sub    $0xc,%esp
8010241a:	68 54 77 10 80       	push   $0x80107754
8010241f:	e8 7c e2 ff ff       	call   801006a0 <cprintf>
80102424:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010242a:	83 c4 10             	add    $0x10,%esp
8010242d:	83 c6 21             	add    $0x21,%esi
80102430:	ba 10 00 00 00       	mov    $0x10,%edx
80102435:	b8 20 00 00 00       	mov    $0x20,%eax
8010243a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102440:	89 11                	mov    %edx,(%ecx)
80102442:	89 c3                	mov    %eax,%ebx
80102444:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010244a:	83 c0 01             	add    $0x1,%eax
8010244d:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102453:	89 59 10             	mov    %ebx,0x10(%ecx)
80102456:	8d 5a 01             	lea    0x1(%edx),%ebx
80102459:	83 c2 02             	add    $0x2,%edx
8010245c:	89 19                	mov    %ebx,(%ecx)
8010245e:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80102464:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010246b:	39 f0                	cmp    %esi,%eax
8010246d:	75 d1                	jne    80102440 <ioapicinit+0x70>
8010246f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102472:	5b                   	pop    %ebx
80102473:	5e                   	pop    %esi
80102474:	5d                   	pop    %ebp
80102475:	c3                   	ret    
80102476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010247d:	8d 76 00             	lea    0x0(%esi),%esi

80102480 <ioapicenable>:
80102480:	55                   	push   %ebp
80102481:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80102487:	89 e5                	mov    %esp,%ebp
80102489:	8b 45 08             	mov    0x8(%ebp),%eax
8010248c:	8d 50 20             	lea    0x20(%eax),%edx
8010248f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102493:	89 01                	mov    %eax,(%ecx)
80102495:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010249b:	83 c0 01             	add    $0x1,%eax
8010249e:	89 51 10             	mov    %edx,0x10(%ecx)
801024a1:	8b 55 0c             	mov    0xc(%ebp),%edx
801024a4:	89 01                	mov    %eax,(%ecx)
801024a6:	a1 34 16 11 80       	mov    0x80111634,%eax
801024ab:	c1 e2 18             	shl    $0x18,%edx
801024ae:	89 50 10             	mov    %edx,0x10(%eax)
801024b1:	5d                   	pop    %ebp
801024b2:	c3                   	ret    
801024b3:	66 90                	xchg   %ax,%ax
801024b5:	66 90                	xchg   %ax,%ax
801024b7:	66 90                	xchg   %ax,%ax
801024b9:	66 90                	xchg   %ax,%ax
801024bb:	66 90                	xchg   %ax,%ax
801024bd:	66 90                	xchg   %ax,%ax
801024bf:	90                   	nop

801024c0 <kfree>:
801024c0:	55                   	push   %ebp
801024c1:	89 e5                	mov    %esp,%ebp
801024c3:	53                   	push   %ebx
801024c4:	83 ec 04             	sub    $0x4,%esp
801024c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801024ca:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801024d0:	75 76                	jne    80102548 <kfree+0x88>
801024d2:	81 fb 30 ce 11 80    	cmp    $0x8011ce30,%ebx
801024d8:	72 6e                	jb     80102548 <kfree+0x88>
801024da:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801024e0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801024e5:	77 61                	ja     80102548 <kfree+0x88>
801024e7:	83 ec 04             	sub    $0x4,%esp
801024ea:	68 00 10 00 00       	push   $0x1000
801024ef:	6a 01                	push   $0x1
801024f1:	53                   	push   %ebx
801024f2:	e8 a9 23 00 00       	call   801048a0 <memset>
801024f7:	8b 15 74 16 11 80    	mov    0x80111674,%edx
801024fd:	83 c4 10             	add    $0x10,%esp
80102500:	85 d2                	test   %edx,%edx
80102502:	75 1c                	jne    80102520 <kfree+0x60>
80102504:	a1 78 16 11 80       	mov    0x80111678,%eax
80102509:	89 03                	mov    %eax,(%ebx)
8010250b:	a1 74 16 11 80       	mov    0x80111674,%eax
80102510:	89 1d 78 16 11 80    	mov    %ebx,0x80111678
80102516:	85 c0                	test   %eax,%eax
80102518:	75 1e                	jne    80102538 <kfree+0x78>
8010251a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010251d:	c9                   	leave  
8010251e:	c3                   	ret    
8010251f:	90                   	nop
80102520:	83 ec 0c             	sub    $0xc,%esp
80102523:	68 40 16 11 80       	push   $0x80111640
80102528:	e8 b3 22 00 00       	call   801047e0 <acquire>
8010252d:	83 c4 10             	add    $0x10,%esp
80102530:	eb d2                	jmp    80102504 <kfree+0x44>
80102532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102538:	c7 45 08 40 16 11 80 	movl   $0x80111640,0x8(%ebp)
8010253f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102542:	c9                   	leave  
80102543:	e9 38 22 00 00       	jmp    80104780 <release>
80102548:	83 ec 0c             	sub    $0xc,%esp
8010254b:	68 86 77 10 80       	push   $0x80107786
80102550:	e8 2b de ff ff       	call   80100380 <panic>
80102555:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010255c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102560 <freerange>:
80102560:	55                   	push   %ebp
80102561:	89 e5                	mov    %esp,%ebp
80102563:	56                   	push   %esi
80102564:	8b 45 08             	mov    0x8(%ebp),%eax
80102567:	8b 75 0c             	mov    0xc(%ebp),%esi
8010256a:	53                   	push   %ebx
8010256b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102571:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102577:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010257d:	39 de                	cmp    %ebx,%esi
8010257f:	72 23                	jb     801025a4 <freerange+0x44>
80102581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102588:	83 ec 0c             	sub    $0xc,%esp
8010258b:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102591:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102597:	50                   	push   %eax
80102598:	e8 23 ff ff ff       	call   801024c0 <kfree>
8010259d:	83 c4 10             	add    $0x10,%esp
801025a0:	39 f3                	cmp    %esi,%ebx
801025a2:	76 e4                	jbe    80102588 <freerange+0x28>
801025a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801025a7:	5b                   	pop    %ebx
801025a8:	5e                   	pop    %esi
801025a9:	5d                   	pop    %ebp
801025aa:	c3                   	ret    
801025ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025af:	90                   	nop

801025b0 <kinit2>:
801025b0:	55                   	push   %ebp
801025b1:	89 e5                	mov    %esp,%ebp
801025b3:	56                   	push   %esi
801025b4:	8b 45 08             	mov    0x8(%ebp),%eax
801025b7:	8b 75 0c             	mov    0xc(%ebp),%esi
801025ba:	53                   	push   %ebx
801025bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801025c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801025c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025cd:	39 de                	cmp    %ebx,%esi
801025cf:	72 23                	jb     801025f4 <kinit2+0x44>
801025d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025d8:	83 ec 0c             	sub    $0xc,%esp
801025db:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801025e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025e7:	50                   	push   %eax
801025e8:	e8 d3 fe ff ff       	call   801024c0 <kfree>
801025ed:	83 c4 10             	add    $0x10,%esp
801025f0:	39 de                	cmp    %ebx,%esi
801025f2:	73 e4                	jae    801025d8 <kinit2+0x28>
801025f4:	c7 05 74 16 11 80 01 	movl   $0x1,0x80111674
801025fb:	00 00 00 
801025fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102601:	5b                   	pop    %ebx
80102602:	5e                   	pop    %esi
80102603:	5d                   	pop    %ebp
80102604:	c3                   	ret    
80102605:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010260c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102610 <kinit1>:
80102610:	55                   	push   %ebp
80102611:	89 e5                	mov    %esp,%ebp
80102613:	56                   	push   %esi
80102614:	53                   	push   %ebx
80102615:	8b 75 0c             	mov    0xc(%ebp),%esi
80102618:	83 ec 08             	sub    $0x8,%esp
8010261b:	68 8c 77 10 80       	push   $0x8010778c
80102620:	68 40 16 11 80       	push   $0x80111640
80102625:	e8 e6 1f 00 00       	call   80104610 <initlock>
8010262a:	8b 45 08             	mov    0x8(%ebp),%eax
8010262d:	83 c4 10             	add    $0x10,%esp
80102630:	c7 05 74 16 11 80 00 	movl   $0x0,0x80111674
80102637:	00 00 00 
8010263a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102640:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102646:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010264c:	39 de                	cmp    %ebx,%esi
8010264e:	72 1c                	jb     8010266c <kinit1+0x5c>
80102650:	83 ec 0c             	sub    $0xc,%esp
80102653:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102659:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010265f:	50                   	push   %eax
80102660:	e8 5b fe ff ff       	call   801024c0 <kfree>
80102665:	83 c4 10             	add    $0x10,%esp
80102668:	39 de                	cmp    %ebx,%esi
8010266a:	73 e4                	jae    80102650 <kinit1+0x40>
8010266c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010266f:	5b                   	pop    %ebx
80102670:	5e                   	pop    %esi
80102671:	5d                   	pop    %ebp
80102672:	c3                   	ret    
80102673:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010267a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102680 <kalloc>:
80102680:	a1 74 16 11 80       	mov    0x80111674,%eax
80102685:	85 c0                	test   %eax,%eax
80102687:	75 1f                	jne    801026a8 <kalloc+0x28>
80102689:	a1 78 16 11 80       	mov    0x80111678,%eax
8010268e:	85 c0                	test   %eax,%eax
80102690:	74 0e                	je     801026a0 <kalloc+0x20>
80102692:	8b 10                	mov    (%eax),%edx
80102694:	89 15 78 16 11 80    	mov    %edx,0x80111678
8010269a:	c3                   	ret    
8010269b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010269f:	90                   	nop
801026a0:	c3                   	ret    
801026a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026a8:	55                   	push   %ebp
801026a9:	89 e5                	mov    %esp,%ebp
801026ab:	83 ec 24             	sub    $0x24,%esp
801026ae:	68 40 16 11 80       	push   $0x80111640
801026b3:	e8 28 21 00 00       	call   801047e0 <acquire>
801026b8:	a1 78 16 11 80       	mov    0x80111678,%eax
801026bd:	8b 15 74 16 11 80    	mov    0x80111674,%edx
801026c3:	83 c4 10             	add    $0x10,%esp
801026c6:	85 c0                	test   %eax,%eax
801026c8:	74 08                	je     801026d2 <kalloc+0x52>
801026ca:	8b 08                	mov    (%eax),%ecx
801026cc:	89 0d 78 16 11 80    	mov    %ecx,0x80111678
801026d2:	85 d2                	test   %edx,%edx
801026d4:	74 16                	je     801026ec <kalloc+0x6c>
801026d6:	83 ec 0c             	sub    $0xc,%esp
801026d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
801026dc:	68 40 16 11 80       	push   $0x80111640
801026e1:	e8 9a 20 00 00       	call   80104780 <release>
801026e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801026e9:	83 c4 10             	add    $0x10,%esp
801026ec:	c9                   	leave  
801026ed:	c3                   	ret    
801026ee:	66 90                	xchg   %ax,%ax

801026f0 <kbdgetc>:
801026f0:	ba 64 00 00 00       	mov    $0x64,%edx
801026f5:	ec                   	in     (%dx),%al
801026f6:	a8 01                	test   $0x1,%al
801026f8:	0f 84 c2 00 00 00    	je     801027c0 <kbdgetc+0xd0>
801026fe:	55                   	push   %ebp
801026ff:	ba 60 00 00 00       	mov    $0x60,%edx
80102704:	89 e5                	mov    %esp,%ebp
80102706:	53                   	push   %ebx
80102707:	ec                   	in     (%dx),%al
80102708:	8b 1d 7c 16 11 80    	mov    0x8011167c,%ebx
8010270e:	0f b6 c8             	movzbl %al,%ecx
80102711:	3c e0                	cmp    $0xe0,%al
80102713:	74 5b                	je     80102770 <kbdgetc+0x80>
80102715:	89 da                	mov    %ebx,%edx
80102717:	83 e2 40             	and    $0x40,%edx
8010271a:	84 c0                	test   %al,%al
8010271c:	78 62                	js     80102780 <kbdgetc+0x90>
8010271e:	85 d2                	test   %edx,%edx
80102720:	74 09                	je     8010272b <kbdgetc+0x3b>
80102722:	83 c8 80             	or     $0xffffff80,%eax
80102725:	83 e3 bf             	and    $0xffffffbf,%ebx
80102728:	0f b6 c8             	movzbl %al,%ecx
8010272b:	0f b6 91 c0 78 10 80 	movzbl -0x7fef8740(%ecx),%edx
80102732:	0f b6 81 c0 77 10 80 	movzbl -0x7fef8840(%ecx),%eax
80102739:	09 da                	or     %ebx,%edx
8010273b:	31 c2                	xor    %eax,%edx
8010273d:	89 d0                	mov    %edx,%eax
8010273f:	89 15 7c 16 11 80    	mov    %edx,0x8011167c
80102745:	83 e0 03             	and    $0x3,%eax
80102748:	83 e2 08             	and    $0x8,%edx
8010274b:	8b 04 85 a0 77 10 80 	mov    -0x7fef8860(,%eax,4),%eax
80102752:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
80102756:	74 0b                	je     80102763 <kbdgetc+0x73>
80102758:	8d 50 9f             	lea    -0x61(%eax),%edx
8010275b:	83 fa 19             	cmp    $0x19,%edx
8010275e:	77 48                	ja     801027a8 <kbdgetc+0xb8>
80102760:	83 e8 20             	sub    $0x20,%eax
80102763:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102766:	c9                   	leave  
80102767:	c3                   	ret    
80102768:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010276f:	90                   	nop
80102770:	83 cb 40             	or     $0x40,%ebx
80102773:	31 c0                	xor    %eax,%eax
80102775:	89 1d 7c 16 11 80    	mov    %ebx,0x8011167c
8010277b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010277e:	c9                   	leave  
8010277f:	c3                   	ret    
80102780:	83 e0 7f             	and    $0x7f,%eax
80102783:	85 d2                	test   %edx,%edx
80102785:	0f 44 c8             	cmove  %eax,%ecx
80102788:	0f b6 81 c0 78 10 80 	movzbl -0x7fef8740(%ecx),%eax
8010278f:	83 c8 40             	or     $0x40,%eax
80102792:	0f b6 c0             	movzbl %al,%eax
80102795:	f7 d0                	not    %eax
80102797:	21 d8                	and    %ebx,%eax
80102799:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010279c:	a3 7c 16 11 80       	mov    %eax,0x8011167c
801027a1:	31 c0                	xor    %eax,%eax
801027a3:	c9                   	leave  
801027a4:	c3                   	ret    
801027a5:	8d 76 00             	lea    0x0(%esi),%esi
801027a8:	8d 48 bf             	lea    -0x41(%eax),%ecx
801027ab:	8d 50 20             	lea    0x20(%eax),%edx
801027ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801027b1:	c9                   	leave  
801027b2:	83 f9 1a             	cmp    $0x1a,%ecx
801027b5:	0f 42 c2             	cmovb  %edx,%eax
801027b8:	c3                   	ret    
801027b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801027c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801027c5:	c3                   	ret    
801027c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801027cd:	8d 76 00             	lea    0x0(%esi),%esi

801027d0 <kbdintr>:
801027d0:	55                   	push   %ebp
801027d1:	89 e5                	mov    %esp,%ebp
801027d3:	83 ec 14             	sub    $0x14,%esp
801027d6:	68 f0 26 10 80       	push   $0x801026f0
801027db:	e8 a0 e0 ff ff       	call   80100880 <consoleintr>
801027e0:	83 c4 10             	add    $0x10,%esp
801027e3:	c9                   	leave  
801027e4:	c3                   	ret    
801027e5:	66 90                	xchg   %ax,%ax
801027e7:	66 90                	xchg   %ax,%ax
801027e9:	66 90                	xchg   %ax,%ax
801027eb:	66 90                	xchg   %ax,%ax
801027ed:	66 90                	xchg   %ax,%ax
801027ef:	90                   	nop

801027f0 <lapicinit>:
801027f0:	a1 80 16 11 80       	mov    0x80111680,%eax
801027f5:	85 c0                	test   %eax,%eax
801027f7:	0f 84 cb 00 00 00    	je     801028c8 <lapicinit+0xd8>
801027fd:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102804:	01 00 00 
80102807:	8b 50 20             	mov    0x20(%eax),%edx
8010280a:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102811:	00 00 00 
80102814:	8b 50 20             	mov    0x20(%eax),%edx
80102817:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
8010281e:	00 02 00 
80102821:	8b 50 20             	mov    0x20(%eax),%edx
80102824:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010282b:	96 98 00 
8010282e:	8b 50 20             	mov    0x20(%eax),%edx
80102831:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
80102838:	00 01 00 
8010283b:	8b 50 20             	mov    0x20(%eax),%edx
8010283e:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102845:	00 01 00 
80102848:	8b 50 20             	mov    0x20(%eax),%edx
8010284b:	8b 50 30             	mov    0x30(%eax),%edx
8010284e:	c1 ea 10             	shr    $0x10,%edx
80102851:	81 e2 fc 00 00 00    	and    $0xfc,%edx
80102857:	75 77                	jne    801028d0 <lapicinit+0xe0>
80102859:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102860:	00 00 00 
80102863:	8b 50 20             	mov    0x20(%eax),%edx
80102866:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010286d:	00 00 00 
80102870:	8b 50 20             	mov    0x20(%eax),%edx
80102873:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010287a:	00 00 00 
8010287d:	8b 50 20             	mov    0x20(%eax),%edx
80102880:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102887:	00 00 00 
8010288a:	8b 50 20             	mov    0x20(%eax),%edx
8010288d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102894:	00 00 00 
80102897:	8b 50 20             	mov    0x20(%eax),%edx
8010289a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801028a1:	85 08 00 
801028a4:	8b 50 20             	mov    0x20(%eax),%edx
801028a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801028ae:	66 90                	xchg   %ax,%ax
801028b0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801028b6:	80 e6 10             	and    $0x10,%dh
801028b9:	75 f5                	jne    801028b0 <lapicinit+0xc0>
801028bb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801028c2:	00 00 00 
801028c5:	8b 40 20             	mov    0x20(%eax),%eax
801028c8:	c3                   	ret    
801028c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801028d0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801028d7:	00 01 00 
801028da:	8b 50 20             	mov    0x20(%eax),%edx
801028dd:	e9 77 ff ff ff       	jmp    80102859 <lapicinit+0x69>
801028e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801028e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801028f0 <lapicid>:
801028f0:	a1 80 16 11 80       	mov    0x80111680,%eax
801028f5:	85 c0                	test   %eax,%eax
801028f7:	74 07                	je     80102900 <lapicid+0x10>
801028f9:	8b 40 20             	mov    0x20(%eax),%eax
801028fc:	c1 e8 18             	shr    $0x18,%eax
801028ff:	c3                   	ret    
80102900:	31 c0                	xor    %eax,%eax
80102902:	c3                   	ret    
80102903:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010290a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102910 <lapiceoi>:
80102910:	a1 80 16 11 80       	mov    0x80111680,%eax
80102915:	85 c0                	test   %eax,%eax
80102917:	74 0d                	je     80102926 <lapiceoi+0x16>
80102919:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102920:	00 00 00 
80102923:	8b 40 20             	mov    0x20(%eax),%eax
80102926:	c3                   	ret    
80102927:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010292e:	66 90                	xchg   %ax,%ax

80102930 <microdelay>:
80102930:	c3                   	ret    
80102931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102938:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010293f:	90                   	nop

80102940 <lapicstartap>:
80102940:	55                   	push   %ebp
80102941:	b8 0f 00 00 00       	mov    $0xf,%eax
80102946:	ba 70 00 00 00       	mov    $0x70,%edx
8010294b:	89 e5                	mov    %esp,%ebp
8010294d:	53                   	push   %ebx
8010294e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102951:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102954:	ee                   	out    %al,(%dx)
80102955:	b8 0a 00 00 00       	mov    $0xa,%eax
8010295a:	ba 71 00 00 00       	mov    $0x71,%edx
8010295f:	ee                   	out    %al,(%dx)
80102960:	31 c0                	xor    %eax,%eax
80102962:	c1 e3 18             	shl    $0x18,%ebx
80102965:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010296b:	89 c8                	mov    %ecx,%eax
8010296d:	c1 e9 0c             	shr    $0xc,%ecx
80102970:	89 da                	mov    %ebx,%edx
80102972:	c1 e8 04             	shr    $0x4,%eax
80102975:	80 cd 06             	or     $0x6,%ch
80102978:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010297e:	a1 80 16 11 80       	mov    0x80111680,%eax
80102983:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102989:	8b 58 20             	mov    0x20(%eax),%ebx
8010298c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102993:	c5 00 00 
80102996:	8b 58 20             	mov    0x20(%eax),%ebx
80102999:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801029a0:	85 00 00 
801029a3:	8b 58 20             	mov    0x20(%eax),%ebx
801029a6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801029ac:	8b 58 20             	mov    0x20(%eax),%ebx
801029af:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801029b5:	8b 58 20             	mov    0x20(%eax),%ebx
801029b8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801029be:	8b 50 20             	mov    0x20(%eax),%edx
801029c1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801029c7:	8b 40 20             	mov    0x20(%eax),%eax
801029ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801029cd:	c9                   	leave  
801029ce:	c3                   	ret    
801029cf:	90                   	nop

801029d0 <cmostime>:
801029d0:	55                   	push   %ebp
801029d1:	b8 0b 00 00 00       	mov    $0xb,%eax
801029d6:	ba 70 00 00 00       	mov    $0x70,%edx
801029db:	89 e5                	mov    %esp,%ebp
801029dd:	57                   	push   %edi
801029de:	56                   	push   %esi
801029df:	53                   	push   %ebx
801029e0:	83 ec 4c             	sub    $0x4c,%esp
801029e3:	ee                   	out    %al,(%dx)
801029e4:	ba 71 00 00 00       	mov    $0x71,%edx
801029e9:	ec                   	in     (%dx),%al
801029ea:	83 e0 04             	and    $0x4,%eax
801029ed:	bb 70 00 00 00       	mov    $0x70,%ebx
801029f2:	88 45 b3             	mov    %al,-0x4d(%ebp)
801029f5:	8d 76 00             	lea    0x0(%esi),%esi
801029f8:	31 c0                	xor    %eax,%eax
801029fa:	89 da                	mov    %ebx,%edx
801029fc:	ee                   	out    %al,(%dx)
801029fd:	b9 71 00 00 00       	mov    $0x71,%ecx
80102a02:	89 ca                	mov    %ecx,%edx
80102a04:	ec                   	in     (%dx),%al
80102a05:	88 45 b7             	mov    %al,-0x49(%ebp)
80102a08:	89 da                	mov    %ebx,%edx
80102a0a:	b8 02 00 00 00       	mov    $0x2,%eax
80102a0f:	ee                   	out    %al,(%dx)
80102a10:	89 ca                	mov    %ecx,%edx
80102a12:	ec                   	in     (%dx),%al
80102a13:	88 45 b6             	mov    %al,-0x4a(%ebp)
80102a16:	89 da                	mov    %ebx,%edx
80102a18:	b8 04 00 00 00       	mov    $0x4,%eax
80102a1d:	ee                   	out    %al,(%dx)
80102a1e:	89 ca                	mov    %ecx,%edx
80102a20:	ec                   	in     (%dx),%al
80102a21:	88 45 b5             	mov    %al,-0x4b(%ebp)
80102a24:	89 da                	mov    %ebx,%edx
80102a26:	b8 07 00 00 00       	mov    $0x7,%eax
80102a2b:	ee                   	out    %al,(%dx)
80102a2c:	89 ca                	mov    %ecx,%edx
80102a2e:	ec                   	in     (%dx),%al
80102a2f:	88 45 b4             	mov    %al,-0x4c(%ebp)
80102a32:	89 da                	mov    %ebx,%edx
80102a34:	b8 08 00 00 00       	mov    $0x8,%eax
80102a39:	ee                   	out    %al,(%dx)
80102a3a:	89 ca                	mov    %ecx,%edx
80102a3c:	ec                   	in     (%dx),%al
80102a3d:	89 c7                	mov    %eax,%edi
80102a3f:	89 da                	mov    %ebx,%edx
80102a41:	b8 09 00 00 00       	mov    $0x9,%eax
80102a46:	ee                   	out    %al,(%dx)
80102a47:	89 ca                	mov    %ecx,%edx
80102a49:	ec                   	in     (%dx),%al
80102a4a:	89 c6                	mov    %eax,%esi
80102a4c:	89 da                	mov    %ebx,%edx
80102a4e:	b8 0a 00 00 00       	mov    $0xa,%eax
80102a53:	ee                   	out    %al,(%dx)
80102a54:	89 ca                	mov    %ecx,%edx
80102a56:	ec                   	in     (%dx),%al
80102a57:	84 c0                	test   %al,%al
80102a59:	78 9d                	js     801029f8 <cmostime+0x28>
80102a5b:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102a5f:	89 fa                	mov    %edi,%edx
80102a61:	0f b6 fa             	movzbl %dl,%edi
80102a64:	89 f2                	mov    %esi,%edx
80102a66:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102a69:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
80102a6d:	0f b6 f2             	movzbl %dl,%esi
80102a70:	89 da                	mov    %ebx,%edx
80102a72:	89 7d c8             	mov    %edi,-0x38(%ebp)
80102a75:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102a78:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
80102a7c:	89 75 cc             	mov    %esi,-0x34(%ebp)
80102a7f:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102a82:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102a86:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102a89:	31 c0                	xor    %eax,%eax
80102a8b:	ee                   	out    %al,(%dx)
80102a8c:	89 ca                	mov    %ecx,%edx
80102a8e:	ec                   	in     (%dx),%al
80102a8f:	0f b6 c0             	movzbl %al,%eax
80102a92:	89 da                	mov    %ebx,%edx
80102a94:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102a97:	b8 02 00 00 00       	mov    $0x2,%eax
80102a9c:	ee                   	out    %al,(%dx)
80102a9d:	89 ca                	mov    %ecx,%edx
80102a9f:	ec                   	in     (%dx),%al
80102aa0:	0f b6 c0             	movzbl %al,%eax
80102aa3:	89 da                	mov    %ebx,%edx
80102aa5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102aa8:	b8 04 00 00 00       	mov    $0x4,%eax
80102aad:	ee                   	out    %al,(%dx)
80102aae:	89 ca                	mov    %ecx,%edx
80102ab0:	ec                   	in     (%dx),%al
80102ab1:	0f b6 c0             	movzbl %al,%eax
80102ab4:	89 da                	mov    %ebx,%edx
80102ab6:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102ab9:	b8 07 00 00 00       	mov    $0x7,%eax
80102abe:	ee                   	out    %al,(%dx)
80102abf:	89 ca                	mov    %ecx,%edx
80102ac1:	ec                   	in     (%dx),%al
80102ac2:	0f b6 c0             	movzbl %al,%eax
80102ac5:	89 da                	mov    %ebx,%edx
80102ac7:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102aca:	b8 08 00 00 00       	mov    $0x8,%eax
80102acf:	ee                   	out    %al,(%dx)
80102ad0:	89 ca                	mov    %ecx,%edx
80102ad2:	ec                   	in     (%dx),%al
80102ad3:	0f b6 c0             	movzbl %al,%eax
80102ad6:	89 da                	mov    %ebx,%edx
80102ad8:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102adb:	b8 09 00 00 00       	mov    $0x9,%eax
80102ae0:	ee                   	out    %al,(%dx)
80102ae1:	89 ca                	mov    %ecx,%edx
80102ae3:	ec                   	in     (%dx),%al
80102ae4:	0f b6 c0             	movzbl %al,%eax
80102ae7:	83 ec 04             	sub    $0x4,%esp
80102aea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102aed:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102af0:	6a 18                	push   $0x18
80102af2:	50                   	push   %eax
80102af3:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102af6:	50                   	push   %eax
80102af7:	e8 f4 1d 00 00       	call   801048f0 <memcmp>
80102afc:	83 c4 10             	add    $0x10,%esp
80102aff:	85 c0                	test   %eax,%eax
80102b01:	0f 85 f1 fe ff ff    	jne    801029f8 <cmostime+0x28>
80102b07:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
80102b0b:	75 78                	jne    80102b85 <cmostime+0x1b5>
80102b0d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102b10:	89 c2                	mov    %eax,%edx
80102b12:	83 e0 0f             	and    $0xf,%eax
80102b15:	c1 ea 04             	shr    $0x4,%edx
80102b18:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b1b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b1e:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102b21:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b24:	89 c2                	mov    %eax,%edx
80102b26:	83 e0 0f             	and    $0xf,%eax
80102b29:	c1 ea 04             	shr    $0x4,%edx
80102b2c:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b2f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b32:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102b35:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b38:	89 c2                	mov    %eax,%edx
80102b3a:	83 e0 0f             	and    $0xf,%eax
80102b3d:	c1 ea 04             	shr    $0x4,%edx
80102b40:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b43:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b46:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102b49:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102b4c:	89 c2                	mov    %eax,%edx
80102b4e:	83 e0 0f             	and    $0xf,%eax
80102b51:	c1 ea 04             	shr    $0x4,%edx
80102b54:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b57:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b5a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102b5d:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102b60:	89 c2                	mov    %eax,%edx
80102b62:	83 e0 0f             	and    $0xf,%eax
80102b65:	c1 ea 04             	shr    $0x4,%edx
80102b68:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b6b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b6e:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102b71:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102b74:	89 c2                	mov    %eax,%edx
80102b76:	83 e0 0f             	and    $0xf,%eax
80102b79:	c1 ea 04             	shr    $0x4,%edx
80102b7c:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b7f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b82:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102b85:	8b 75 08             	mov    0x8(%ebp),%esi
80102b88:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102b8b:	89 06                	mov    %eax,(%esi)
80102b8d:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b90:	89 46 04             	mov    %eax,0x4(%esi)
80102b93:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b96:	89 46 08             	mov    %eax,0x8(%esi)
80102b99:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102b9c:	89 46 0c             	mov    %eax,0xc(%esi)
80102b9f:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102ba2:	89 46 10             	mov    %eax,0x10(%esi)
80102ba5:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102ba8:	89 46 14             	mov    %eax,0x14(%esi)
80102bab:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102bb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102bb5:	5b                   	pop    %ebx
80102bb6:	5e                   	pop    %esi
80102bb7:	5f                   	pop    %edi
80102bb8:	5d                   	pop    %ebp
80102bb9:	c3                   	ret    
80102bba:	66 90                	xchg   %ax,%ax
80102bbc:	66 90                	xchg   %ax,%ax
80102bbe:	66 90                	xchg   %ax,%ax

80102bc0 <install_trans>:
80102bc0:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
80102bc6:	85 c9                	test   %ecx,%ecx
80102bc8:	0f 8e 8a 00 00 00    	jle    80102c58 <install_trans+0x98>
80102bce:	55                   	push   %ebp
80102bcf:	89 e5                	mov    %esp,%ebp
80102bd1:	57                   	push   %edi
80102bd2:	31 ff                	xor    %edi,%edi
80102bd4:	56                   	push   %esi
80102bd5:	53                   	push   %ebx
80102bd6:	83 ec 0c             	sub    $0xc,%esp
80102bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102be0:	a1 d4 16 11 80       	mov    0x801116d4,%eax
80102be5:	83 ec 08             	sub    $0x8,%esp
80102be8:	01 f8                	add    %edi,%eax
80102bea:	83 c0 01             	add    $0x1,%eax
80102bed:	50                   	push   %eax
80102bee:	ff 35 e4 16 11 80    	push   0x801116e4
80102bf4:	e8 d7 d4 ff ff       	call   801000d0 <bread>
80102bf9:	89 c6                	mov    %eax,%esi
80102bfb:	58                   	pop    %eax
80102bfc:	5a                   	pop    %edx
80102bfd:	ff 34 bd ec 16 11 80 	push   -0x7feee914(,%edi,4)
80102c04:	ff 35 e4 16 11 80    	push   0x801116e4
80102c0a:	83 c7 01             	add    $0x1,%edi
80102c0d:	e8 be d4 ff ff       	call   801000d0 <bread>
80102c12:	83 c4 0c             	add    $0xc,%esp
80102c15:	89 c3                	mov    %eax,%ebx
80102c17:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c1a:	68 00 02 00 00       	push   $0x200
80102c1f:	50                   	push   %eax
80102c20:	8d 43 5c             	lea    0x5c(%ebx),%eax
80102c23:	50                   	push   %eax
80102c24:	e8 17 1d 00 00       	call   80104940 <memmove>
80102c29:	89 1c 24             	mov    %ebx,(%esp)
80102c2c:	e8 7f d5 ff ff       	call   801001b0 <bwrite>
80102c31:	89 34 24             	mov    %esi,(%esp)
80102c34:	e8 b7 d5 ff ff       	call   801001f0 <brelse>
80102c39:	89 1c 24             	mov    %ebx,(%esp)
80102c3c:	e8 af d5 ff ff       	call   801001f0 <brelse>
80102c41:	83 c4 10             	add    $0x10,%esp
80102c44:	39 3d e8 16 11 80    	cmp    %edi,0x801116e8
80102c4a:	7f 94                	jg     80102be0 <install_trans+0x20>
80102c4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c4f:	5b                   	pop    %ebx
80102c50:	5e                   	pop    %esi
80102c51:	5f                   	pop    %edi
80102c52:	5d                   	pop    %ebp
80102c53:	c3                   	ret    
80102c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c58:	c3                   	ret    
80102c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102c60 <write_head>:
80102c60:	55                   	push   %ebp
80102c61:	89 e5                	mov    %esp,%ebp
80102c63:	53                   	push   %ebx
80102c64:	83 ec 0c             	sub    $0xc,%esp
80102c67:	ff 35 d4 16 11 80    	push   0x801116d4
80102c6d:	ff 35 e4 16 11 80    	push   0x801116e4
80102c73:	e8 58 d4 ff ff       	call   801000d0 <bread>
80102c78:	83 c4 10             	add    $0x10,%esp
80102c7b:	89 c3                	mov    %eax,%ebx
80102c7d:	a1 e8 16 11 80       	mov    0x801116e8,%eax
80102c82:	89 43 5c             	mov    %eax,0x5c(%ebx)
80102c85:	85 c0                	test   %eax,%eax
80102c87:	7e 19                	jle    80102ca2 <write_head+0x42>
80102c89:	31 d2                	xor    %edx,%edx
80102c8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c8f:	90                   	nop
80102c90:	8b 0c 95 ec 16 11 80 	mov    -0x7feee914(,%edx,4),%ecx
80102c97:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
80102c9b:	83 c2 01             	add    $0x1,%edx
80102c9e:	39 d0                	cmp    %edx,%eax
80102ca0:	75 ee                	jne    80102c90 <write_head+0x30>
80102ca2:	83 ec 0c             	sub    $0xc,%esp
80102ca5:	53                   	push   %ebx
80102ca6:	e8 05 d5 ff ff       	call   801001b0 <bwrite>
80102cab:	89 1c 24             	mov    %ebx,(%esp)
80102cae:	e8 3d d5 ff ff       	call   801001f0 <brelse>
80102cb3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102cb6:	83 c4 10             	add    $0x10,%esp
80102cb9:	c9                   	leave  
80102cba:	c3                   	ret    
80102cbb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102cbf:	90                   	nop

80102cc0 <initlog>:
80102cc0:	55                   	push   %ebp
80102cc1:	89 e5                	mov    %esp,%ebp
80102cc3:	53                   	push   %ebx
80102cc4:	83 ec 2c             	sub    $0x2c,%esp
80102cc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102cca:	68 c0 79 10 80       	push   $0x801079c0
80102ccf:	68 a0 16 11 80       	push   $0x801116a0
80102cd4:	e8 37 19 00 00       	call   80104610 <initlock>
80102cd9:	58                   	pop    %eax
80102cda:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102cdd:	5a                   	pop    %edx
80102cde:	50                   	push   %eax
80102cdf:	53                   	push   %ebx
80102ce0:	e8 3b e8 ff ff       	call   80101520 <readsb>
80102ce5:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102ce8:	59                   	pop    %ecx
80102ce9:	89 1d e4 16 11 80    	mov    %ebx,0x801116e4
80102cef:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102cf2:	a3 d4 16 11 80       	mov    %eax,0x801116d4
80102cf7:	89 15 d8 16 11 80    	mov    %edx,0x801116d8
80102cfd:	5a                   	pop    %edx
80102cfe:	50                   	push   %eax
80102cff:	53                   	push   %ebx
80102d00:	e8 cb d3 ff ff       	call   801000d0 <bread>
80102d05:	83 c4 10             	add    $0x10,%esp
80102d08:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102d0b:	89 1d e8 16 11 80    	mov    %ebx,0x801116e8
80102d11:	85 db                	test   %ebx,%ebx
80102d13:	7e 1d                	jle    80102d32 <initlog+0x72>
80102d15:	31 d2                	xor    %edx,%edx
80102d17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102d1e:	66 90                	xchg   %ax,%ax
80102d20:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
80102d24:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
80102d2b:	83 c2 01             	add    $0x1,%edx
80102d2e:	39 d3                	cmp    %edx,%ebx
80102d30:	75 ee                	jne    80102d20 <initlog+0x60>
80102d32:	83 ec 0c             	sub    $0xc,%esp
80102d35:	50                   	push   %eax
80102d36:	e8 b5 d4 ff ff       	call   801001f0 <brelse>
80102d3b:	e8 80 fe ff ff       	call   80102bc0 <install_trans>
80102d40:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
80102d47:	00 00 00 
80102d4a:	e8 11 ff ff ff       	call   80102c60 <write_head>
80102d4f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d52:	83 c4 10             	add    $0x10,%esp
80102d55:	c9                   	leave  
80102d56:	c3                   	ret    
80102d57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102d5e:	66 90                	xchg   %ax,%ax

80102d60 <begin_op>:
80102d60:	55                   	push   %ebp
80102d61:	89 e5                	mov    %esp,%ebp
80102d63:	83 ec 14             	sub    $0x14,%esp
80102d66:	68 a0 16 11 80       	push   $0x801116a0
80102d6b:	e8 70 1a 00 00       	call   801047e0 <acquire>
80102d70:	83 c4 10             	add    $0x10,%esp
80102d73:	eb 18                	jmp    80102d8d <begin_op+0x2d>
80102d75:	8d 76 00             	lea    0x0(%esi),%esi
80102d78:	83 ec 08             	sub    $0x8,%esp
80102d7b:	68 a0 16 11 80       	push   $0x801116a0
80102d80:	68 a0 16 11 80       	push   $0x801116a0
80102d85:	e8 d6 13 00 00       	call   80104160 <sleep>
80102d8a:	83 c4 10             	add    $0x10,%esp
80102d8d:	a1 e0 16 11 80       	mov    0x801116e0,%eax
80102d92:	85 c0                	test   %eax,%eax
80102d94:	75 e2                	jne    80102d78 <begin_op+0x18>
80102d96:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102d9b:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102da1:	83 c0 01             	add    $0x1,%eax
80102da4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102da7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102daa:	83 fa 1e             	cmp    $0x1e,%edx
80102dad:	7f c9                	jg     80102d78 <begin_op+0x18>
80102daf:	83 ec 0c             	sub    $0xc,%esp
80102db2:	a3 dc 16 11 80       	mov    %eax,0x801116dc
80102db7:	68 a0 16 11 80       	push   $0x801116a0
80102dbc:	e8 bf 19 00 00       	call   80104780 <release>
80102dc1:	83 c4 10             	add    $0x10,%esp
80102dc4:	c9                   	leave  
80102dc5:	c3                   	ret    
80102dc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102dcd:	8d 76 00             	lea    0x0(%esi),%esi

80102dd0 <end_op>:
80102dd0:	55                   	push   %ebp
80102dd1:	89 e5                	mov    %esp,%ebp
80102dd3:	57                   	push   %edi
80102dd4:	56                   	push   %esi
80102dd5:	53                   	push   %ebx
80102dd6:	83 ec 18             	sub    $0x18,%esp
80102dd9:	68 a0 16 11 80       	push   $0x801116a0
80102dde:	e8 fd 19 00 00       	call   801047e0 <acquire>
80102de3:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102de8:	8b 35 e0 16 11 80    	mov    0x801116e0,%esi
80102dee:	83 c4 10             	add    $0x10,%esp
80102df1:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102df4:	89 1d dc 16 11 80    	mov    %ebx,0x801116dc
80102dfa:	85 f6                	test   %esi,%esi
80102dfc:	0f 85 22 01 00 00    	jne    80102f24 <end_op+0x154>
80102e02:	85 db                	test   %ebx,%ebx
80102e04:	0f 85 f6 00 00 00    	jne    80102f00 <end_op+0x130>
80102e0a:	c7 05 e0 16 11 80 01 	movl   $0x1,0x801116e0
80102e11:	00 00 00 
80102e14:	83 ec 0c             	sub    $0xc,%esp
80102e17:	68 a0 16 11 80       	push   $0x801116a0
80102e1c:	e8 5f 19 00 00       	call   80104780 <release>
80102e21:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
80102e27:	83 c4 10             	add    $0x10,%esp
80102e2a:	85 c9                	test   %ecx,%ecx
80102e2c:	7f 42                	jg     80102e70 <end_op+0xa0>
80102e2e:	83 ec 0c             	sub    $0xc,%esp
80102e31:	68 a0 16 11 80       	push   $0x801116a0
80102e36:	e8 a5 19 00 00       	call   801047e0 <acquire>
80102e3b:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102e42:	c7 05 e0 16 11 80 00 	movl   $0x0,0x801116e0
80102e49:	00 00 00 
80102e4c:	e8 1f 15 00 00       	call   80104370 <wakeup>
80102e51:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102e58:	e8 23 19 00 00       	call   80104780 <release>
80102e5d:	83 c4 10             	add    $0x10,%esp
80102e60:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e63:	5b                   	pop    %ebx
80102e64:	5e                   	pop    %esi
80102e65:	5f                   	pop    %edi
80102e66:	5d                   	pop    %ebp
80102e67:	c3                   	ret    
80102e68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102e6f:	90                   	nop
80102e70:	a1 d4 16 11 80       	mov    0x801116d4,%eax
80102e75:	83 ec 08             	sub    $0x8,%esp
80102e78:	01 d8                	add    %ebx,%eax
80102e7a:	83 c0 01             	add    $0x1,%eax
80102e7d:	50                   	push   %eax
80102e7e:	ff 35 e4 16 11 80    	push   0x801116e4
80102e84:	e8 47 d2 ff ff       	call   801000d0 <bread>
80102e89:	89 c6                	mov    %eax,%esi
80102e8b:	58                   	pop    %eax
80102e8c:	5a                   	pop    %edx
80102e8d:	ff 34 9d ec 16 11 80 	push   -0x7feee914(,%ebx,4)
80102e94:	ff 35 e4 16 11 80    	push   0x801116e4
80102e9a:	83 c3 01             	add    $0x1,%ebx
80102e9d:	e8 2e d2 ff ff       	call   801000d0 <bread>
80102ea2:	83 c4 0c             	add    $0xc,%esp
80102ea5:	89 c7                	mov    %eax,%edi
80102ea7:	8d 40 5c             	lea    0x5c(%eax),%eax
80102eaa:	68 00 02 00 00       	push   $0x200
80102eaf:	50                   	push   %eax
80102eb0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102eb3:	50                   	push   %eax
80102eb4:	e8 87 1a 00 00       	call   80104940 <memmove>
80102eb9:	89 34 24             	mov    %esi,(%esp)
80102ebc:	e8 ef d2 ff ff       	call   801001b0 <bwrite>
80102ec1:	89 3c 24             	mov    %edi,(%esp)
80102ec4:	e8 27 d3 ff ff       	call   801001f0 <brelse>
80102ec9:	89 34 24             	mov    %esi,(%esp)
80102ecc:	e8 1f d3 ff ff       	call   801001f0 <brelse>
80102ed1:	83 c4 10             	add    $0x10,%esp
80102ed4:	3b 1d e8 16 11 80    	cmp    0x801116e8,%ebx
80102eda:	7c 94                	jl     80102e70 <end_op+0xa0>
80102edc:	e8 7f fd ff ff       	call   80102c60 <write_head>
80102ee1:	e8 da fc ff ff       	call   80102bc0 <install_trans>
80102ee6:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
80102eed:	00 00 00 
80102ef0:	e8 6b fd ff ff       	call   80102c60 <write_head>
80102ef5:	e9 34 ff ff ff       	jmp    80102e2e <end_op+0x5e>
80102efa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102f00:	83 ec 0c             	sub    $0xc,%esp
80102f03:	68 a0 16 11 80       	push   $0x801116a0
80102f08:	e8 63 14 00 00       	call   80104370 <wakeup>
80102f0d:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102f14:	e8 67 18 00 00       	call   80104780 <release>
80102f19:	83 c4 10             	add    $0x10,%esp
80102f1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f1f:	5b                   	pop    %ebx
80102f20:	5e                   	pop    %esi
80102f21:	5f                   	pop    %edi
80102f22:	5d                   	pop    %ebp
80102f23:	c3                   	ret    
80102f24:	83 ec 0c             	sub    $0xc,%esp
80102f27:	68 c4 79 10 80       	push   $0x801079c4
80102f2c:	e8 4f d4 ff ff       	call   80100380 <panic>
80102f31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f3f:	90                   	nop

80102f40 <log_write>:
80102f40:	55                   	push   %ebp
80102f41:	89 e5                	mov    %esp,%ebp
80102f43:	53                   	push   %ebx
80102f44:	83 ec 04             	sub    $0x4,%esp
80102f47:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102f4d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102f50:	83 fa 1d             	cmp    $0x1d,%edx
80102f53:	0f 8f 85 00 00 00    	jg     80102fde <log_write+0x9e>
80102f59:	a1 d8 16 11 80       	mov    0x801116d8,%eax
80102f5e:	83 e8 01             	sub    $0x1,%eax
80102f61:	39 c2                	cmp    %eax,%edx
80102f63:	7d 79                	jge    80102fde <log_write+0x9e>
80102f65:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102f6a:	85 c0                	test   %eax,%eax
80102f6c:	7e 7d                	jle    80102feb <log_write+0xab>
80102f6e:	83 ec 0c             	sub    $0xc,%esp
80102f71:	68 a0 16 11 80       	push   $0x801116a0
80102f76:	e8 65 18 00 00       	call   801047e0 <acquire>
80102f7b:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102f81:	83 c4 10             	add    $0x10,%esp
80102f84:	85 d2                	test   %edx,%edx
80102f86:	7e 4a                	jle    80102fd2 <log_write+0x92>
80102f88:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102f8b:	31 c0                	xor    %eax,%eax
80102f8d:	eb 08                	jmp    80102f97 <log_write+0x57>
80102f8f:	90                   	nop
80102f90:	83 c0 01             	add    $0x1,%eax
80102f93:	39 c2                	cmp    %eax,%edx
80102f95:	74 29                	je     80102fc0 <log_write+0x80>
80102f97:	39 0c 85 ec 16 11 80 	cmp    %ecx,-0x7feee914(,%eax,4)
80102f9e:	75 f0                	jne    80102f90 <log_write+0x50>
80102fa0:	89 0c 85 ec 16 11 80 	mov    %ecx,-0x7feee914(,%eax,4)
80102fa7:	83 0b 04             	orl    $0x4,(%ebx)
80102faa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102fad:	c7 45 08 a0 16 11 80 	movl   $0x801116a0,0x8(%ebp)
80102fb4:	c9                   	leave  
80102fb5:	e9 c6 17 00 00       	jmp    80104780 <release>
80102fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102fc0:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
80102fc7:	83 c2 01             	add    $0x1,%edx
80102fca:	89 15 e8 16 11 80    	mov    %edx,0x801116e8
80102fd0:	eb d5                	jmp    80102fa7 <log_write+0x67>
80102fd2:	8b 43 08             	mov    0x8(%ebx),%eax
80102fd5:	a3 ec 16 11 80       	mov    %eax,0x801116ec
80102fda:	75 cb                	jne    80102fa7 <log_write+0x67>
80102fdc:	eb e9                	jmp    80102fc7 <log_write+0x87>
80102fde:	83 ec 0c             	sub    $0xc,%esp
80102fe1:	68 d3 79 10 80       	push   $0x801079d3
80102fe6:	e8 95 d3 ff ff       	call   80100380 <panic>
80102feb:	83 ec 0c             	sub    $0xc,%esp
80102fee:	68 e9 79 10 80       	push   $0x801079e9
80102ff3:	e8 88 d3 ff ff       	call   80100380 <panic>
80102ff8:	66 90                	xchg   %ax,%ax
80102ffa:	66 90                	xchg   %ax,%ax
80102ffc:	66 90                	xchg   %ax,%ax
80102ffe:	66 90                	xchg   %ax,%ax

80103000 <mpmain>:
  lapicinit();
  mpmain();
}

// Common CPU setup code.
static void mpmain(void) {
80103000:	55                   	push   %ebp
80103001:	89 e5                	mov    %esp,%ebp
80103003:	53                   	push   %ebx
80103004:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80103007:	e8 84 08 00 00       	call   80103890 <cpuid>
8010300c:	89 c3                	mov    %eax,%ebx
8010300e:	e8 7d 08 00 00       	call   80103890 <cpuid>
80103013:	83 ec 04             	sub    $0x4,%esp
80103016:	53                   	push   %ebx
80103017:	50                   	push   %eax
80103018:	68 04 7a 10 80       	push   $0x80107a04
8010301d:	e8 7e d6 ff ff       	call   801006a0 <cprintf>
  idtinit();                    // load idt register
80103022:	e8 39 2c 00 00       	call   80105c60 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80103027:	e8 04 08 00 00       	call   80103830 <mycpu>
8010302c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
8010302e:	b8 01 00 00 00       	mov    $0x1,%eax
80103033:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();                  // start running processes
8010303a:	e8 21 0e 00 00       	call   80103e60 <scheduler>
8010303f:	90                   	nop

80103040 <mpenter>:
static void mpenter(void) {
80103040:	55                   	push   %ebp
80103041:	89 e5                	mov    %esp,%ebp
80103043:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80103046:	e8 05 3d 00 00       	call   80106d50 <switchkvm>
  seginit();
8010304b:	e8 70 3c 00 00       	call   80106cc0 <seginit>
  lapicinit();
80103050:	e8 9b f7 ff ff       	call   801027f0 <lapicinit>
  mpmain();
80103055:	e8 a6 ff ff ff       	call   80103000 <mpmain>
8010305a:	66 90                	xchg   %ax,%ax
8010305c:	66 90                	xchg   %ax,%ax
8010305e:	66 90                	xchg   %ax,%ax

80103060 <main>:
int main(void) {
80103060:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80103064:	83 e4 f0             	and    $0xfffffff0,%esp
80103067:	ff 71 fc             	push   -0x4(%ecx)
8010306a:	55                   	push   %ebp
8010306b:	89 e5                	mov    %esp,%ebp
8010306d:	53                   	push   %ebx
8010306e:	51                   	push   %ecx
  kinit1(end, P2V(4 * 1024 * 1024));          // phys page allocator
8010306f:	83 ec 08             	sub    $0x8,%esp
80103072:	68 00 00 40 80       	push   $0x80400000
80103077:	68 30 ce 11 80       	push   $0x8011ce30
8010307c:	e8 8f f5 ff ff       	call   80102610 <kinit1>
  kvmalloc();                                 // kernel page table
80103081:	e8 ba 41 00 00       	call   80107240 <kvmalloc>
  mpinit();                                   // detect other processors
80103086:	e8 95 01 00 00       	call   80103220 <mpinit>
  lapicinit();                                // interrupt controller
8010308b:	e8 60 f7 ff ff       	call   801027f0 <lapicinit>
  seginit();                                  // segment descriptors
80103090:	e8 2b 3c 00 00       	call   80106cc0 <seginit>
  picinit();                                  // disable pic
80103095:	e8 86 03 00 00       	call   80103420 <picinit>
  ioapicinit();                               // another interrupt controller
8010309a:	e8 31 f3 ff ff       	call   801023d0 <ioapicinit>
  consoleinit();                              // console hardware
8010309f:	e8 bc d9 ff ff       	call   80100a60 <consoleinit>
  uartinit();                                 // serial port
801030a4:	e8 a7 2e 00 00       	call   80105f50 <uartinit>
  pinit();                                    // process table
801030a9:	e8 62 07 00 00       	call   80103810 <pinit>
  tvinit();                                   // trap vectors
801030ae:	e8 2d 2b 00 00       	call   80105be0 <tvinit>
  binit();                                    // buffer cache
801030b3:	e8 88 cf ff ff       	call   80100040 <binit>
  fileinit();                                 // file table
801030b8:	e8 53 dd ff ff       	call   80100e10 <fileinit>
  ideinit();                                  // disk
801030bd:	e8 fe f0 ff ff       	call   801021c0 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
801030c2:	83 c4 0c             	add    $0xc,%esp
801030c5:	68 8a 00 00 00       	push   $0x8a
801030ca:	68 8c a4 10 80       	push   $0x8010a48c
801030cf:	68 00 70 00 80       	push   $0x80007000
801030d4:	e8 67 18 00 00       	call   80104940 <memmove>

  for (c = cpus; c < cpus + ncpu; c++) {
801030d9:	83 c4 10             	add    $0x10,%esp
801030dc:	69 05 84 17 11 80 b0 	imul   $0xb0,0x80111784,%eax
801030e3:	00 00 00 
801030e6:	05 a0 17 11 80       	add    $0x801117a0,%eax
801030eb:	3d a0 17 11 80       	cmp    $0x801117a0,%eax
801030f0:	76 7e                	jbe    80103170 <main+0x110>
801030f2:	bb a0 17 11 80       	mov    $0x801117a0,%ebx
801030f7:	eb 20                	jmp    80103119 <main+0xb9>
801030f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103100:	69 05 84 17 11 80 b0 	imul   $0xb0,0x80111784,%eax
80103107:	00 00 00 
8010310a:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80103110:	05 a0 17 11 80       	add    $0x801117a0,%eax
80103115:	39 c3                	cmp    %eax,%ebx
80103117:	73 57                	jae    80103170 <main+0x110>
    if (c == mycpu()) // We've started already.
80103119:	e8 12 07 00 00       	call   80103830 <mycpu>
8010311e:	39 c3                	cmp    %eax,%ebx
80103120:	74 de                	je     80103100 <main+0xa0>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack                        = kalloc();
80103122:	e8 59 f5 ff ff       	call   80102680 <kalloc>
    *(void **)(code - 4)         = stack + KSTACKSIZE;
    *(void (**)(void))(code - 8) = mpenter;
    *(int **)(code - 12)         = (void *)V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80103127:	83 ec 08             	sub    $0x8,%esp
    *(void (**)(void))(code - 8) = mpenter;
8010312a:	c7 05 f8 6f 00 80 40 	movl   $0x80103040,0x80006ff8
80103131:	30 10 80 
    *(int **)(code - 12)         = (void *)V2P(entrypgdir);
80103134:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
8010313b:	90 10 00 
    *(void **)(code - 4)         = stack + KSTACKSIZE;
8010313e:	05 00 10 00 00       	add    $0x1000,%eax
80103143:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    lapicstartap(c->apicid, V2P(code));
80103148:	0f b6 03             	movzbl (%ebx),%eax
8010314b:	68 00 70 00 00       	push   $0x7000
80103150:	50                   	push   %eax
80103151:	e8 ea f7 ff ff       	call   80102940 <lapicstartap>

    // wait for cpu to finish mpmain()
    while (c->started == 0)
80103156:	83 c4 10             	add    $0x10,%esp
80103159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103160:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103166:	85 c0                	test   %eax,%eax
80103168:	74 f6                	je     80103160 <main+0x100>
8010316a:	eb 94                	jmp    80103100 <main+0xa0>
8010316c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  kinit2(P2V(4 * 1024 * 1024), P2V(PHYSTOP)); // must come after startothers()
80103170:	83 ec 08             	sub    $0x8,%esp
80103173:	68 00 00 00 8e       	push   $0x8e000000
80103178:	68 00 00 40 80       	push   $0x80400000
8010317d:	e8 2e f4 ff ff       	call   801025b0 <kinit2>
  userinit();                                 // first user process
80103182:	e8 e9 09 00 00       	call   80103b70 <userinit>
  buf_rest_size = LOGBUFSIZE; // added
80103187:	c7 05 54 3d 11 80 bc 	movl   $0x2bc,0x80113d54
8010318e:	02 00 00 
  mpmain(); // finish this processor's setup
80103191:	e8 6a fe ff ff       	call   80103000 <mpmain>
80103196:	66 90                	xchg   %ax,%ax
80103198:	66 90                	xchg   %ax,%ax
8010319a:	66 90                	xchg   %ax,%ax
8010319c:	66 90                	xchg   %ax,%ax
8010319e:	66 90                	xchg   %ax,%ax

801031a0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
801031a0:	55                   	push   %ebp
801031a1:	89 e5                	mov    %esp,%ebp
801031a3:	57                   	push   %edi
801031a4:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
801031a5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
801031ab:	53                   	push   %ebx
  e = addr+len;
801031ac:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
801031af:	83 ec 0c             	sub    $0xc,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
801031b2:	39 de                	cmp    %ebx,%esi
801031b4:	72 10                	jb     801031c6 <mpsearch1+0x26>
801031b6:	eb 50                	jmp    80103208 <mpsearch1+0x68>
801031b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801031bf:	90                   	nop
801031c0:	89 fe                	mov    %edi,%esi
801031c2:	39 fb                	cmp    %edi,%ebx
801031c4:	76 42                	jbe    80103208 <mpsearch1+0x68>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801031c6:	83 ec 04             	sub    $0x4,%esp
801031c9:	8d 7e 10             	lea    0x10(%esi),%edi
801031cc:	6a 04                	push   $0x4
801031ce:	68 18 7a 10 80       	push   $0x80107a18
801031d3:	56                   	push   %esi
801031d4:	e8 17 17 00 00       	call   801048f0 <memcmp>
801031d9:	83 c4 10             	add    $0x10,%esp
801031dc:	85 c0                	test   %eax,%eax
801031de:	75 e0                	jne    801031c0 <mpsearch1+0x20>
801031e0:	89 f2                	mov    %esi,%edx
801031e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    sum += addr[i];
801031e8:	0f b6 0a             	movzbl (%edx),%ecx
  for(i=0; i<len; i++)
801031eb:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
801031ee:	01 c8                	add    %ecx,%eax
  for(i=0; i<len; i++)
801031f0:	39 fa                	cmp    %edi,%edx
801031f2:	75 f4                	jne    801031e8 <mpsearch1+0x48>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801031f4:	84 c0                	test   %al,%al
801031f6:	75 c8                	jne    801031c0 <mpsearch1+0x20>
      return (struct mp*)p;
  return 0;
}
801031f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031fb:	89 f0                	mov    %esi,%eax
801031fd:	5b                   	pop    %ebx
801031fe:	5e                   	pop    %esi
801031ff:	5f                   	pop    %edi
80103200:	5d                   	pop    %ebp
80103201:	c3                   	ret    
80103202:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103208:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010320b:	31 f6                	xor    %esi,%esi
}
8010320d:	5b                   	pop    %ebx
8010320e:	89 f0                	mov    %esi,%eax
80103210:	5e                   	pop    %esi
80103211:	5f                   	pop    %edi
80103212:	5d                   	pop    %ebp
80103213:	c3                   	ret    
80103214:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010321b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010321f:	90                   	nop

80103220 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103220:	55                   	push   %ebp
80103221:	89 e5                	mov    %esp,%ebp
80103223:	57                   	push   %edi
80103224:	56                   	push   %esi
80103225:	53                   	push   %ebx
80103226:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103229:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103230:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103237:	c1 e0 08             	shl    $0x8,%eax
8010323a:	09 d0                	or     %edx,%eax
8010323c:	c1 e0 04             	shl    $0x4,%eax
8010323f:	75 1b                	jne    8010325c <mpinit+0x3c>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103241:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80103248:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
8010324f:	c1 e0 08             	shl    $0x8,%eax
80103252:	09 d0                	or     %edx,%eax
80103254:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103257:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
8010325c:	ba 00 04 00 00       	mov    $0x400,%edx
80103261:	e8 3a ff ff ff       	call   801031a0 <mpsearch1>
80103266:	89 c3                	mov    %eax,%ebx
80103268:	85 c0                	test   %eax,%eax
8010326a:	0f 84 40 01 00 00    	je     801033b0 <mpinit+0x190>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103270:	8b 73 04             	mov    0x4(%ebx),%esi
80103273:	85 f6                	test   %esi,%esi
80103275:	0f 84 25 01 00 00    	je     801033a0 <mpinit+0x180>
  if(memcmp(conf, "PCMP", 4) != 0)
8010327b:	83 ec 04             	sub    $0x4,%esp
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010327e:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80103284:	6a 04                	push   $0x4
80103286:	68 1d 7a 10 80       	push   $0x80107a1d
8010328b:	50                   	push   %eax
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010328c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
8010328f:	e8 5c 16 00 00       	call   801048f0 <memcmp>
80103294:	83 c4 10             	add    $0x10,%esp
80103297:	85 c0                	test   %eax,%eax
80103299:	0f 85 01 01 00 00    	jne    801033a0 <mpinit+0x180>
  if(conf->version != 1 && conf->version != 4)
8010329f:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
801032a6:	3c 01                	cmp    $0x1,%al
801032a8:	74 08                	je     801032b2 <mpinit+0x92>
801032aa:	3c 04                	cmp    $0x4,%al
801032ac:	0f 85 ee 00 00 00    	jne    801033a0 <mpinit+0x180>
  if(sum((uchar*)conf, conf->length) != 0)
801032b2:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
  for(i=0; i<len; i++)
801032b9:	66 85 d2             	test   %dx,%dx
801032bc:	74 22                	je     801032e0 <mpinit+0xc0>
801032be:	8d 3c 32             	lea    (%edx,%esi,1),%edi
801032c1:	89 f0                	mov    %esi,%eax
  sum = 0;
801032c3:	31 d2                	xor    %edx,%edx
801032c5:	8d 76 00             	lea    0x0(%esi),%esi
    sum += addr[i];
801032c8:	0f b6 88 00 00 00 80 	movzbl -0x80000000(%eax),%ecx
  for(i=0; i<len; i++)
801032cf:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
801032d2:	01 ca                	add    %ecx,%edx
  for(i=0; i<len; i++)
801032d4:	39 c7                	cmp    %eax,%edi
801032d6:	75 f0                	jne    801032c8 <mpinit+0xa8>
  if(sum((uchar*)conf, conf->length) != 0)
801032d8:	84 d2                	test   %dl,%dl
801032da:	0f 85 c0 00 00 00    	jne    801033a0 <mpinit+0x180>
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801032e0:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
801032e6:	a3 80 16 11 80       	mov    %eax,0x80111680
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801032eb:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
801032f2:	8d 86 2c 00 00 80    	lea    -0x7fffffd4(%esi),%eax
  ismp = 1;
801032f8:	be 01 00 00 00       	mov    $0x1,%esi
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801032fd:	03 55 e4             	add    -0x1c(%ebp),%edx
80103300:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80103303:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103307:	90                   	nop
80103308:	39 d0                	cmp    %edx,%eax
8010330a:	73 15                	jae    80103321 <mpinit+0x101>
    switch(*p){
8010330c:	0f b6 08             	movzbl (%eax),%ecx
8010330f:	80 f9 02             	cmp    $0x2,%cl
80103312:	74 4c                	je     80103360 <mpinit+0x140>
80103314:	77 3a                	ja     80103350 <mpinit+0x130>
80103316:	84 c9                	test   %cl,%cl
80103318:	74 56                	je     80103370 <mpinit+0x150>
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
8010331a:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010331d:	39 d0                	cmp    %edx,%eax
8010331f:	72 eb                	jb     8010330c <mpinit+0xec>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103321:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103324:	85 f6                	test   %esi,%esi
80103326:	0f 84 d9 00 00 00    	je     80103405 <mpinit+0x1e5>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010332c:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
80103330:	74 15                	je     80103347 <mpinit+0x127>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103332:	b8 70 00 00 00       	mov    $0x70,%eax
80103337:	ba 22 00 00 00       	mov    $0x22,%edx
8010333c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010333d:	ba 23 00 00 00       	mov    $0x23,%edx
80103342:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103343:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103346:	ee                   	out    %al,(%dx)
  }
}
80103347:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010334a:	5b                   	pop    %ebx
8010334b:	5e                   	pop    %esi
8010334c:	5f                   	pop    %edi
8010334d:	5d                   	pop    %ebp
8010334e:	c3                   	ret    
8010334f:	90                   	nop
    switch(*p){
80103350:	83 e9 03             	sub    $0x3,%ecx
80103353:	80 f9 01             	cmp    $0x1,%cl
80103356:	76 c2                	jbe    8010331a <mpinit+0xfa>
80103358:	31 f6                	xor    %esi,%esi
8010335a:	eb ac                	jmp    80103308 <mpinit+0xe8>
8010335c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ioapicid = ioapic->apicno;
80103360:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
      p += sizeof(struct mpioapic);
80103364:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
80103367:	88 0d 80 17 11 80    	mov    %cl,0x80111780
      continue;
8010336d:	eb 99                	jmp    80103308 <mpinit+0xe8>
8010336f:	90                   	nop
      if(ncpu < NCPU) {
80103370:	8b 0d 84 17 11 80    	mov    0x80111784,%ecx
80103376:	83 f9 07             	cmp    $0x7,%ecx
80103379:	7f 19                	jg     80103394 <mpinit+0x174>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010337b:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
80103381:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
        ncpu++;
80103385:	83 c1 01             	add    $0x1,%ecx
80103388:	89 0d 84 17 11 80    	mov    %ecx,0x80111784
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010338e:	88 9f a0 17 11 80    	mov    %bl,-0x7feee860(%edi)
      p += sizeof(struct mpproc);
80103394:	83 c0 14             	add    $0x14,%eax
      continue;
80103397:	e9 6c ff ff ff       	jmp    80103308 <mpinit+0xe8>
8010339c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    panic("Expect to run on an SMP");
801033a0:	83 ec 0c             	sub    $0xc,%esp
801033a3:	68 22 7a 10 80       	push   $0x80107a22
801033a8:	e8 d3 cf ff ff       	call   80100380 <panic>
801033ad:	8d 76 00             	lea    0x0(%esi),%esi
{
801033b0:	bb 00 00 0f 80       	mov    $0x800f0000,%ebx
801033b5:	eb 13                	jmp    801033ca <mpinit+0x1aa>
801033b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801033be:	66 90                	xchg   %ax,%ax
  for(p = addr; p < e; p += sizeof(struct mp))
801033c0:	89 f3                	mov    %esi,%ebx
801033c2:	81 fe 00 00 10 80    	cmp    $0x80100000,%esi
801033c8:	74 d6                	je     801033a0 <mpinit+0x180>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801033ca:	83 ec 04             	sub    $0x4,%esp
801033cd:	8d 73 10             	lea    0x10(%ebx),%esi
801033d0:	6a 04                	push   $0x4
801033d2:	68 18 7a 10 80       	push   $0x80107a18
801033d7:	53                   	push   %ebx
801033d8:	e8 13 15 00 00       	call   801048f0 <memcmp>
801033dd:	83 c4 10             	add    $0x10,%esp
801033e0:	85 c0                	test   %eax,%eax
801033e2:	75 dc                	jne    801033c0 <mpinit+0x1a0>
801033e4:	89 da                	mov    %ebx,%edx
801033e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801033ed:	8d 76 00             	lea    0x0(%esi),%esi
    sum += addr[i];
801033f0:	0f b6 0a             	movzbl (%edx),%ecx
  for(i=0; i<len; i++)
801033f3:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
801033f6:	01 c8                	add    %ecx,%eax
  for(i=0; i<len; i++)
801033f8:	39 d6                	cmp    %edx,%esi
801033fa:	75 f4                	jne    801033f0 <mpinit+0x1d0>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801033fc:	84 c0                	test   %al,%al
801033fe:	75 c0                	jne    801033c0 <mpinit+0x1a0>
80103400:	e9 6b fe ff ff       	jmp    80103270 <mpinit+0x50>
    panic("Didn't find a suitable machine");
80103405:	83 ec 0c             	sub    $0xc,%esp
80103408:	68 3c 7a 10 80       	push   $0x80107a3c
8010340d:	e8 6e cf ff ff       	call   80100380 <panic>
80103412:	66 90                	xchg   %ax,%ax
80103414:	66 90                	xchg   %ax,%ax
80103416:	66 90                	xchg   %ax,%ax
80103418:	66 90                	xchg   %ax,%ax
8010341a:	66 90                	xchg   %ax,%ax
8010341c:	66 90                	xchg   %ax,%ax
8010341e:	66 90                	xchg   %ax,%ax

80103420 <picinit>:
80103420:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103425:	ba 21 00 00 00       	mov    $0x21,%edx
8010342a:	ee                   	out    %al,(%dx)
8010342b:	ba a1 00 00 00       	mov    $0xa1,%edx
80103430:	ee                   	out    %al,(%dx)
80103431:	c3                   	ret    
80103432:	66 90                	xchg   %ax,%ax
80103434:	66 90                	xchg   %ax,%ax
80103436:	66 90                	xchg   %ax,%ax
80103438:	66 90                	xchg   %ax,%ax
8010343a:	66 90                	xchg   %ax,%ax
8010343c:	66 90                	xchg   %ax,%ax
8010343e:	66 90                	xchg   %ax,%ax

80103440 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103440:	55                   	push   %ebp
80103441:	89 e5                	mov    %esp,%ebp
80103443:	57                   	push   %edi
80103444:	56                   	push   %esi
80103445:	53                   	push   %ebx
80103446:	83 ec 0c             	sub    $0xc,%esp
80103449:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010344c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010344f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103455:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010345b:	e8 d0 d9 ff ff       	call   80100e30 <filealloc>
80103460:	89 03                	mov    %eax,(%ebx)
80103462:	85 c0                	test   %eax,%eax
80103464:	0f 84 a8 00 00 00    	je     80103512 <pipealloc+0xd2>
8010346a:	e8 c1 d9 ff ff       	call   80100e30 <filealloc>
8010346f:	89 06                	mov    %eax,(%esi)
80103471:	85 c0                	test   %eax,%eax
80103473:	0f 84 87 00 00 00    	je     80103500 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103479:	e8 02 f2 ff ff       	call   80102680 <kalloc>
8010347e:	89 c7                	mov    %eax,%edi
80103480:	85 c0                	test   %eax,%eax
80103482:	0f 84 b0 00 00 00    	je     80103538 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
80103488:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010348f:	00 00 00 
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103492:	83 ec 08             	sub    $0x8,%esp
  p->writeopen = 1;
80103495:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010349c:	00 00 00 
  p->nwrite = 0;
8010349f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801034a6:	00 00 00 
  p->nread = 0;
801034a9:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801034b0:	00 00 00 
  initlock(&p->lock, "pipe");
801034b3:	68 5b 7a 10 80       	push   $0x80107a5b
801034b8:	50                   	push   %eax
801034b9:	e8 52 11 00 00       	call   80104610 <initlock>
  (*f0)->type = FD_PIPE;
801034be:	8b 03                	mov    (%ebx),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801034c0:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
801034c3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
801034c9:	8b 03                	mov    (%ebx),%eax
801034cb:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
801034cf:	8b 03                	mov    (%ebx),%eax
801034d1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
801034d5:	8b 03                	mov    (%ebx),%eax
801034d7:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
801034da:	8b 06                	mov    (%esi),%eax
801034dc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801034e2:	8b 06                	mov    (%esi),%eax
801034e4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
801034e8:	8b 06                	mov    (%esi),%eax
801034ea:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
801034ee:	8b 06                	mov    (%esi),%eax
801034f0:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801034f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801034f6:	31 c0                	xor    %eax,%eax
}
801034f8:	5b                   	pop    %ebx
801034f9:	5e                   	pop    %esi
801034fa:	5f                   	pop    %edi
801034fb:	5d                   	pop    %ebp
801034fc:	c3                   	ret    
801034fd:	8d 76 00             	lea    0x0(%esi),%esi
  if(*f0)
80103500:	8b 03                	mov    (%ebx),%eax
80103502:	85 c0                	test   %eax,%eax
80103504:	74 1e                	je     80103524 <pipealloc+0xe4>
    fileclose(*f0);
80103506:	83 ec 0c             	sub    $0xc,%esp
80103509:	50                   	push   %eax
8010350a:	e8 e1 d9 ff ff       	call   80100ef0 <fileclose>
8010350f:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103512:	8b 06                	mov    (%esi),%eax
80103514:	85 c0                	test   %eax,%eax
80103516:	74 0c                	je     80103524 <pipealloc+0xe4>
    fileclose(*f1);
80103518:	83 ec 0c             	sub    $0xc,%esp
8010351b:	50                   	push   %eax
8010351c:	e8 cf d9 ff ff       	call   80100ef0 <fileclose>
80103521:	83 c4 10             	add    $0x10,%esp
}
80103524:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
80103527:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010352c:	5b                   	pop    %ebx
8010352d:	5e                   	pop    %esi
8010352e:	5f                   	pop    %edi
8010352f:	5d                   	pop    %ebp
80103530:	c3                   	ret    
80103531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(*f0)
80103538:	8b 03                	mov    (%ebx),%eax
8010353a:	85 c0                	test   %eax,%eax
8010353c:	75 c8                	jne    80103506 <pipealloc+0xc6>
8010353e:	eb d2                	jmp    80103512 <pipealloc+0xd2>

80103540 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103540:	55                   	push   %ebp
80103541:	89 e5                	mov    %esp,%ebp
80103543:	56                   	push   %esi
80103544:	53                   	push   %ebx
80103545:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103548:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010354b:	83 ec 0c             	sub    $0xc,%esp
8010354e:	53                   	push   %ebx
8010354f:	e8 8c 12 00 00       	call   801047e0 <acquire>
  if(writable){
80103554:	83 c4 10             	add    $0x10,%esp
80103557:	85 f6                	test   %esi,%esi
80103559:	74 65                	je     801035c0 <pipeclose+0x80>
    p->writeopen = 0;
    wakeup(&p->nread);
8010355b:	83 ec 0c             	sub    $0xc,%esp
8010355e:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
    p->writeopen = 0;
80103564:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010356b:	00 00 00 
    wakeup(&p->nread);
8010356e:	50                   	push   %eax
8010356f:	e8 fc 0d 00 00       	call   80104370 <wakeup>
80103574:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103577:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010357d:	85 d2                	test   %edx,%edx
8010357f:	75 0a                	jne    8010358b <pipeclose+0x4b>
80103581:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103587:	85 c0                	test   %eax,%eax
80103589:	74 15                	je     801035a0 <pipeclose+0x60>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010358b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010358e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103591:	5b                   	pop    %ebx
80103592:	5e                   	pop    %esi
80103593:	5d                   	pop    %ebp
    release(&p->lock);
80103594:	e9 e7 11 00 00       	jmp    80104780 <release>
80103599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    release(&p->lock);
801035a0:	83 ec 0c             	sub    $0xc,%esp
801035a3:	53                   	push   %ebx
801035a4:	e8 d7 11 00 00       	call   80104780 <release>
    kfree((char*)p);
801035a9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801035ac:	83 c4 10             	add    $0x10,%esp
}
801035af:	8d 65 f8             	lea    -0x8(%ebp),%esp
801035b2:	5b                   	pop    %ebx
801035b3:	5e                   	pop    %esi
801035b4:	5d                   	pop    %ebp
    kfree((char*)p);
801035b5:	e9 06 ef ff ff       	jmp    801024c0 <kfree>
801035ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    wakeup(&p->nwrite);
801035c0:	83 ec 0c             	sub    $0xc,%esp
801035c3:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
    p->readopen = 0;
801035c9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801035d0:	00 00 00 
    wakeup(&p->nwrite);
801035d3:	50                   	push   %eax
801035d4:	e8 97 0d 00 00       	call   80104370 <wakeup>
801035d9:	83 c4 10             	add    $0x10,%esp
801035dc:	eb 99                	jmp    80103577 <pipeclose+0x37>
801035de:	66 90                	xchg   %ax,%ax

801035e0 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
801035e0:	55                   	push   %ebp
801035e1:	89 e5                	mov    %esp,%ebp
801035e3:	57                   	push   %edi
801035e4:	56                   	push   %esi
801035e5:	53                   	push   %ebx
801035e6:	83 ec 28             	sub    $0x28,%esp
801035e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
801035ec:	53                   	push   %ebx
801035ed:	e8 ee 11 00 00       	call   801047e0 <acquire>
  for(i = 0; i < n; i++){
801035f2:	8b 45 10             	mov    0x10(%ebp),%eax
801035f5:	83 c4 10             	add    $0x10,%esp
801035f8:	85 c0                	test   %eax,%eax
801035fa:	0f 8e c0 00 00 00    	jle    801036c0 <pipewrite+0xe0>
80103600:	8b 45 0c             	mov    0xc(%ebp),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103603:	8b 8b 38 02 00 00    	mov    0x238(%ebx),%ecx
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103609:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
8010360f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103612:	03 45 10             	add    0x10(%ebp),%eax
80103615:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103618:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010361e:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103624:	89 ca                	mov    %ecx,%edx
80103626:	05 00 02 00 00       	add    $0x200,%eax
8010362b:	39 c1                	cmp    %eax,%ecx
8010362d:	74 3f                	je     8010366e <pipewrite+0x8e>
8010362f:	eb 67                	jmp    80103698 <pipewrite+0xb8>
80103631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->readopen == 0 || myproc()->killed){
80103638:	e8 73 02 00 00       	call   801038b0 <myproc>
8010363d:	8b 48 24             	mov    0x24(%eax),%ecx
80103640:	85 c9                	test   %ecx,%ecx
80103642:	75 34                	jne    80103678 <pipewrite+0x98>
      wakeup(&p->nread);
80103644:	83 ec 0c             	sub    $0xc,%esp
80103647:	57                   	push   %edi
80103648:	e8 23 0d 00 00       	call   80104370 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010364d:	58                   	pop    %eax
8010364e:	5a                   	pop    %edx
8010364f:	53                   	push   %ebx
80103650:	56                   	push   %esi
80103651:	e8 0a 0b 00 00       	call   80104160 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103656:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010365c:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
80103662:	83 c4 10             	add    $0x10,%esp
80103665:	05 00 02 00 00       	add    $0x200,%eax
8010366a:	39 c2                	cmp    %eax,%edx
8010366c:	75 2a                	jne    80103698 <pipewrite+0xb8>
      if(p->readopen == 0 || myproc()->killed){
8010366e:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103674:	85 c0                	test   %eax,%eax
80103676:	75 c0                	jne    80103638 <pipewrite+0x58>
        release(&p->lock);
80103678:	83 ec 0c             	sub    $0xc,%esp
8010367b:	53                   	push   %ebx
8010367c:	e8 ff 10 00 00       	call   80104780 <release>
        return -1;
80103681:	83 c4 10             	add    $0x10,%esp
80103684:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103689:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010368c:	5b                   	pop    %ebx
8010368d:	5e                   	pop    %esi
8010368e:	5f                   	pop    %edi
8010368f:	5d                   	pop    %ebp
80103690:	c3                   	ret    
80103691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103698:	8b 75 e4             	mov    -0x1c(%ebp),%esi
8010369b:	8d 4a 01             	lea    0x1(%edx),%ecx
8010369e:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801036a4:	89 8b 38 02 00 00    	mov    %ecx,0x238(%ebx)
801036aa:	0f b6 06             	movzbl (%esi),%eax
  for(i = 0; i < n; i++){
801036ad:	83 c6 01             	add    $0x1,%esi
801036b0:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801036b3:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
801036b7:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801036ba:	0f 85 58 ff ff ff    	jne    80103618 <pipewrite+0x38>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
801036c0:	83 ec 0c             	sub    $0xc,%esp
801036c3:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801036c9:	50                   	push   %eax
801036ca:	e8 a1 0c 00 00       	call   80104370 <wakeup>
  release(&p->lock);
801036cf:	89 1c 24             	mov    %ebx,(%esp)
801036d2:	e8 a9 10 00 00       	call   80104780 <release>
  return n;
801036d7:	8b 45 10             	mov    0x10(%ebp),%eax
801036da:	83 c4 10             	add    $0x10,%esp
801036dd:	eb aa                	jmp    80103689 <pipewrite+0xa9>
801036df:	90                   	nop

801036e0 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
801036e0:	55                   	push   %ebp
801036e1:	89 e5                	mov    %esp,%ebp
801036e3:	57                   	push   %edi
801036e4:	56                   	push   %esi
801036e5:	53                   	push   %ebx
801036e6:	83 ec 18             	sub    $0x18,%esp
801036e9:	8b 75 08             	mov    0x8(%ebp),%esi
801036ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801036ef:	56                   	push   %esi
801036f0:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801036f6:	e8 e5 10 00 00       	call   801047e0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801036fb:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103701:	83 c4 10             	add    $0x10,%esp
80103704:	39 86 38 02 00 00    	cmp    %eax,0x238(%esi)
8010370a:	74 2f                	je     8010373b <piperead+0x5b>
8010370c:	eb 37                	jmp    80103745 <piperead+0x65>
8010370e:	66 90                	xchg   %ax,%ax
    if(myproc()->killed){
80103710:	e8 9b 01 00 00       	call   801038b0 <myproc>
80103715:	8b 48 24             	mov    0x24(%eax),%ecx
80103718:	85 c9                	test   %ecx,%ecx
8010371a:	0f 85 80 00 00 00    	jne    801037a0 <piperead+0xc0>
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103720:	83 ec 08             	sub    $0x8,%esp
80103723:	56                   	push   %esi
80103724:	53                   	push   %ebx
80103725:	e8 36 0a 00 00       	call   80104160 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010372a:	8b 86 38 02 00 00    	mov    0x238(%esi),%eax
80103730:	83 c4 10             	add    $0x10,%esp
80103733:	39 86 34 02 00 00    	cmp    %eax,0x234(%esi)
80103739:	75 0a                	jne    80103745 <piperead+0x65>
8010373b:	8b 86 40 02 00 00    	mov    0x240(%esi),%eax
80103741:	85 c0                	test   %eax,%eax
80103743:	75 cb                	jne    80103710 <piperead+0x30>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103745:	8b 55 10             	mov    0x10(%ebp),%edx
80103748:	31 db                	xor    %ebx,%ebx
8010374a:	85 d2                	test   %edx,%edx
8010374c:	7f 20                	jg     8010376e <piperead+0x8e>
8010374e:	eb 2c                	jmp    8010377c <piperead+0x9c>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103750:	8d 48 01             	lea    0x1(%eax),%ecx
80103753:	25 ff 01 00 00       	and    $0x1ff,%eax
80103758:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010375e:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
80103763:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103766:	83 c3 01             	add    $0x1,%ebx
80103769:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010376c:	74 0e                	je     8010377c <piperead+0x9c>
    if(p->nread == p->nwrite)
8010376e:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103774:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010377a:	75 d4                	jne    80103750 <piperead+0x70>
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010377c:	83 ec 0c             	sub    $0xc,%esp
8010377f:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103785:	50                   	push   %eax
80103786:	e8 e5 0b 00 00       	call   80104370 <wakeup>
  release(&p->lock);
8010378b:	89 34 24             	mov    %esi,(%esp)
8010378e:	e8 ed 0f 00 00       	call   80104780 <release>
  return i;
80103793:	83 c4 10             	add    $0x10,%esp
}
80103796:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103799:	89 d8                	mov    %ebx,%eax
8010379b:	5b                   	pop    %ebx
8010379c:	5e                   	pop    %esi
8010379d:	5f                   	pop    %edi
8010379e:	5d                   	pop    %ebp
8010379f:	c3                   	ret    
      release(&p->lock);
801037a0:	83 ec 0c             	sub    $0xc,%esp
      return -1;
801037a3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
801037a8:	56                   	push   %esi
801037a9:	e8 d2 0f 00 00       	call   80104780 <release>
      return -1;
801037ae:	83 c4 10             	add    $0x10,%esp
}
801037b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801037b4:	89 d8                	mov    %ebx,%eax
801037b6:	5b                   	pop    %ebx
801037b7:	5e                   	pop    %esi
801037b8:	5f                   	pop    %edi
801037b9:	5d                   	pop    %ebp
801037ba:	c3                   	ret    
801037bb:	66 90                	xchg   %ax,%ax
801037bd:	66 90                	xchg   %ax,%ax
801037bf:	90                   	nop

801037c0 <forkret>:
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void) {
801037c0:	55                   	push   %ebp
801037c1:	89 e5                	mov    %esp,%ebp
801037c3:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801037c6:	68 20 1d 11 80       	push   $0x80111d20
801037cb:	e8 b0 0f 00 00       	call   80104780 <release>

  if (first) {
801037d0:	a1 00 a0 10 80       	mov    0x8010a000,%eax
801037d5:	83 c4 10             	add    $0x10,%esp
801037d8:	85 c0                	test   %eax,%eax
801037da:	75 04                	jne    801037e0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801037dc:	c9                   	leave  
801037dd:	c3                   	ret    
801037de:	66 90                	xchg   %ax,%ax
    first = 0;
801037e0:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801037e7:	00 00 00 
    iinit(ROOTDEV);
801037ea:	83 ec 0c             	sub    $0xc,%esp
801037ed:	6a 01                	push   $0x1
801037ef:	e8 6c dd ff ff       	call   80101560 <iinit>
    initlog(ROOTDEV);
801037f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801037fb:	e8 c0 f4 ff ff       	call   80102cc0 <initlog>
}
80103800:	83 c4 10             	add    $0x10,%esp
80103803:	c9                   	leave  
80103804:	c3                   	ret    
80103805:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010380c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103810 <pinit>:
void pinit(void) {
80103810:	55                   	push   %ebp
80103811:	89 e5                	mov    %esp,%ebp
80103813:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103816:	68 60 7a 10 80       	push   $0x80107a60
8010381b:	68 20 1d 11 80       	push   $0x80111d20
80103820:	e8 eb 0d 00 00       	call   80104610 <initlock>
}
80103825:	83 c4 10             	add    $0x10,%esp
80103828:	c9                   	leave  
80103829:	c3                   	ret    
8010382a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103830 <mycpu>:
struct cpu *mycpu(void) {
80103830:	55                   	push   %ebp
80103831:	89 e5                	mov    %esp,%ebp
80103833:	56                   	push   %esi
80103834:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103835:	9c                   	pushf  
80103836:	58                   	pop    %eax
  if (readeflags() & FL_IF)
80103837:	f6 c4 02             	test   $0x2,%ah
8010383a:	75 46                	jne    80103882 <mycpu+0x52>
  apicid = lapicid();
8010383c:	e8 af f0 ff ff       	call   801028f0 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103841:	8b 35 84 17 11 80    	mov    0x80111784,%esi
80103847:	85 f6                	test   %esi,%esi
80103849:	7e 2a                	jle    80103875 <mycpu+0x45>
8010384b:	31 d2                	xor    %edx,%edx
8010384d:	eb 08                	jmp    80103857 <mycpu+0x27>
8010384f:	90                   	nop
80103850:	83 c2 01             	add    $0x1,%edx
80103853:	39 f2                	cmp    %esi,%edx
80103855:	74 1e                	je     80103875 <mycpu+0x45>
    if (cpus[i].apicid == apicid)
80103857:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
8010385d:	0f b6 99 a0 17 11 80 	movzbl -0x7feee860(%ecx),%ebx
80103864:	39 c3                	cmp    %eax,%ebx
80103866:	75 e8                	jne    80103850 <mycpu+0x20>
}
80103868:	8d 65 f8             	lea    -0x8(%ebp),%esp
      return &cpus[i];
8010386b:	8d 81 a0 17 11 80    	lea    -0x7feee860(%ecx),%eax
}
80103871:	5b                   	pop    %ebx
80103872:	5e                   	pop    %esi
80103873:	5d                   	pop    %ebp
80103874:	c3                   	ret    
  panic("unknown apicid\n");
80103875:	83 ec 0c             	sub    $0xc,%esp
80103878:	68 67 7a 10 80       	push   $0x80107a67
8010387d:	e8 fe ca ff ff       	call   80100380 <panic>
    panic("mycpu called with interrupts enabled\n");
80103882:	83 ec 0c             	sub    $0xc,%esp
80103885:	68 4c 7b 10 80       	push   $0x80107b4c
8010388a:	e8 f1 ca ff ff       	call   80100380 <panic>
8010388f:	90                   	nop

80103890 <cpuid>:
int cpuid() {
80103890:	55                   	push   %ebp
80103891:	89 e5                	mov    %esp,%ebp
80103893:	83 ec 08             	sub    $0x8,%esp
  return mycpu() - cpus;
80103896:	e8 95 ff ff ff       	call   80103830 <mycpu>
}
8010389b:	c9                   	leave  
  return mycpu() - cpus;
8010389c:	2d a0 17 11 80       	sub    $0x801117a0,%eax
801038a1:	c1 f8 04             	sar    $0x4,%eax
801038a4:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
801038aa:	c3                   	ret    
801038ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801038af:	90                   	nop

801038b0 <myproc>:
struct proc *myproc(void) {
801038b0:	55                   	push   %ebp
801038b1:	89 e5                	mov    %esp,%ebp
801038b3:	53                   	push   %ebx
801038b4:	83 ec 04             	sub    $0x4,%esp
  pushcli();
801038b7:	e8 d4 0d 00 00       	call   80104690 <pushcli>
  c = mycpu();
801038bc:	e8 6f ff ff ff       	call   80103830 <mycpu>
  p = c->proc;
801038c1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038c7:	e8 14 0e 00 00       	call   801046e0 <popcli>
}
801038cc:	89 d8                	mov    %ebx,%eax
801038ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038d1:	c9                   	leave  
801038d2:	c3                   	ret    
801038d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801038da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801038e0 <mystrcmp>:
int mystrcmp(const char *p, const char *q) {
801038e0:	55                   	push   %ebp
801038e1:	89 e5                	mov    %esp,%ebp
801038e3:	53                   	push   %ebx
801038e4:	8b 55 08             	mov    0x8(%ebp),%edx
801038e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
801038ea:	0f b6 02             	movzbl (%edx),%eax
801038ed:	84 c0                	test   %al,%al
801038ef:	75 17                	jne    80103908 <mystrcmp+0x28>
801038f1:	eb 3a                	jmp    8010392d <mystrcmp+0x4d>
801038f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801038f7:	90                   	nop
801038f8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
801038fc:	83 c2 01             	add    $0x1,%edx
801038ff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
80103902:	84 c0                	test   %al,%al
80103904:	74 1a                	je     80103920 <mystrcmp+0x40>
    p++, q++;
80103906:	89 d9                	mov    %ebx,%ecx
  while (*p && *p == *q)
80103908:	0f b6 19             	movzbl (%ecx),%ebx
8010390b:	38 c3                	cmp    %al,%bl
8010390d:	74 e9                	je     801038f8 <mystrcmp+0x18>
  return (uchar)*p - (uchar)*q;
8010390f:	29 d8                	sub    %ebx,%eax
}
80103911:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103914:	c9                   	leave  
80103915:	c3                   	ret    
80103916:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010391d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
80103920:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
80103924:	31 c0                	xor    %eax,%eax
80103926:	29 d8                	sub    %ebx,%eax
}
80103928:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010392b:	c9                   	leave  
8010392c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
8010392d:	0f b6 19             	movzbl (%ecx),%ebx
80103930:	31 c0                	xor    %eax,%eax
80103932:	eb db                	jmp    8010390f <mystrcmp+0x2f>
80103934:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010393b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010393f:	90                   	nop

80103940 <writelog>:
              int next_pstate) {
80103940:	55                   	push   %ebp
80103941:	89 e5                	mov    %esp,%ebp
80103943:	57                   	push   %edi
80103944:	56                   	push   %esi
80103945:	53                   	push   %ebx
80103946:	83 ec 1c             	sub    $0x1c,%esp
  if (buf_rest_size > 0 && !mystrcmp(pname, "bufwrite")) {
80103949:	8b 3d 54 3d 11 80    	mov    0x80113d54,%edi
              int next_pstate) {
8010394f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103952:	8b 75 10             	mov    0x10(%ebp),%esi
  if (buf_rest_size > 0 && !mystrcmp(pname, "bufwrite")) {
80103955:	85 ff                	test   %edi,%edi
80103957:	7e 2d                	jle    80103986 <writelog+0x46>
  while (*p && *p == *q)
80103959:	0f b6 11             	movzbl (%ecx),%edx
8010395c:	b8 01 00 00 00       	mov    $0x1,%eax
80103961:	bb 62 00 00 00       	mov    $0x62,%ebx
80103966:	84 d2                	test   %dl,%dl
80103968:	75 18                	jne    80103982 <writelog+0x42>
8010396a:	eb 1a                	jmp    80103986 <writelog+0x46>
8010396c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103970:	0f b6 14 01          	movzbl (%ecx,%eax,1),%edx
80103974:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
80103977:	0f b6 98 76 7a 10 80 	movzbl -0x7fef858a(%eax),%ebx
  while (*p && *p == *q)
8010397e:	84 d2                	test   %dl,%dl
80103980:	74 0e                	je     80103990 <writelog+0x50>
80103982:	38 d3                	cmp    %dl,%bl
80103984:	74 ea                	je     80103970 <writelog+0x30>
}
80103986:	83 c4 1c             	add    $0x1c,%esp
80103989:	5b                   	pop    %ebx
8010398a:	5e                   	pop    %esi
8010398b:	5f                   	pop    %edi
8010398c:	5d                   	pop    %ebp
8010398d:	c3                   	ret    
8010398e:	66 90                	xchg   %ax,%ax
  if (buf_rest_size > 0 && !mystrcmp(pname, "bufwrite")) {
80103990:	84 db                	test   %bl,%bl
80103992:	75 f2                	jne    80103986 <writelog+0x46>
    buf_log[LOGBUFSIZE - buf_rest_size].clock = rdtsc();
80103994:	b8 bc 02 00 00       	mov    $0x2bc,%eax
80103999:	29 f8                	sub    %edi,%eax
8010399b:	89 c7                	mov    %eax,%edi
8010399d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  __asm__ __volatile__("rdtsc" : "=a"(lo), "=d"(hi));
801039a0:	0f 31                	rdtsc  
    buf_log[LOGBUFSIZE - buf_rest_size].clock = rdtsc();
801039a2:	6b df 2c             	imul   $0x2c,%edi,%ebx
801039a5:	89 83 64 3d 11 80    	mov    %eax,-0x7feec29c(%ebx)
    buf_log[LOGBUFSIZE - buf_rest_size].pid   = pid;
801039ab:	8b 45 08             	mov    0x8(%ebp),%eax
    buf_log[LOGBUFSIZE - buf_rest_size].clock = rdtsc();
801039ae:	89 93 60 3d 11 80    	mov    %edx,-0x7feec2a0(%ebx)
    for (int i = 0; i < 16; i++) {
801039b4:	31 d2                	xor    %edx,%edx
    buf_log[LOGBUFSIZE - buf_rest_size].pid   = pid;
801039b6:	89 83 68 3d 11 80    	mov    %eax,-0x7feec298(%ebx)
    for (int i = 0; i < 16; i++) {
801039bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      buf_log[LOGBUFSIZE - buf_rest_size].name[i] = pname[i];
801039c0:	0f b6 04 11          	movzbl (%ecx,%edx,1),%eax
801039c4:	88 84 13 6c 3d 11 80 	mov    %al,-0x7feec294(%ebx,%edx,1)
    for (int i = 0; i < 16; i++) {
801039cb:	83 c2 01             	add    $0x1,%edx
801039ce:	83 fa 10             	cmp    $0x10,%edx
801039d1:	75 ed                	jne    801039c0 <writelog+0x80>
    buf_log[LOGBUFSIZE - buf_rest_size].event_name  = event_name;
801039d3:	6b 5d e4 2c          	imul   $0x2c,-0x1c(%ebp),%ebx
801039d7:	89 f0                	mov    %esi,%eax
801039d9:	0f be f0             	movsbl %al,%esi
    buf_log[LOGBUFSIZE - buf_rest_size].prev_pstate = prev_pstate;
801039dc:	8b 45 14             	mov    0x14(%ebp),%eax
801039df:	89 83 80 3d 11 80    	mov    %eax,-0x7feec280(%ebx)
    buf_log[LOGBUFSIZE - buf_rest_size].next_pstate = next_pstate;
801039e5:	8b 45 18             	mov    0x18(%ebp),%eax
    buf_log[LOGBUFSIZE - buf_rest_size].event_name  = event_name;
801039e8:	89 b3 7c 3d 11 80    	mov    %esi,-0x7feec284(%ebx)
    buf_log[LOGBUFSIZE - buf_rest_size].next_pstate = next_pstate;
801039ee:	89 83 84 3d 11 80    	mov    %eax,-0x7feec27c(%ebx)
  return mycpu() - cpus;
801039f4:	e8 37 fe ff ff       	call   80103830 <mycpu>
    buf_rest_size--;
801039f9:	83 2d 54 3d 11 80 01 	subl   $0x1,0x80113d54
  return mycpu() - cpus;
80103a00:	2d a0 17 11 80       	sub    $0x801117a0,%eax
80103a05:	c1 f8 04             	sar    $0x4,%eax
80103a08:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
    buf_log[LOGBUFSIZE - buf_rest_size].cpu         = cpuid();
80103a0e:	89 83 88 3d 11 80    	mov    %eax,-0x7feec278(%ebx)
}
80103a14:	83 c4 1c             	add    $0x1c,%esp
80103a17:	5b                   	pop    %ebx
80103a18:	5e                   	pop    %esi
80103a19:	5f                   	pop    %edi
80103a1a:	5d                   	pop    %ebp
80103a1b:	c3                   	ret    
80103a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103a20 <allocproc>:
static struct proc *allocproc(void) {
80103a20:	55                   	push   %ebp
80103a21:	89 e5                	mov    %esp,%ebp
80103a23:	53                   	push   %ebx
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103a24:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
static struct proc *allocproc(void) {
80103a29:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
80103a2c:	68 20 1d 11 80       	push   $0x80111d20
80103a31:	e8 aa 0d 00 00       	call   801047e0 <acquire>
80103a36:	83 c4 10             	add    $0x10,%esp
80103a39:	eb 14                	jmp    80103a4f <allocproc+0x2f>
80103a3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103a3f:	90                   	nop
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103a40:	83 eb 80             	sub    $0xffffff80,%ebx
80103a43:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103a49:	0f 84 91 00 00 00    	je     80103ae0 <allocproc+0xc0>
    if (p->state == UNUSED)
80103a4f:	8b 43 0c             	mov    0xc(%ebx),%eax
80103a52:	85 c0                	test   %eax,%eax
80103a54:	75 ea                	jne    80103a40 <allocproc+0x20>
  p->pid = nextpid++;
80103a56:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  writelog(p->pid, p->name, ALLOCPROC, p->state, EMBRYO);
80103a5b:	83 ec 0c             	sub    $0xc,%esp
  p->priority = MAX_PRIO;
80103a5e:	c7 43 7c 64 00 00 00 	movl   $0x64,0x7c(%ebx)
  p->pid = nextpid++;
80103a65:	8d 50 01             	lea    0x1(%eax),%edx
80103a68:	89 43 10             	mov    %eax,0x10(%ebx)
80103a6b:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  writelog(p->pid, p->name, ALLOCPROC, p->state, EMBRYO);
80103a71:	8d 53 6c             	lea    0x6c(%ebx),%edx
80103a74:	6a 01                	push   $0x1
80103a76:	6a 00                	push   $0x0
80103a78:	6a 00                	push   $0x0
80103a7a:	52                   	push   %edx
80103a7b:	50                   	push   %eax
80103a7c:	e8 bf fe ff ff       	call   80103940 <writelog>
  release(&ptable.lock);
80103a81:	83 c4 14             	add    $0x14,%esp
  p->state = EMBRYO;
80103a84:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  release(&ptable.lock);
80103a8b:	68 20 1d 11 80       	push   $0x80111d20
80103a90:	e8 eb 0c 00 00       	call   80104780 <release>
  if ((p->kstack = kalloc()) == 0) {
80103a95:	e8 e6 eb ff ff       	call   80102680 <kalloc>
80103a9a:	83 c4 10             	add    $0x10,%esp
80103a9d:	89 43 08             	mov    %eax,0x8(%ebx)
80103aa0:	85 c0                	test   %eax,%eax
80103aa2:	74 55                	je     80103af9 <allocproc+0xd9>
  sp -= sizeof *p->tf;
80103aa4:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  memset(p->context, 0, sizeof *p->context);
80103aaa:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
80103aad:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
80103ab2:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint *)sp = (uint)trapret;
80103ab5:	c7 40 14 d2 5b 10 80 	movl   $0x80105bd2,0x14(%eax)
  p->context = (struct context *)sp;
80103abc:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103abf:	6a 14                	push   $0x14
80103ac1:	6a 00                	push   $0x0
80103ac3:	50                   	push   %eax
80103ac4:	e8 d7 0d 00 00       	call   801048a0 <memset>
  p->context->eip = (uint)forkret;
80103ac9:	8b 43 1c             	mov    0x1c(%ebx),%eax
  return p;
80103acc:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
80103acf:	c7 40 10 c0 37 10 80 	movl   $0x801037c0,0x10(%eax)
}
80103ad6:	89 d8                	mov    %ebx,%eax
80103ad8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103adb:	c9                   	leave  
80103adc:	c3                   	ret    
80103add:	8d 76 00             	lea    0x0(%esi),%esi
  release(&ptable.lock);
80103ae0:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103ae3:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
80103ae5:	68 20 1d 11 80       	push   $0x80111d20
80103aea:	e8 91 0c 00 00       	call   80104780 <release>
}
80103aef:	89 d8                	mov    %ebx,%eax
  return 0;
80103af1:	83 c4 10             	add    $0x10,%esp
}
80103af4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103af7:	c9                   	leave  
80103af8:	c3                   	ret    
    p->state = UNUSED;
80103af9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103b00:	31 db                	xor    %ebx,%ebx
}
80103b02:	89 d8                	mov    %ebx,%eax
80103b04:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b07:	c9                   	leave  
80103b08:	c3                   	ret    
80103b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103b10 <wakeup1>:
}

// PAGEBREAK!
//  Wake up all processes sleeping on chan.
//  The ptable lock must be held.
static void wakeup1(void *chan) {
80103b10:	55                   	push   %ebp
80103b11:	89 e5                	mov    %esp,%ebp
80103b13:	56                   	push   %esi
80103b14:	89 c6                	mov    %eax,%esi
80103b16:	53                   	push   %ebx
80103b17:	bb c0 1d 11 80       	mov    $0x80111dc0,%ebx
80103b1c:	eb 0d                	jmp    80103b2b <wakeup1+0x1b>
80103b1e:	66 90                	xchg   %ax,%ax
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b20:	83 eb 80             	sub    $0xffffff80,%ebx
80103b23:	81 fb c0 3d 11 80    	cmp    $0x80113dc0,%ebx
80103b29:	74 38                	je     80103b63 <wakeup1+0x53>
    if (p->state == SLEEPING && p->chan == chan) {
80103b2b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80103b2f:	75 ef                	jne    80103b20 <wakeup1+0x10>
80103b31:	39 73 b4             	cmp    %esi,-0x4c(%ebx)
80103b34:	75 ea                	jne    80103b20 <wakeup1+0x10>
      // added
      writelog(p->pid, p->name, WAKEUP, p->state, RUNNABLE);
80103b36:	83 ec 0c             	sub    $0xc,%esp
80103b39:	6a 03                	push   $0x3
80103b3b:	6a 02                	push   $0x2
80103b3d:	6a 01                	push   $0x1
80103b3f:	53                   	push   %ebx
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b40:	83 eb 80             	sub    $0xffffff80,%ebx
      writelog(p->pid, p->name, WAKEUP, p->state, RUNNABLE);
80103b43:	ff b3 24 ff ff ff    	push   -0xdc(%ebx)
80103b49:	e8 f2 fd ff ff       	call   80103940 <writelog>

      p->state = RUNNABLE;
80103b4e:	83 c4 20             	add    $0x20,%esp
80103b51:	c7 83 20 ff ff ff 03 	movl   $0x3,-0xe0(%ebx)
80103b58:	00 00 00 
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b5b:	81 fb c0 3d 11 80    	cmp    $0x80113dc0,%ebx
80103b61:	75 c8                	jne    80103b2b <wakeup1+0x1b>
    }
}
80103b63:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b66:	5b                   	pop    %ebx
80103b67:	5e                   	pop    %esi
80103b68:	5d                   	pop    %ebp
80103b69:	c3                   	ret    
80103b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103b70 <userinit>:
void userinit(void) {
80103b70:	55                   	push   %ebp
80103b71:	89 e5                	mov    %esp,%ebp
80103b73:	53                   	push   %ebx
80103b74:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
80103b77:	e8 a4 fe ff ff       	call   80103a20 <allocproc>
80103b7c:	89 c3                	mov    %eax,%ebx
  initproc = p;
80103b7e:	a3 b0 b5 11 80       	mov    %eax,0x8011b5b0
  if ((p->pgdir = setupkvm()) == 0)
80103b83:	e8 38 36 00 00       	call   801071c0 <setupkvm>
80103b88:	89 43 04             	mov    %eax,0x4(%ebx)
80103b8b:	85 c0                	test   %eax,%eax
80103b8d:	0f 84 bd 00 00 00    	je     80103c50 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103b93:	83 ec 04             	sub    $0x4,%esp
80103b96:	68 2c 00 00 00       	push   $0x2c
80103b9b:	68 60 a4 10 80       	push   $0x8010a460
80103ba0:	50                   	push   %eax
80103ba1:	e8 ca 32 00 00       	call   80106e70 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103ba6:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103ba9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103baf:	6a 4c                	push   $0x4c
80103bb1:	6a 00                	push   $0x0
80103bb3:	ff 73 18             	push   0x18(%ebx)
80103bb6:	e8 e5 0c 00 00       	call   801048a0 <memset>
  p->tf->cs     = (SEG_UCODE << 3) | DPL_USER;
80103bbb:	8b 43 18             	mov    0x18(%ebx),%eax
80103bbe:	ba 1b 00 00 00       	mov    $0x1b,%edx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103bc3:	83 c4 0c             	add    $0xc,%esp
  p->tf->ds     = (SEG_UDATA << 3) | DPL_USER;
80103bc6:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->cs     = (SEG_UCODE << 3) | DPL_USER;
80103bcb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds     = (SEG_UDATA << 3) | DPL_USER;
80103bcf:	8b 43 18             	mov    0x18(%ebx),%eax
80103bd2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es     = p->tf->ds;
80103bd6:	8b 43 18             	mov    0x18(%ebx),%eax
80103bd9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103bdd:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss     = p->tf->ds;
80103be1:	8b 43 18             	mov    0x18(%ebx),%eax
80103be4:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103be8:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
80103bec:	8b 43 18             	mov    0x18(%ebx),%eax
80103bef:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp    = PGSIZE;
80103bf6:	8b 43 18             	mov    0x18(%ebx),%eax
80103bf9:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip    = 0; // beginning of initcode.S
80103c00:	8b 43 18             	mov    0x18(%ebx),%eax
80103c03:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103c0a:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103c0d:	6a 10                	push   $0x10
80103c0f:	68 99 7a 10 80       	push   $0x80107a99
80103c14:	50                   	push   %eax
80103c15:	e8 46 0e 00 00       	call   80104a60 <safestrcpy>
  p->cwd = namei("/");
80103c1a:	c7 04 24 a2 7a 10 80 	movl   $0x80107aa2,(%esp)
80103c21:	e8 7a e4 ff ff       	call   801020a0 <namei>
80103c26:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103c29:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103c30:	e8 ab 0b 00 00       	call   801047e0 <acquire>
  p->state = RUNNABLE;
80103c35:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
80103c3c:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103c43:	e8 38 0b 00 00       	call   80104780 <release>
}
80103c48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c4b:	83 c4 10             	add    $0x10,%esp
80103c4e:	c9                   	leave  
80103c4f:	c3                   	ret    
    panic("userinit: out of memory?");
80103c50:	83 ec 0c             	sub    $0xc,%esp
80103c53:	68 80 7a 10 80       	push   $0x80107a80
80103c58:	e8 23 c7 ff ff       	call   80100380 <panic>
80103c5d:	8d 76 00             	lea    0x0(%esi),%esi

80103c60 <growproc>:
int growproc(int n) {
80103c60:	55                   	push   %ebp
80103c61:	89 e5                	mov    %esp,%ebp
80103c63:	56                   	push   %esi
80103c64:	53                   	push   %ebx
80103c65:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
80103c68:	e8 23 0a 00 00       	call   80104690 <pushcli>
  c = mycpu();
80103c6d:	e8 be fb ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103c72:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103c78:	e8 63 0a 00 00       	call   801046e0 <popcli>
  sz = curproc->sz;
80103c7d:	8b 03                	mov    (%ebx),%eax
  if (n > 0) {
80103c7f:	85 f6                	test   %esi,%esi
80103c81:	7f 1d                	jg     80103ca0 <growproc+0x40>
  } else if (n < 0) {
80103c83:	75 3b                	jne    80103cc0 <growproc+0x60>
  switchuvm(curproc);
80103c85:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
80103c88:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
80103c8a:	53                   	push   %ebx
80103c8b:	e8 d0 30 00 00       	call   80106d60 <switchuvm>
  return 0;
80103c90:	83 c4 10             	add    $0x10,%esp
80103c93:	31 c0                	xor    %eax,%eax
}
80103c95:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103c98:	5b                   	pop    %ebx
80103c99:	5e                   	pop    %esi
80103c9a:	5d                   	pop    %ebp
80103c9b:	c3                   	ret    
80103c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if ((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103ca0:	83 ec 04             	sub    $0x4,%esp
80103ca3:	01 c6                	add    %eax,%esi
80103ca5:	56                   	push   %esi
80103ca6:	50                   	push   %eax
80103ca7:	ff 73 04             	push   0x4(%ebx)
80103caa:	e8 31 33 00 00       	call   80106fe0 <allocuvm>
80103caf:	83 c4 10             	add    $0x10,%esp
80103cb2:	85 c0                	test   %eax,%eax
80103cb4:	75 cf                	jne    80103c85 <growproc+0x25>
      return -1;
80103cb6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103cbb:	eb d8                	jmp    80103c95 <growproc+0x35>
80103cbd:	8d 76 00             	lea    0x0(%esi),%esi
    if ((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103cc0:	83 ec 04             	sub    $0x4,%esp
80103cc3:	01 c6                	add    %eax,%esi
80103cc5:	56                   	push   %esi
80103cc6:	50                   	push   %eax
80103cc7:	ff 73 04             	push   0x4(%ebx)
80103cca:	e8 41 34 00 00       	call   80107110 <deallocuvm>
80103ccf:	83 c4 10             	add    $0x10,%esp
80103cd2:	85 c0                	test   %eax,%eax
80103cd4:	75 af                	jne    80103c85 <growproc+0x25>
80103cd6:	eb de                	jmp    80103cb6 <growproc+0x56>
80103cd8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103cdf:	90                   	nop

80103ce0 <fork>:
int fork(void) {
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	57                   	push   %edi
80103ce4:	56                   	push   %esi
80103ce5:	53                   	push   %ebx
80103ce6:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103ce9:	e8 a2 09 00 00       	call   80104690 <pushcli>
  c = mycpu();
80103cee:	e8 3d fb ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103cf3:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103cf9:	e8 e2 09 00 00       	call   801046e0 <popcli>
  if ((np = allocproc()) == 0) {
80103cfe:	e8 1d fd ff ff       	call   80103a20 <allocproc>
80103d03:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103d06:	85 c0                	test   %eax,%eax
80103d08:	0f 84 cd 00 00 00    	je     80103ddb <fork+0xfb>
  if ((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0) {
80103d0e:	83 ec 08             	sub    $0x8,%esp
80103d11:	ff 33                	push   (%ebx)
80103d13:	89 c7                	mov    %eax,%edi
80103d15:	ff 73 04             	push   0x4(%ebx)
80103d18:	e8 93 35 00 00       	call   801072b0 <copyuvm>
80103d1d:	83 c4 10             	add    $0x10,%esp
80103d20:	89 47 04             	mov    %eax,0x4(%edi)
80103d23:	85 c0                	test   %eax,%eax
80103d25:	0f 84 b7 00 00 00    	je     80103de2 <fork+0x102>
  np->sz     = curproc->sz;
80103d2b:	8b 03                	mov    (%ebx),%eax
80103d2d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103d30:	89 01                	mov    %eax,(%ecx)
  *np->tf    = *curproc->tf;
80103d32:	8b 79 18             	mov    0x18(%ecx),%edi
  np->parent = curproc;
80103d35:	89 c8                	mov    %ecx,%eax
80103d37:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf    = *curproc->tf;
80103d3a:	b9 13 00 00 00       	mov    $0x13,%ecx
80103d3f:	8b 73 18             	mov    0x18(%ebx),%esi
80103d42:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for (i = 0; i < NOFILE; i++)
80103d44:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103d46:	8b 40 18             	mov    0x18(%eax),%eax
80103d49:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    if (curproc->ofile[i])
80103d50:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103d54:	85 c0                	test   %eax,%eax
80103d56:	74 13                	je     80103d6b <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103d58:	83 ec 0c             	sub    $0xc,%esp
80103d5b:	50                   	push   %eax
80103d5c:	e8 3f d1 ff ff       	call   80100ea0 <filedup>
80103d61:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103d64:	83 c4 10             	add    $0x10,%esp
80103d67:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for (i = 0; i < NOFILE; i++)
80103d6b:	83 c6 01             	add    $0x1,%esi
80103d6e:	83 fe 10             	cmp    $0x10,%esi
80103d71:	75 dd                	jne    80103d50 <fork+0x70>
  np->cwd = idup(curproc->cwd);
80103d73:	83 ec 0c             	sub    $0xc,%esp
80103d76:	ff 73 68             	push   0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103d79:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
80103d7c:	e8 cf d9 ff ff       	call   80101750 <idup>
80103d81:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103d84:	83 c4 0c             	add    $0xc,%esp
80103d87:	8d 77 6c             	lea    0x6c(%edi),%esi
  np->cwd = idup(curproc->cwd);
80103d8a:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103d8d:	6a 10                	push   $0x10
80103d8f:	53                   	push   %ebx
80103d90:	56                   	push   %esi
80103d91:	e8 ca 0c 00 00       	call   80104a60 <safestrcpy>
  pid = np->pid;
80103d96:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103d99:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103da0:	e8 3b 0a 00 00       	call   801047e0 <acquire>
  writelog(np->pid, np->name, FORK, np->state, RUNNABLE);
80103da5:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
80103dac:	ff 77 0c             	push   0xc(%edi)
80103daf:	6a 03                	push   $0x3
80103db1:	56                   	push   %esi
80103db2:	ff 77 10             	push   0x10(%edi)
80103db5:	e8 86 fb ff ff       	call   80103940 <writelog>
  release(&ptable.lock);
80103dba:	83 c4 14             	add    $0x14,%esp
  np->state = RUNNABLE;
80103dbd:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103dc4:	68 20 1d 11 80       	push   $0x80111d20
80103dc9:	e8 b2 09 00 00       	call   80104780 <release>
  return pid;
80103dce:	83 c4 10             	add    $0x10,%esp
}
80103dd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dd4:	89 d8                	mov    %ebx,%eax
80103dd6:	5b                   	pop    %ebx
80103dd7:	5e                   	pop    %esi
80103dd8:	5f                   	pop    %edi
80103dd9:	5d                   	pop    %ebp
80103dda:	c3                   	ret    
    return -1;
80103ddb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103de0:	eb ef                	jmp    80103dd1 <fork+0xf1>
    kfree(np->kstack);
80103de2:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103de5:	83 ec 0c             	sub    $0xc,%esp
80103de8:	ff 73 08             	push   0x8(%ebx)
80103deb:	e8 d0 e6 ff ff       	call   801024c0 <kfree>
    np->kstack = 0;
80103df0:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    return -1;
80103df7:	83 c4 10             	add    $0x10,%esp
    np->state  = UNUSED;
80103dfa:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103e01:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103e06:	eb c9                	jmp    80103dd1 <fork+0xf1>
80103e08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103e0f:	90                   	nop

80103e10 <boost_prio>:
void boost_prio(void) {
80103e10:	55                   	push   %ebp
80103e11:	89 e5                	mov    %esp,%ebp
80103e13:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);
80103e16:	68 20 1d 11 80       	push   $0x80111d20
80103e1b:	e8 c0 09 00 00       	call   801047e0 <acquire>
80103e20:	83 c4 10             	add    $0x10,%esp
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103e23:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103e28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103e2f:	90                   	nop
    p->priority = MAX_PRIO;
80103e30:	c7 40 7c 64 00 00 00 	movl   $0x64,0x7c(%eax)
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103e37:	83 e8 80             	sub    $0xffffff80,%eax
80103e3a:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103e3f:	75 ef                	jne    80103e30 <boost_prio+0x20>
  release(&ptable.lock);
80103e41:	83 ec 0c             	sub    $0xc,%esp
80103e44:	68 20 1d 11 80       	push   $0x80111d20
80103e49:	e8 32 09 00 00       	call   80104780 <release>
}
80103e4e:	83 c4 10             	add    $0x10,%esp
80103e51:	c9                   	leave  
80103e52:	c3                   	ret    
80103e53:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103e60 <scheduler>:
void scheduler(void) {
80103e60:	55                   	push   %ebp
80103e61:	89 e5                	mov    %esp,%ebp
80103e63:	57                   	push   %edi
80103e64:	56                   	push   %esi
80103e65:	53                   	push   %ebx
80103e66:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103e69:	e8 c2 f9 ff ff       	call   80103830 <mycpu>
  c->proc = 0;
80103e6e:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103e75:	00 00 00 
  struct cpu *c = mycpu();
80103e78:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103e7a:	8d 78 04             	lea    0x4(%eax),%edi
80103e7d:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
80103e80:	fb                   	sti    
    acquire(&ptable.lock);
80103e81:	83 ec 0c             	sub    $0xc,%esp
      for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103e84:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
    acquire(&ptable.lock);
80103e89:	68 20 1d 11 80       	push   $0x80111d20
80103e8e:	e8 4d 09 00 00       	call   801047e0 <acquire>
80103e93:	83 c4 10             	add    $0x10,%esp
80103e96:	eb 13                	jmp    80103eab <scheduler+0x4b>
80103e98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103e9f:	90                   	nop
      for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103ea0:	83 eb 80             	sub    $0xffffff80,%ebx
80103ea3:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103ea9:	74 5d                	je     80103f08 <scheduler+0xa8>
        if (p->state == RUNNABLE) {
80103eab:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103eaf:	75 ef                	jne    80103ea0 <scheduler+0x40>
          switchuvm(p);
80103eb1:	83 ec 0c             	sub    $0xc,%esp
          c->proc = p;
80103eb4:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
          switchuvm(p);
80103eba:	53                   	push   %ebx
80103ebb:	e8 a0 2e 00 00       	call   80106d60 <switchuvm>
          writelog(p->pid, p->name, TICK, p->state, RUNNING);
80103ec0:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103ec3:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
      for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103eca:	83 eb 80             	sub    $0xffffff80,%ebx
          writelog(p->pid, p->name, TICK, p->state, RUNNING);
80103ecd:	ff 73 8c             	push   -0x74(%ebx)
80103ed0:	6a 04                	push   $0x4
80103ed2:	50                   	push   %eax
80103ed3:	ff 73 90             	push   -0x70(%ebx)
80103ed6:	e8 65 fa ff ff       	call   80103940 <writelog>
          swtch(&(c->scheduler), p->context);
80103edb:	83 c4 18             	add    $0x18,%esp
80103ede:	ff 73 9c             	push   -0x64(%ebx)
80103ee1:	57                   	push   %edi
          p->state = RUNNING;
80103ee2:	c7 43 8c 04 00 00 00 	movl   $0x4,-0x74(%ebx)
          swtch(&(c->scheduler), p->context);
80103ee9:	e8 cd 0b 00 00       	call   80104abb <swtch>
          switchkvm();
80103eee:	e8 5d 2e 00 00       	call   80106d50 <switchkvm>
          c->proc = 0; // ???
80103ef3:	83 c4 10             	add    $0x10,%esp
80103ef6:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103efd:	00 00 00 
      for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103f00:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103f06:	75 a3                	jne    80103eab <scheduler+0x4b>
    release(&ptable.lock);
80103f08:	83 ec 0c             	sub    $0xc,%esp
80103f0b:	68 20 1d 11 80       	push   $0x80111d20
80103f10:	e8 6b 08 00 00       	call   80104780 <release>
    sti();
80103f15:	83 c4 10             	add    $0x10,%esp
80103f18:	e9 63 ff ff ff       	jmp    80103e80 <scheduler+0x20>
80103f1d:	8d 76 00             	lea    0x0(%esi),%esi

80103f20 <sched>:
void sched(void) {
80103f20:	55                   	push   %ebp
80103f21:	89 e5                	mov    %esp,%ebp
80103f23:	56                   	push   %esi
80103f24:	53                   	push   %ebx
  pushcli();
80103f25:	e8 66 07 00 00       	call   80104690 <pushcli>
  c = mycpu();
80103f2a:	e8 01 f9 ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103f2f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103f35:	e8 a6 07 00 00       	call   801046e0 <popcli>
  if (!holding(&ptable.lock))
80103f3a:	83 ec 0c             	sub    $0xc,%esp
80103f3d:	68 20 1d 11 80       	push   $0x80111d20
80103f42:	e8 f9 07 00 00       	call   80104740 <holding>
80103f47:	83 c4 10             	add    $0x10,%esp
80103f4a:	85 c0                	test   %eax,%eax
80103f4c:	74 4f                	je     80103f9d <sched+0x7d>
  if (mycpu()->ncli != 1)
80103f4e:	e8 dd f8 ff ff       	call   80103830 <mycpu>
80103f53:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103f5a:	75 68                	jne    80103fc4 <sched+0xa4>
  if (p->state == RUNNING)
80103f5c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103f60:	74 55                	je     80103fb7 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103f62:	9c                   	pushf  
80103f63:	58                   	pop    %eax
  if (readeflags() & FL_IF)
80103f64:	f6 c4 02             	test   $0x2,%ah
80103f67:	75 41                	jne    80103faa <sched+0x8a>
  intena = mycpu()->intena;
80103f69:	e8 c2 f8 ff ff       	call   80103830 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103f6e:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103f71:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103f77:	e8 b4 f8 ff ff       	call   80103830 <mycpu>
80103f7c:	83 ec 08             	sub    $0x8,%esp
80103f7f:	ff 70 04             	push   0x4(%eax)
80103f82:	53                   	push   %ebx
80103f83:	e8 33 0b 00 00       	call   80104abb <swtch>
  mycpu()->intena = intena;
80103f88:	e8 a3 f8 ff ff       	call   80103830 <mycpu>
}
80103f8d:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103f90:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103f96:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f99:	5b                   	pop    %ebx
80103f9a:	5e                   	pop    %esi
80103f9b:	5d                   	pop    %ebp
80103f9c:	c3                   	ret    
    panic("sched ptable.lock");
80103f9d:	83 ec 0c             	sub    $0xc,%esp
80103fa0:	68 a4 7a 10 80       	push   $0x80107aa4
80103fa5:	e8 d6 c3 ff ff       	call   80100380 <panic>
    panic("sched interruptible");
80103faa:	83 ec 0c             	sub    $0xc,%esp
80103fad:	68 d0 7a 10 80       	push   $0x80107ad0
80103fb2:	e8 c9 c3 ff ff       	call   80100380 <panic>
    panic("sched running");
80103fb7:	83 ec 0c             	sub    $0xc,%esp
80103fba:	68 c2 7a 10 80       	push   $0x80107ac2
80103fbf:	e8 bc c3 ff ff       	call   80100380 <panic>
    panic("sched locks");
80103fc4:	83 ec 0c             	sub    $0xc,%esp
80103fc7:	68 b6 7a 10 80       	push   $0x80107ab6
80103fcc:	e8 af c3 ff ff       	call   80100380 <panic>
80103fd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103fd8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103fdf:	90                   	nop

80103fe0 <exit>:
void exit(void) {
80103fe0:	55                   	push   %ebp
80103fe1:	89 e5                	mov    %esp,%ebp
80103fe3:	57                   	push   %edi
80103fe4:	56                   	push   %esi
80103fe5:	53                   	push   %ebx
80103fe6:	83 ec 0c             	sub    $0xc,%esp
  struct proc *curproc = myproc();
80103fe9:	e8 c2 f8 ff ff       	call   801038b0 <myproc>
  if (curproc == initproc)
80103fee:	39 05 b0 b5 11 80    	cmp    %eax,0x8011b5b0
80103ff4:	0f 84 d8 00 00 00    	je     801040d2 <exit+0xf2>
80103ffa:	89 c6                	mov    %eax,%esi
80103ffc:	8d 58 28             	lea    0x28(%eax),%ebx
80103fff:	8d 78 68             	lea    0x68(%eax),%edi
80104002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (curproc->ofile[fd]) {
80104008:	8b 03                	mov    (%ebx),%eax
8010400a:	85 c0                	test   %eax,%eax
8010400c:	74 12                	je     80104020 <exit+0x40>
      fileclose(curproc->ofile[fd]);
8010400e:	83 ec 0c             	sub    $0xc,%esp
80104011:	50                   	push   %eax
80104012:	e8 d9 ce ff ff       	call   80100ef0 <fileclose>
      curproc->ofile[fd] = 0;
80104017:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010401d:	83 c4 10             	add    $0x10,%esp
  for (fd = 0; fd < NOFILE; fd++) {
80104020:	83 c3 04             	add    $0x4,%ebx
80104023:	39 fb                	cmp    %edi,%ebx
80104025:	75 e1                	jne    80104008 <exit+0x28>
  begin_op();
80104027:	e8 34 ed ff ff       	call   80102d60 <begin_op>
  iput(curproc->cwd);
8010402c:	83 ec 0c             	sub    $0xc,%esp
8010402f:	ff 76 68             	push   0x68(%esi)
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104032:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
  iput(curproc->cwd);
80104037:	e8 74 d8 ff ff       	call   801018b0 <iput>
  end_op();
8010403c:	e8 8f ed ff ff       	call   80102dd0 <end_op>
  curproc->cwd = 0;
80104041:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80104048:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010404f:	e8 8c 07 00 00       	call   801047e0 <acquire>
  wakeup1(curproc->parent);
80104054:	8b 46 14             	mov    0x14(%esi),%eax
80104057:	e8 b4 fa ff ff       	call   80103b10 <wakeup1>
8010405c:	83 c4 10             	add    $0x10,%esp
8010405f:	eb 12                	jmp    80104073 <exit+0x93>
80104061:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104068:	83 eb 80             	sub    $0xffffff80,%ebx
8010406b:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80104071:	74 2d                	je     801040a0 <exit+0xc0>
    if (p->parent == curproc) {
80104073:	39 73 14             	cmp    %esi,0x14(%ebx)
80104076:	75 f0                	jne    80104068 <exit+0x88>
      p->parent = initproc;
80104078:	a1 b0 b5 11 80       	mov    0x8011b5b0,%eax
      if (p->state == ZOMBIE)
8010407d:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
      p->parent = initproc;
80104081:	89 43 14             	mov    %eax,0x14(%ebx)
      if (p->state == ZOMBIE)
80104084:	75 e2                	jne    80104068 <exit+0x88>
        wakeup1(initproc);
80104086:	e8 85 fa ff ff       	call   80103b10 <wakeup1>
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
8010408b:	83 eb 80             	sub    $0xffffff80,%ebx
8010408e:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80104094:	75 dd                	jne    80104073 <exit+0x93>
80104096:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010409d:	8d 76 00             	lea    0x0(%esi),%esi
  writelog(curproc->pid, curproc->name, EXIT, curproc->state, ZOMBIE);
801040a0:	83 ec 0c             	sub    $0xc,%esp
801040a3:	8d 46 6c             	lea    0x6c(%esi),%eax
801040a6:	6a 05                	push   $0x5
801040a8:	ff 76 0c             	push   0xc(%esi)
801040ab:	6a 05                	push   $0x5
801040ad:	50                   	push   %eax
801040ae:	ff 76 10             	push   0x10(%esi)
801040b1:	e8 8a f8 ff ff       	call   80103940 <writelog>
  curproc->state = ZOMBIE;
801040b6:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
801040bd:	83 c4 20             	add    $0x20,%esp
801040c0:	e8 5b fe ff ff       	call   80103f20 <sched>
  panic("zombie exit");
801040c5:	83 ec 0c             	sub    $0xc,%esp
801040c8:	68 f1 7a 10 80       	push   $0x80107af1
801040cd:	e8 ae c2 ff ff       	call   80100380 <panic>
    panic("init exiting");
801040d2:	83 ec 0c             	sub    $0xc,%esp
801040d5:	68 e4 7a 10 80       	push   $0x80107ae4
801040da:	e8 a1 c2 ff ff       	call   80100380 <panic>
801040df:	90                   	nop

801040e0 <yield>:
void yield(void) {
801040e0:	55                   	push   %ebp
801040e1:	89 e5                	mov    %esp,%ebp
801040e3:	53                   	push   %ebx
801040e4:	83 ec 04             	sub    $0x4,%esp
  pushcli();
801040e7:	e8 a4 05 00 00       	call   80104690 <pushcli>
  c = mycpu();
801040ec:	e8 3f f7 ff ff       	call   80103830 <mycpu>
  p = c->proc;
801040f1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801040f7:	e8 e4 05 00 00       	call   801046e0 <popcli>
  acquire(&ptable.lock); // DOC: yieldlock
801040fc:	83 ec 0c             	sub    $0xc,%esp
801040ff:	68 20 1d 11 80       	push   $0x80111d20
80104104:	e8 d7 06 00 00       	call   801047e0 <acquire>
  writelog(curproc->pid, curproc->name, YIELD, curproc->state, RUNNABLE);
80104109:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010410c:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
80104113:	ff 73 0c             	push   0xc(%ebx)
80104116:	6a 02                	push   $0x2
80104118:	50                   	push   %eax
80104119:	ff 73 10             	push   0x10(%ebx)
8010411c:	e8 1f f8 ff ff       	call   80103940 <writelog>
  pushcli();
80104121:	83 c4 20             	add    $0x20,%esp
80104124:	e8 67 05 00 00       	call   80104690 <pushcli>
  c = mycpu();
80104129:	e8 02 f7 ff ff       	call   80103830 <mycpu>
  p = c->proc;
8010412e:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80104134:	e8 a7 05 00 00       	call   801046e0 <popcli>
  myproc()->state = RUNNABLE;
80104139:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80104140:	e8 db fd ff ff       	call   80103f20 <sched>
  release(&ptable.lock);
80104145:	83 ec 0c             	sub    $0xc,%esp
80104148:	68 20 1d 11 80       	push   $0x80111d20
8010414d:	e8 2e 06 00 00       	call   80104780 <release>
}
80104152:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104155:	83 c4 10             	add    $0x10,%esp
80104158:	c9                   	leave  
80104159:	c3                   	ret    
8010415a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104160 <sleep>:
void sleep(void *chan, struct spinlock *lk) {
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	57                   	push   %edi
80104164:	56                   	push   %esi
80104165:	53                   	push   %ebx
80104166:	83 ec 1c             	sub    $0x1c,%esp
80104169:	8b 7d 08             	mov    0x8(%ebp),%edi
8010416c:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
8010416f:	e8 1c 05 00 00       	call   80104690 <pushcli>
  c = mycpu();
80104174:	e8 b7 f6 ff ff       	call   80103830 <mycpu>
  p = c->proc;
80104179:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
8010417f:	e8 5c 05 00 00       	call   801046e0 <popcli>
  if (p == 0)
80104184:	85 db                	test   %ebx,%ebx
80104186:	0f 84 c5 00 00 00    	je     80104251 <sleep+0xf1>
  if (lk == 0)
8010418c:	85 f6                	test   %esi,%esi
8010418e:	0f 84 b0 00 00 00    	je     80104244 <sleep+0xe4>
  writelog(p->pid, p->name, SLEEP, p->state, SLEEPING);
80104194:	8d 43 6c             	lea    0x6c(%ebx),%eax
  if (lk != &ptable.lock) { // DOC: sleeplock0
80104197:	81 fe 20 1d 11 80    	cmp    $0x80111d20,%esi
8010419d:	74 71                	je     80104210 <sleep+0xb0>
    acquire(&ptable.lock);  // DOC: sleeplock1
8010419f:	83 ec 0c             	sub    $0xc,%esp
801041a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801041a5:	68 20 1d 11 80       	push   $0x80111d20
801041aa:	e8 31 06 00 00       	call   801047e0 <acquire>
    release(lk);
801041af:	89 34 24             	mov    %esi,(%esp)
801041b2:	e8 c9 05 00 00       	call   80104780 <release>
  writelog(p->pid, p->name, SLEEP, p->state, SLEEPING);
801041b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  p->chan = chan;
801041ba:	89 7b 20             	mov    %edi,0x20(%ebx)
  writelog(p->pid, p->name, SLEEP, p->state, SLEEPING);
801041bd:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
801041c4:	ff 73 0c             	push   0xc(%ebx)
801041c7:	6a 07                	push   $0x7
801041c9:	50                   	push   %eax
801041ca:	ff 73 10             	push   0x10(%ebx)
801041cd:	e8 6e f7 ff ff       	call   80103940 <writelog>
  p->state = SLEEPING;
801041d2:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
801041d9:	83 c4 20             	add    $0x20,%esp
801041dc:	e8 3f fd ff ff       	call   80103f20 <sched>
    release(&ptable.lock);
801041e1:	83 ec 0c             	sub    $0xc,%esp
  p->chan = 0;
801041e4:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
801041eb:	68 20 1d 11 80       	push   $0x80111d20
801041f0:	e8 8b 05 00 00       	call   80104780 <release>
    acquire(lk);
801041f5:	89 75 08             	mov    %esi,0x8(%ebp)
801041f8:	83 c4 10             	add    $0x10,%esp
}
801041fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801041fe:	5b                   	pop    %ebx
801041ff:	5e                   	pop    %esi
80104200:	5f                   	pop    %edi
80104201:	5d                   	pop    %ebp
    acquire(lk);
80104202:	e9 d9 05 00 00       	jmp    801047e0 <acquire>
80104207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010420e:	66 90                	xchg   %ax,%ax
  writelog(p->pid, p->name, SLEEP, p->state, SLEEPING);
80104210:	83 ec 0c             	sub    $0xc,%esp
  p->chan = chan;
80104213:	89 7b 20             	mov    %edi,0x20(%ebx)
  writelog(p->pid, p->name, SLEEP, p->state, SLEEPING);
80104216:	6a 02                	push   $0x2
80104218:	ff 73 0c             	push   0xc(%ebx)
8010421b:	6a 07                	push   $0x7
8010421d:	50                   	push   %eax
8010421e:	ff 73 10             	push   0x10(%ebx)
80104221:	e8 1a f7 ff ff       	call   80103940 <writelog>
  p->state = SLEEPING;
80104226:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
8010422d:	83 c4 20             	add    $0x20,%esp
80104230:	e8 eb fc ff ff       	call   80103f20 <sched>
  p->chan = 0;
80104235:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
8010423c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010423f:	5b                   	pop    %ebx
80104240:	5e                   	pop    %esi
80104241:	5f                   	pop    %edi
80104242:	5d                   	pop    %ebp
80104243:	c3                   	ret    
    panic("sleep without lk");
80104244:	83 ec 0c             	sub    $0xc,%esp
80104247:	68 03 7b 10 80       	push   $0x80107b03
8010424c:	e8 2f c1 ff ff       	call   80100380 <panic>
    panic("sleep");
80104251:	83 ec 0c             	sub    $0xc,%esp
80104254:	68 fd 7a 10 80       	push   $0x80107afd
80104259:	e8 22 c1 ff ff       	call   80100380 <panic>
8010425e:	66 90                	xchg   %ax,%ax

80104260 <wait>:
int wait(void) {
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	56                   	push   %esi
80104264:	53                   	push   %ebx
  pushcli();
80104265:	e8 26 04 00 00       	call   80104690 <pushcli>
  c = mycpu();
8010426a:	e8 c1 f5 ff ff       	call   80103830 <mycpu>
  p = c->proc;
8010426f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80104275:	e8 66 04 00 00       	call   801046e0 <popcli>
  acquire(&ptable.lock);
8010427a:	83 ec 0c             	sub    $0xc,%esp
8010427d:	68 20 1d 11 80       	push   $0x80111d20
80104282:	e8 59 05 00 00       	call   801047e0 <acquire>
80104287:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
8010428a:	31 c0                	xor    %eax,%eax
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
8010428c:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80104291:	eb 10                	jmp    801042a3 <wait+0x43>
80104293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104297:	90                   	nop
80104298:	83 eb 80             	sub    $0xffffff80,%ebx
8010429b:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
801042a1:	74 1b                	je     801042be <wait+0x5e>
      if (p->parent != curproc)
801042a3:	39 73 14             	cmp    %esi,0x14(%ebx)
801042a6:	75 f0                	jne    80104298 <wait+0x38>
      if (p->state == ZOMBIE) {
801042a8:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801042ac:	74 32                	je     801042e0 <wait+0x80>
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801042ae:	83 eb 80             	sub    $0xffffff80,%ebx
      havekids = 1;
801042b1:	b8 01 00 00 00       	mov    $0x1,%eax
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801042b6:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
801042bc:	75 e5                	jne    801042a3 <wait+0x43>
    if (!havekids || curproc->killed) {
801042be:	85 c0                	test   %eax,%eax
801042c0:	0f 84 85 00 00 00    	je     8010434b <wait+0xeb>
801042c6:	8b 46 24             	mov    0x24(%esi),%eax
801042c9:	85 c0                	test   %eax,%eax
801042cb:	75 7e                	jne    8010434b <wait+0xeb>
    sleep(curproc, &ptable.lock); // DOC: wait-sleep
801042cd:	83 ec 08             	sub    $0x8,%esp
801042d0:	68 20 1d 11 80       	push   $0x80111d20
801042d5:	56                   	push   %esi
801042d6:	e8 85 fe ff ff       	call   80104160 <sleep>
    havekids = 0;
801042db:	83 c4 10             	add    $0x10,%esp
801042de:	eb aa                	jmp    8010428a <wait+0x2a>
        writelog(p->pid, p->name, WAIT, p->state, UNUSED);
801042e0:	83 ec 0c             	sub    $0xc,%esp
801042e3:	8d 43 6c             	lea    0x6c(%ebx),%eax
801042e6:	6a 00                	push   $0x0
801042e8:	6a 05                	push   $0x5
801042ea:	6a 06                	push   $0x6
801042ec:	50                   	push   %eax
801042ed:	ff 73 10             	push   0x10(%ebx)
801042f0:	e8 4b f6 ff ff       	call   80103940 <writelog>
        kfree(p->kstack);
801042f5:	83 c4 14             	add    $0x14,%esp
801042f8:	ff 73 08             	push   0x8(%ebx)
        pid = p->pid;
801042fb:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
801042fe:	e8 bd e1 ff ff       	call   801024c0 <kfree>
        freevm(p->pgdir);
80104303:	5a                   	pop    %edx
80104304:	ff 73 04             	push   0x4(%ebx)
        p->kstack = 0;
80104307:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
8010430e:	e8 2d 2e 00 00       	call   80107140 <freevm>
        release(&ptable.lock);
80104313:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
        p->pid     = 0;
8010431a:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent  = 0;
80104321:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80104328:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed  = 0;
8010432c:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state   = UNUSED;
80104333:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
8010433a:	e8 41 04 00 00       	call   80104780 <release>
        return pid;
8010433f:	83 c4 10             	add    $0x10,%esp
}
80104342:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104345:	89 f0                	mov    %esi,%eax
80104347:	5b                   	pop    %ebx
80104348:	5e                   	pop    %esi
80104349:	5d                   	pop    %ebp
8010434a:	c3                   	ret    
      release(&ptable.lock);
8010434b:	83 ec 0c             	sub    $0xc,%esp
      return -1;
8010434e:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80104353:	68 20 1d 11 80       	push   $0x80111d20
80104358:	e8 23 04 00 00       	call   80104780 <release>
      return -1;
8010435d:	83 c4 10             	add    $0x10,%esp
80104360:	eb e0                	jmp    80104342 <wait+0xe2>
80104362:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104370 <wakeup>:

// Wake up all processes sleeping on chan.
void wakeup(void *chan) {
80104370:	55                   	push   %ebp
80104371:	89 e5                	mov    %esp,%ebp
80104373:	53                   	push   %ebx
80104374:	83 ec 10             	sub    $0x10,%esp
80104377:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010437a:	68 20 1d 11 80       	push   $0x80111d20
8010437f:	e8 5c 04 00 00       	call   801047e0 <acquire>
  wakeup1(chan);
80104384:	89 d8                	mov    %ebx,%eax
80104386:	e8 85 f7 ff ff       	call   80103b10 <wakeup1>
  release(&ptable.lock);
8010438b:	c7 45 08 20 1d 11 80 	movl   $0x80111d20,0x8(%ebp)
}
80104392:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  release(&ptable.lock);
80104395:	83 c4 10             	add    $0x10,%esp
}
80104398:	c9                   	leave  
  release(&ptable.lock);
80104399:	e9 e2 03 00 00       	jmp    80104780 <release>
8010439e:	66 90                	xchg   %ax,%ax

801043a0 <kill>:

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int kill(int pid) {
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	53                   	push   %ebx
801043a4:	83 ec 10             	sub    $0x10,%esp
801043a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801043aa:	68 20 1d 11 80       	push   $0x80111d20
801043af:	e8 2c 04 00 00       	call   801047e0 <acquire>
801043b4:	83 c4 10             	add    $0x10,%esp
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801043b7:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
801043bc:	eb 0c                	jmp    801043ca <kill+0x2a>
801043be:	66 90                	xchg   %ax,%ax
801043c0:	83 e8 80             	sub    $0xffffff80,%eax
801043c3:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
801043c8:	74 36                	je     80104400 <kill+0x60>
    if (p->pid == pid) {
801043ca:	39 58 10             	cmp    %ebx,0x10(%eax)
801043cd:	75 f1                	jne    801043c0 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if (p->state == SLEEPING) {
801043cf:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
801043d3:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if (p->state == SLEEPING) {
801043da:	75 07                	jne    801043e3 <kill+0x43>
        // added
        /* writelog(p->pid, KILL, p->state, RUNNABLE); */
        p->state = RUNNABLE;
801043dc:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      }
      release(&ptable.lock);
801043e3:	83 ec 0c             	sub    $0xc,%esp
801043e6:	68 20 1d 11 80       	push   $0x80111d20
801043eb:	e8 90 03 00 00       	call   80104780 <release>
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
801043f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      return 0;
801043f3:	83 c4 10             	add    $0x10,%esp
801043f6:	31 c0                	xor    %eax,%eax
}
801043f8:	c9                   	leave  
801043f9:	c3                   	ret    
801043fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80104400:	83 ec 0c             	sub    $0xc,%esp
80104403:	68 20 1d 11 80       	push   $0x80111d20
80104408:	e8 73 03 00 00       	call   80104780 <release>
}
8010440d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return -1;
80104410:	83 c4 10             	add    $0x10,%esp
80104413:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104418:	c9                   	leave  
80104419:	c3                   	ret    
8010441a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104420 <procdump>:

// PAGEBREAK: 36
//  Print a process listing to console.  For debugging.
//  Runs when user types ^P on console.
//  No lock to avoid wedging a stuck machine further.
void procdump(void) {
80104420:	55                   	push   %ebp
80104421:	89 e5                	mov    %esp,%ebp
80104423:	57                   	push   %edi
80104424:	56                   	push   %esi
80104425:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104428:	53                   	push   %ebx
80104429:	bb c0 1d 11 80       	mov    $0x80111dc0,%ebx
8010442e:	83 ec 3c             	sub    $0x3c,%esp
80104431:	eb 24                	jmp    80104457 <procdump+0x37>
80104433:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104437:	90                   	nop
    if (p->state == SLEEPING) {
      getcallerpcs((uint *)p->context->ebp + 2, pc);
      for (i = 0; i < 10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104438:	83 ec 0c             	sub    $0xc,%esp
8010443b:	68 ef 7e 10 80       	push   $0x80107eef
80104440:	e8 5b c2 ff ff       	call   801006a0 <cprintf>
80104445:	83 c4 10             	add    $0x10,%esp
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104448:	83 eb 80             	sub    $0xffffff80,%ebx
8010444b:	81 fb c0 3d 11 80    	cmp    $0x80113dc0,%ebx
80104451:	0f 84 81 00 00 00    	je     801044d8 <procdump+0xb8>
    if (p->state == UNUSED)
80104457:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010445a:	85 c0                	test   %eax,%eax
8010445c:	74 ea                	je     80104448 <procdump+0x28>
      state = "???";
8010445e:	ba 14 7b 10 80       	mov    $0x80107b14,%edx
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104463:	83 f8 05             	cmp    $0x5,%eax
80104466:	77 11                	ja     80104479 <procdump+0x59>
80104468:	8b 14 85 74 7b 10 80 	mov    -0x7fef848c(,%eax,4),%edx
      state = "???";
8010446f:	b8 14 7b 10 80       	mov    $0x80107b14,%eax
80104474:	85 d2                	test   %edx,%edx
80104476:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104479:	53                   	push   %ebx
8010447a:	52                   	push   %edx
8010447b:	ff 73 a4             	push   -0x5c(%ebx)
8010447e:	68 18 7b 10 80       	push   $0x80107b18
80104483:	e8 18 c2 ff ff       	call   801006a0 <cprintf>
    if (p->state == SLEEPING) {
80104488:	83 c4 10             	add    $0x10,%esp
8010448b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010448f:	75 a7                	jne    80104438 <procdump+0x18>
      getcallerpcs((uint *)p->context->ebp + 2, pc);
80104491:	83 ec 08             	sub    $0x8,%esp
80104494:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104497:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010449a:	50                   	push   %eax
8010449b:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010449e:	8b 40 0c             	mov    0xc(%eax),%eax
801044a1:	83 c0 08             	add    $0x8,%eax
801044a4:	50                   	push   %eax
801044a5:	e8 86 01 00 00       	call   80104630 <getcallerpcs>
      for (i = 0; i < 10 && pc[i] != 0; i++)
801044aa:	83 c4 10             	add    $0x10,%esp
801044ad:	8d 76 00             	lea    0x0(%esi),%esi
801044b0:	8b 17                	mov    (%edi),%edx
801044b2:	85 d2                	test   %edx,%edx
801044b4:	74 82                	je     80104438 <procdump+0x18>
        cprintf(" %p", pc[i]);
801044b6:	83 ec 08             	sub    $0x8,%esp
      for (i = 0; i < 10 && pc[i] != 0; i++)
801044b9:	83 c7 04             	add    $0x4,%edi
        cprintf(" %p", pc[i]);
801044bc:	52                   	push   %edx
801044bd:	68 61 75 10 80       	push   $0x80107561
801044c2:	e8 d9 c1 ff ff       	call   801006a0 <cprintf>
      for (i = 0; i < 10 && pc[i] != 0; i++)
801044c7:	83 c4 10             	add    $0x10,%esp
801044ca:	39 fe                	cmp    %edi,%esi
801044cc:	75 e2                	jne    801044b0 <procdump+0x90>
801044ce:	e9 65 ff ff ff       	jmp    80104438 <procdump+0x18>
801044d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044d7:	90                   	nop
  }
}
801044d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801044db:	5b                   	pop    %ebx
801044dc:	5e                   	pop    %esi
801044dd:	5f                   	pop    %edi
801044de:	5d                   	pop    %ebp
801044df:	c3                   	ret    

801044e0 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
801044e0:	55                   	push   %ebp
801044e1:	89 e5                	mov    %esp,%ebp
801044e3:	53                   	push   %ebx
801044e4:	83 ec 0c             	sub    $0xc,%esp
801044e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
801044ea:	68 8c 7b 10 80       	push   $0x80107b8c
801044ef:	8d 43 04             	lea    0x4(%ebx),%eax
801044f2:	50                   	push   %eax
801044f3:	e8 18 01 00 00       	call   80104610 <initlock>
  lk->name = name;
801044f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801044fb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104501:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
80104504:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010450b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010450e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104511:	c9                   	leave  
80104512:	c3                   	ret    
80104513:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010451a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104520 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104520:	55                   	push   %ebp
80104521:	89 e5                	mov    %esp,%ebp
80104523:	56                   	push   %esi
80104524:	53                   	push   %ebx
80104525:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104528:	8d 73 04             	lea    0x4(%ebx),%esi
8010452b:	83 ec 0c             	sub    $0xc,%esp
8010452e:	56                   	push   %esi
8010452f:	e8 ac 02 00 00       	call   801047e0 <acquire>
  while (lk->locked) {
80104534:	8b 13                	mov    (%ebx),%edx
80104536:	83 c4 10             	add    $0x10,%esp
80104539:	85 d2                	test   %edx,%edx
8010453b:	74 16                	je     80104553 <acquiresleep+0x33>
8010453d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104540:	83 ec 08             	sub    $0x8,%esp
80104543:	56                   	push   %esi
80104544:	53                   	push   %ebx
80104545:	e8 16 fc ff ff       	call   80104160 <sleep>
  while (lk->locked) {
8010454a:	8b 03                	mov    (%ebx),%eax
8010454c:	83 c4 10             	add    $0x10,%esp
8010454f:	85 c0                	test   %eax,%eax
80104551:	75 ed                	jne    80104540 <acquiresleep+0x20>
  }
  lk->locked = 1;
80104553:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104559:	e8 52 f3 ff ff       	call   801038b0 <myproc>
8010455e:	8b 40 10             	mov    0x10(%eax),%eax
80104561:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104564:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104567:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010456a:	5b                   	pop    %ebx
8010456b:	5e                   	pop    %esi
8010456c:	5d                   	pop    %ebp
  release(&lk->lk);
8010456d:	e9 0e 02 00 00       	jmp    80104780 <release>
80104572:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104580 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80104580:	55                   	push   %ebp
80104581:	89 e5                	mov    %esp,%ebp
80104583:	56                   	push   %esi
80104584:	53                   	push   %ebx
80104585:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104588:	8d 73 04             	lea    0x4(%ebx),%esi
8010458b:	83 ec 0c             	sub    $0xc,%esp
8010458e:	56                   	push   %esi
8010458f:	e8 4c 02 00 00       	call   801047e0 <acquire>
  lk->locked = 0;
80104594:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010459a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
801045a1:	89 1c 24             	mov    %ebx,(%esp)
801045a4:	e8 c7 fd ff ff       	call   80104370 <wakeup>
  release(&lk->lk);
801045a9:	89 75 08             	mov    %esi,0x8(%ebp)
801045ac:	83 c4 10             	add    $0x10,%esp
}
801045af:	8d 65 f8             	lea    -0x8(%ebp),%esp
801045b2:	5b                   	pop    %ebx
801045b3:	5e                   	pop    %esi
801045b4:	5d                   	pop    %ebp
  release(&lk->lk);
801045b5:	e9 c6 01 00 00       	jmp    80104780 <release>
801045ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801045c0 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
801045c0:	55                   	push   %ebp
801045c1:	89 e5                	mov    %esp,%ebp
801045c3:	57                   	push   %edi
801045c4:	31 ff                	xor    %edi,%edi
801045c6:	56                   	push   %esi
801045c7:	53                   	push   %ebx
801045c8:	83 ec 18             	sub    $0x18,%esp
801045cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
801045ce:	8d 73 04             	lea    0x4(%ebx),%esi
801045d1:	56                   	push   %esi
801045d2:	e8 09 02 00 00       	call   801047e0 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
801045d7:	8b 03                	mov    (%ebx),%eax
801045d9:	83 c4 10             	add    $0x10,%esp
801045dc:	85 c0                	test   %eax,%eax
801045de:	75 18                	jne    801045f8 <holdingsleep+0x38>
  release(&lk->lk);
801045e0:	83 ec 0c             	sub    $0xc,%esp
801045e3:	56                   	push   %esi
801045e4:	e8 97 01 00 00       	call   80104780 <release>
  return r;
}
801045e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801045ec:	89 f8                	mov    %edi,%eax
801045ee:	5b                   	pop    %ebx
801045ef:	5e                   	pop    %esi
801045f0:	5f                   	pop    %edi
801045f1:	5d                   	pop    %ebp
801045f2:	c3                   	ret    
801045f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045f7:	90                   	nop
  r = lk->locked && (lk->pid == myproc()->pid);
801045f8:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
801045fb:	e8 b0 f2 ff ff       	call   801038b0 <myproc>
80104600:	39 58 10             	cmp    %ebx,0x10(%eax)
80104603:	0f 94 c0             	sete   %al
80104606:	0f b6 c0             	movzbl %al,%eax
80104609:	89 c7                	mov    %eax,%edi
8010460b:	eb d3                	jmp    801045e0 <holdingsleep+0x20>
8010460d:	66 90                	xchg   %ax,%ax
8010460f:	90                   	nop

80104610 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104610:	55                   	push   %ebp
80104611:	89 e5                	mov    %esp,%ebp
80104613:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104616:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104619:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
8010461f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
80104622:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104629:	5d                   	pop    %ebp
8010462a:	c3                   	ret    
8010462b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010462f:	90                   	nop

80104630 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104630:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104631:	31 d2                	xor    %edx,%edx
{
80104633:	89 e5                	mov    %esp,%ebp
80104635:	53                   	push   %ebx
  ebp = (uint*)v - 2;
80104636:	8b 45 08             	mov    0x8(%ebp),%eax
{
80104639:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
8010463c:	83 e8 08             	sub    $0x8,%eax
  for(i = 0; i < 10; i++){
8010463f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104640:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80104646:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010464c:	77 1a                	ja     80104668 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010464e:	8b 58 04             	mov    0x4(%eax),%ebx
80104651:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
80104654:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
80104657:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104659:	83 fa 0a             	cmp    $0xa,%edx
8010465c:	75 e2                	jne    80104640 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010465e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104661:	c9                   	leave  
80104662:	c3                   	ret    
80104663:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104667:	90                   	nop
  for(; i < 10; i++)
80104668:	8d 04 91             	lea    (%ecx,%edx,4),%eax
8010466b:	8d 51 28             	lea    0x28(%ecx),%edx
8010466e:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
80104670:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
80104676:	83 c0 04             	add    $0x4,%eax
80104679:	39 d0                	cmp    %edx,%eax
8010467b:	75 f3                	jne    80104670 <getcallerpcs+0x40>
}
8010467d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104680:	c9                   	leave  
80104681:	c3                   	ret    
80104682:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104690 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	53                   	push   %ebx
80104694:	83 ec 04             	sub    $0x4,%esp
80104697:	9c                   	pushf  
80104698:	5b                   	pop    %ebx
  asm volatile("cli");
80104699:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010469a:	e8 91 f1 ff ff       	call   80103830 <mycpu>
8010469f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801046a5:	85 c0                	test   %eax,%eax
801046a7:	74 17                	je     801046c0 <pushcli+0x30>
    mycpu()->intena = eflags & FL_IF;
  mycpu()->ncli += 1;
801046a9:	e8 82 f1 ff ff       	call   80103830 <mycpu>
801046ae:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
801046b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801046b8:	c9                   	leave  
801046b9:	c3                   	ret    
801046ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    mycpu()->intena = eflags & FL_IF;
801046c0:	e8 6b f1 ff ff       	call   80103830 <mycpu>
801046c5:	81 e3 00 02 00 00    	and    $0x200,%ebx
801046cb:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
801046d1:	eb d6                	jmp    801046a9 <pushcli+0x19>
801046d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801046e0 <popcli>:

void
popcli(void)
{
801046e0:	55                   	push   %ebp
801046e1:	89 e5                	mov    %esp,%ebp
801046e3:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801046e6:	9c                   	pushf  
801046e7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801046e8:	f6 c4 02             	test   $0x2,%ah
801046eb:	75 35                	jne    80104722 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
801046ed:	e8 3e f1 ff ff       	call   80103830 <mycpu>
801046f2:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
801046f9:	78 34                	js     8010472f <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801046fb:	e8 30 f1 ff ff       	call   80103830 <mycpu>
80104700:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104706:	85 d2                	test   %edx,%edx
80104708:	74 06                	je     80104710 <popcli+0x30>
    sti();
}
8010470a:	c9                   	leave  
8010470b:	c3                   	ret    
8010470c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104710:	e8 1b f1 ff ff       	call   80103830 <mycpu>
80104715:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010471b:	85 c0                	test   %eax,%eax
8010471d:	74 eb                	je     8010470a <popcli+0x2a>
  asm volatile("sti");
8010471f:	fb                   	sti    
}
80104720:	c9                   	leave  
80104721:	c3                   	ret    
    panic("popcli - interruptible");
80104722:	83 ec 0c             	sub    $0xc,%esp
80104725:	68 97 7b 10 80       	push   $0x80107b97
8010472a:	e8 51 bc ff ff       	call   80100380 <panic>
    panic("popcli");
8010472f:	83 ec 0c             	sub    $0xc,%esp
80104732:	68 ae 7b 10 80       	push   $0x80107bae
80104737:	e8 44 bc ff ff       	call   80100380 <panic>
8010473c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104740 <holding>:
{
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
80104743:	56                   	push   %esi
80104744:	53                   	push   %ebx
80104745:	8b 75 08             	mov    0x8(%ebp),%esi
80104748:	31 db                	xor    %ebx,%ebx
  pushcli();
8010474a:	e8 41 ff ff ff       	call   80104690 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
8010474f:	8b 06                	mov    (%esi),%eax
80104751:	85 c0                	test   %eax,%eax
80104753:	75 0b                	jne    80104760 <holding+0x20>
  popcli();
80104755:	e8 86 ff ff ff       	call   801046e0 <popcli>
}
8010475a:	89 d8                	mov    %ebx,%eax
8010475c:	5b                   	pop    %ebx
8010475d:	5e                   	pop    %esi
8010475e:	5d                   	pop    %ebp
8010475f:	c3                   	ret    
  r = lock->locked && lock->cpu == mycpu();
80104760:	8b 5e 08             	mov    0x8(%esi),%ebx
80104763:	e8 c8 f0 ff ff       	call   80103830 <mycpu>
80104768:	39 c3                	cmp    %eax,%ebx
8010476a:	0f 94 c3             	sete   %bl
  popcli();
8010476d:	e8 6e ff ff ff       	call   801046e0 <popcli>
  r = lock->locked && lock->cpu == mycpu();
80104772:	0f b6 db             	movzbl %bl,%ebx
}
80104775:	89 d8                	mov    %ebx,%eax
80104777:	5b                   	pop    %ebx
80104778:	5e                   	pop    %esi
80104779:	5d                   	pop    %ebp
8010477a:	c3                   	ret    
8010477b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010477f:	90                   	nop

80104780 <release>:
{
80104780:	55                   	push   %ebp
80104781:	89 e5                	mov    %esp,%ebp
80104783:	56                   	push   %esi
80104784:	53                   	push   %ebx
80104785:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80104788:	e8 03 ff ff ff       	call   80104690 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
8010478d:	8b 03                	mov    (%ebx),%eax
8010478f:	85 c0                	test   %eax,%eax
80104791:	75 15                	jne    801047a8 <release+0x28>
  popcli();
80104793:	e8 48 ff ff ff       	call   801046e0 <popcli>
    panic("release");
80104798:	83 ec 0c             	sub    $0xc,%esp
8010479b:	68 b5 7b 10 80       	push   $0x80107bb5
801047a0:	e8 db bb ff ff       	call   80100380 <panic>
801047a5:	8d 76 00             	lea    0x0(%esi),%esi
  r = lock->locked && lock->cpu == mycpu();
801047a8:	8b 73 08             	mov    0x8(%ebx),%esi
801047ab:	e8 80 f0 ff ff       	call   80103830 <mycpu>
801047b0:	39 c6                	cmp    %eax,%esi
801047b2:	75 df                	jne    80104793 <release+0x13>
  popcli();
801047b4:	e8 27 ff ff ff       	call   801046e0 <popcli>
  lk->pcs[0] = 0;
801047b9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
801047c0:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
801047c7:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801047cc:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
801047d2:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047d5:	5b                   	pop    %ebx
801047d6:	5e                   	pop    %esi
801047d7:	5d                   	pop    %ebp
  popcli();
801047d8:	e9 03 ff ff ff       	jmp    801046e0 <popcli>
801047dd:	8d 76 00             	lea    0x0(%esi),%esi

801047e0 <acquire>:
{
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	53                   	push   %ebx
801047e4:	83 ec 04             	sub    $0x4,%esp
  pushcli(); // disable interrupts to avoid deadlock.
801047e7:	e8 a4 fe ff ff       	call   80104690 <pushcli>
  if(holding(lk))
801047ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
801047ef:	e8 9c fe ff ff       	call   80104690 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
801047f4:	8b 03                	mov    (%ebx),%eax
801047f6:	85 c0                	test   %eax,%eax
801047f8:	75 7e                	jne    80104878 <acquire+0x98>
  popcli();
801047fa:	e8 e1 fe ff ff       	call   801046e0 <popcli>
  asm volatile("lock; xchgl %0, %1" :
801047ff:	b9 01 00 00 00       	mov    $0x1,%ecx
80104804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(xchg(&lk->locked, 1) != 0)
80104808:	8b 55 08             	mov    0x8(%ebp),%edx
8010480b:	89 c8                	mov    %ecx,%eax
8010480d:	f0 87 02             	lock xchg %eax,(%edx)
80104810:	85 c0                	test   %eax,%eax
80104812:	75 f4                	jne    80104808 <acquire+0x28>
  __sync_synchronize();
80104814:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80104819:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010481c:	e8 0f f0 ff ff       	call   80103830 <mycpu>
  getcallerpcs(&lk, lk->pcs);
80104821:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ebp = (uint*)v - 2;
80104824:	89 ea                	mov    %ebp,%edx
  lk->cpu = mycpu();
80104826:	89 43 08             	mov    %eax,0x8(%ebx)
  for(i = 0; i < 10; i++){
80104829:	31 c0                	xor    %eax,%eax
8010482b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010482f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104830:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104836:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010483c:	77 1a                	ja     80104858 <acquire+0x78>
    pcs[i] = ebp[1];     // saved %eip
8010483e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104841:	89 5c 81 0c          	mov    %ebx,0xc(%ecx,%eax,4)
  for(i = 0; i < 10; i++){
80104845:	83 c0 01             	add    $0x1,%eax
    ebp = (uint*)ebp[0]; // saved %ebp
80104848:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
8010484a:	83 f8 0a             	cmp    $0xa,%eax
8010484d:	75 e1                	jne    80104830 <acquire+0x50>
}
8010484f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104852:	c9                   	leave  
80104853:	c3                   	ret    
80104854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(; i < 10; i++)
80104858:	8d 44 81 0c          	lea    0xc(%ecx,%eax,4),%eax
8010485c:	8d 51 34             	lea    0x34(%ecx),%edx
8010485f:	90                   	nop
    pcs[i] = 0;
80104860:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
80104866:	83 c0 04             	add    $0x4,%eax
80104869:	39 c2                	cmp    %eax,%edx
8010486b:	75 f3                	jne    80104860 <acquire+0x80>
}
8010486d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104870:	c9                   	leave  
80104871:	c3                   	ret    
80104872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  r = lock->locked && lock->cpu == mycpu();
80104878:	8b 5b 08             	mov    0x8(%ebx),%ebx
8010487b:	e8 b0 ef ff ff       	call   80103830 <mycpu>
80104880:	39 c3                	cmp    %eax,%ebx
80104882:	0f 85 72 ff ff ff    	jne    801047fa <acquire+0x1a>
  popcli();
80104888:	e8 53 fe ff ff       	call   801046e0 <popcli>
    panic("acquire");
8010488d:	83 ec 0c             	sub    $0xc,%esp
80104890:	68 bd 7b 10 80       	push   $0x80107bbd
80104895:	e8 e6 ba ff ff       	call   80100380 <panic>
8010489a:	66 90                	xchg   %ax,%ax
8010489c:	66 90                	xchg   %ax,%ax
8010489e:	66 90                	xchg   %ax,%ax

801048a0 <memset>:
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	57                   	push   %edi
801048a4:	8b 55 08             	mov    0x8(%ebp),%edx
801048a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
801048aa:	53                   	push   %ebx
801048ab:	8b 45 0c             	mov    0xc(%ebp),%eax
801048ae:	89 d7                	mov    %edx,%edi
801048b0:	09 cf                	or     %ecx,%edi
801048b2:	83 e7 03             	and    $0x3,%edi
801048b5:	75 29                	jne    801048e0 <memset+0x40>
801048b7:	0f b6 f8             	movzbl %al,%edi
801048ba:	c1 e0 18             	shl    $0x18,%eax
801048bd:	89 fb                	mov    %edi,%ebx
801048bf:	c1 e9 02             	shr    $0x2,%ecx
801048c2:	c1 e3 10             	shl    $0x10,%ebx
801048c5:	09 d8                	or     %ebx,%eax
801048c7:	09 f8                	or     %edi,%eax
801048c9:	c1 e7 08             	shl    $0x8,%edi
801048cc:	09 f8                	or     %edi,%eax
801048ce:	89 d7                	mov    %edx,%edi
801048d0:	fc                   	cld    
801048d1:	f3 ab                	rep stos %eax,%es:(%edi)
801048d3:	5b                   	pop    %ebx
801048d4:	89 d0                	mov    %edx,%eax
801048d6:	5f                   	pop    %edi
801048d7:	5d                   	pop    %ebp
801048d8:	c3                   	ret    
801048d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048e0:	89 d7                	mov    %edx,%edi
801048e2:	fc                   	cld    
801048e3:	f3 aa                	rep stos %al,%es:(%edi)
801048e5:	5b                   	pop    %ebx
801048e6:	89 d0                	mov    %edx,%eax
801048e8:	5f                   	pop    %edi
801048e9:	5d                   	pop    %ebp
801048ea:	c3                   	ret    
801048eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801048ef:	90                   	nop

801048f0 <memcmp>:
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	56                   	push   %esi
801048f4:	8b 75 10             	mov    0x10(%ebp),%esi
801048f7:	8b 55 08             	mov    0x8(%ebp),%edx
801048fa:	53                   	push   %ebx
801048fb:	8b 45 0c             	mov    0xc(%ebp),%eax
801048fe:	85 f6                	test   %esi,%esi
80104900:	74 2e                	je     80104930 <memcmp+0x40>
80104902:	01 c6                	add    %eax,%esi
80104904:	eb 14                	jmp    8010491a <memcmp+0x2a>
80104906:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010490d:	8d 76 00             	lea    0x0(%esi),%esi
80104910:	83 c0 01             	add    $0x1,%eax
80104913:	83 c2 01             	add    $0x1,%edx
80104916:	39 f0                	cmp    %esi,%eax
80104918:	74 16                	je     80104930 <memcmp+0x40>
8010491a:	0f b6 0a             	movzbl (%edx),%ecx
8010491d:	0f b6 18             	movzbl (%eax),%ebx
80104920:	38 d9                	cmp    %bl,%cl
80104922:	74 ec                	je     80104910 <memcmp+0x20>
80104924:	0f b6 c1             	movzbl %cl,%eax
80104927:	29 d8                	sub    %ebx,%eax
80104929:	5b                   	pop    %ebx
8010492a:	5e                   	pop    %esi
8010492b:	5d                   	pop    %ebp
8010492c:	c3                   	ret    
8010492d:	8d 76 00             	lea    0x0(%esi),%esi
80104930:	5b                   	pop    %ebx
80104931:	31 c0                	xor    %eax,%eax
80104933:	5e                   	pop    %esi
80104934:	5d                   	pop    %ebp
80104935:	c3                   	ret    
80104936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010493d:	8d 76 00             	lea    0x0(%esi),%esi

80104940 <memmove>:
80104940:	55                   	push   %ebp
80104941:	89 e5                	mov    %esp,%ebp
80104943:	57                   	push   %edi
80104944:	8b 55 08             	mov    0x8(%ebp),%edx
80104947:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010494a:	56                   	push   %esi
8010494b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010494e:	39 d6                	cmp    %edx,%esi
80104950:	73 26                	jae    80104978 <memmove+0x38>
80104952:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
80104955:	39 fa                	cmp    %edi,%edx
80104957:	73 1f                	jae    80104978 <memmove+0x38>
80104959:	8d 41 ff             	lea    -0x1(%ecx),%eax
8010495c:	85 c9                	test   %ecx,%ecx
8010495e:	74 0c                	je     8010496c <memmove+0x2c>
80104960:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104964:	88 0c 02             	mov    %cl,(%edx,%eax,1)
80104967:	83 e8 01             	sub    $0x1,%eax
8010496a:	73 f4                	jae    80104960 <memmove+0x20>
8010496c:	5e                   	pop    %esi
8010496d:	89 d0                	mov    %edx,%eax
8010496f:	5f                   	pop    %edi
80104970:	5d                   	pop    %ebp
80104971:	c3                   	ret    
80104972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104978:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
8010497b:	89 d7                	mov    %edx,%edi
8010497d:	85 c9                	test   %ecx,%ecx
8010497f:	74 eb                	je     8010496c <memmove+0x2c>
80104981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104988:	a4                   	movsb  %ds:(%esi),%es:(%edi)
80104989:	39 c6                	cmp    %eax,%esi
8010498b:	75 fb                	jne    80104988 <memmove+0x48>
8010498d:	5e                   	pop    %esi
8010498e:	89 d0                	mov    %edx,%eax
80104990:	5f                   	pop    %edi
80104991:	5d                   	pop    %ebp
80104992:	c3                   	ret    
80104993:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010499a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801049a0 <memcpy>:
801049a0:	eb 9e                	jmp    80104940 <memmove>
801049a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801049b0 <strncmp>:
801049b0:	55                   	push   %ebp
801049b1:	89 e5                	mov    %esp,%ebp
801049b3:	56                   	push   %esi
801049b4:	8b 75 10             	mov    0x10(%ebp),%esi
801049b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
801049ba:	53                   	push   %ebx
801049bb:	8b 55 0c             	mov    0xc(%ebp),%edx
801049be:	85 f6                	test   %esi,%esi
801049c0:	74 2e                	je     801049f0 <strncmp+0x40>
801049c2:	01 d6                	add    %edx,%esi
801049c4:	eb 18                	jmp    801049de <strncmp+0x2e>
801049c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049cd:	8d 76 00             	lea    0x0(%esi),%esi
801049d0:	38 d8                	cmp    %bl,%al
801049d2:	75 14                	jne    801049e8 <strncmp+0x38>
801049d4:	83 c2 01             	add    $0x1,%edx
801049d7:	83 c1 01             	add    $0x1,%ecx
801049da:	39 f2                	cmp    %esi,%edx
801049dc:	74 12                	je     801049f0 <strncmp+0x40>
801049de:	0f b6 01             	movzbl (%ecx),%eax
801049e1:	0f b6 1a             	movzbl (%edx),%ebx
801049e4:	84 c0                	test   %al,%al
801049e6:	75 e8                	jne    801049d0 <strncmp+0x20>
801049e8:	29 d8                	sub    %ebx,%eax
801049ea:	5b                   	pop    %ebx
801049eb:	5e                   	pop    %esi
801049ec:	5d                   	pop    %ebp
801049ed:	c3                   	ret    
801049ee:	66 90                	xchg   %ax,%ax
801049f0:	5b                   	pop    %ebx
801049f1:	31 c0                	xor    %eax,%eax
801049f3:	5e                   	pop    %esi
801049f4:	5d                   	pop    %ebp
801049f5:	c3                   	ret    
801049f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049fd:	8d 76 00             	lea    0x0(%esi),%esi

80104a00 <strncpy>:
80104a00:	55                   	push   %ebp
80104a01:	89 e5                	mov    %esp,%ebp
80104a03:	57                   	push   %edi
80104a04:	56                   	push   %esi
80104a05:	8b 75 08             	mov    0x8(%ebp),%esi
80104a08:	53                   	push   %ebx
80104a09:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104a0c:	89 f0                	mov    %esi,%eax
80104a0e:	eb 15                	jmp    80104a25 <strncpy+0x25>
80104a10:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
80104a14:	8b 7d 0c             	mov    0xc(%ebp),%edi
80104a17:	83 c0 01             	add    $0x1,%eax
80104a1a:	0f b6 57 ff          	movzbl -0x1(%edi),%edx
80104a1e:	88 50 ff             	mov    %dl,-0x1(%eax)
80104a21:	84 d2                	test   %dl,%dl
80104a23:	74 09                	je     80104a2e <strncpy+0x2e>
80104a25:	89 cb                	mov    %ecx,%ebx
80104a27:	83 e9 01             	sub    $0x1,%ecx
80104a2a:	85 db                	test   %ebx,%ebx
80104a2c:	7f e2                	jg     80104a10 <strncpy+0x10>
80104a2e:	89 c2                	mov    %eax,%edx
80104a30:	85 c9                	test   %ecx,%ecx
80104a32:	7e 17                	jle    80104a4b <strncpy+0x4b>
80104a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a38:	83 c2 01             	add    $0x1,%edx
80104a3b:	89 c1                	mov    %eax,%ecx
80104a3d:	c6 42 ff 00          	movb   $0x0,-0x1(%edx)
80104a41:	29 d1                	sub    %edx,%ecx
80104a43:	8d 4c 0b ff          	lea    -0x1(%ebx,%ecx,1),%ecx
80104a47:	85 c9                	test   %ecx,%ecx
80104a49:	7f ed                	jg     80104a38 <strncpy+0x38>
80104a4b:	5b                   	pop    %ebx
80104a4c:	89 f0                	mov    %esi,%eax
80104a4e:	5e                   	pop    %esi
80104a4f:	5f                   	pop    %edi
80104a50:	5d                   	pop    %ebp
80104a51:	c3                   	ret    
80104a52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104a60 <safestrcpy>:
80104a60:	55                   	push   %ebp
80104a61:	89 e5                	mov    %esp,%ebp
80104a63:	56                   	push   %esi
80104a64:	8b 55 10             	mov    0x10(%ebp),%edx
80104a67:	8b 75 08             	mov    0x8(%ebp),%esi
80104a6a:	53                   	push   %ebx
80104a6b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a6e:	85 d2                	test   %edx,%edx
80104a70:	7e 25                	jle    80104a97 <safestrcpy+0x37>
80104a72:	8d 5c 10 ff          	lea    -0x1(%eax,%edx,1),%ebx
80104a76:	89 f2                	mov    %esi,%edx
80104a78:	eb 16                	jmp    80104a90 <safestrcpy+0x30>
80104a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a80:	0f b6 08             	movzbl (%eax),%ecx
80104a83:	83 c0 01             	add    $0x1,%eax
80104a86:	83 c2 01             	add    $0x1,%edx
80104a89:	88 4a ff             	mov    %cl,-0x1(%edx)
80104a8c:	84 c9                	test   %cl,%cl
80104a8e:	74 04                	je     80104a94 <safestrcpy+0x34>
80104a90:	39 d8                	cmp    %ebx,%eax
80104a92:	75 ec                	jne    80104a80 <safestrcpy+0x20>
80104a94:	c6 02 00             	movb   $0x0,(%edx)
80104a97:	89 f0                	mov    %esi,%eax
80104a99:	5b                   	pop    %ebx
80104a9a:	5e                   	pop    %esi
80104a9b:	5d                   	pop    %ebp
80104a9c:	c3                   	ret    
80104a9d:	8d 76 00             	lea    0x0(%esi),%esi

80104aa0 <strlen>:
80104aa0:	55                   	push   %ebp
80104aa1:	31 c0                	xor    %eax,%eax
80104aa3:	89 e5                	mov    %esp,%ebp
80104aa5:	8b 55 08             	mov    0x8(%ebp),%edx
80104aa8:	80 3a 00             	cmpb   $0x0,(%edx)
80104aab:	74 0c                	je     80104ab9 <strlen+0x19>
80104aad:	8d 76 00             	lea    0x0(%esi),%esi
80104ab0:	83 c0 01             	add    $0x1,%eax
80104ab3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104ab7:	75 f7                	jne    80104ab0 <strlen+0x10>
80104ab9:	5d                   	pop    %ebp
80104aba:	c3                   	ret    

80104abb <swtch>:
80104abb:	8b 44 24 04          	mov    0x4(%esp),%eax
80104abf:	8b 54 24 08          	mov    0x8(%esp),%edx
80104ac3:	55                   	push   %ebp
80104ac4:	53                   	push   %ebx
80104ac5:	56                   	push   %esi
80104ac6:	57                   	push   %edi
80104ac7:	89 20                	mov    %esp,(%eax)
80104ac9:	89 d4                	mov    %edx,%esp
80104acb:	5f                   	pop    %edi
80104acc:	5e                   	pop    %esi
80104acd:	5b                   	pop    %ebx
80104ace:	5d                   	pop    %ebp
80104acf:	c3                   	ret    

80104ad0 <fetchint>:
// Arguments on the stack, from the user call to the C
// library system call function. The saved user %esp points
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int fetchint(uint addr, int *ip) {
80104ad0:	55                   	push   %ebp
80104ad1:	89 e5                	mov    %esp,%ebp
80104ad3:	53                   	push   %ebx
80104ad4:	83 ec 04             	sub    $0x4,%esp
80104ad7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
80104ada:	e8 d1 ed ff ff       	call   801038b0 <myproc>

  if (addr >= curproc->sz || addr + 4 > curproc->sz)
80104adf:	8b 00                	mov    (%eax),%eax
80104ae1:	39 d8                	cmp    %ebx,%eax
80104ae3:	76 1b                	jbe    80104b00 <fetchint+0x30>
80104ae5:	8d 53 04             	lea    0x4(%ebx),%edx
80104ae8:	39 d0                	cmp    %edx,%eax
80104aea:	72 14                	jb     80104b00 <fetchint+0x30>
    return -1;
  *ip = *(int *)(addr);
80104aec:	8b 45 0c             	mov    0xc(%ebp),%eax
80104aef:	8b 13                	mov    (%ebx),%edx
80104af1:	89 10                	mov    %edx,(%eax)
  return 0;
80104af3:	31 c0                	xor    %eax,%eax
}
80104af5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104af8:	c9                   	leave  
80104af9:	c3                   	ret    
80104afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80104b00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b05:	eb ee                	jmp    80104af5 <fetchint+0x25>
80104b07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b0e:	66 90                	xchg   %ax,%ax

80104b10 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int fetchstr(uint addr, char **pp) {
80104b10:	55                   	push   %ebp
80104b11:	89 e5                	mov    %esp,%ebp
80104b13:	53                   	push   %ebx
80104b14:	83 ec 04             	sub    $0x4,%esp
80104b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
80104b1a:	e8 91 ed ff ff       	call   801038b0 <myproc>

  if (addr >= curproc->sz)
80104b1f:	39 18                	cmp    %ebx,(%eax)
80104b21:	76 2d                	jbe    80104b50 <fetchstr+0x40>
    return -1;
  *pp = (char *)addr;
80104b23:	8b 55 0c             	mov    0xc(%ebp),%edx
80104b26:	89 1a                	mov    %ebx,(%edx)
  ep  = (char *)curproc->sz;
80104b28:	8b 10                	mov    (%eax),%edx
  for (s = *pp; s < ep; s++) {
80104b2a:	39 d3                	cmp    %edx,%ebx
80104b2c:	73 22                	jae    80104b50 <fetchstr+0x40>
80104b2e:	89 d8                	mov    %ebx,%eax
80104b30:	eb 0d                	jmp    80104b3f <fetchstr+0x2f>
80104b32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b38:	83 c0 01             	add    $0x1,%eax
80104b3b:	39 c2                	cmp    %eax,%edx
80104b3d:	76 11                	jbe    80104b50 <fetchstr+0x40>
    if (*s == 0)
80104b3f:	80 38 00             	cmpb   $0x0,(%eax)
80104b42:	75 f4                	jne    80104b38 <fetchstr+0x28>
      return s - *pp;
80104b44:	29 d8                	sub    %ebx,%eax
  }
  return -1;
}
80104b46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b49:	c9                   	leave  
80104b4a:	c3                   	ret    
80104b4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b4f:	90                   	nop
80104b50:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return -1;
80104b53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104b58:	c9                   	leave  
80104b59:	c3                   	ret    
80104b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104b60 <argint>:

// Fetch the nth 32-bit system call argument.
int argint(int n, int *ip) {
80104b60:	55                   	push   %ebp
80104b61:	89 e5                	mov    %esp,%ebp
80104b63:	56                   	push   %esi
80104b64:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4 * n, ip);
80104b65:	e8 46 ed ff ff       	call   801038b0 <myproc>
80104b6a:	8b 55 08             	mov    0x8(%ebp),%edx
80104b6d:	8b 40 18             	mov    0x18(%eax),%eax
80104b70:	8b 40 44             	mov    0x44(%eax),%eax
80104b73:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104b76:	e8 35 ed ff ff       	call   801038b0 <myproc>
  return fetchint((myproc()->tf->esp) + 4 + 4 * n, ip);
80104b7b:	8d 73 04             	lea    0x4(%ebx),%esi
  if (addr >= curproc->sz || addr + 4 > curproc->sz)
80104b7e:	8b 00                	mov    (%eax),%eax
80104b80:	39 c6                	cmp    %eax,%esi
80104b82:	73 1c                	jae    80104ba0 <argint+0x40>
80104b84:	8d 53 08             	lea    0x8(%ebx),%edx
80104b87:	39 d0                	cmp    %edx,%eax
80104b89:	72 15                	jb     80104ba0 <argint+0x40>
  *ip = *(int *)(addr);
80104b8b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b8e:	8b 53 04             	mov    0x4(%ebx),%edx
80104b91:	89 10                	mov    %edx,(%eax)
  return 0;
80104b93:	31 c0                	xor    %eax,%eax
}
80104b95:	5b                   	pop    %ebx
80104b96:	5e                   	pop    %esi
80104b97:	5d                   	pop    %ebp
80104b98:	c3                   	ret    
80104b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104ba0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4 * n, ip);
80104ba5:	eb ee                	jmp    80104b95 <argint+0x35>
80104ba7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104bae:	66 90                	xchg   %ax,%ax

80104bb0 <argptr>:

// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int argptr(int n, char **pp, int size) {
80104bb0:	55                   	push   %ebp
80104bb1:	89 e5                	mov    %esp,%ebp
80104bb3:	57                   	push   %edi
80104bb4:	56                   	push   %esi
80104bb5:	53                   	push   %ebx
80104bb6:	83 ec 0c             	sub    $0xc,%esp
  int i;
  struct proc *curproc = myproc();
80104bb9:	e8 f2 ec ff ff       	call   801038b0 <myproc>
80104bbe:	89 c6                	mov    %eax,%esi
  return fetchint((myproc()->tf->esp) + 4 + 4 * n, ip);
80104bc0:	e8 eb ec ff ff       	call   801038b0 <myproc>
80104bc5:	8b 55 08             	mov    0x8(%ebp),%edx
80104bc8:	8b 40 18             	mov    0x18(%eax),%eax
80104bcb:	8b 40 44             	mov    0x44(%eax),%eax
80104bce:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104bd1:	e8 da ec ff ff       	call   801038b0 <myproc>
  return fetchint((myproc()->tf->esp) + 4 + 4 * n, ip);
80104bd6:	8d 7b 04             	lea    0x4(%ebx),%edi
  if (addr >= curproc->sz || addr + 4 > curproc->sz)
80104bd9:	8b 00                	mov    (%eax),%eax
80104bdb:	39 c7                	cmp    %eax,%edi
80104bdd:	73 31                	jae    80104c10 <argptr+0x60>
80104bdf:	8d 4b 08             	lea    0x8(%ebx),%ecx
80104be2:	39 c8                	cmp    %ecx,%eax
80104be4:	72 2a                	jb     80104c10 <argptr+0x60>

  if (argint(n, &i) < 0)
    return -1;
  if (size < 0 || (uint)i >= curproc->sz || (uint)i + size > curproc->sz)
80104be6:	8b 55 10             	mov    0x10(%ebp),%edx
  *ip = *(int *)(addr);
80104be9:	8b 43 04             	mov    0x4(%ebx),%eax
  if (size < 0 || (uint)i >= curproc->sz || (uint)i + size > curproc->sz)
80104bec:	85 d2                	test   %edx,%edx
80104bee:	78 20                	js     80104c10 <argptr+0x60>
80104bf0:	8b 16                	mov    (%esi),%edx
80104bf2:	39 c2                	cmp    %eax,%edx
80104bf4:	76 1a                	jbe    80104c10 <argptr+0x60>
80104bf6:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104bf9:	01 c3                	add    %eax,%ebx
80104bfb:	39 da                	cmp    %ebx,%edx
80104bfd:	72 11                	jb     80104c10 <argptr+0x60>
    return -1;
  *pp = (char *)i;
80104bff:	8b 55 0c             	mov    0xc(%ebp),%edx
80104c02:	89 02                	mov    %eax,(%edx)
  return 0;
80104c04:	31 c0                	xor    %eax,%eax
}
80104c06:	83 c4 0c             	add    $0xc,%esp
80104c09:	5b                   	pop    %ebx
80104c0a:	5e                   	pop    %esi
80104c0b:	5f                   	pop    %edi
80104c0c:	5d                   	pop    %ebp
80104c0d:	c3                   	ret    
80104c0e:	66 90                	xchg   %ax,%ax
    return -1;
80104c10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c15:	eb ef                	jmp    80104c06 <argptr+0x56>
80104c17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c1e:	66 90                	xchg   %ax,%ax

80104c20 <argstr>:

// Fetch the nth word-sized system call argument as a string pointer.
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int argstr(int n, char **pp) {
80104c20:	55                   	push   %ebp
80104c21:	89 e5                	mov    %esp,%ebp
80104c23:	56                   	push   %esi
80104c24:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4 * n, ip);
80104c25:	e8 86 ec ff ff       	call   801038b0 <myproc>
80104c2a:	8b 55 08             	mov    0x8(%ebp),%edx
80104c2d:	8b 40 18             	mov    0x18(%eax),%eax
80104c30:	8b 40 44             	mov    0x44(%eax),%eax
80104c33:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104c36:	e8 75 ec ff ff       	call   801038b0 <myproc>
  return fetchint((myproc()->tf->esp) + 4 + 4 * n, ip);
80104c3b:	8d 73 04             	lea    0x4(%ebx),%esi
  if (addr >= curproc->sz || addr + 4 > curproc->sz)
80104c3e:	8b 00                	mov    (%eax),%eax
80104c40:	39 c6                	cmp    %eax,%esi
80104c42:	73 44                	jae    80104c88 <argstr+0x68>
80104c44:	8d 53 08             	lea    0x8(%ebx),%edx
80104c47:	39 d0                	cmp    %edx,%eax
80104c49:	72 3d                	jb     80104c88 <argstr+0x68>
  *ip = *(int *)(addr);
80104c4b:	8b 5b 04             	mov    0x4(%ebx),%ebx
  struct proc *curproc = myproc();
80104c4e:	e8 5d ec ff ff       	call   801038b0 <myproc>
  if (addr >= curproc->sz)
80104c53:	3b 18                	cmp    (%eax),%ebx
80104c55:	73 31                	jae    80104c88 <argstr+0x68>
  *pp = (char *)addr;
80104c57:	8b 55 0c             	mov    0xc(%ebp),%edx
80104c5a:	89 1a                	mov    %ebx,(%edx)
  ep  = (char *)curproc->sz;
80104c5c:	8b 10                	mov    (%eax),%edx
  for (s = *pp; s < ep; s++) {
80104c5e:	39 d3                	cmp    %edx,%ebx
80104c60:	73 26                	jae    80104c88 <argstr+0x68>
80104c62:	89 d8                	mov    %ebx,%eax
80104c64:	eb 11                	jmp    80104c77 <argstr+0x57>
80104c66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c6d:	8d 76 00             	lea    0x0(%esi),%esi
80104c70:	83 c0 01             	add    $0x1,%eax
80104c73:	39 c2                	cmp    %eax,%edx
80104c75:	76 11                	jbe    80104c88 <argstr+0x68>
    if (*s == 0)
80104c77:	80 38 00             	cmpb   $0x0,(%eax)
80104c7a:	75 f4                	jne    80104c70 <argstr+0x50>
      return s - *pp;
80104c7c:	29 d8                	sub    %ebx,%eax
  int addr;
  if (argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104c7e:	5b                   	pop    %ebx
80104c7f:	5e                   	pop    %esi
80104c80:	5d                   	pop    %ebp
80104c81:	c3                   	ret    
80104c82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c88:	5b                   	pop    %ebx
    return -1;
80104c89:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c8e:	5e                   	pop    %esi
80104c8f:	5d                   	pop    %ebp
80104c90:	c3                   	ret    
80104c91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c9f:	90                   	nop

80104ca0 <syscall>:
    [SYS_close] sys_close,
    [SYS_bufwrite] sys_bufwrite, // added
    [SYS_bufread] sys_bufread,   // added
};

void syscall(void) {
80104ca0:	55                   	push   %ebp
80104ca1:	89 e5                	mov    %esp,%ebp
80104ca3:	53                   	push   %ebx
80104ca4:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104ca7:	e8 04 ec ff ff       	call   801038b0 <myproc>
80104cac:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104cae:	8b 40 18             	mov    0x18(%eax),%eax
80104cb1:	8b 40 1c             	mov    0x1c(%eax),%eax
  if (num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104cb4:	8d 50 ff             	lea    -0x1(%eax),%edx
80104cb7:	83 fa 16             	cmp    $0x16,%edx
80104cba:	77 24                	ja     80104ce0 <syscall+0x40>
80104cbc:	8b 14 85 00 7c 10 80 	mov    -0x7fef8400(,%eax,4),%edx
80104cc3:	85 d2                	test   %edx,%edx
80104cc5:	74 19                	je     80104ce0 <syscall+0x40>
    curproc->tf->eax = syscalls[num]();
80104cc7:	ff d2                	call   *%edx
80104cc9:	89 c2                	mov    %eax,%edx
80104ccb:	8b 43 18             	mov    0x18(%ebx),%eax
80104cce:	89 50 1c             	mov    %edx,0x1c(%eax)
  } else {
    cprintf("%d %s: unknown sys call %d\n", curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104cd1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104cd4:	c9                   	leave  
80104cd5:	c3                   	ret    
80104cd6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104cdd:	8d 76 00             	lea    0x0(%esi),%esi
    cprintf("%d %s: unknown sys call %d\n", curproc->pid, curproc->name, num);
80104ce0:	50                   	push   %eax
80104ce1:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104ce4:	50                   	push   %eax
80104ce5:	ff 73 10             	push   0x10(%ebx)
80104ce8:	68 c5 7b 10 80       	push   $0x80107bc5
80104ced:	e8 ae b9 ff ff       	call   801006a0 <cprintf>
    curproc->tf->eax = -1;
80104cf2:	8b 43 18             	mov    0x18(%ebx),%eax
80104cf5:	83 c4 10             	add    $0x10,%esp
80104cf8:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104cff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d02:	c9                   	leave  
80104d03:	c3                   	ret    
80104d04:	66 90                	xchg   %ax,%ax
80104d06:	66 90                	xchg   %ax,%ax
80104d08:	66 90                	xchg   %ax,%ax
80104d0a:	66 90                	xchg   %ax,%ax
80104d0c:	66 90                	xchg   %ax,%ax
80104d0e:	66 90                	xchg   %ax,%ax

80104d10 <create>:
  iunlockput(dp);
  end_op();
  return -1;
}

static struct inode *create(char *path, short type, short major, short minor) {
80104d10:	55                   	push   %ebp
80104d11:	89 e5                	mov    %esp,%ebp
80104d13:	57                   	push   %edi
80104d14:	56                   	push   %esi
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if ((dp = nameiparent(path, name)) == 0)
80104d15:	8d 7d da             	lea    -0x26(%ebp),%edi
static struct inode *create(char *path, short type, short major, short minor) {
80104d18:	53                   	push   %ebx
80104d19:	83 ec 34             	sub    $0x34,%esp
80104d1c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104d1f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if ((dp = nameiparent(path, name)) == 0)
80104d22:	57                   	push   %edi
80104d23:	50                   	push   %eax
static struct inode *create(char *path, short type, short major, short minor) {
80104d24:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104d27:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  if ((dp = nameiparent(path, name)) == 0)
80104d2a:	e8 91 d3 ff ff       	call   801020c0 <nameiparent>
80104d2f:	83 c4 10             	add    $0x10,%esp
80104d32:	85 c0                	test   %eax,%eax
80104d34:	0f 84 46 01 00 00    	je     80104e80 <create+0x170>
    return 0;
  ilock(dp);
80104d3a:	83 ec 0c             	sub    $0xc,%esp
80104d3d:	89 c3                	mov    %eax,%ebx
80104d3f:	50                   	push   %eax
80104d40:	e8 3b ca ff ff       	call   80101780 <ilock>

  if ((ip = dirlookup(dp, name, 0)) != 0) {
80104d45:	83 c4 0c             	add    $0xc,%esp
80104d48:	6a 00                	push   $0x0
80104d4a:	57                   	push   %edi
80104d4b:	53                   	push   %ebx
80104d4c:	e8 8f cf ff ff       	call   80101ce0 <dirlookup>
80104d51:	83 c4 10             	add    $0x10,%esp
80104d54:	89 c6                	mov    %eax,%esi
80104d56:	85 c0                	test   %eax,%eax
80104d58:	74 56                	je     80104db0 <create+0xa0>
    iunlockput(dp);
80104d5a:	83 ec 0c             	sub    $0xc,%esp
80104d5d:	53                   	push   %ebx
80104d5e:	e8 ad cc ff ff       	call   80101a10 <iunlockput>
    ilock(ip);
80104d63:	89 34 24             	mov    %esi,(%esp)
80104d66:	e8 15 ca ff ff       	call   80101780 <ilock>
    if (type == T_FILE && ip->type == T_FILE)
80104d6b:	83 c4 10             	add    $0x10,%esp
80104d6e:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104d73:	75 1b                	jne    80104d90 <create+0x80>
80104d75:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
80104d7a:	75 14                	jne    80104d90 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104d7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d7f:	89 f0                	mov    %esi,%eax
80104d81:	5b                   	pop    %ebx
80104d82:	5e                   	pop    %esi
80104d83:	5f                   	pop    %edi
80104d84:	5d                   	pop    %ebp
80104d85:	c3                   	ret    
80104d86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d8d:	8d 76 00             	lea    0x0(%esi),%esi
    iunlockput(ip);
80104d90:	83 ec 0c             	sub    $0xc,%esp
80104d93:	56                   	push   %esi
    return 0;
80104d94:	31 f6                	xor    %esi,%esi
    iunlockput(ip);
80104d96:	e8 75 cc ff ff       	call   80101a10 <iunlockput>
    return 0;
80104d9b:	83 c4 10             	add    $0x10,%esp
}
80104d9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104da1:	89 f0                	mov    %esi,%eax
80104da3:	5b                   	pop    %ebx
80104da4:	5e                   	pop    %esi
80104da5:	5f                   	pop    %edi
80104da6:	5d                   	pop    %ebp
80104da7:	c3                   	ret    
80104da8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104daf:	90                   	nop
  if ((ip = ialloc(dp->dev, type)) == 0)
80104db0:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104db4:	83 ec 08             	sub    $0x8,%esp
80104db7:	50                   	push   %eax
80104db8:	ff 33                	push   (%ebx)
80104dba:	e8 51 c8 ff ff       	call   80101610 <ialloc>
80104dbf:	83 c4 10             	add    $0x10,%esp
80104dc2:	89 c6                	mov    %eax,%esi
80104dc4:	85 c0                	test   %eax,%eax
80104dc6:	0f 84 cd 00 00 00    	je     80104e99 <create+0x189>
  ilock(ip);
80104dcc:	83 ec 0c             	sub    $0xc,%esp
80104dcf:	50                   	push   %eax
80104dd0:	e8 ab c9 ff ff       	call   80101780 <ilock>
  ip->major = major;
80104dd5:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104dd9:	66 89 46 52          	mov    %ax,0x52(%esi)
  ip->minor = minor;
80104ddd:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104de1:	66 89 46 54          	mov    %ax,0x54(%esi)
  ip->nlink = 1;
80104de5:	b8 01 00 00 00       	mov    $0x1,%eax
80104dea:	66 89 46 56          	mov    %ax,0x56(%esi)
  iupdate(ip);
80104dee:	89 34 24             	mov    %esi,(%esp)
80104df1:	e8 da c8 ff ff       	call   801016d0 <iupdate>
  if (type == T_DIR) { // Create . and .. entries.
80104df6:	83 c4 10             	add    $0x10,%esp
80104df9:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104dfe:	74 30                	je     80104e30 <create+0x120>
  if (dirlink(dp, name, ip->inum) < 0)
80104e00:	83 ec 04             	sub    $0x4,%esp
80104e03:	ff 76 04             	push   0x4(%esi)
80104e06:	57                   	push   %edi
80104e07:	53                   	push   %ebx
80104e08:	e8 d3 d1 ff ff       	call   80101fe0 <dirlink>
80104e0d:	83 c4 10             	add    $0x10,%esp
80104e10:	85 c0                	test   %eax,%eax
80104e12:	78 78                	js     80104e8c <create+0x17c>
  iunlockput(dp);
80104e14:	83 ec 0c             	sub    $0xc,%esp
80104e17:	53                   	push   %ebx
80104e18:	e8 f3 cb ff ff       	call   80101a10 <iunlockput>
  return ip;
80104e1d:	83 c4 10             	add    $0x10,%esp
}
80104e20:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e23:	89 f0                	mov    %esi,%eax
80104e25:	5b                   	pop    %ebx
80104e26:	5e                   	pop    %esi
80104e27:	5f                   	pop    %edi
80104e28:	5d                   	pop    %ebp
80104e29:	c3                   	ret    
80104e2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iupdate(dp);
80104e30:	83 ec 0c             	sub    $0xc,%esp
    dp->nlink++;       // for ".."
80104e33:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
80104e38:	53                   	push   %ebx
80104e39:	e8 92 c8 ff ff       	call   801016d0 <iupdate>
    if (dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104e3e:	83 c4 0c             	add    $0xc,%esp
80104e41:	ff 76 04             	push   0x4(%esi)
80104e44:	68 7c 7c 10 80       	push   $0x80107c7c
80104e49:	56                   	push   %esi
80104e4a:	e8 91 d1 ff ff       	call   80101fe0 <dirlink>
80104e4f:	83 c4 10             	add    $0x10,%esp
80104e52:	85 c0                	test   %eax,%eax
80104e54:	78 18                	js     80104e6e <create+0x15e>
80104e56:	83 ec 04             	sub    $0x4,%esp
80104e59:	ff 73 04             	push   0x4(%ebx)
80104e5c:	68 7b 7c 10 80       	push   $0x80107c7b
80104e61:	56                   	push   %esi
80104e62:	e8 79 d1 ff ff       	call   80101fe0 <dirlink>
80104e67:	83 c4 10             	add    $0x10,%esp
80104e6a:	85 c0                	test   %eax,%eax
80104e6c:	79 92                	jns    80104e00 <create+0xf0>
      panic("create dots");
80104e6e:	83 ec 0c             	sub    $0xc,%esp
80104e71:	68 6f 7c 10 80       	push   $0x80107c6f
80104e76:	e8 05 b5 ff ff       	call   80100380 <panic>
80104e7b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104e7f:	90                   	nop
}
80104e80:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
80104e83:	31 f6                	xor    %esi,%esi
}
80104e85:	5b                   	pop    %ebx
80104e86:	89 f0                	mov    %esi,%eax
80104e88:	5e                   	pop    %esi
80104e89:	5f                   	pop    %edi
80104e8a:	5d                   	pop    %ebp
80104e8b:	c3                   	ret    
    panic("create: dirlink");
80104e8c:	83 ec 0c             	sub    $0xc,%esp
80104e8f:	68 7e 7c 10 80       	push   $0x80107c7e
80104e94:	e8 e7 b4 ff ff       	call   80100380 <panic>
    panic("create: ialloc");
80104e99:	83 ec 0c             	sub    $0xc,%esp
80104e9c:	68 60 7c 10 80       	push   $0x80107c60
80104ea1:	e8 da b4 ff ff       	call   80100380 <panic>
80104ea6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ead:	8d 76 00             	lea    0x0(%esi),%esi

80104eb0 <sys_dup>:
int sys_dup(void) {
80104eb0:	55                   	push   %ebp
80104eb1:	89 e5                	mov    %esp,%ebp
80104eb3:	56                   	push   %esi
80104eb4:	53                   	push   %ebx
  if (argint(n, &fd) < 0)
80104eb5:	8d 45 f4             	lea    -0xc(%ebp),%eax
int sys_dup(void) {
80104eb8:	83 ec 18             	sub    $0x18,%esp
  if (argint(n, &fd) < 0)
80104ebb:	50                   	push   %eax
80104ebc:	6a 00                	push   $0x0
80104ebe:	e8 9d fc ff ff       	call   80104b60 <argint>
80104ec3:	83 c4 10             	add    $0x10,%esp
80104ec6:	85 c0                	test   %eax,%eax
80104ec8:	78 36                	js     80104f00 <sys_dup+0x50>
  if (fd < 0 || fd >= NOFILE || (f = myproc()->ofile[fd]) == 0)
80104eca:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104ece:	77 30                	ja     80104f00 <sys_dup+0x50>
80104ed0:	e8 db e9 ff ff       	call   801038b0 <myproc>
80104ed5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104ed8:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104edc:	85 f6                	test   %esi,%esi
80104ede:	74 20                	je     80104f00 <sys_dup+0x50>
  struct proc *curproc = myproc();
80104ee0:	e8 cb e9 ff ff       	call   801038b0 <myproc>
  for (fd = 0; fd < NOFILE; fd++) {
80104ee5:	31 db                	xor    %ebx,%ebx
80104ee7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104eee:	66 90                	xchg   %ax,%ax
    if (curproc->ofile[fd] == 0) {
80104ef0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104ef4:	85 d2                	test   %edx,%edx
80104ef6:	74 18                	je     80104f10 <sys_dup+0x60>
  for (fd = 0; fd < NOFILE; fd++) {
80104ef8:	83 c3 01             	add    $0x1,%ebx
80104efb:	83 fb 10             	cmp    $0x10,%ebx
80104efe:	75 f0                	jne    80104ef0 <sys_dup+0x40>
}
80104f00:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104f03:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104f08:	89 d8                	mov    %ebx,%eax
80104f0a:	5b                   	pop    %ebx
80104f0b:	5e                   	pop    %esi
80104f0c:	5d                   	pop    %ebp
80104f0d:	c3                   	ret    
80104f0e:	66 90                	xchg   %ax,%ax
  filedup(f);
80104f10:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
80104f13:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
  filedup(f);
80104f17:	56                   	push   %esi
80104f18:	e8 83 bf ff ff       	call   80100ea0 <filedup>
  return fd;
80104f1d:	83 c4 10             	add    $0x10,%esp
}
80104f20:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f23:	89 d8                	mov    %ebx,%eax
80104f25:	5b                   	pop    %ebx
80104f26:	5e                   	pop    %esi
80104f27:	5d                   	pop    %ebp
80104f28:	c3                   	ret    
80104f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104f30 <sys_read>:
int sys_read(void) {
80104f30:	55                   	push   %ebp
80104f31:	89 e5                	mov    %esp,%ebp
80104f33:	56                   	push   %esi
80104f34:	53                   	push   %ebx
  if (argint(n, &fd) < 0)
80104f35:	8d 5d f4             	lea    -0xc(%ebp),%ebx
int sys_read(void) {
80104f38:	83 ec 18             	sub    $0x18,%esp
  if (argint(n, &fd) < 0)
80104f3b:	53                   	push   %ebx
80104f3c:	6a 00                	push   $0x0
80104f3e:	e8 1d fc ff ff       	call   80104b60 <argint>
80104f43:	83 c4 10             	add    $0x10,%esp
80104f46:	85 c0                	test   %eax,%eax
80104f48:	78 5e                	js     80104fa8 <sys_read+0x78>
  if (fd < 0 || fd >= NOFILE || (f = myproc()->ofile[fd]) == 0)
80104f4a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104f4e:	77 58                	ja     80104fa8 <sys_read+0x78>
80104f50:	e8 5b e9 ff ff       	call   801038b0 <myproc>
80104f55:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104f58:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104f5c:	85 f6                	test   %esi,%esi
80104f5e:	74 48                	je     80104fa8 <sys_read+0x78>
  if (argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104f60:	83 ec 08             	sub    $0x8,%esp
80104f63:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104f66:	50                   	push   %eax
80104f67:	6a 02                	push   $0x2
80104f69:	e8 f2 fb ff ff       	call   80104b60 <argint>
80104f6e:	83 c4 10             	add    $0x10,%esp
80104f71:	85 c0                	test   %eax,%eax
80104f73:	78 33                	js     80104fa8 <sys_read+0x78>
80104f75:	83 ec 04             	sub    $0x4,%esp
80104f78:	ff 75 f0             	push   -0x10(%ebp)
80104f7b:	53                   	push   %ebx
80104f7c:	6a 01                	push   $0x1
80104f7e:	e8 2d fc ff ff       	call   80104bb0 <argptr>
80104f83:	83 c4 10             	add    $0x10,%esp
80104f86:	85 c0                	test   %eax,%eax
80104f88:	78 1e                	js     80104fa8 <sys_read+0x78>
  return fileread(f, p, n);
80104f8a:	83 ec 04             	sub    $0x4,%esp
80104f8d:	ff 75 f0             	push   -0x10(%ebp)
80104f90:	ff 75 f4             	push   -0xc(%ebp)
80104f93:	56                   	push   %esi
80104f94:	e8 87 c0 ff ff       	call   80101020 <fileread>
80104f99:	83 c4 10             	add    $0x10,%esp
}
80104f9c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f9f:	5b                   	pop    %ebx
80104fa0:	5e                   	pop    %esi
80104fa1:	5d                   	pop    %ebp
80104fa2:	c3                   	ret    
80104fa3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104fa7:	90                   	nop
    return -1;
80104fa8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fad:	eb ed                	jmp    80104f9c <sys_read+0x6c>
80104faf:	90                   	nop

80104fb0 <sys_write>:
int sys_write(void) {
80104fb0:	55                   	push   %ebp
80104fb1:	89 e5                	mov    %esp,%ebp
80104fb3:	56                   	push   %esi
80104fb4:	53                   	push   %ebx
  if (argint(n, &fd) < 0)
80104fb5:	8d 5d f4             	lea    -0xc(%ebp),%ebx
int sys_write(void) {
80104fb8:	83 ec 18             	sub    $0x18,%esp
  if (argint(n, &fd) < 0)
80104fbb:	53                   	push   %ebx
80104fbc:	6a 00                	push   $0x0
80104fbe:	e8 9d fb ff ff       	call   80104b60 <argint>
80104fc3:	83 c4 10             	add    $0x10,%esp
80104fc6:	85 c0                	test   %eax,%eax
80104fc8:	78 5e                	js     80105028 <sys_write+0x78>
  if (fd < 0 || fd >= NOFILE || (f = myproc()->ofile[fd]) == 0)
80104fca:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104fce:	77 58                	ja     80105028 <sys_write+0x78>
80104fd0:	e8 db e8 ff ff       	call   801038b0 <myproc>
80104fd5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104fd8:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104fdc:	85 f6                	test   %esi,%esi
80104fde:	74 48                	je     80105028 <sys_write+0x78>
  if (argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104fe0:	83 ec 08             	sub    $0x8,%esp
80104fe3:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104fe6:	50                   	push   %eax
80104fe7:	6a 02                	push   $0x2
80104fe9:	e8 72 fb ff ff       	call   80104b60 <argint>
80104fee:	83 c4 10             	add    $0x10,%esp
80104ff1:	85 c0                	test   %eax,%eax
80104ff3:	78 33                	js     80105028 <sys_write+0x78>
80104ff5:	83 ec 04             	sub    $0x4,%esp
80104ff8:	ff 75 f0             	push   -0x10(%ebp)
80104ffb:	53                   	push   %ebx
80104ffc:	6a 01                	push   $0x1
80104ffe:	e8 ad fb ff ff       	call   80104bb0 <argptr>
80105003:	83 c4 10             	add    $0x10,%esp
80105006:	85 c0                	test   %eax,%eax
80105008:	78 1e                	js     80105028 <sys_write+0x78>
  return filewrite(f, p, n);
8010500a:	83 ec 04             	sub    $0x4,%esp
8010500d:	ff 75 f0             	push   -0x10(%ebp)
80105010:	ff 75 f4             	push   -0xc(%ebp)
80105013:	56                   	push   %esi
80105014:	e8 97 c0 ff ff       	call   801010b0 <filewrite>
80105019:	83 c4 10             	add    $0x10,%esp
}
8010501c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010501f:	5b                   	pop    %ebx
80105020:	5e                   	pop    %esi
80105021:	5d                   	pop    %ebp
80105022:	c3                   	ret    
80105023:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105027:	90                   	nop
    return -1;
80105028:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010502d:	eb ed                	jmp    8010501c <sys_write+0x6c>
8010502f:	90                   	nop

80105030 <sys_close>:
int sys_close(void) {
80105030:	55                   	push   %ebp
80105031:	89 e5                	mov    %esp,%ebp
80105033:	56                   	push   %esi
80105034:	53                   	push   %ebx
  if (argint(n, &fd) < 0)
80105035:	8d 45 f4             	lea    -0xc(%ebp),%eax
int sys_close(void) {
80105038:	83 ec 18             	sub    $0x18,%esp
  if (argint(n, &fd) < 0)
8010503b:	50                   	push   %eax
8010503c:	6a 00                	push   $0x0
8010503e:	e8 1d fb ff ff       	call   80104b60 <argint>
80105043:	83 c4 10             	add    $0x10,%esp
80105046:	85 c0                	test   %eax,%eax
80105048:	78 3e                	js     80105088 <sys_close+0x58>
  if (fd < 0 || fd >= NOFILE || (f = myproc()->ofile[fd]) == 0)
8010504a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010504e:	77 38                	ja     80105088 <sys_close+0x58>
80105050:	e8 5b e8 ff ff       	call   801038b0 <myproc>
80105055:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105058:	8d 5a 08             	lea    0x8(%edx),%ebx
8010505b:	8b 74 98 08          	mov    0x8(%eax,%ebx,4),%esi
8010505f:	85 f6                	test   %esi,%esi
80105061:	74 25                	je     80105088 <sys_close+0x58>
  myproc()->ofile[fd] = 0;
80105063:	e8 48 e8 ff ff       	call   801038b0 <myproc>
  fileclose(f);
80105068:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
8010506b:	c7 44 98 08 00 00 00 	movl   $0x0,0x8(%eax,%ebx,4)
80105072:	00 
  fileclose(f);
80105073:	56                   	push   %esi
80105074:	e8 77 be ff ff       	call   80100ef0 <fileclose>
  return 0;
80105079:	83 c4 10             	add    $0x10,%esp
8010507c:	31 c0                	xor    %eax,%eax
}
8010507e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105081:	5b                   	pop    %ebx
80105082:	5e                   	pop    %esi
80105083:	5d                   	pop    %ebp
80105084:	c3                   	ret    
80105085:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80105088:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010508d:	eb ef                	jmp    8010507e <sys_close+0x4e>
8010508f:	90                   	nop

80105090 <sys_fstat>:
int sys_fstat(void) {
80105090:	55                   	push   %ebp
80105091:	89 e5                	mov    %esp,%ebp
80105093:	56                   	push   %esi
80105094:	53                   	push   %ebx
  if (argint(n, &fd) < 0)
80105095:	8d 5d f4             	lea    -0xc(%ebp),%ebx
int sys_fstat(void) {
80105098:	83 ec 18             	sub    $0x18,%esp
  if (argint(n, &fd) < 0)
8010509b:	53                   	push   %ebx
8010509c:	6a 00                	push   $0x0
8010509e:	e8 bd fa ff ff       	call   80104b60 <argint>
801050a3:	83 c4 10             	add    $0x10,%esp
801050a6:	85 c0                	test   %eax,%eax
801050a8:	78 46                	js     801050f0 <sys_fstat+0x60>
  if (fd < 0 || fd >= NOFILE || (f = myproc()->ofile[fd]) == 0)
801050aa:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801050ae:	77 40                	ja     801050f0 <sys_fstat+0x60>
801050b0:	e8 fb e7 ff ff       	call   801038b0 <myproc>
801050b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
801050b8:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
801050bc:	85 f6                	test   %esi,%esi
801050be:	74 30                	je     801050f0 <sys_fstat+0x60>
  if (argfd(0, 0, &f) < 0 || argptr(1, (void *)&st, sizeof(*st)) < 0)
801050c0:	83 ec 04             	sub    $0x4,%esp
801050c3:	6a 14                	push   $0x14
801050c5:	53                   	push   %ebx
801050c6:	6a 01                	push   $0x1
801050c8:	e8 e3 fa ff ff       	call   80104bb0 <argptr>
801050cd:	83 c4 10             	add    $0x10,%esp
801050d0:	85 c0                	test   %eax,%eax
801050d2:	78 1c                	js     801050f0 <sys_fstat+0x60>
  return filestat(f, st);
801050d4:	83 ec 08             	sub    $0x8,%esp
801050d7:	ff 75 f4             	push   -0xc(%ebp)
801050da:	56                   	push   %esi
801050db:	e8 f0 be ff ff       	call   80100fd0 <filestat>
801050e0:	83 c4 10             	add    $0x10,%esp
}
801050e3:	8d 65 f8             	lea    -0x8(%ebp),%esp
801050e6:	5b                   	pop    %ebx
801050e7:	5e                   	pop    %esi
801050e8:	5d                   	pop    %ebp
801050e9:	c3                   	ret    
801050ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
801050f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050f5:	eb ec                	jmp    801050e3 <sys_fstat+0x53>
801050f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801050fe:	66 90                	xchg   %ax,%ax

80105100 <sys_link>:
int sys_link(void) {
80105100:	55                   	push   %ebp
80105101:	89 e5                	mov    %esp,%ebp
80105103:	57                   	push   %edi
80105104:	56                   	push   %esi
  if (argstr(0, &old) < 0 || argstr(1, &new) < 0)
80105105:	8d 45 d4             	lea    -0x2c(%ebp),%eax
int sys_link(void) {
80105108:	53                   	push   %ebx
80105109:	83 ec 34             	sub    $0x34,%esp
  if (argstr(0, &old) < 0 || argstr(1, &new) < 0)
8010510c:	50                   	push   %eax
8010510d:	6a 00                	push   $0x0
8010510f:	e8 0c fb ff ff       	call   80104c20 <argstr>
80105114:	83 c4 10             	add    $0x10,%esp
80105117:	85 c0                	test   %eax,%eax
80105119:	0f 88 fb 00 00 00    	js     8010521a <sys_link+0x11a>
8010511f:	83 ec 08             	sub    $0x8,%esp
80105122:	8d 45 d0             	lea    -0x30(%ebp),%eax
80105125:	50                   	push   %eax
80105126:	6a 01                	push   $0x1
80105128:	e8 f3 fa ff ff       	call   80104c20 <argstr>
8010512d:	83 c4 10             	add    $0x10,%esp
80105130:	85 c0                	test   %eax,%eax
80105132:	0f 88 e2 00 00 00    	js     8010521a <sys_link+0x11a>
  begin_op();
80105138:	e8 23 dc ff ff       	call   80102d60 <begin_op>
  if ((ip = namei(old)) == 0) {
8010513d:	83 ec 0c             	sub    $0xc,%esp
80105140:	ff 75 d4             	push   -0x2c(%ebp)
80105143:	e8 58 cf ff ff       	call   801020a0 <namei>
80105148:	83 c4 10             	add    $0x10,%esp
8010514b:	89 c3                	mov    %eax,%ebx
8010514d:	85 c0                	test   %eax,%eax
8010514f:	0f 84 e4 00 00 00    	je     80105239 <sys_link+0x139>
  ilock(ip);
80105155:	83 ec 0c             	sub    $0xc,%esp
80105158:	50                   	push   %eax
80105159:	e8 22 c6 ff ff       	call   80101780 <ilock>
  if (ip->type == T_DIR) {
8010515e:	83 c4 10             	add    $0x10,%esp
80105161:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105166:	0f 84 b5 00 00 00    	je     80105221 <sys_link+0x121>
  iupdate(ip);
8010516c:	83 ec 0c             	sub    $0xc,%esp
  ip->nlink++;
8010516f:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  if ((dp = nameiparent(new, name)) == 0)
80105174:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80105177:	53                   	push   %ebx
80105178:	e8 53 c5 ff ff       	call   801016d0 <iupdate>
  iunlock(ip);
8010517d:	89 1c 24             	mov    %ebx,(%esp)
80105180:	e8 db c6 ff ff       	call   80101860 <iunlock>
  if ((dp = nameiparent(new, name)) == 0)
80105185:	58                   	pop    %eax
80105186:	5a                   	pop    %edx
80105187:	57                   	push   %edi
80105188:	ff 75 d0             	push   -0x30(%ebp)
8010518b:	e8 30 cf ff ff       	call   801020c0 <nameiparent>
80105190:	83 c4 10             	add    $0x10,%esp
80105193:	89 c6                	mov    %eax,%esi
80105195:	85 c0                	test   %eax,%eax
80105197:	74 5b                	je     801051f4 <sys_link+0xf4>
  ilock(dp);
80105199:	83 ec 0c             	sub    $0xc,%esp
8010519c:	50                   	push   %eax
8010519d:	e8 de c5 ff ff       	call   80101780 <ilock>
  if (dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0) {
801051a2:	8b 03                	mov    (%ebx),%eax
801051a4:	83 c4 10             	add    $0x10,%esp
801051a7:	39 06                	cmp    %eax,(%esi)
801051a9:	75 3d                	jne    801051e8 <sys_link+0xe8>
801051ab:	83 ec 04             	sub    $0x4,%esp
801051ae:	ff 73 04             	push   0x4(%ebx)
801051b1:	57                   	push   %edi
801051b2:	56                   	push   %esi
801051b3:	e8 28 ce ff ff       	call   80101fe0 <dirlink>
801051b8:	83 c4 10             	add    $0x10,%esp
801051bb:	85 c0                	test   %eax,%eax
801051bd:	78 29                	js     801051e8 <sys_link+0xe8>
  iunlockput(dp);
801051bf:	83 ec 0c             	sub    $0xc,%esp
801051c2:	56                   	push   %esi
801051c3:	e8 48 c8 ff ff       	call   80101a10 <iunlockput>
  iput(ip);
801051c8:	89 1c 24             	mov    %ebx,(%esp)
801051cb:	e8 e0 c6 ff ff       	call   801018b0 <iput>
  end_op();
801051d0:	e8 fb db ff ff       	call   80102dd0 <end_op>
  return 0;
801051d5:	83 c4 10             	add    $0x10,%esp
801051d8:	31 c0                	xor    %eax,%eax
}
801051da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051dd:	5b                   	pop    %ebx
801051de:	5e                   	pop    %esi
801051df:	5f                   	pop    %edi
801051e0:	5d                   	pop    %ebp
801051e1:	c3                   	ret    
801051e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
801051e8:	83 ec 0c             	sub    $0xc,%esp
801051eb:	56                   	push   %esi
801051ec:	e8 1f c8 ff ff       	call   80101a10 <iunlockput>
    goto bad;
801051f1:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
801051f4:	83 ec 0c             	sub    $0xc,%esp
801051f7:	53                   	push   %ebx
801051f8:	e8 83 c5 ff ff       	call   80101780 <ilock>
  ip->nlink--;
801051fd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105202:	89 1c 24             	mov    %ebx,(%esp)
80105205:	e8 c6 c4 ff ff       	call   801016d0 <iupdate>
  iunlockput(ip);
8010520a:	89 1c 24             	mov    %ebx,(%esp)
8010520d:	e8 fe c7 ff ff       	call   80101a10 <iunlockput>
  end_op();
80105212:	e8 b9 db ff ff       	call   80102dd0 <end_op>
  return -1;
80105217:	83 c4 10             	add    $0x10,%esp
8010521a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010521f:	eb b9                	jmp    801051da <sys_link+0xda>
    iunlockput(ip);
80105221:	83 ec 0c             	sub    $0xc,%esp
80105224:	53                   	push   %ebx
80105225:	e8 e6 c7 ff ff       	call   80101a10 <iunlockput>
    end_op();
8010522a:	e8 a1 db ff ff       	call   80102dd0 <end_op>
    return -1;
8010522f:	83 c4 10             	add    $0x10,%esp
80105232:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105237:	eb a1                	jmp    801051da <sys_link+0xda>
    end_op();
80105239:	e8 92 db ff ff       	call   80102dd0 <end_op>
    return -1;
8010523e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105243:	eb 95                	jmp    801051da <sys_link+0xda>
80105245:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010524c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105250 <sys_unlink>:
int sys_unlink(void) {
80105250:	55                   	push   %ebp
80105251:	89 e5                	mov    %esp,%ebp
80105253:	57                   	push   %edi
80105254:	56                   	push   %esi
  if (argstr(0, &path) < 0)
80105255:	8d 45 c0             	lea    -0x40(%ebp),%eax
int sys_unlink(void) {
80105258:	53                   	push   %ebx
80105259:	83 ec 54             	sub    $0x54,%esp
  if (argstr(0, &path) < 0)
8010525c:	50                   	push   %eax
8010525d:	6a 00                	push   $0x0
8010525f:	e8 bc f9 ff ff       	call   80104c20 <argstr>
80105264:	83 c4 10             	add    $0x10,%esp
80105267:	85 c0                	test   %eax,%eax
80105269:	0f 88 7a 01 00 00    	js     801053e9 <sys_unlink+0x199>
  begin_op();
8010526f:	e8 ec da ff ff       	call   80102d60 <begin_op>
  if ((dp = nameiparent(path, name)) == 0) {
80105274:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80105277:	83 ec 08             	sub    $0x8,%esp
8010527a:	53                   	push   %ebx
8010527b:	ff 75 c0             	push   -0x40(%ebp)
8010527e:	e8 3d ce ff ff       	call   801020c0 <nameiparent>
80105283:	83 c4 10             	add    $0x10,%esp
80105286:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80105289:	85 c0                	test   %eax,%eax
8010528b:	0f 84 62 01 00 00    	je     801053f3 <sys_unlink+0x1a3>
  ilock(dp);
80105291:	8b 7d b4             	mov    -0x4c(%ebp),%edi
80105294:	83 ec 0c             	sub    $0xc,%esp
80105297:	57                   	push   %edi
80105298:	e8 e3 c4 ff ff       	call   80101780 <ilock>
  if (namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
8010529d:	58                   	pop    %eax
8010529e:	5a                   	pop    %edx
8010529f:	68 7c 7c 10 80       	push   $0x80107c7c
801052a4:	53                   	push   %ebx
801052a5:	e8 16 ca ff ff       	call   80101cc0 <namecmp>
801052aa:	83 c4 10             	add    $0x10,%esp
801052ad:	85 c0                	test   %eax,%eax
801052af:	0f 84 fb 00 00 00    	je     801053b0 <sys_unlink+0x160>
801052b5:	83 ec 08             	sub    $0x8,%esp
801052b8:	68 7b 7c 10 80       	push   $0x80107c7b
801052bd:	53                   	push   %ebx
801052be:	e8 fd c9 ff ff       	call   80101cc0 <namecmp>
801052c3:	83 c4 10             	add    $0x10,%esp
801052c6:	85 c0                	test   %eax,%eax
801052c8:	0f 84 e2 00 00 00    	je     801053b0 <sys_unlink+0x160>
  if ((ip = dirlookup(dp, name, &off)) == 0)
801052ce:	83 ec 04             	sub    $0x4,%esp
801052d1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801052d4:	50                   	push   %eax
801052d5:	53                   	push   %ebx
801052d6:	57                   	push   %edi
801052d7:	e8 04 ca ff ff       	call   80101ce0 <dirlookup>
801052dc:	83 c4 10             	add    $0x10,%esp
801052df:	89 c3                	mov    %eax,%ebx
801052e1:	85 c0                	test   %eax,%eax
801052e3:	0f 84 c7 00 00 00    	je     801053b0 <sys_unlink+0x160>
  ilock(ip);
801052e9:	83 ec 0c             	sub    $0xc,%esp
801052ec:	50                   	push   %eax
801052ed:	e8 8e c4 ff ff       	call   80101780 <ilock>
  if (ip->nlink < 1)
801052f2:	83 c4 10             	add    $0x10,%esp
801052f5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801052fa:	0f 8e 1c 01 00 00    	jle    8010541c <sys_unlink+0x1cc>
  if (ip->type == T_DIR && !isdirempty(ip)) {
80105300:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105305:	8d 7d d8             	lea    -0x28(%ebp),%edi
80105308:	74 66                	je     80105370 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
8010530a:	83 ec 04             	sub    $0x4,%esp
8010530d:	6a 10                	push   $0x10
8010530f:	6a 00                	push   $0x0
80105311:	57                   	push   %edi
80105312:	e8 89 f5 ff ff       	call   801048a0 <memset>
  if (writei(dp, (char *)&de, off, sizeof(de)) != sizeof(de))
80105317:	6a 10                	push   $0x10
80105319:	ff 75 c4             	push   -0x3c(%ebp)
8010531c:	57                   	push   %edi
8010531d:	ff 75 b4             	push   -0x4c(%ebp)
80105320:	e8 6b c8 ff ff       	call   80101b90 <writei>
80105325:	83 c4 20             	add    $0x20,%esp
80105328:	83 f8 10             	cmp    $0x10,%eax
8010532b:	0f 85 de 00 00 00    	jne    8010540f <sys_unlink+0x1bf>
  if (ip->type == T_DIR) {
80105331:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105336:	0f 84 94 00 00 00    	je     801053d0 <sys_unlink+0x180>
  iunlockput(dp);
8010533c:	83 ec 0c             	sub    $0xc,%esp
8010533f:	ff 75 b4             	push   -0x4c(%ebp)
80105342:	e8 c9 c6 ff ff       	call   80101a10 <iunlockput>
  ip->nlink--;
80105347:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
8010534c:	89 1c 24             	mov    %ebx,(%esp)
8010534f:	e8 7c c3 ff ff       	call   801016d0 <iupdate>
  iunlockput(ip);
80105354:	89 1c 24             	mov    %ebx,(%esp)
80105357:	e8 b4 c6 ff ff       	call   80101a10 <iunlockput>
  end_op();
8010535c:	e8 6f da ff ff       	call   80102dd0 <end_op>
  return 0;
80105361:	83 c4 10             	add    $0x10,%esp
80105364:	31 c0                	xor    %eax,%eax
}
80105366:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105369:	5b                   	pop    %ebx
8010536a:	5e                   	pop    %esi
8010536b:	5f                   	pop    %edi
8010536c:	5d                   	pop    %ebp
8010536d:	c3                   	ret    
8010536e:	66 90                	xchg   %ax,%ax
  for (off = 2 * sizeof(de); off < dp->size; off += sizeof(de)) {
80105370:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105374:	76 94                	jbe    8010530a <sys_unlink+0xba>
80105376:	be 20 00 00 00       	mov    $0x20,%esi
8010537b:	eb 0b                	jmp    80105388 <sys_unlink+0x138>
8010537d:	8d 76 00             	lea    0x0(%esi),%esi
80105380:	83 c6 10             	add    $0x10,%esi
80105383:	3b 73 58             	cmp    0x58(%ebx),%esi
80105386:	73 82                	jae    8010530a <sys_unlink+0xba>
    if (readi(dp, (char *)&de, off, sizeof(de)) != sizeof(de))
80105388:	6a 10                	push   $0x10
8010538a:	56                   	push   %esi
8010538b:	57                   	push   %edi
8010538c:	53                   	push   %ebx
8010538d:	e8 fe c6 ff ff       	call   80101a90 <readi>
80105392:	83 c4 10             	add    $0x10,%esp
80105395:	83 f8 10             	cmp    $0x10,%eax
80105398:	75 68                	jne    80105402 <sys_unlink+0x1b2>
    if (de.inum != 0)
8010539a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
8010539f:	74 df                	je     80105380 <sys_unlink+0x130>
    iunlockput(ip);
801053a1:	83 ec 0c             	sub    $0xc,%esp
801053a4:	53                   	push   %ebx
801053a5:	e8 66 c6 ff ff       	call   80101a10 <iunlockput>
    goto bad;
801053aa:	83 c4 10             	add    $0x10,%esp
801053ad:	8d 76 00             	lea    0x0(%esi),%esi
  iunlockput(dp);
801053b0:	83 ec 0c             	sub    $0xc,%esp
801053b3:	ff 75 b4             	push   -0x4c(%ebp)
801053b6:	e8 55 c6 ff ff       	call   80101a10 <iunlockput>
  end_op();
801053bb:	e8 10 da ff ff       	call   80102dd0 <end_op>
  return -1;
801053c0:	83 c4 10             	add    $0x10,%esp
801053c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053c8:	eb 9c                	jmp    80105366 <sys_unlink+0x116>
801053ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    dp->nlink--;
801053d0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
801053d3:	83 ec 0c             	sub    $0xc,%esp
    dp->nlink--;
801053d6:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
801053db:	50                   	push   %eax
801053dc:	e8 ef c2 ff ff       	call   801016d0 <iupdate>
801053e1:	83 c4 10             	add    $0x10,%esp
801053e4:	e9 53 ff ff ff       	jmp    8010533c <sys_unlink+0xec>
    return -1;
801053e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053ee:	e9 73 ff ff ff       	jmp    80105366 <sys_unlink+0x116>
    end_op();
801053f3:	e8 d8 d9 ff ff       	call   80102dd0 <end_op>
    return -1;
801053f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053fd:	e9 64 ff ff ff       	jmp    80105366 <sys_unlink+0x116>
      panic("isdirempty: readi");
80105402:	83 ec 0c             	sub    $0xc,%esp
80105405:	68 a0 7c 10 80       	push   $0x80107ca0
8010540a:	e8 71 af ff ff       	call   80100380 <panic>
    panic("unlink: writei");
8010540f:	83 ec 0c             	sub    $0xc,%esp
80105412:	68 b2 7c 10 80       	push   $0x80107cb2
80105417:	e8 64 af ff ff       	call   80100380 <panic>
    panic("unlink: nlink < 1");
8010541c:	83 ec 0c             	sub    $0xc,%esp
8010541f:	68 8e 7c 10 80       	push   $0x80107c8e
80105424:	e8 57 af ff ff       	call   80100380 <panic>
80105429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105430 <sys_open>:

int sys_open(void) {
80105430:	55                   	push   %ebp
80105431:	89 e5                	mov    %esp,%ebp
80105433:	57                   	push   %edi
80105434:	56                   	push   %esi
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if (argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105435:	8d 45 e0             	lea    -0x20(%ebp),%eax
int sys_open(void) {
80105438:	53                   	push   %ebx
80105439:	83 ec 24             	sub    $0x24,%esp
  if (argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010543c:	50                   	push   %eax
8010543d:	6a 00                	push   $0x0
8010543f:	e8 dc f7 ff ff       	call   80104c20 <argstr>
80105444:	83 c4 10             	add    $0x10,%esp
80105447:	85 c0                	test   %eax,%eax
80105449:	0f 88 8e 00 00 00    	js     801054dd <sys_open+0xad>
8010544f:	83 ec 08             	sub    $0x8,%esp
80105452:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105455:	50                   	push   %eax
80105456:	6a 01                	push   $0x1
80105458:	e8 03 f7 ff ff       	call   80104b60 <argint>
8010545d:	83 c4 10             	add    $0x10,%esp
80105460:	85 c0                	test   %eax,%eax
80105462:	78 79                	js     801054dd <sys_open+0xad>
    return -1;

  begin_op();
80105464:	e8 f7 d8 ff ff       	call   80102d60 <begin_op>

  if (omode & O_CREATE) {
80105469:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
8010546d:	75 79                	jne    801054e8 <sys_open+0xb8>
    if (ip == 0) {
      end_op();
      return -1;
    }
  } else {
    if ((ip = namei(path)) == 0) {
8010546f:	83 ec 0c             	sub    $0xc,%esp
80105472:	ff 75 e0             	push   -0x20(%ebp)
80105475:	e8 26 cc ff ff       	call   801020a0 <namei>
8010547a:	83 c4 10             	add    $0x10,%esp
8010547d:	89 c6                	mov    %eax,%esi
8010547f:	85 c0                	test   %eax,%eax
80105481:	0f 84 7e 00 00 00    	je     80105505 <sys_open+0xd5>
      end_op();
      return -1;
    }
    ilock(ip);
80105487:	83 ec 0c             	sub    $0xc,%esp
8010548a:	50                   	push   %eax
8010548b:	e8 f0 c2 ff ff       	call   80101780 <ilock>
    if (ip->type == T_DIR && omode != O_RDONLY) {
80105490:	83 c4 10             	add    $0x10,%esp
80105493:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105498:	0f 84 c2 00 00 00    	je     80105560 <sys_open+0x130>
      end_op();
      return -1;
    }
  }

  if ((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0) {
8010549e:	e8 8d b9 ff ff       	call   80100e30 <filealloc>
801054a3:	89 c7                	mov    %eax,%edi
801054a5:	85 c0                	test   %eax,%eax
801054a7:	74 23                	je     801054cc <sys_open+0x9c>
  struct proc *curproc = myproc();
801054a9:	e8 02 e4 ff ff       	call   801038b0 <myproc>
  for (fd = 0; fd < NOFILE; fd++) {
801054ae:	31 db                	xor    %ebx,%ebx
    if (curproc->ofile[fd] == 0) {
801054b0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801054b4:	85 d2                	test   %edx,%edx
801054b6:	74 60                	je     80105518 <sys_open+0xe8>
  for (fd = 0; fd < NOFILE; fd++) {
801054b8:	83 c3 01             	add    $0x1,%ebx
801054bb:	83 fb 10             	cmp    $0x10,%ebx
801054be:	75 f0                	jne    801054b0 <sys_open+0x80>
    if (f)
      fileclose(f);
801054c0:	83 ec 0c             	sub    $0xc,%esp
801054c3:	57                   	push   %edi
801054c4:	e8 27 ba ff ff       	call   80100ef0 <fileclose>
801054c9:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
801054cc:	83 ec 0c             	sub    $0xc,%esp
801054cf:	56                   	push   %esi
801054d0:	e8 3b c5 ff ff       	call   80101a10 <iunlockput>
    end_op();
801054d5:	e8 f6 d8 ff ff       	call   80102dd0 <end_op>
    return -1;
801054da:	83 c4 10             	add    $0x10,%esp
801054dd:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801054e2:	eb 6d                	jmp    80105551 <sys_open+0x121>
801054e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ip = create(path, T_FILE, 0, 0);
801054e8:	83 ec 0c             	sub    $0xc,%esp
801054eb:	8b 45 e0             	mov    -0x20(%ebp),%eax
801054ee:	31 c9                	xor    %ecx,%ecx
801054f0:	ba 02 00 00 00       	mov    $0x2,%edx
801054f5:	6a 00                	push   $0x0
801054f7:	e8 14 f8 ff ff       	call   80104d10 <create>
    if (ip == 0) {
801054fc:	83 c4 10             	add    $0x10,%esp
    ip = create(path, T_FILE, 0, 0);
801054ff:	89 c6                	mov    %eax,%esi
    if (ip == 0) {
80105501:	85 c0                	test   %eax,%eax
80105503:	75 99                	jne    8010549e <sys_open+0x6e>
      end_op();
80105505:	e8 c6 d8 ff ff       	call   80102dd0 <end_op>
      return -1;
8010550a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010550f:	eb 40                	jmp    80105551 <sys_open+0x121>
80105511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }
  iunlock(ip);
80105518:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
8010551b:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
  iunlock(ip);
8010551f:	56                   	push   %esi
80105520:	e8 3b c3 ff ff       	call   80101860 <iunlock>
  end_op();
80105525:	e8 a6 d8 ff ff       	call   80102dd0 <end_op>

  f->type     = FD_INODE;
8010552a:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip       = ip;
  f->off      = 0;
  f->readable = !(omode & O_WRONLY);
80105530:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105533:	83 c4 10             	add    $0x10,%esp
  f->ip       = ip;
80105536:	89 77 10             	mov    %esi,0x10(%edi)
  f->readable = !(omode & O_WRONLY);
80105539:	89 d0                	mov    %edx,%eax
  f->off      = 0;
8010553b:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
80105542:	f7 d0                	not    %eax
80105544:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105547:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
8010554a:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010554d:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
80105551:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105554:	89 d8                	mov    %ebx,%eax
80105556:	5b                   	pop    %ebx
80105557:	5e                   	pop    %esi
80105558:	5f                   	pop    %edi
80105559:	5d                   	pop    %ebp
8010555a:	c3                   	ret    
8010555b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010555f:	90                   	nop
    if (ip->type == T_DIR && omode != O_RDONLY) {
80105560:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105563:	85 c9                	test   %ecx,%ecx
80105565:	0f 84 33 ff ff ff    	je     8010549e <sys_open+0x6e>
8010556b:	e9 5c ff ff ff       	jmp    801054cc <sys_open+0x9c>

80105570 <sys_mkdir>:

int sys_mkdir(void) {
80105570:	55                   	push   %ebp
80105571:	89 e5                	mov    %esp,%ebp
80105573:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105576:	e8 e5 d7 ff ff       	call   80102d60 <begin_op>
  if (argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0) {
8010557b:	83 ec 08             	sub    $0x8,%esp
8010557e:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105581:	50                   	push   %eax
80105582:	6a 00                	push   $0x0
80105584:	e8 97 f6 ff ff       	call   80104c20 <argstr>
80105589:	83 c4 10             	add    $0x10,%esp
8010558c:	85 c0                	test   %eax,%eax
8010558e:	78 30                	js     801055c0 <sys_mkdir+0x50>
80105590:	83 ec 0c             	sub    $0xc,%esp
80105593:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105596:	31 c9                	xor    %ecx,%ecx
80105598:	ba 01 00 00 00       	mov    $0x1,%edx
8010559d:	6a 00                	push   $0x0
8010559f:	e8 6c f7 ff ff       	call   80104d10 <create>
801055a4:	83 c4 10             	add    $0x10,%esp
801055a7:	85 c0                	test   %eax,%eax
801055a9:	74 15                	je     801055c0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801055ab:	83 ec 0c             	sub    $0xc,%esp
801055ae:	50                   	push   %eax
801055af:	e8 5c c4 ff ff       	call   80101a10 <iunlockput>
  end_op();
801055b4:	e8 17 d8 ff ff       	call   80102dd0 <end_op>
  return 0;
801055b9:	83 c4 10             	add    $0x10,%esp
801055bc:	31 c0                	xor    %eax,%eax
}
801055be:	c9                   	leave  
801055bf:	c3                   	ret    
    end_op();
801055c0:	e8 0b d8 ff ff       	call   80102dd0 <end_op>
    return -1;
801055c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801055ca:	c9                   	leave  
801055cb:	c3                   	ret    
801055cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801055d0 <sys_mknod>:

int sys_mknod(void) {
801055d0:	55                   	push   %ebp
801055d1:	89 e5                	mov    %esp,%ebp
801055d3:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801055d6:	e8 85 d7 ff ff       	call   80102d60 <begin_op>
  if ((argstr(0, &path)) < 0 || argint(1, &major) < 0 ||
801055db:	83 ec 08             	sub    $0x8,%esp
801055de:	8d 45 ec             	lea    -0x14(%ebp),%eax
801055e1:	50                   	push   %eax
801055e2:	6a 00                	push   $0x0
801055e4:	e8 37 f6 ff ff       	call   80104c20 <argstr>
801055e9:	83 c4 10             	add    $0x10,%esp
801055ec:	85 c0                	test   %eax,%eax
801055ee:	78 60                	js     80105650 <sys_mknod+0x80>
801055f0:	83 ec 08             	sub    $0x8,%esp
801055f3:	8d 45 f0             	lea    -0x10(%ebp),%eax
801055f6:	50                   	push   %eax
801055f7:	6a 01                	push   $0x1
801055f9:	e8 62 f5 ff ff       	call   80104b60 <argint>
801055fe:	83 c4 10             	add    $0x10,%esp
80105601:	85 c0                	test   %eax,%eax
80105603:	78 4b                	js     80105650 <sys_mknod+0x80>
      argint(2, &minor) < 0 || (ip = create(path, T_DEV, major, minor)) == 0) {
80105605:	83 ec 08             	sub    $0x8,%esp
80105608:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010560b:	50                   	push   %eax
8010560c:	6a 02                	push   $0x2
8010560e:	e8 4d f5 ff ff       	call   80104b60 <argint>
  if ((argstr(0, &path)) < 0 || argint(1, &major) < 0 ||
80105613:	83 c4 10             	add    $0x10,%esp
80105616:	85 c0                	test   %eax,%eax
80105618:	78 36                	js     80105650 <sys_mknod+0x80>
      argint(2, &minor) < 0 || (ip = create(path, T_DEV, major, minor)) == 0) {
8010561a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010561e:	83 ec 0c             	sub    $0xc,%esp
80105621:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105625:	ba 03 00 00 00       	mov    $0x3,%edx
8010562a:	50                   	push   %eax
8010562b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010562e:	e8 dd f6 ff ff       	call   80104d10 <create>
80105633:	83 c4 10             	add    $0x10,%esp
80105636:	85 c0                	test   %eax,%eax
80105638:	74 16                	je     80105650 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010563a:	83 ec 0c             	sub    $0xc,%esp
8010563d:	50                   	push   %eax
8010563e:	e8 cd c3 ff ff       	call   80101a10 <iunlockput>
  end_op();
80105643:	e8 88 d7 ff ff       	call   80102dd0 <end_op>
  return 0;
80105648:	83 c4 10             	add    $0x10,%esp
8010564b:	31 c0                	xor    %eax,%eax
}
8010564d:	c9                   	leave  
8010564e:	c3                   	ret    
8010564f:	90                   	nop
    end_op();
80105650:	e8 7b d7 ff ff       	call   80102dd0 <end_op>
    return -1;
80105655:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010565a:	c9                   	leave  
8010565b:	c3                   	ret    
8010565c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105660 <sys_chdir>:

int sys_chdir(void) {
80105660:	55                   	push   %ebp
80105661:	89 e5                	mov    %esp,%ebp
80105663:	56                   	push   %esi
80105664:	53                   	push   %ebx
80105665:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105668:	e8 43 e2 ff ff       	call   801038b0 <myproc>
8010566d:	89 c6                	mov    %eax,%esi

  begin_op();
8010566f:	e8 ec d6 ff ff       	call   80102d60 <begin_op>
  if (argstr(0, &path) < 0 || (ip = namei(path)) == 0) {
80105674:	83 ec 08             	sub    $0x8,%esp
80105677:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010567a:	50                   	push   %eax
8010567b:	6a 00                	push   $0x0
8010567d:	e8 9e f5 ff ff       	call   80104c20 <argstr>
80105682:	83 c4 10             	add    $0x10,%esp
80105685:	85 c0                	test   %eax,%eax
80105687:	78 77                	js     80105700 <sys_chdir+0xa0>
80105689:	83 ec 0c             	sub    $0xc,%esp
8010568c:	ff 75 f4             	push   -0xc(%ebp)
8010568f:	e8 0c ca ff ff       	call   801020a0 <namei>
80105694:	83 c4 10             	add    $0x10,%esp
80105697:	89 c3                	mov    %eax,%ebx
80105699:	85 c0                	test   %eax,%eax
8010569b:	74 63                	je     80105700 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
8010569d:	83 ec 0c             	sub    $0xc,%esp
801056a0:	50                   	push   %eax
801056a1:	e8 da c0 ff ff       	call   80101780 <ilock>
  if (ip->type != T_DIR) {
801056a6:	83 c4 10             	add    $0x10,%esp
801056a9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801056ae:	75 30                	jne    801056e0 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801056b0:	83 ec 0c             	sub    $0xc,%esp
801056b3:	53                   	push   %ebx
801056b4:	e8 a7 c1 ff ff       	call   80101860 <iunlock>
  iput(curproc->cwd);
801056b9:	58                   	pop    %eax
801056ba:	ff 76 68             	push   0x68(%esi)
801056bd:	e8 ee c1 ff ff       	call   801018b0 <iput>
  end_op();
801056c2:	e8 09 d7 ff ff       	call   80102dd0 <end_op>
  curproc->cwd = ip;
801056c7:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
801056ca:	83 c4 10             	add    $0x10,%esp
801056cd:	31 c0                	xor    %eax,%eax
}
801056cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801056d2:	5b                   	pop    %ebx
801056d3:	5e                   	pop    %esi
801056d4:	5d                   	pop    %ebp
801056d5:	c3                   	ret    
801056d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801056dd:	8d 76 00             	lea    0x0(%esi),%esi
    iunlockput(ip);
801056e0:	83 ec 0c             	sub    $0xc,%esp
801056e3:	53                   	push   %ebx
801056e4:	e8 27 c3 ff ff       	call   80101a10 <iunlockput>
    end_op();
801056e9:	e8 e2 d6 ff ff       	call   80102dd0 <end_op>
    return -1;
801056ee:	83 c4 10             	add    $0x10,%esp
801056f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056f6:	eb d7                	jmp    801056cf <sys_chdir+0x6f>
801056f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801056ff:	90                   	nop
    end_op();
80105700:	e8 cb d6 ff ff       	call   80102dd0 <end_op>
    return -1;
80105705:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010570a:	eb c3                	jmp    801056cf <sys_chdir+0x6f>
8010570c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105710 <sys_exec>:

int sys_exec(void) {
80105710:	55                   	push   %ebp
80105711:	89 e5                	mov    %esp,%ebp
80105713:	57                   	push   %edi
80105714:	56                   	push   %esi
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if (argstr(0, &path) < 0 || argint(1, (int *)&uargv) < 0) {
80105715:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
int sys_exec(void) {
8010571b:	53                   	push   %ebx
8010571c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if (argstr(0, &path) < 0 || argint(1, (int *)&uargv) < 0) {
80105722:	50                   	push   %eax
80105723:	6a 00                	push   $0x0
80105725:	e8 f6 f4 ff ff       	call   80104c20 <argstr>
8010572a:	83 c4 10             	add    $0x10,%esp
8010572d:	85 c0                	test   %eax,%eax
8010572f:	0f 88 87 00 00 00    	js     801057bc <sys_exec+0xac>
80105735:	83 ec 08             	sub    $0x8,%esp
80105738:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010573e:	50                   	push   %eax
8010573f:	6a 01                	push   $0x1
80105741:	e8 1a f4 ff ff       	call   80104b60 <argint>
80105746:	83 c4 10             	add    $0x10,%esp
80105749:	85 c0                	test   %eax,%eax
8010574b:	78 6f                	js     801057bc <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010574d:	83 ec 04             	sub    $0x4,%esp
80105750:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
  for (i = 0;; i++) {
80105756:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
80105758:	68 80 00 00 00       	push   $0x80
8010575d:	6a 00                	push   $0x0
8010575f:	56                   	push   %esi
80105760:	e8 3b f1 ff ff       	call   801048a0 <memset>
80105765:	83 c4 10             	add    $0x10,%esp
80105768:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010576f:	90                   	nop
    if (i >= NELEM(argv))
      return -1;
    if (fetchint(uargv + 4 * i, (int *)&uarg) < 0)
80105770:	83 ec 08             	sub    $0x8,%esp
80105773:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
80105779:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
80105780:	50                   	push   %eax
80105781:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105787:	01 f8                	add    %edi,%eax
80105789:	50                   	push   %eax
8010578a:	e8 41 f3 ff ff       	call   80104ad0 <fetchint>
8010578f:	83 c4 10             	add    $0x10,%esp
80105792:	85 c0                	test   %eax,%eax
80105794:	78 26                	js     801057bc <sys_exec+0xac>
      return -1;
    if (uarg == 0) {
80105796:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
8010579c:	85 c0                	test   %eax,%eax
8010579e:	74 30                	je     801057d0 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if (fetchstr(uarg, &argv[i]) < 0)
801057a0:	83 ec 08             	sub    $0x8,%esp
801057a3:	8d 14 3e             	lea    (%esi,%edi,1),%edx
801057a6:	52                   	push   %edx
801057a7:	50                   	push   %eax
801057a8:	e8 63 f3 ff ff       	call   80104b10 <fetchstr>
801057ad:	83 c4 10             	add    $0x10,%esp
801057b0:	85 c0                	test   %eax,%eax
801057b2:	78 08                	js     801057bc <sys_exec+0xac>
  for (i = 0;; i++) {
801057b4:	83 c3 01             	add    $0x1,%ebx
    if (i >= NELEM(argv))
801057b7:	83 fb 20             	cmp    $0x20,%ebx
801057ba:	75 b4                	jne    80105770 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
801057bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
801057bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801057c4:	5b                   	pop    %ebx
801057c5:	5e                   	pop    %esi
801057c6:	5f                   	pop    %edi
801057c7:	5d                   	pop    %ebp
801057c8:	c3                   	ret    
801057c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      argv[i] = 0;
801057d0:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801057d7:	00 00 00 00 
  return exec(path, argv);
801057db:	83 ec 08             	sub    $0x8,%esp
801057de:	56                   	push   %esi
801057df:	ff b5 5c ff ff ff    	push   -0xa4(%ebp)
801057e5:	e8 c6 b2 ff ff       	call   80100ab0 <exec>
801057ea:	83 c4 10             	add    $0x10,%esp
}
801057ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801057f0:	5b                   	pop    %ebx
801057f1:	5e                   	pop    %esi
801057f2:	5f                   	pop    %edi
801057f3:	5d                   	pop    %ebp
801057f4:	c3                   	ret    
801057f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801057fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105800 <sys_pipe>:

int sys_pipe(void) {
80105800:	55                   	push   %ebp
80105801:	89 e5                	mov    %esp,%ebp
80105803:	57                   	push   %edi
80105804:	56                   	push   %esi
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if (argptr(0, (void *)&fd, 2 * sizeof(fd[0])) < 0)
80105805:	8d 45 dc             	lea    -0x24(%ebp),%eax
int sys_pipe(void) {
80105808:	53                   	push   %ebx
80105809:	83 ec 20             	sub    $0x20,%esp
  if (argptr(0, (void *)&fd, 2 * sizeof(fd[0])) < 0)
8010580c:	6a 08                	push   $0x8
8010580e:	50                   	push   %eax
8010580f:	6a 00                	push   $0x0
80105811:	e8 9a f3 ff ff       	call   80104bb0 <argptr>
80105816:	83 c4 10             	add    $0x10,%esp
80105819:	85 c0                	test   %eax,%eax
8010581b:	78 4a                	js     80105867 <sys_pipe+0x67>
    return -1;
  if (pipealloc(&rf, &wf) < 0)
8010581d:	83 ec 08             	sub    $0x8,%esp
80105820:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105823:	50                   	push   %eax
80105824:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105827:	50                   	push   %eax
80105828:	e8 13 dc ff ff       	call   80103440 <pipealloc>
8010582d:	83 c4 10             	add    $0x10,%esp
80105830:	85 c0                	test   %eax,%eax
80105832:	78 33                	js     80105867 <sys_pipe+0x67>
    return -1;
  fd0 = -1;
  if ((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0) {
80105834:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for (fd = 0; fd < NOFILE; fd++) {
80105837:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80105839:	e8 72 e0 ff ff       	call   801038b0 <myproc>
  for (fd = 0; fd < NOFILE; fd++) {
8010583e:	66 90                	xchg   %ax,%ax
    if (curproc->ofile[fd] == 0) {
80105840:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80105844:	85 f6                	test   %esi,%esi
80105846:	74 28                	je     80105870 <sys_pipe+0x70>
  for (fd = 0; fd < NOFILE; fd++) {
80105848:	83 c3 01             	add    $0x1,%ebx
8010584b:	83 fb 10             	cmp    $0x10,%ebx
8010584e:	75 f0                	jne    80105840 <sys_pipe+0x40>
    if (fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
80105850:	83 ec 0c             	sub    $0xc,%esp
80105853:	ff 75 e0             	push   -0x20(%ebp)
80105856:	e8 95 b6 ff ff       	call   80100ef0 <fileclose>
    fileclose(wf);
8010585b:	58                   	pop    %eax
8010585c:	ff 75 e4             	push   -0x1c(%ebp)
8010585f:	e8 8c b6 ff ff       	call   80100ef0 <fileclose>
    return -1;
80105864:	83 c4 10             	add    $0x10,%esp
80105867:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010586c:	eb 53                	jmp    801058c1 <sys_pipe+0xc1>
8010586e:	66 90                	xchg   %ax,%ax
      curproc->ofile[fd] = f;
80105870:	8d 73 08             	lea    0x8(%ebx),%esi
80105873:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if ((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0) {
80105877:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
8010587a:	e8 31 e0 ff ff       	call   801038b0 <myproc>
  for (fd = 0; fd < NOFILE; fd++) {
8010587f:	31 d2                	xor    %edx,%edx
80105881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (curproc->ofile[fd] == 0) {
80105888:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
8010588c:	85 c9                	test   %ecx,%ecx
8010588e:	74 20                	je     801058b0 <sys_pipe+0xb0>
  for (fd = 0; fd < NOFILE; fd++) {
80105890:	83 c2 01             	add    $0x1,%edx
80105893:	83 fa 10             	cmp    $0x10,%edx
80105896:	75 f0                	jne    80105888 <sys_pipe+0x88>
      myproc()->ofile[fd0] = 0;
80105898:	e8 13 e0 ff ff       	call   801038b0 <myproc>
8010589d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
801058a4:	00 
801058a5:	eb a9                	jmp    80105850 <sys_pipe+0x50>
801058a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801058ae:	66 90                	xchg   %ax,%ax
      curproc->ofile[fd] = f;
801058b0:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
  }
  fd[0] = fd0;
801058b4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058b7:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801058b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058bc:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
801058bf:	31 c0                	xor    %eax,%eax
}
801058c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058c4:	5b                   	pop    %ebx
801058c5:	5e                   	pop    %esi
801058c6:	5f                   	pop    %edi
801058c7:	5d                   	pop    %ebp
801058c8:	c3                   	ret    
801058c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801058d0 <convert_to_hexa>:

// added
void convert_to_hexa(unsigned int n, char *hex) {
801058d0:	55                   	push   %ebp
801058d1:	89 e5                	mov    %esp,%ebp
801058d3:	57                   	push   %edi
801058d4:	56                   	push   %esi
801058d5:	8b 75 0c             	mov    0xc(%ebp),%esi
801058d8:	53                   	push   %ebx
801058d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  for (int i = 0; i < 8; i++) {
801058dc:	8d 46 07             	lea    0x7(%esi),%eax
801058df:	eb 09                	jmp    801058ea <convert_to_hexa+0x1a>
801058e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801058e8:	89 d0                	mov    %edx,%eax
    unsigned int digit = n % 16;
801058ea:	89 d9                	mov    %ebx,%ecx
    n /= 16;
801058ec:	c1 eb 04             	shr    $0x4,%ebx
    unsigned int digit = n % 16;
801058ef:	83 e1 0f             	and    $0xf,%ecx
    if (digit < 10) {
      hex[7 - i] = '0' + digit;
801058f2:	8d 79 30             	lea    0x30(%ecx),%edi
801058f5:	8d 51 37             	lea    0x37(%ecx),%edx
801058f8:	83 f9 09             	cmp    $0x9,%ecx
801058fb:	0f 46 d7             	cmovbe %edi,%edx
801058fe:	88 10                	mov    %dl,(%eax)
  for (int i = 0; i < 8; i++) {
80105900:	8d 50 ff             	lea    -0x1(%eax),%edx
80105903:	39 c6                	cmp    %eax,%esi
80105905:	75 e1                	jne    801058e8 <convert_to_hexa+0x18>
    } else {
      hex[7 - i] = 'A' + digit - 10;
    }
  }
  hex[8] = '\0';
80105907:	c6 46 08 00          	movb   $0x0,0x8(%esi)
}
8010590b:	5b                   	pop    %ebx
8010590c:	5e                   	pop    %esi
8010590d:	5f                   	pop    %edi
8010590e:	5d                   	pop    %ebp
8010590f:	c3                   	ret    

80105910 <sys_bufwrite>:

// added
// unused
int sys_bufwrite(void) {
  return 0;
}
80105910:	31 c0                	xor    %eax,%eax
80105912:	c3                   	ret    
80105913:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010591a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105920 <sys_bufread>:

// added
int sys_bufread(void) {
80105920:	55                   	push   %ebp
80105921:	89 e5                	mov    %esp,%ebp
80105923:	57                   	push   %edi
80105924:	56                   	push   %esi
80105925:	53                   	push   %ebx
80105926:	bb 6c 3d 11 80       	mov    $0x80113d6c,%ebx
8010592b:	83 ec 38             	sub    $0x38,%esp
  cprintf("clock,pid,pname,event_name,pstate_prev,pstate_next,cpu\n");
8010592e:	68 d8 7c 10 80       	push   $0x80107cd8
80105933:	e8 68 ad ff ff       	call   801006a0 <cprintf>

  for (int i = 0; i < LOGBUFSIZE; i++) {
80105938:	83 c4 10             	add    $0x10,%esp
8010593b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010593f:	90                   	nop
    // print clock
    char hi_hex[8 + 1], lo_hex[8 + 1]; // last character is '\0'
    convert_to_hexa(buf_log[i].clock.hi, hi_hex);
80105940:	8b 73 f4             	mov    -0xc(%ebx),%esi
  for (int i = 0; i < 8; i++) {
80105943:	8d 45 dd             	lea    -0x23(%ebp),%eax
80105946:	eb 0a                	jmp    80105952 <sys_bufread+0x32>
80105948:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010594f:	90                   	nop
80105950:	89 d0                	mov    %edx,%eax
    unsigned int digit = n % 16;
80105952:	89 f1                	mov    %esi,%ecx
    n /= 16;
80105954:	c1 ee 04             	shr    $0x4,%esi
    unsigned int digit = n % 16;
80105957:	83 e1 0f             	and    $0xf,%ecx
      hex[7 - i] = '0' + digit;
8010595a:	8d 79 30             	lea    0x30(%ecx),%edi
8010595d:	8d 51 37             	lea    0x37(%ecx),%edx
80105960:	83 f9 09             	cmp    $0x9,%ecx
80105963:	0f 46 d7             	cmovbe %edi,%edx
  for (int i = 0; i < 8; i++) {
80105966:	8d 7d d6             	lea    -0x2a(%ebp),%edi
      hex[7 - i] = '0' + digit;
80105969:	88 10                	mov    %dl,(%eax)
  for (int i = 0; i < 8; i++) {
8010596b:	8d 50 ff             	lea    -0x1(%eax),%edx
8010596e:	39 f8                	cmp    %edi,%eax
80105970:	75 de                	jne    80105950 <sys_bufread+0x30>
    cprintf("%s", hi_hex);
80105972:	83 ec 08             	sub    $0x8,%esp
  hex[8] = '\0';
80105975:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    cprintf("%s", hi_hex);
80105979:	57                   	push   %edi
8010597a:	68 1e 7b 10 80       	push   $0x80107b1e
8010597f:	e8 1c ad ff ff       	call   801006a0 <cprintf>
    convert_to_hexa(buf_log[i].clock.lo, lo_hex);
80105984:	8b 73 f8             	mov    -0x8(%ebx),%esi
  for (int i = 0; i < 8; i++) {
80105987:	8d 45 e6             	lea    -0x1a(%ebp),%eax
8010598a:	83 c4 10             	add    $0x10,%esp
8010598d:	eb 03                	jmp    80105992 <sys_bufread+0x72>
8010598f:	90                   	nop
80105990:	89 d0                	mov    %edx,%eax
    unsigned int digit = n % 16;
80105992:	89 f1                	mov    %esi,%ecx
    n /= 16;
80105994:	c1 ee 04             	shr    $0x4,%esi
    unsigned int digit = n % 16;
80105997:	83 e1 0f             	and    $0xf,%ecx
      hex[7 - i] = '0' + digit;
8010599a:	8d 79 30             	lea    0x30(%ecx),%edi
8010599d:	8d 51 37             	lea    0x37(%ecx),%edx
801059a0:	83 f9 09             	cmp    $0x9,%ecx
801059a3:	0f 46 d7             	cmovbe %edi,%edx
  for (int i = 0; i < 8; i++) {
801059a6:	8d 7d df             	lea    -0x21(%ebp),%edi
      hex[7 - i] = '0' + digit;
801059a9:	88 10                	mov    %dl,(%eax)
  for (int i = 0; i < 8; i++) {
801059ab:	8d 50 ff             	lea    -0x1(%eax),%edx
801059ae:	39 c7                	cmp    %eax,%edi
801059b0:	75 de                	jne    80105990 <sys_bufread+0x70>
    cprintf("%s,", lo_hex);
801059b2:	83 ec 08             	sub    $0x8,%esp
  hex[8] = '\0';
801059b5:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
    cprintf("%s,", lo_hex);
801059b9:	57                   	push   %edi
801059ba:	68 c1 7c 10 80       	push   $0x80107cc1
801059bf:	e8 dc ac ff ff       	call   801006a0 <cprintf>

    // print other elements
    cprintf("%d,%s,%d,%d,%d,%d\n", buf_log[i].pid, buf_log[i].name,
801059c4:	83 c4 0c             	add    $0xc,%esp
801059c7:	ff 73 1c             	push   0x1c(%ebx)
801059ca:	ff 73 18             	push   0x18(%ebx)
801059cd:	ff 73 14             	push   0x14(%ebx)
801059d0:	ff 73 10             	push   0x10(%ebx)
801059d3:	53                   	push   %ebx
  for (int i = 0; i < LOGBUFSIZE; i++) {
801059d4:	83 c3 2c             	add    $0x2c,%ebx
    cprintf("%d,%s,%d,%d,%d,%d\n", buf_log[i].pid, buf_log[i].name,
801059d7:	ff 73 d0             	push   -0x30(%ebx)
801059da:	68 c5 7c 10 80       	push   $0x80107cc5
801059df:	e8 bc ac ff ff       	call   801006a0 <cprintf>
  for (int i = 0; i < LOGBUFSIZE; i++) {
801059e4:	b8 bc b5 11 80       	mov    $0x8011b5bc,%eax
801059e9:	83 c4 20             	add    $0x20,%esp
801059ec:	39 d8                	cmp    %ebx,%eax
801059ee:	0f 85 4c ff ff ff    	jne    80105940 <sys_bufread+0x20>
            buf_log[i].event_name, buf_log[i].prev_pstate,
            buf_log[i].next_pstate, buf_log[i].cpu);
  }
  cprintf("\n");
801059f4:	83 ec 0c             	sub    $0xc,%esp
801059f7:	68 ef 7e 10 80       	push   $0x80107eef
801059fc:	e8 9f ac ff ff       	call   801006a0 <cprintf>

  return 0;
}
80105a01:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a04:	31 c0                	xor    %eax,%eax
80105a06:	5b                   	pop    %ebx
80105a07:	5e                   	pop    %esi
80105a08:	5f                   	pop    %edi
80105a09:	5d                   	pop    %ebp
80105a0a:	c3                   	ret    
80105a0b:	66 90                	xchg   %ax,%ax
80105a0d:	66 90                	xchg   %ax,%ax
80105a0f:	90                   	nop

80105a10 <sys_fork>:
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80105a10:	e9 cb e2 ff ff       	jmp    80103ce0 <fork>
80105a15:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105a20 <sys_exit>:
}

int
sys_exit(void)
{
80105a20:	55                   	push   %ebp
80105a21:	89 e5                	mov    %esp,%ebp
80105a23:	83 ec 08             	sub    $0x8,%esp
  exit();
80105a26:	e8 b5 e5 ff ff       	call   80103fe0 <exit>
  return 0;  // not reached
}
80105a2b:	31 c0                	xor    %eax,%eax
80105a2d:	c9                   	leave  
80105a2e:	c3                   	ret    
80105a2f:	90                   	nop

80105a30 <sys_wait>:

int
sys_wait(void)
{
  return wait();
80105a30:	e9 2b e8 ff ff       	jmp    80104260 <wait>
80105a35:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105a40 <sys_kill>:
}

int
sys_kill(void)
{
80105a40:	55                   	push   %ebp
80105a41:	89 e5                	mov    %esp,%ebp
80105a43:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105a46:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105a49:	50                   	push   %eax
80105a4a:	6a 00                	push   $0x0
80105a4c:	e8 0f f1 ff ff       	call   80104b60 <argint>
80105a51:	83 c4 10             	add    $0x10,%esp
80105a54:	85 c0                	test   %eax,%eax
80105a56:	78 18                	js     80105a70 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105a58:	83 ec 0c             	sub    $0xc,%esp
80105a5b:	ff 75 f4             	push   -0xc(%ebp)
80105a5e:	e8 3d e9 ff ff       	call   801043a0 <kill>
80105a63:	83 c4 10             	add    $0x10,%esp
}
80105a66:	c9                   	leave  
80105a67:	c3                   	ret    
80105a68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a6f:	90                   	nop
80105a70:	c9                   	leave  
    return -1;
80105a71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105a76:	c3                   	ret    
80105a77:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a7e:	66 90                	xchg   %ax,%ax

80105a80 <sys_getpid>:

int
sys_getpid(void)
{
80105a80:	55                   	push   %ebp
80105a81:	89 e5                	mov    %esp,%ebp
80105a83:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105a86:	e8 25 de ff ff       	call   801038b0 <myproc>
80105a8b:	8b 40 10             	mov    0x10(%eax),%eax
}
80105a8e:	c9                   	leave  
80105a8f:	c3                   	ret    

80105a90 <sys_sbrk>:

int
sys_sbrk(void)
{
80105a90:	55                   	push   %ebp
80105a91:	89 e5                	mov    %esp,%ebp
80105a93:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105a94:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105a97:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
80105a9a:	50                   	push   %eax
80105a9b:	6a 00                	push   $0x0
80105a9d:	e8 be f0 ff ff       	call   80104b60 <argint>
80105aa2:	83 c4 10             	add    $0x10,%esp
80105aa5:	85 c0                	test   %eax,%eax
80105aa7:	78 27                	js     80105ad0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105aa9:	e8 02 de ff ff       	call   801038b0 <myproc>
  if(growproc(n) < 0)
80105aae:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
80105ab1:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105ab3:	ff 75 f4             	push   -0xc(%ebp)
80105ab6:	e8 a5 e1 ff ff       	call   80103c60 <growproc>
80105abb:	83 c4 10             	add    $0x10,%esp
80105abe:	85 c0                	test   %eax,%eax
80105ac0:	78 0e                	js     80105ad0 <sys_sbrk+0x40>
    return -1;
  return addr;
}
80105ac2:	89 d8                	mov    %ebx,%eax
80105ac4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105ac7:	c9                   	leave  
80105ac8:	c3                   	ret    
80105ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105ad0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105ad5:	eb eb                	jmp    80105ac2 <sys_sbrk+0x32>
80105ad7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ade:	66 90                	xchg   %ax,%ax

80105ae0 <sys_sleep>:

int
sys_sleep(void)
{
80105ae0:	55                   	push   %ebp
80105ae1:	89 e5                	mov    %esp,%ebp
80105ae3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105ae4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105ae7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
80105aea:	50                   	push   %eax
80105aeb:	6a 00                	push   $0x0
80105aed:	e8 6e f0 ff ff       	call   80104b60 <argint>
80105af2:	83 c4 10             	add    $0x10,%esp
80105af5:	85 c0                	test   %eax,%eax
80105af7:	0f 88 8a 00 00 00    	js     80105b87 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
80105afd:	83 ec 0c             	sub    $0xc,%esp
80105b00:	68 e0 b5 11 80       	push   $0x8011b5e0
80105b05:	e8 d6 ec ff ff       	call   801047e0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105b0a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  ticks0 = ticks;
80105b0d:	8b 1d c4 b5 11 80    	mov    0x8011b5c4,%ebx
  while(ticks - ticks0 < n){
80105b13:	83 c4 10             	add    $0x10,%esp
80105b16:	85 d2                	test   %edx,%edx
80105b18:	75 27                	jne    80105b41 <sys_sleep+0x61>
80105b1a:	eb 54                	jmp    80105b70 <sys_sleep+0x90>
80105b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105b20:	83 ec 08             	sub    $0x8,%esp
80105b23:	68 e0 b5 11 80       	push   $0x8011b5e0
80105b28:	68 c4 b5 11 80       	push   $0x8011b5c4
80105b2d:	e8 2e e6 ff ff       	call   80104160 <sleep>
  while(ticks - ticks0 < n){
80105b32:	a1 c4 b5 11 80       	mov    0x8011b5c4,%eax
80105b37:	83 c4 10             	add    $0x10,%esp
80105b3a:	29 d8                	sub    %ebx,%eax
80105b3c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80105b3f:	73 2f                	jae    80105b70 <sys_sleep+0x90>
    if(myproc()->killed){
80105b41:	e8 6a dd ff ff       	call   801038b0 <myproc>
80105b46:	8b 40 24             	mov    0x24(%eax),%eax
80105b49:	85 c0                	test   %eax,%eax
80105b4b:	74 d3                	je     80105b20 <sys_sleep+0x40>
      release(&tickslock);
80105b4d:	83 ec 0c             	sub    $0xc,%esp
80105b50:	68 e0 b5 11 80       	push   $0x8011b5e0
80105b55:	e8 26 ec ff ff       	call   80104780 <release>
  }
  release(&tickslock);
  return 0;
}
80105b5a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      return -1;
80105b5d:	83 c4 10             	add    $0x10,%esp
80105b60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105b65:	c9                   	leave  
80105b66:	c3                   	ret    
80105b67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b6e:	66 90                	xchg   %ax,%ax
  release(&tickslock);
80105b70:	83 ec 0c             	sub    $0xc,%esp
80105b73:	68 e0 b5 11 80       	push   $0x8011b5e0
80105b78:	e8 03 ec ff ff       	call   80104780 <release>
  return 0;
80105b7d:	83 c4 10             	add    $0x10,%esp
80105b80:	31 c0                	xor    %eax,%eax
}
80105b82:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105b85:	c9                   	leave  
80105b86:	c3                   	ret    
    return -1;
80105b87:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b8c:	eb f4                	jmp    80105b82 <sys_sleep+0xa2>
80105b8e:	66 90                	xchg   %ax,%ax

80105b90 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105b90:	55                   	push   %ebp
80105b91:	89 e5                	mov    %esp,%ebp
80105b93:	53                   	push   %ebx
80105b94:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105b97:	68 e0 b5 11 80       	push   $0x8011b5e0
80105b9c:	e8 3f ec ff ff       	call   801047e0 <acquire>
  xticks = ticks;
80105ba1:	8b 1d c4 b5 11 80    	mov    0x8011b5c4,%ebx
  release(&tickslock);
80105ba7:	c7 04 24 e0 b5 11 80 	movl   $0x8011b5e0,(%esp)
80105bae:	e8 cd eb ff ff       	call   80104780 <release>
  return xticks;
}
80105bb3:	89 d8                	mov    %ebx,%eax
80105bb5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105bb8:	c9                   	leave  
80105bb9:	c3                   	ret    

80105bba <alltraps>:
80105bba:	1e                   	push   %ds
80105bbb:	06                   	push   %es
80105bbc:	0f a0                	push   %fs
80105bbe:	0f a8                	push   %gs
80105bc0:	60                   	pusha  
80105bc1:	66 b8 10 00          	mov    $0x10,%ax
80105bc5:	8e d8                	mov    %eax,%ds
80105bc7:	8e c0                	mov    %eax,%es
80105bc9:	54                   	push   %esp
80105bca:	e8 c1 00 00 00       	call   80105c90 <trap>
80105bcf:	83 c4 04             	add    $0x4,%esp

80105bd2 <trapret>:
80105bd2:	61                   	popa   
80105bd3:	0f a9                	pop    %gs
80105bd5:	0f a1                	pop    %fs
80105bd7:	07                   	pop    %es
80105bd8:	1f                   	pop    %ds
80105bd9:	83 c4 08             	add    $0x8,%esp
80105bdc:	cf                   	iret   
80105bdd:	66 90                	xchg   %ax,%ax
80105bdf:	90                   	nop

80105be0 <tvinit>:
struct spinlock tickslock;
uint ticks;

int boost_cnt; // added

void tvinit(void) {
80105be0:	55                   	push   %ebp
  int i;

  for (i = 0; i < 256; i++)
80105be1:	31 c0                	xor    %eax,%eax
void tvinit(void) {
80105be3:	89 e5                	mov    %esp,%ebp
80105be5:	83 ec 08             	sub    $0x8,%esp
80105be8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105bef:	90                   	nop
    SETGATE(idt[i], 0, SEG_KCODE << 3, vectors[i], 0);
80105bf0:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
80105bf7:	c7 04 c5 22 b6 11 80 	movl   $0x8e000008,-0x7fee49de(,%eax,8)
80105bfe:	08 00 00 8e 
80105c02:	66 89 14 c5 20 b6 11 	mov    %dx,-0x7fee49e0(,%eax,8)
80105c09:	80 
80105c0a:	c1 ea 10             	shr    $0x10,%edx
80105c0d:	66 89 14 c5 26 b6 11 	mov    %dx,-0x7fee49da(,%eax,8)
80105c14:	80 
  for (i = 0; i < 256; i++)
80105c15:	83 c0 01             	add    $0x1,%eax
80105c18:	3d 00 01 00 00       	cmp    $0x100,%eax
80105c1d:	75 d1                	jne    80105bf0 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE << 3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
80105c1f:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE << 3, vectors[T_SYSCALL], DPL_USER);
80105c22:	a1 08 a1 10 80       	mov    0x8010a108,%eax
80105c27:	c7 05 22 b8 11 80 08 	movl   $0xef000008,0x8011b822
80105c2e:	00 00 ef 
  initlock(&tickslock, "time");
80105c31:	68 10 7d 10 80       	push   $0x80107d10
80105c36:	68 e0 b5 11 80       	push   $0x8011b5e0
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE << 3, vectors[T_SYSCALL], DPL_USER);
80105c3b:	66 a3 20 b8 11 80    	mov    %ax,0x8011b820
80105c41:	c1 e8 10             	shr    $0x10,%eax
80105c44:	66 a3 26 b8 11 80    	mov    %ax,0x8011b826
  initlock(&tickslock, "time");
80105c4a:	e8 c1 e9 ff ff       	call   80104610 <initlock>
}
80105c4f:	83 c4 10             	add    $0x10,%esp
80105c52:	c9                   	leave  
80105c53:	c3                   	ret    
80105c54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105c5f:	90                   	nop

80105c60 <idtinit>:

void idtinit(void) {
80105c60:	55                   	push   %ebp
  pd[0] = size-1;
80105c61:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105c66:	89 e5                	mov    %esp,%ebp
80105c68:	83 ec 10             	sub    $0x10,%esp
80105c6b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105c6f:	b8 20 b6 11 80       	mov    $0x8011b620,%eax
80105c74:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105c78:	c1 e8 10             	shr    $0x10,%eax
80105c7b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105c7f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105c82:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105c85:	c9                   	leave  
80105c86:	c3                   	ret    
80105c87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c8e:	66 90                	xchg   %ax,%ax

80105c90 <trap>:

// PAGEBREAK: 41
void trap(struct trapframe *tf) {
80105c90:	55                   	push   %ebp
80105c91:	89 e5                	mov    %esp,%ebp
80105c93:	57                   	push   %edi
80105c94:	56                   	push   %esi
80105c95:	53                   	push   %ebx
80105c96:	83 ec 1c             	sub    $0x1c,%esp
80105c99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (tf->trapno == T_SYSCALL) {
80105c9c:	8b 43 30             	mov    0x30(%ebx),%eax
80105c9f:	83 f8 40             	cmp    $0x40,%eax
80105ca2:	0f 84 68 01 00 00    	je     80105e10 <trap+0x180>
    if (myproc()->killed)
      exit();
    return;
  }

  switch (tf->trapno) {
80105ca8:	83 e8 20             	sub    $0x20,%eax
80105cab:	83 f8 1f             	cmp    $0x1f,%eax
80105cae:	0f 87 8c 00 00 00    	ja     80105d40 <trap+0xb0>
80105cb4:	ff 24 85 b8 7d 10 80 	jmp    *-0x7fef8248(,%eax,4)
80105cbb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105cbf:	90                   	nop
        release(&tickslock);
      }
      lapiceoi();
      break;
    case T_IRQ0 + IRQ_IDE:
      ideintr();
80105cc0:	e8 7b c5 ff ff       	call   80102240 <ideintr>
      lapiceoi();
80105cc5:	e8 46 cc ff ff       	call   80102910 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
80105cca:	e8 e1 db ff ff       	call   801038b0 <myproc>
80105ccf:	85 c0                	test   %eax,%eax
80105cd1:	74 1d                	je     80105cf0 <trap+0x60>
80105cd3:	e8 d8 db ff ff       	call   801038b0 <myproc>
80105cd8:	8b 50 24             	mov    0x24(%eax),%edx
80105cdb:	85 d2                	test   %edx,%edx
80105cdd:	74 11                	je     80105cf0 <trap+0x60>
80105cdf:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105ce3:	83 e0 03             	and    $0x3,%eax
80105ce6:	66 83 f8 03          	cmp    $0x3,%ax
80105cea:	0f 84 e8 01 00 00    	je     80105ed8 <trap+0x248>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if (myproc() && myproc()->state == RUNNING &&
80105cf0:	e8 bb db ff ff       	call   801038b0 <myproc>
80105cf5:	85 c0                	test   %eax,%eax
80105cf7:	74 0f                	je     80105d08 <trap+0x78>
80105cf9:	e8 b2 db ff ff       	call   801038b0 <myproc>
80105cfe:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105d02:	0f 84 b8 00 00 00    	je     80105dc0 <trap+0x130>

    yield();
  }

  // Check if the process has been killed since we yielded
  if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
80105d08:	e8 a3 db ff ff       	call   801038b0 <myproc>
80105d0d:	85 c0                	test   %eax,%eax
80105d0f:	74 1d                	je     80105d2e <trap+0x9e>
80105d11:	e8 9a db ff ff       	call   801038b0 <myproc>
80105d16:	8b 40 24             	mov    0x24(%eax),%eax
80105d19:	85 c0                	test   %eax,%eax
80105d1b:	74 11                	je     80105d2e <trap+0x9e>
80105d1d:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105d21:	83 e0 03             	and    $0x3,%eax
80105d24:	66 83 f8 03          	cmp    $0x3,%ax
80105d28:	0f 84 0f 01 00 00    	je     80105e3d <trap+0x1ad>
    exit();
}
80105d2e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d31:	5b                   	pop    %ebx
80105d32:	5e                   	pop    %esi
80105d33:	5f                   	pop    %edi
80105d34:	5d                   	pop    %ebp
80105d35:	c3                   	ret    
80105d36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105d3d:	8d 76 00             	lea    0x0(%esi),%esi
      if (myproc() == 0 || (tf->cs & 3) == 0) {
80105d40:	e8 6b db ff ff       	call   801038b0 <myproc>
80105d45:	8b 7b 38             	mov    0x38(%ebx),%edi
80105d48:	85 c0                	test   %eax,%eax
80105d4a:	0f 84 a2 01 00 00    	je     80105ef2 <trap+0x262>
80105d50:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105d54:	0f 84 98 01 00 00    	je     80105ef2 <trap+0x262>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105d5a:	0f 20 d1             	mov    %cr2,%ecx
80105d5d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
      cprintf(
80105d60:	e8 2b db ff ff       	call   80103890 <cpuid>
80105d65:	8b 73 30             	mov    0x30(%ebx),%esi
80105d68:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105d6b:	8b 43 34             	mov    0x34(%ebx),%eax
80105d6e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          myproc()->pid, myproc()->name, tf->trapno, tf->err, cpuid(), tf->eip,
80105d71:	e8 3a db ff ff       	call   801038b0 <myproc>
80105d76:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105d79:	e8 32 db ff ff       	call   801038b0 <myproc>
      cprintf(
80105d7e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105d81:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105d84:	51                   	push   %ecx
80105d85:	57                   	push   %edi
80105d86:	52                   	push   %edx
80105d87:	ff 75 e4             	push   -0x1c(%ebp)
80105d8a:	56                   	push   %esi
          myproc()->pid, myproc()->name, tf->trapno, tf->err, cpuid(), tf->eip,
80105d8b:	8b 75 e0             	mov    -0x20(%ebp),%esi
80105d8e:	83 c6 6c             	add    $0x6c,%esi
      cprintf(
80105d91:	56                   	push   %esi
80105d92:	ff 70 10             	push   0x10(%eax)
80105d95:	68 74 7d 10 80       	push   $0x80107d74
80105d9a:	e8 01 a9 ff ff       	call   801006a0 <cprintf>
      myproc()->killed = 1;
80105d9f:	83 c4 20             	add    $0x20,%esp
80105da2:	e8 09 db ff ff       	call   801038b0 <myproc>
80105da7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
80105dae:	e8 fd da ff ff       	call   801038b0 <myproc>
80105db3:	85 c0                	test   %eax,%eax
80105db5:	0f 85 18 ff ff ff    	jne    80105cd3 <trap+0x43>
80105dbb:	e9 30 ff ff ff       	jmp    80105cf0 <trap+0x60>
  if (myproc() && myproc()->state == RUNNING &&
80105dc0:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105dc4:	0f 85 3e ff ff ff    	jne    80105d08 <trap+0x78>
    yield();
80105dca:	e8 11 e3 ff ff       	call   801040e0 <yield>
80105dcf:	e9 34 ff ff ff       	jmp    80105d08 <trap+0x78>
80105dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      cprintf("cpu%d: spurious interrupt at %x:%x\n", cpuid(), tf->cs, tf->eip);
80105dd8:	8b 7b 38             	mov    0x38(%ebx),%edi
80105ddb:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105ddf:	e8 ac da ff ff       	call   80103890 <cpuid>
80105de4:	57                   	push   %edi
80105de5:	56                   	push   %esi
80105de6:	50                   	push   %eax
80105de7:	68 1c 7d 10 80       	push   $0x80107d1c
80105dec:	e8 af a8 ff ff       	call   801006a0 <cprintf>
      lapiceoi();
80105df1:	e8 1a cb ff ff       	call   80102910 <lapiceoi>
      break;
80105df6:	83 c4 10             	add    $0x10,%esp
  if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
80105df9:	e8 b2 da ff ff       	call   801038b0 <myproc>
80105dfe:	85 c0                	test   %eax,%eax
80105e00:	0f 85 cd fe ff ff    	jne    80105cd3 <trap+0x43>
80105e06:	e9 e5 fe ff ff       	jmp    80105cf0 <trap+0x60>
80105e0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105e0f:	90                   	nop
    if (myproc()->killed)
80105e10:	e8 9b da ff ff       	call   801038b0 <myproc>
80105e15:	8b 70 24             	mov    0x24(%eax),%esi
80105e18:	85 f6                	test   %esi,%esi
80105e1a:	0f 85 c8 00 00 00    	jne    80105ee8 <trap+0x258>
    myproc()->tf = tf;
80105e20:	e8 8b da ff ff       	call   801038b0 <myproc>
80105e25:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105e28:	e8 73 ee ff ff       	call   80104ca0 <syscall>
    if (myproc()->killed)
80105e2d:	e8 7e da ff ff       	call   801038b0 <myproc>
80105e32:	8b 48 24             	mov    0x24(%eax),%ecx
80105e35:	85 c9                	test   %ecx,%ecx
80105e37:	0f 84 f1 fe ff ff    	je     80105d2e <trap+0x9e>
}
80105e3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e40:	5b                   	pop    %ebx
80105e41:	5e                   	pop    %esi
80105e42:	5f                   	pop    %edi
80105e43:	5d                   	pop    %ebp
      exit();
80105e44:	e9 97 e1 ff ff       	jmp    80103fe0 <exit>
80105e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      uartintr();
80105e50:	e8 3b 02 00 00       	call   80106090 <uartintr>
      lapiceoi();
80105e55:	e8 b6 ca ff ff       	call   80102910 <lapiceoi>
  if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
80105e5a:	e8 51 da ff ff       	call   801038b0 <myproc>
80105e5f:	85 c0                	test   %eax,%eax
80105e61:	0f 85 6c fe ff ff    	jne    80105cd3 <trap+0x43>
80105e67:	e9 84 fe ff ff       	jmp    80105cf0 <trap+0x60>
80105e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      kbdintr();
80105e70:	e8 5b c9 ff ff       	call   801027d0 <kbdintr>
      lapiceoi();
80105e75:	e8 96 ca ff ff       	call   80102910 <lapiceoi>
  if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
80105e7a:	e8 31 da ff ff       	call   801038b0 <myproc>
80105e7f:	85 c0                	test   %eax,%eax
80105e81:	0f 85 4c fe ff ff    	jne    80105cd3 <trap+0x43>
80105e87:	e9 64 fe ff ff       	jmp    80105cf0 <trap+0x60>
80105e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if (cpuid() == 0) {
80105e90:	e8 fb d9 ff ff       	call   80103890 <cpuid>
80105e95:	85 c0                	test   %eax,%eax
80105e97:	0f 85 28 fe ff ff    	jne    80105cc5 <trap+0x35>
        acquire(&tickslock);
80105e9d:	83 ec 0c             	sub    $0xc,%esp
80105ea0:	68 e0 b5 11 80       	push   $0x8011b5e0
80105ea5:	e8 36 e9 ff ff       	call   801047e0 <acquire>
        wakeup(&ticks);
80105eaa:	c7 04 24 c4 b5 11 80 	movl   $0x8011b5c4,(%esp)
        ticks++;
80105eb1:	83 05 c4 b5 11 80 01 	addl   $0x1,0x8011b5c4
        wakeup(&ticks);
80105eb8:	e8 b3 e4 ff ff       	call   80104370 <wakeup>
        release(&tickslock);
80105ebd:	c7 04 24 e0 b5 11 80 	movl   $0x8011b5e0,(%esp)
80105ec4:	e8 b7 e8 ff ff       	call   80104780 <release>
80105ec9:	83 c4 10             	add    $0x10,%esp
      lapiceoi();
80105ecc:	e9 f4 fd ff ff       	jmp    80105cc5 <trap+0x35>
80105ed1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
80105ed8:	e8 03 e1 ff ff       	call   80103fe0 <exit>
80105edd:	e9 0e fe ff ff       	jmp    80105cf0 <trap+0x60>
80105ee2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
80105ee8:	e8 f3 e0 ff ff       	call   80103fe0 <exit>
80105eed:	e9 2e ff ff ff       	jmp    80105e20 <trap+0x190>
80105ef2:	0f 20 d6             	mov    %cr2,%esi
        cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105ef5:	e8 96 d9 ff ff       	call   80103890 <cpuid>
80105efa:	83 ec 0c             	sub    $0xc,%esp
80105efd:	56                   	push   %esi
80105efe:	57                   	push   %edi
80105eff:	50                   	push   %eax
80105f00:	ff 73 30             	push   0x30(%ebx)
80105f03:	68 40 7d 10 80       	push   $0x80107d40
80105f08:	e8 93 a7 ff ff       	call   801006a0 <cprintf>
        panic("trap");
80105f0d:	83 c4 14             	add    $0x14,%esp
80105f10:	68 15 7d 10 80       	push   $0x80107d15
80105f15:	e8 66 a4 ff ff       	call   80100380 <panic>
80105f1a:	66 90                	xchg   %ax,%ax
80105f1c:	66 90                	xchg   %ax,%ax
80105f1e:	66 90                	xchg   %ax,%ax

80105f20 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105f20:	a1 20 be 11 80       	mov    0x8011be20,%eax
80105f25:	85 c0                	test   %eax,%eax
80105f27:	74 17                	je     80105f40 <uartgetc+0x20>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105f29:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105f2e:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105f2f:	a8 01                	test   $0x1,%al
80105f31:	74 0d                	je     80105f40 <uartgetc+0x20>
80105f33:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105f38:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105f39:	0f b6 c0             	movzbl %al,%eax
80105f3c:	c3                   	ret    
80105f3d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80105f40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105f45:	c3                   	ret    
80105f46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105f4d:	8d 76 00             	lea    0x0(%esi),%esi

80105f50 <uartinit>:
{
80105f50:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105f51:	31 c9                	xor    %ecx,%ecx
80105f53:	89 c8                	mov    %ecx,%eax
80105f55:	89 e5                	mov    %esp,%ebp
80105f57:	57                   	push   %edi
80105f58:	bf fa 03 00 00       	mov    $0x3fa,%edi
80105f5d:	56                   	push   %esi
80105f5e:	89 fa                	mov    %edi,%edx
80105f60:	53                   	push   %ebx
80105f61:	83 ec 1c             	sub    $0x1c,%esp
80105f64:	ee                   	out    %al,(%dx)
80105f65:	be fb 03 00 00       	mov    $0x3fb,%esi
80105f6a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105f6f:	89 f2                	mov    %esi,%edx
80105f71:	ee                   	out    %al,(%dx)
80105f72:	b8 0c 00 00 00       	mov    $0xc,%eax
80105f77:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105f7c:	ee                   	out    %al,(%dx)
80105f7d:	bb f9 03 00 00       	mov    $0x3f9,%ebx
80105f82:	89 c8                	mov    %ecx,%eax
80105f84:	89 da                	mov    %ebx,%edx
80105f86:	ee                   	out    %al,(%dx)
80105f87:	b8 03 00 00 00       	mov    $0x3,%eax
80105f8c:	89 f2                	mov    %esi,%edx
80105f8e:	ee                   	out    %al,(%dx)
80105f8f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105f94:	89 c8                	mov    %ecx,%eax
80105f96:	ee                   	out    %al,(%dx)
80105f97:	b8 01 00 00 00       	mov    $0x1,%eax
80105f9c:	89 da                	mov    %ebx,%edx
80105f9e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105f9f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105fa4:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105fa5:	3c ff                	cmp    $0xff,%al
80105fa7:	74 78                	je     80106021 <uartinit+0xd1>
  uart = 1;
80105fa9:	c7 05 20 be 11 80 01 	movl   $0x1,0x8011be20
80105fb0:	00 00 00 
80105fb3:	89 fa                	mov    %edi,%edx
80105fb5:	ec                   	in     (%dx),%al
80105fb6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105fbb:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105fbc:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
80105fbf:	bf 38 7e 10 80       	mov    $0x80107e38,%edi
80105fc4:	be fd 03 00 00       	mov    $0x3fd,%esi
  ioapicenable(IRQ_COM1, 0);
80105fc9:	6a 00                	push   $0x0
80105fcb:	6a 04                	push   $0x4
80105fcd:	e8 ae c4 ff ff       	call   80102480 <ioapicenable>
  for(p="xv6...\n"; *p; p++)
80105fd2:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
  ioapicenable(IRQ_COM1, 0);
80105fd6:	83 c4 10             	add    $0x10,%esp
80105fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(!uart)
80105fe0:	a1 20 be 11 80       	mov    0x8011be20,%eax
80105fe5:	bb 80 00 00 00       	mov    $0x80,%ebx
80105fea:	85 c0                	test   %eax,%eax
80105fec:	75 14                	jne    80106002 <uartinit+0xb2>
80105fee:	eb 23                	jmp    80106013 <uartinit+0xc3>
    microdelay(10);
80105ff0:	83 ec 0c             	sub    $0xc,%esp
80105ff3:	6a 0a                	push   $0xa
80105ff5:	e8 36 c9 ff ff       	call   80102930 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105ffa:	83 c4 10             	add    $0x10,%esp
80105ffd:	83 eb 01             	sub    $0x1,%ebx
80106000:	74 07                	je     80106009 <uartinit+0xb9>
80106002:	89 f2                	mov    %esi,%edx
80106004:	ec                   	in     (%dx),%al
80106005:	a8 20                	test   $0x20,%al
80106007:	74 e7                	je     80105ff0 <uartinit+0xa0>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80106009:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
8010600d:	ba f8 03 00 00       	mov    $0x3f8,%edx
80106012:	ee                   	out    %al,(%dx)
  for(p="xv6...\n"; *p; p++)
80106013:	0f b6 47 01          	movzbl 0x1(%edi),%eax
80106017:	83 c7 01             	add    $0x1,%edi
8010601a:	88 45 e7             	mov    %al,-0x19(%ebp)
8010601d:	84 c0                	test   %al,%al
8010601f:	75 bf                	jne    80105fe0 <uartinit+0x90>
}
80106021:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106024:	5b                   	pop    %ebx
80106025:	5e                   	pop    %esi
80106026:	5f                   	pop    %edi
80106027:	5d                   	pop    %ebp
80106028:	c3                   	ret    
80106029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106030 <uartputc>:
  if(!uart)
80106030:	a1 20 be 11 80       	mov    0x8011be20,%eax
80106035:	85 c0                	test   %eax,%eax
80106037:	74 47                	je     80106080 <uartputc+0x50>
{
80106039:	55                   	push   %ebp
8010603a:	89 e5                	mov    %esp,%ebp
8010603c:	56                   	push   %esi
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010603d:	be fd 03 00 00       	mov    $0x3fd,%esi
80106042:	53                   	push   %ebx
80106043:	bb 80 00 00 00       	mov    $0x80,%ebx
80106048:	eb 18                	jmp    80106062 <uartputc+0x32>
8010604a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    microdelay(10);
80106050:	83 ec 0c             	sub    $0xc,%esp
80106053:	6a 0a                	push   $0xa
80106055:	e8 d6 c8 ff ff       	call   80102930 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
8010605a:	83 c4 10             	add    $0x10,%esp
8010605d:	83 eb 01             	sub    $0x1,%ebx
80106060:	74 07                	je     80106069 <uartputc+0x39>
80106062:	89 f2                	mov    %esi,%edx
80106064:	ec                   	in     (%dx),%al
80106065:	a8 20                	test   $0x20,%al
80106067:	74 e7                	je     80106050 <uartputc+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80106069:	8b 45 08             	mov    0x8(%ebp),%eax
8010606c:	ba f8 03 00 00       	mov    $0x3f8,%edx
80106071:	ee                   	out    %al,(%dx)
}
80106072:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106075:	5b                   	pop    %ebx
80106076:	5e                   	pop    %esi
80106077:	5d                   	pop    %ebp
80106078:	c3                   	ret    
80106079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106080:	c3                   	ret    
80106081:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106088:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010608f:	90                   	nop

80106090 <uartintr>:

void
uartintr(void)
{
80106090:	55                   	push   %ebp
80106091:	89 e5                	mov    %esp,%ebp
80106093:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80106096:	68 20 5f 10 80       	push   $0x80105f20
8010609b:	e8 e0 a7 ff ff       	call   80100880 <consoleintr>
}
801060a0:	83 c4 10             	add    $0x10,%esp
801060a3:	c9                   	leave  
801060a4:	c3                   	ret    

801060a5 <vector0>:
801060a5:	6a 00                	push   $0x0
801060a7:	6a 00                	push   $0x0
801060a9:	e9 0c fb ff ff       	jmp    80105bba <alltraps>

801060ae <vector1>:
801060ae:	6a 00                	push   $0x0
801060b0:	6a 01                	push   $0x1
801060b2:	e9 03 fb ff ff       	jmp    80105bba <alltraps>

801060b7 <vector2>:
801060b7:	6a 00                	push   $0x0
801060b9:	6a 02                	push   $0x2
801060bb:	e9 fa fa ff ff       	jmp    80105bba <alltraps>

801060c0 <vector3>:
801060c0:	6a 00                	push   $0x0
801060c2:	6a 03                	push   $0x3
801060c4:	e9 f1 fa ff ff       	jmp    80105bba <alltraps>

801060c9 <vector4>:
801060c9:	6a 00                	push   $0x0
801060cb:	6a 04                	push   $0x4
801060cd:	e9 e8 fa ff ff       	jmp    80105bba <alltraps>

801060d2 <vector5>:
801060d2:	6a 00                	push   $0x0
801060d4:	6a 05                	push   $0x5
801060d6:	e9 df fa ff ff       	jmp    80105bba <alltraps>

801060db <vector6>:
801060db:	6a 00                	push   $0x0
801060dd:	6a 06                	push   $0x6
801060df:	e9 d6 fa ff ff       	jmp    80105bba <alltraps>

801060e4 <vector7>:
801060e4:	6a 00                	push   $0x0
801060e6:	6a 07                	push   $0x7
801060e8:	e9 cd fa ff ff       	jmp    80105bba <alltraps>

801060ed <vector8>:
801060ed:	6a 08                	push   $0x8
801060ef:	e9 c6 fa ff ff       	jmp    80105bba <alltraps>

801060f4 <vector9>:
801060f4:	6a 00                	push   $0x0
801060f6:	6a 09                	push   $0x9
801060f8:	e9 bd fa ff ff       	jmp    80105bba <alltraps>

801060fd <vector10>:
801060fd:	6a 0a                	push   $0xa
801060ff:	e9 b6 fa ff ff       	jmp    80105bba <alltraps>

80106104 <vector11>:
80106104:	6a 0b                	push   $0xb
80106106:	e9 af fa ff ff       	jmp    80105bba <alltraps>

8010610b <vector12>:
8010610b:	6a 0c                	push   $0xc
8010610d:	e9 a8 fa ff ff       	jmp    80105bba <alltraps>

80106112 <vector13>:
80106112:	6a 0d                	push   $0xd
80106114:	e9 a1 fa ff ff       	jmp    80105bba <alltraps>

80106119 <vector14>:
80106119:	6a 0e                	push   $0xe
8010611b:	e9 9a fa ff ff       	jmp    80105bba <alltraps>

80106120 <vector15>:
80106120:	6a 00                	push   $0x0
80106122:	6a 0f                	push   $0xf
80106124:	e9 91 fa ff ff       	jmp    80105bba <alltraps>

80106129 <vector16>:
80106129:	6a 00                	push   $0x0
8010612b:	6a 10                	push   $0x10
8010612d:	e9 88 fa ff ff       	jmp    80105bba <alltraps>

80106132 <vector17>:
80106132:	6a 11                	push   $0x11
80106134:	e9 81 fa ff ff       	jmp    80105bba <alltraps>

80106139 <vector18>:
80106139:	6a 00                	push   $0x0
8010613b:	6a 12                	push   $0x12
8010613d:	e9 78 fa ff ff       	jmp    80105bba <alltraps>

80106142 <vector19>:
80106142:	6a 00                	push   $0x0
80106144:	6a 13                	push   $0x13
80106146:	e9 6f fa ff ff       	jmp    80105bba <alltraps>

8010614b <vector20>:
8010614b:	6a 00                	push   $0x0
8010614d:	6a 14                	push   $0x14
8010614f:	e9 66 fa ff ff       	jmp    80105bba <alltraps>

80106154 <vector21>:
80106154:	6a 00                	push   $0x0
80106156:	6a 15                	push   $0x15
80106158:	e9 5d fa ff ff       	jmp    80105bba <alltraps>

8010615d <vector22>:
8010615d:	6a 00                	push   $0x0
8010615f:	6a 16                	push   $0x16
80106161:	e9 54 fa ff ff       	jmp    80105bba <alltraps>

80106166 <vector23>:
80106166:	6a 00                	push   $0x0
80106168:	6a 17                	push   $0x17
8010616a:	e9 4b fa ff ff       	jmp    80105bba <alltraps>

8010616f <vector24>:
8010616f:	6a 00                	push   $0x0
80106171:	6a 18                	push   $0x18
80106173:	e9 42 fa ff ff       	jmp    80105bba <alltraps>

80106178 <vector25>:
80106178:	6a 00                	push   $0x0
8010617a:	6a 19                	push   $0x19
8010617c:	e9 39 fa ff ff       	jmp    80105bba <alltraps>

80106181 <vector26>:
80106181:	6a 00                	push   $0x0
80106183:	6a 1a                	push   $0x1a
80106185:	e9 30 fa ff ff       	jmp    80105bba <alltraps>

8010618a <vector27>:
8010618a:	6a 00                	push   $0x0
8010618c:	6a 1b                	push   $0x1b
8010618e:	e9 27 fa ff ff       	jmp    80105bba <alltraps>

80106193 <vector28>:
80106193:	6a 00                	push   $0x0
80106195:	6a 1c                	push   $0x1c
80106197:	e9 1e fa ff ff       	jmp    80105bba <alltraps>

8010619c <vector29>:
8010619c:	6a 00                	push   $0x0
8010619e:	6a 1d                	push   $0x1d
801061a0:	e9 15 fa ff ff       	jmp    80105bba <alltraps>

801061a5 <vector30>:
801061a5:	6a 00                	push   $0x0
801061a7:	6a 1e                	push   $0x1e
801061a9:	e9 0c fa ff ff       	jmp    80105bba <alltraps>

801061ae <vector31>:
801061ae:	6a 00                	push   $0x0
801061b0:	6a 1f                	push   $0x1f
801061b2:	e9 03 fa ff ff       	jmp    80105bba <alltraps>

801061b7 <vector32>:
801061b7:	6a 00                	push   $0x0
801061b9:	6a 20                	push   $0x20
801061bb:	e9 fa f9 ff ff       	jmp    80105bba <alltraps>

801061c0 <vector33>:
801061c0:	6a 00                	push   $0x0
801061c2:	6a 21                	push   $0x21
801061c4:	e9 f1 f9 ff ff       	jmp    80105bba <alltraps>

801061c9 <vector34>:
801061c9:	6a 00                	push   $0x0
801061cb:	6a 22                	push   $0x22
801061cd:	e9 e8 f9 ff ff       	jmp    80105bba <alltraps>

801061d2 <vector35>:
801061d2:	6a 00                	push   $0x0
801061d4:	6a 23                	push   $0x23
801061d6:	e9 df f9 ff ff       	jmp    80105bba <alltraps>

801061db <vector36>:
801061db:	6a 00                	push   $0x0
801061dd:	6a 24                	push   $0x24
801061df:	e9 d6 f9 ff ff       	jmp    80105bba <alltraps>

801061e4 <vector37>:
801061e4:	6a 00                	push   $0x0
801061e6:	6a 25                	push   $0x25
801061e8:	e9 cd f9 ff ff       	jmp    80105bba <alltraps>

801061ed <vector38>:
801061ed:	6a 00                	push   $0x0
801061ef:	6a 26                	push   $0x26
801061f1:	e9 c4 f9 ff ff       	jmp    80105bba <alltraps>

801061f6 <vector39>:
801061f6:	6a 00                	push   $0x0
801061f8:	6a 27                	push   $0x27
801061fa:	e9 bb f9 ff ff       	jmp    80105bba <alltraps>

801061ff <vector40>:
801061ff:	6a 00                	push   $0x0
80106201:	6a 28                	push   $0x28
80106203:	e9 b2 f9 ff ff       	jmp    80105bba <alltraps>

80106208 <vector41>:
80106208:	6a 00                	push   $0x0
8010620a:	6a 29                	push   $0x29
8010620c:	e9 a9 f9 ff ff       	jmp    80105bba <alltraps>

80106211 <vector42>:
80106211:	6a 00                	push   $0x0
80106213:	6a 2a                	push   $0x2a
80106215:	e9 a0 f9 ff ff       	jmp    80105bba <alltraps>

8010621a <vector43>:
8010621a:	6a 00                	push   $0x0
8010621c:	6a 2b                	push   $0x2b
8010621e:	e9 97 f9 ff ff       	jmp    80105bba <alltraps>

80106223 <vector44>:
80106223:	6a 00                	push   $0x0
80106225:	6a 2c                	push   $0x2c
80106227:	e9 8e f9 ff ff       	jmp    80105bba <alltraps>

8010622c <vector45>:
8010622c:	6a 00                	push   $0x0
8010622e:	6a 2d                	push   $0x2d
80106230:	e9 85 f9 ff ff       	jmp    80105bba <alltraps>

80106235 <vector46>:
80106235:	6a 00                	push   $0x0
80106237:	6a 2e                	push   $0x2e
80106239:	e9 7c f9 ff ff       	jmp    80105bba <alltraps>

8010623e <vector47>:
8010623e:	6a 00                	push   $0x0
80106240:	6a 2f                	push   $0x2f
80106242:	e9 73 f9 ff ff       	jmp    80105bba <alltraps>

80106247 <vector48>:
80106247:	6a 00                	push   $0x0
80106249:	6a 30                	push   $0x30
8010624b:	e9 6a f9 ff ff       	jmp    80105bba <alltraps>

80106250 <vector49>:
80106250:	6a 00                	push   $0x0
80106252:	6a 31                	push   $0x31
80106254:	e9 61 f9 ff ff       	jmp    80105bba <alltraps>

80106259 <vector50>:
80106259:	6a 00                	push   $0x0
8010625b:	6a 32                	push   $0x32
8010625d:	e9 58 f9 ff ff       	jmp    80105bba <alltraps>

80106262 <vector51>:
80106262:	6a 00                	push   $0x0
80106264:	6a 33                	push   $0x33
80106266:	e9 4f f9 ff ff       	jmp    80105bba <alltraps>

8010626b <vector52>:
8010626b:	6a 00                	push   $0x0
8010626d:	6a 34                	push   $0x34
8010626f:	e9 46 f9 ff ff       	jmp    80105bba <alltraps>

80106274 <vector53>:
80106274:	6a 00                	push   $0x0
80106276:	6a 35                	push   $0x35
80106278:	e9 3d f9 ff ff       	jmp    80105bba <alltraps>

8010627d <vector54>:
8010627d:	6a 00                	push   $0x0
8010627f:	6a 36                	push   $0x36
80106281:	e9 34 f9 ff ff       	jmp    80105bba <alltraps>

80106286 <vector55>:
80106286:	6a 00                	push   $0x0
80106288:	6a 37                	push   $0x37
8010628a:	e9 2b f9 ff ff       	jmp    80105bba <alltraps>

8010628f <vector56>:
8010628f:	6a 00                	push   $0x0
80106291:	6a 38                	push   $0x38
80106293:	e9 22 f9 ff ff       	jmp    80105bba <alltraps>

80106298 <vector57>:
80106298:	6a 00                	push   $0x0
8010629a:	6a 39                	push   $0x39
8010629c:	e9 19 f9 ff ff       	jmp    80105bba <alltraps>

801062a1 <vector58>:
801062a1:	6a 00                	push   $0x0
801062a3:	6a 3a                	push   $0x3a
801062a5:	e9 10 f9 ff ff       	jmp    80105bba <alltraps>

801062aa <vector59>:
801062aa:	6a 00                	push   $0x0
801062ac:	6a 3b                	push   $0x3b
801062ae:	e9 07 f9 ff ff       	jmp    80105bba <alltraps>

801062b3 <vector60>:
801062b3:	6a 00                	push   $0x0
801062b5:	6a 3c                	push   $0x3c
801062b7:	e9 fe f8 ff ff       	jmp    80105bba <alltraps>

801062bc <vector61>:
801062bc:	6a 00                	push   $0x0
801062be:	6a 3d                	push   $0x3d
801062c0:	e9 f5 f8 ff ff       	jmp    80105bba <alltraps>

801062c5 <vector62>:
801062c5:	6a 00                	push   $0x0
801062c7:	6a 3e                	push   $0x3e
801062c9:	e9 ec f8 ff ff       	jmp    80105bba <alltraps>

801062ce <vector63>:
801062ce:	6a 00                	push   $0x0
801062d0:	6a 3f                	push   $0x3f
801062d2:	e9 e3 f8 ff ff       	jmp    80105bba <alltraps>

801062d7 <vector64>:
801062d7:	6a 00                	push   $0x0
801062d9:	6a 40                	push   $0x40
801062db:	e9 da f8 ff ff       	jmp    80105bba <alltraps>

801062e0 <vector65>:
801062e0:	6a 00                	push   $0x0
801062e2:	6a 41                	push   $0x41
801062e4:	e9 d1 f8 ff ff       	jmp    80105bba <alltraps>

801062e9 <vector66>:
801062e9:	6a 00                	push   $0x0
801062eb:	6a 42                	push   $0x42
801062ed:	e9 c8 f8 ff ff       	jmp    80105bba <alltraps>

801062f2 <vector67>:
801062f2:	6a 00                	push   $0x0
801062f4:	6a 43                	push   $0x43
801062f6:	e9 bf f8 ff ff       	jmp    80105bba <alltraps>

801062fb <vector68>:
801062fb:	6a 00                	push   $0x0
801062fd:	6a 44                	push   $0x44
801062ff:	e9 b6 f8 ff ff       	jmp    80105bba <alltraps>

80106304 <vector69>:
80106304:	6a 00                	push   $0x0
80106306:	6a 45                	push   $0x45
80106308:	e9 ad f8 ff ff       	jmp    80105bba <alltraps>

8010630d <vector70>:
8010630d:	6a 00                	push   $0x0
8010630f:	6a 46                	push   $0x46
80106311:	e9 a4 f8 ff ff       	jmp    80105bba <alltraps>

80106316 <vector71>:
80106316:	6a 00                	push   $0x0
80106318:	6a 47                	push   $0x47
8010631a:	e9 9b f8 ff ff       	jmp    80105bba <alltraps>

8010631f <vector72>:
8010631f:	6a 00                	push   $0x0
80106321:	6a 48                	push   $0x48
80106323:	e9 92 f8 ff ff       	jmp    80105bba <alltraps>

80106328 <vector73>:
80106328:	6a 00                	push   $0x0
8010632a:	6a 49                	push   $0x49
8010632c:	e9 89 f8 ff ff       	jmp    80105bba <alltraps>

80106331 <vector74>:
80106331:	6a 00                	push   $0x0
80106333:	6a 4a                	push   $0x4a
80106335:	e9 80 f8 ff ff       	jmp    80105bba <alltraps>

8010633a <vector75>:
8010633a:	6a 00                	push   $0x0
8010633c:	6a 4b                	push   $0x4b
8010633e:	e9 77 f8 ff ff       	jmp    80105bba <alltraps>

80106343 <vector76>:
80106343:	6a 00                	push   $0x0
80106345:	6a 4c                	push   $0x4c
80106347:	e9 6e f8 ff ff       	jmp    80105bba <alltraps>

8010634c <vector77>:
8010634c:	6a 00                	push   $0x0
8010634e:	6a 4d                	push   $0x4d
80106350:	e9 65 f8 ff ff       	jmp    80105bba <alltraps>

80106355 <vector78>:
80106355:	6a 00                	push   $0x0
80106357:	6a 4e                	push   $0x4e
80106359:	e9 5c f8 ff ff       	jmp    80105bba <alltraps>

8010635e <vector79>:
8010635e:	6a 00                	push   $0x0
80106360:	6a 4f                	push   $0x4f
80106362:	e9 53 f8 ff ff       	jmp    80105bba <alltraps>

80106367 <vector80>:
80106367:	6a 00                	push   $0x0
80106369:	6a 50                	push   $0x50
8010636b:	e9 4a f8 ff ff       	jmp    80105bba <alltraps>

80106370 <vector81>:
80106370:	6a 00                	push   $0x0
80106372:	6a 51                	push   $0x51
80106374:	e9 41 f8 ff ff       	jmp    80105bba <alltraps>

80106379 <vector82>:
80106379:	6a 00                	push   $0x0
8010637b:	6a 52                	push   $0x52
8010637d:	e9 38 f8 ff ff       	jmp    80105bba <alltraps>

80106382 <vector83>:
80106382:	6a 00                	push   $0x0
80106384:	6a 53                	push   $0x53
80106386:	e9 2f f8 ff ff       	jmp    80105bba <alltraps>

8010638b <vector84>:
8010638b:	6a 00                	push   $0x0
8010638d:	6a 54                	push   $0x54
8010638f:	e9 26 f8 ff ff       	jmp    80105bba <alltraps>

80106394 <vector85>:
80106394:	6a 00                	push   $0x0
80106396:	6a 55                	push   $0x55
80106398:	e9 1d f8 ff ff       	jmp    80105bba <alltraps>

8010639d <vector86>:
8010639d:	6a 00                	push   $0x0
8010639f:	6a 56                	push   $0x56
801063a1:	e9 14 f8 ff ff       	jmp    80105bba <alltraps>

801063a6 <vector87>:
801063a6:	6a 00                	push   $0x0
801063a8:	6a 57                	push   $0x57
801063aa:	e9 0b f8 ff ff       	jmp    80105bba <alltraps>

801063af <vector88>:
801063af:	6a 00                	push   $0x0
801063b1:	6a 58                	push   $0x58
801063b3:	e9 02 f8 ff ff       	jmp    80105bba <alltraps>

801063b8 <vector89>:
801063b8:	6a 00                	push   $0x0
801063ba:	6a 59                	push   $0x59
801063bc:	e9 f9 f7 ff ff       	jmp    80105bba <alltraps>

801063c1 <vector90>:
801063c1:	6a 00                	push   $0x0
801063c3:	6a 5a                	push   $0x5a
801063c5:	e9 f0 f7 ff ff       	jmp    80105bba <alltraps>

801063ca <vector91>:
801063ca:	6a 00                	push   $0x0
801063cc:	6a 5b                	push   $0x5b
801063ce:	e9 e7 f7 ff ff       	jmp    80105bba <alltraps>

801063d3 <vector92>:
801063d3:	6a 00                	push   $0x0
801063d5:	6a 5c                	push   $0x5c
801063d7:	e9 de f7 ff ff       	jmp    80105bba <alltraps>

801063dc <vector93>:
801063dc:	6a 00                	push   $0x0
801063de:	6a 5d                	push   $0x5d
801063e0:	e9 d5 f7 ff ff       	jmp    80105bba <alltraps>

801063e5 <vector94>:
801063e5:	6a 00                	push   $0x0
801063e7:	6a 5e                	push   $0x5e
801063e9:	e9 cc f7 ff ff       	jmp    80105bba <alltraps>

801063ee <vector95>:
801063ee:	6a 00                	push   $0x0
801063f0:	6a 5f                	push   $0x5f
801063f2:	e9 c3 f7 ff ff       	jmp    80105bba <alltraps>

801063f7 <vector96>:
801063f7:	6a 00                	push   $0x0
801063f9:	6a 60                	push   $0x60
801063fb:	e9 ba f7 ff ff       	jmp    80105bba <alltraps>

80106400 <vector97>:
80106400:	6a 00                	push   $0x0
80106402:	6a 61                	push   $0x61
80106404:	e9 b1 f7 ff ff       	jmp    80105bba <alltraps>

80106409 <vector98>:
80106409:	6a 00                	push   $0x0
8010640b:	6a 62                	push   $0x62
8010640d:	e9 a8 f7 ff ff       	jmp    80105bba <alltraps>

80106412 <vector99>:
80106412:	6a 00                	push   $0x0
80106414:	6a 63                	push   $0x63
80106416:	e9 9f f7 ff ff       	jmp    80105bba <alltraps>

8010641b <vector100>:
8010641b:	6a 00                	push   $0x0
8010641d:	6a 64                	push   $0x64
8010641f:	e9 96 f7 ff ff       	jmp    80105bba <alltraps>

80106424 <vector101>:
80106424:	6a 00                	push   $0x0
80106426:	6a 65                	push   $0x65
80106428:	e9 8d f7 ff ff       	jmp    80105bba <alltraps>

8010642d <vector102>:
8010642d:	6a 00                	push   $0x0
8010642f:	6a 66                	push   $0x66
80106431:	e9 84 f7 ff ff       	jmp    80105bba <alltraps>

80106436 <vector103>:
80106436:	6a 00                	push   $0x0
80106438:	6a 67                	push   $0x67
8010643a:	e9 7b f7 ff ff       	jmp    80105bba <alltraps>

8010643f <vector104>:
8010643f:	6a 00                	push   $0x0
80106441:	6a 68                	push   $0x68
80106443:	e9 72 f7 ff ff       	jmp    80105bba <alltraps>

80106448 <vector105>:
80106448:	6a 00                	push   $0x0
8010644a:	6a 69                	push   $0x69
8010644c:	e9 69 f7 ff ff       	jmp    80105bba <alltraps>

80106451 <vector106>:
80106451:	6a 00                	push   $0x0
80106453:	6a 6a                	push   $0x6a
80106455:	e9 60 f7 ff ff       	jmp    80105bba <alltraps>

8010645a <vector107>:
8010645a:	6a 00                	push   $0x0
8010645c:	6a 6b                	push   $0x6b
8010645e:	e9 57 f7 ff ff       	jmp    80105bba <alltraps>

80106463 <vector108>:
80106463:	6a 00                	push   $0x0
80106465:	6a 6c                	push   $0x6c
80106467:	e9 4e f7 ff ff       	jmp    80105bba <alltraps>

8010646c <vector109>:
8010646c:	6a 00                	push   $0x0
8010646e:	6a 6d                	push   $0x6d
80106470:	e9 45 f7 ff ff       	jmp    80105bba <alltraps>

80106475 <vector110>:
80106475:	6a 00                	push   $0x0
80106477:	6a 6e                	push   $0x6e
80106479:	e9 3c f7 ff ff       	jmp    80105bba <alltraps>

8010647e <vector111>:
8010647e:	6a 00                	push   $0x0
80106480:	6a 6f                	push   $0x6f
80106482:	e9 33 f7 ff ff       	jmp    80105bba <alltraps>

80106487 <vector112>:
80106487:	6a 00                	push   $0x0
80106489:	6a 70                	push   $0x70
8010648b:	e9 2a f7 ff ff       	jmp    80105bba <alltraps>

80106490 <vector113>:
80106490:	6a 00                	push   $0x0
80106492:	6a 71                	push   $0x71
80106494:	e9 21 f7 ff ff       	jmp    80105bba <alltraps>

80106499 <vector114>:
80106499:	6a 00                	push   $0x0
8010649b:	6a 72                	push   $0x72
8010649d:	e9 18 f7 ff ff       	jmp    80105bba <alltraps>

801064a2 <vector115>:
801064a2:	6a 00                	push   $0x0
801064a4:	6a 73                	push   $0x73
801064a6:	e9 0f f7 ff ff       	jmp    80105bba <alltraps>

801064ab <vector116>:
801064ab:	6a 00                	push   $0x0
801064ad:	6a 74                	push   $0x74
801064af:	e9 06 f7 ff ff       	jmp    80105bba <alltraps>

801064b4 <vector117>:
801064b4:	6a 00                	push   $0x0
801064b6:	6a 75                	push   $0x75
801064b8:	e9 fd f6 ff ff       	jmp    80105bba <alltraps>

801064bd <vector118>:
801064bd:	6a 00                	push   $0x0
801064bf:	6a 76                	push   $0x76
801064c1:	e9 f4 f6 ff ff       	jmp    80105bba <alltraps>

801064c6 <vector119>:
801064c6:	6a 00                	push   $0x0
801064c8:	6a 77                	push   $0x77
801064ca:	e9 eb f6 ff ff       	jmp    80105bba <alltraps>

801064cf <vector120>:
801064cf:	6a 00                	push   $0x0
801064d1:	6a 78                	push   $0x78
801064d3:	e9 e2 f6 ff ff       	jmp    80105bba <alltraps>

801064d8 <vector121>:
801064d8:	6a 00                	push   $0x0
801064da:	6a 79                	push   $0x79
801064dc:	e9 d9 f6 ff ff       	jmp    80105bba <alltraps>

801064e1 <vector122>:
801064e1:	6a 00                	push   $0x0
801064e3:	6a 7a                	push   $0x7a
801064e5:	e9 d0 f6 ff ff       	jmp    80105bba <alltraps>

801064ea <vector123>:
801064ea:	6a 00                	push   $0x0
801064ec:	6a 7b                	push   $0x7b
801064ee:	e9 c7 f6 ff ff       	jmp    80105bba <alltraps>

801064f3 <vector124>:
801064f3:	6a 00                	push   $0x0
801064f5:	6a 7c                	push   $0x7c
801064f7:	e9 be f6 ff ff       	jmp    80105bba <alltraps>

801064fc <vector125>:
801064fc:	6a 00                	push   $0x0
801064fe:	6a 7d                	push   $0x7d
80106500:	e9 b5 f6 ff ff       	jmp    80105bba <alltraps>

80106505 <vector126>:
80106505:	6a 00                	push   $0x0
80106507:	6a 7e                	push   $0x7e
80106509:	e9 ac f6 ff ff       	jmp    80105bba <alltraps>

8010650e <vector127>:
8010650e:	6a 00                	push   $0x0
80106510:	6a 7f                	push   $0x7f
80106512:	e9 a3 f6 ff ff       	jmp    80105bba <alltraps>

80106517 <vector128>:
80106517:	6a 00                	push   $0x0
80106519:	68 80 00 00 00       	push   $0x80
8010651e:	e9 97 f6 ff ff       	jmp    80105bba <alltraps>

80106523 <vector129>:
80106523:	6a 00                	push   $0x0
80106525:	68 81 00 00 00       	push   $0x81
8010652a:	e9 8b f6 ff ff       	jmp    80105bba <alltraps>

8010652f <vector130>:
8010652f:	6a 00                	push   $0x0
80106531:	68 82 00 00 00       	push   $0x82
80106536:	e9 7f f6 ff ff       	jmp    80105bba <alltraps>

8010653b <vector131>:
8010653b:	6a 00                	push   $0x0
8010653d:	68 83 00 00 00       	push   $0x83
80106542:	e9 73 f6 ff ff       	jmp    80105bba <alltraps>

80106547 <vector132>:
80106547:	6a 00                	push   $0x0
80106549:	68 84 00 00 00       	push   $0x84
8010654e:	e9 67 f6 ff ff       	jmp    80105bba <alltraps>

80106553 <vector133>:
80106553:	6a 00                	push   $0x0
80106555:	68 85 00 00 00       	push   $0x85
8010655a:	e9 5b f6 ff ff       	jmp    80105bba <alltraps>

8010655f <vector134>:
8010655f:	6a 00                	push   $0x0
80106561:	68 86 00 00 00       	push   $0x86
80106566:	e9 4f f6 ff ff       	jmp    80105bba <alltraps>

8010656b <vector135>:
8010656b:	6a 00                	push   $0x0
8010656d:	68 87 00 00 00       	push   $0x87
80106572:	e9 43 f6 ff ff       	jmp    80105bba <alltraps>

80106577 <vector136>:
80106577:	6a 00                	push   $0x0
80106579:	68 88 00 00 00       	push   $0x88
8010657e:	e9 37 f6 ff ff       	jmp    80105bba <alltraps>

80106583 <vector137>:
80106583:	6a 00                	push   $0x0
80106585:	68 89 00 00 00       	push   $0x89
8010658a:	e9 2b f6 ff ff       	jmp    80105bba <alltraps>

8010658f <vector138>:
8010658f:	6a 00                	push   $0x0
80106591:	68 8a 00 00 00       	push   $0x8a
80106596:	e9 1f f6 ff ff       	jmp    80105bba <alltraps>

8010659b <vector139>:
8010659b:	6a 00                	push   $0x0
8010659d:	68 8b 00 00 00       	push   $0x8b
801065a2:	e9 13 f6 ff ff       	jmp    80105bba <alltraps>

801065a7 <vector140>:
801065a7:	6a 00                	push   $0x0
801065a9:	68 8c 00 00 00       	push   $0x8c
801065ae:	e9 07 f6 ff ff       	jmp    80105bba <alltraps>

801065b3 <vector141>:
801065b3:	6a 00                	push   $0x0
801065b5:	68 8d 00 00 00       	push   $0x8d
801065ba:	e9 fb f5 ff ff       	jmp    80105bba <alltraps>

801065bf <vector142>:
801065bf:	6a 00                	push   $0x0
801065c1:	68 8e 00 00 00       	push   $0x8e
801065c6:	e9 ef f5 ff ff       	jmp    80105bba <alltraps>

801065cb <vector143>:
801065cb:	6a 00                	push   $0x0
801065cd:	68 8f 00 00 00       	push   $0x8f
801065d2:	e9 e3 f5 ff ff       	jmp    80105bba <alltraps>

801065d7 <vector144>:
801065d7:	6a 00                	push   $0x0
801065d9:	68 90 00 00 00       	push   $0x90
801065de:	e9 d7 f5 ff ff       	jmp    80105bba <alltraps>

801065e3 <vector145>:
801065e3:	6a 00                	push   $0x0
801065e5:	68 91 00 00 00       	push   $0x91
801065ea:	e9 cb f5 ff ff       	jmp    80105bba <alltraps>

801065ef <vector146>:
801065ef:	6a 00                	push   $0x0
801065f1:	68 92 00 00 00       	push   $0x92
801065f6:	e9 bf f5 ff ff       	jmp    80105bba <alltraps>

801065fb <vector147>:
801065fb:	6a 00                	push   $0x0
801065fd:	68 93 00 00 00       	push   $0x93
80106602:	e9 b3 f5 ff ff       	jmp    80105bba <alltraps>

80106607 <vector148>:
80106607:	6a 00                	push   $0x0
80106609:	68 94 00 00 00       	push   $0x94
8010660e:	e9 a7 f5 ff ff       	jmp    80105bba <alltraps>

80106613 <vector149>:
80106613:	6a 00                	push   $0x0
80106615:	68 95 00 00 00       	push   $0x95
8010661a:	e9 9b f5 ff ff       	jmp    80105bba <alltraps>

8010661f <vector150>:
8010661f:	6a 00                	push   $0x0
80106621:	68 96 00 00 00       	push   $0x96
80106626:	e9 8f f5 ff ff       	jmp    80105bba <alltraps>

8010662b <vector151>:
8010662b:	6a 00                	push   $0x0
8010662d:	68 97 00 00 00       	push   $0x97
80106632:	e9 83 f5 ff ff       	jmp    80105bba <alltraps>

80106637 <vector152>:
80106637:	6a 00                	push   $0x0
80106639:	68 98 00 00 00       	push   $0x98
8010663e:	e9 77 f5 ff ff       	jmp    80105bba <alltraps>

80106643 <vector153>:
80106643:	6a 00                	push   $0x0
80106645:	68 99 00 00 00       	push   $0x99
8010664a:	e9 6b f5 ff ff       	jmp    80105bba <alltraps>

8010664f <vector154>:
8010664f:	6a 00                	push   $0x0
80106651:	68 9a 00 00 00       	push   $0x9a
80106656:	e9 5f f5 ff ff       	jmp    80105bba <alltraps>

8010665b <vector155>:
8010665b:	6a 00                	push   $0x0
8010665d:	68 9b 00 00 00       	push   $0x9b
80106662:	e9 53 f5 ff ff       	jmp    80105bba <alltraps>

80106667 <vector156>:
80106667:	6a 00                	push   $0x0
80106669:	68 9c 00 00 00       	push   $0x9c
8010666e:	e9 47 f5 ff ff       	jmp    80105bba <alltraps>

80106673 <vector157>:
80106673:	6a 00                	push   $0x0
80106675:	68 9d 00 00 00       	push   $0x9d
8010667a:	e9 3b f5 ff ff       	jmp    80105bba <alltraps>

8010667f <vector158>:
8010667f:	6a 00                	push   $0x0
80106681:	68 9e 00 00 00       	push   $0x9e
80106686:	e9 2f f5 ff ff       	jmp    80105bba <alltraps>

8010668b <vector159>:
8010668b:	6a 00                	push   $0x0
8010668d:	68 9f 00 00 00       	push   $0x9f
80106692:	e9 23 f5 ff ff       	jmp    80105bba <alltraps>

80106697 <vector160>:
80106697:	6a 00                	push   $0x0
80106699:	68 a0 00 00 00       	push   $0xa0
8010669e:	e9 17 f5 ff ff       	jmp    80105bba <alltraps>

801066a3 <vector161>:
801066a3:	6a 00                	push   $0x0
801066a5:	68 a1 00 00 00       	push   $0xa1
801066aa:	e9 0b f5 ff ff       	jmp    80105bba <alltraps>

801066af <vector162>:
801066af:	6a 00                	push   $0x0
801066b1:	68 a2 00 00 00       	push   $0xa2
801066b6:	e9 ff f4 ff ff       	jmp    80105bba <alltraps>

801066bb <vector163>:
801066bb:	6a 00                	push   $0x0
801066bd:	68 a3 00 00 00       	push   $0xa3
801066c2:	e9 f3 f4 ff ff       	jmp    80105bba <alltraps>

801066c7 <vector164>:
801066c7:	6a 00                	push   $0x0
801066c9:	68 a4 00 00 00       	push   $0xa4
801066ce:	e9 e7 f4 ff ff       	jmp    80105bba <alltraps>

801066d3 <vector165>:
801066d3:	6a 00                	push   $0x0
801066d5:	68 a5 00 00 00       	push   $0xa5
801066da:	e9 db f4 ff ff       	jmp    80105bba <alltraps>

801066df <vector166>:
801066df:	6a 00                	push   $0x0
801066e1:	68 a6 00 00 00       	push   $0xa6
801066e6:	e9 cf f4 ff ff       	jmp    80105bba <alltraps>

801066eb <vector167>:
801066eb:	6a 00                	push   $0x0
801066ed:	68 a7 00 00 00       	push   $0xa7
801066f2:	e9 c3 f4 ff ff       	jmp    80105bba <alltraps>

801066f7 <vector168>:
801066f7:	6a 00                	push   $0x0
801066f9:	68 a8 00 00 00       	push   $0xa8
801066fe:	e9 b7 f4 ff ff       	jmp    80105bba <alltraps>

80106703 <vector169>:
80106703:	6a 00                	push   $0x0
80106705:	68 a9 00 00 00       	push   $0xa9
8010670a:	e9 ab f4 ff ff       	jmp    80105bba <alltraps>

8010670f <vector170>:
8010670f:	6a 00                	push   $0x0
80106711:	68 aa 00 00 00       	push   $0xaa
80106716:	e9 9f f4 ff ff       	jmp    80105bba <alltraps>

8010671b <vector171>:
8010671b:	6a 00                	push   $0x0
8010671d:	68 ab 00 00 00       	push   $0xab
80106722:	e9 93 f4 ff ff       	jmp    80105bba <alltraps>

80106727 <vector172>:
80106727:	6a 00                	push   $0x0
80106729:	68 ac 00 00 00       	push   $0xac
8010672e:	e9 87 f4 ff ff       	jmp    80105bba <alltraps>

80106733 <vector173>:
80106733:	6a 00                	push   $0x0
80106735:	68 ad 00 00 00       	push   $0xad
8010673a:	e9 7b f4 ff ff       	jmp    80105bba <alltraps>

8010673f <vector174>:
8010673f:	6a 00                	push   $0x0
80106741:	68 ae 00 00 00       	push   $0xae
80106746:	e9 6f f4 ff ff       	jmp    80105bba <alltraps>

8010674b <vector175>:
8010674b:	6a 00                	push   $0x0
8010674d:	68 af 00 00 00       	push   $0xaf
80106752:	e9 63 f4 ff ff       	jmp    80105bba <alltraps>

80106757 <vector176>:
80106757:	6a 00                	push   $0x0
80106759:	68 b0 00 00 00       	push   $0xb0
8010675e:	e9 57 f4 ff ff       	jmp    80105bba <alltraps>

80106763 <vector177>:
80106763:	6a 00                	push   $0x0
80106765:	68 b1 00 00 00       	push   $0xb1
8010676a:	e9 4b f4 ff ff       	jmp    80105bba <alltraps>

8010676f <vector178>:
8010676f:	6a 00                	push   $0x0
80106771:	68 b2 00 00 00       	push   $0xb2
80106776:	e9 3f f4 ff ff       	jmp    80105bba <alltraps>

8010677b <vector179>:
8010677b:	6a 00                	push   $0x0
8010677d:	68 b3 00 00 00       	push   $0xb3
80106782:	e9 33 f4 ff ff       	jmp    80105bba <alltraps>

80106787 <vector180>:
80106787:	6a 00                	push   $0x0
80106789:	68 b4 00 00 00       	push   $0xb4
8010678e:	e9 27 f4 ff ff       	jmp    80105bba <alltraps>

80106793 <vector181>:
80106793:	6a 00                	push   $0x0
80106795:	68 b5 00 00 00       	push   $0xb5
8010679a:	e9 1b f4 ff ff       	jmp    80105bba <alltraps>

8010679f <vector182>:
8010679f:	6a 00                	push   $0x0
801067a1:	68 b6 00 00 00       	push   $0xb6
801067a6:	e9 0f f4 ff ff       	jmp    80105bba <alltraps>

801067ab <vector183>:
801067ab:	6a 00                	push   $0x0
801067ad:	68 b7 00 00 00       	push   $0xb7
801067b2:	e9 03 f4 ff ff       	jmp    80105bba <alltraps>

801067b7 <vector184>:
801067b7:	6a 00                	push   $0x0
801067b9:	68 b8 00 00 00       	push   $0xb8
801067be:	e9 f7 f3 ff ff       	jmp    80105bba <alltraps>

801067c3 <vector185>:
801067c3:	6a 00                	push   $0x0
801067c5:	68 b9 00 00 00       	push   $0xb9
801067ca:	e9 eb f3 ff ff       	jmp    80105bba <alltraps>

801067cf <vector186>:
801067cf:	6a 00                	push   $0x0
801067d1:	68 ba 00 00 00       	push   $0xba
801067d6:	e9 df f3 ff ff       	jmp    80105bba <alltraps>

801067db <vector187>:
801067db:	6a 00                	push   $0x0
801067dd:	68 bb 00 00 00       	push   $0xbb
801067e2:	e9 d3 f3 ff ff       	jmp    80105bba <alltraps>

801067e7 <vector188>:
801067e7:	6a 00                	push   $0x0
801067e9:	68 bc 00 00 00       	push   $0xbc
801067ee:	e9 c7 f3 ff ff       	jmp    80105bba <alltraps>

801067f3 <vector189>:
801067f3:	6a 00                	push   $0x0
801067f5:	68 bd 00 00 00       	push   $0xbd
801067fa:	e9 bb f3 ff ff       	jmp    80105bba <alltraps>

801067ff <vector190>:
801067ff:	6a 00                	push   $0x0
80106801:	68 be 00 00 00       	push   $0xbe
80106806:	e9 af f3 ff ff       	jmp    80105bba <alltraps>

8010680b <vector191>:
8010680b:	6a 00                	push   $0x0
8010680d:	68 bf 00 00 00       	push   $0xbf
80106812:	e9 a3 f3 ff ff       	jmp    80105bba <alltraps>

80106817 <vector192>:
80106817:	6a 00                	push   $0x0
80106819:	68 c0 00 00 00       	push   $0xc0
8010681e:	e9 97 f3 ff ff       	jmp    80105bba <alltraps>

80106823 <vector193>:
80106823:	6a 00                	push   $0x0
80106825:	68 c1 00 00 00       	push   $0xc1
8010682a:	e9 8b f3 ff ff       	jmp    80105bba <alltraps>

8010682f <vector194>:
8010682f:	6a 00                	push   $0x0
80106831:	68 c2 00 00 00       	push   $0xc2
80106836:	e9 7f f3 ff ff       	jmp    80105bba <alltraps>

8010683b <vector195>:
8010683b:	6a 00                	push   $0x0
8010683d:	68 c3 00 00 00       	push   $0xc3
80106842:	e9 73 f3 ff ff       	jmp    80105bba <alltraps>

80106847 <vector196>:
80106847:	6a 00                	push   $0x0
80106849:	68 c4 00 00 00       	push   $0xc4
8010684e:	e9 67 f3 ff ff       	jmp    80105bba <alltraps>

80106853 <vector197>:
80106853:	6a 00                	push   $0x0
80106855:	68 c5 00 00 00       	push   $0xc5
8010685a:	e9 5b f3 ff ff       	jmp    80105bba <alltraps>

8010685f <vector198>:
8010685f:	6a 00                	push   $0x0
80106861:	68 c6 00 00 00       	push   $0xc6
80106866:	e9 4f f3 ff ff       	jmp    80105bba <alltraps>

8010686b <vector199>:
8010686b:	6a 00                	push   $0x0
8010686d:	68 c7 00 00 00       	push   $0xc7
80106872:	e9 43 f3 ff ff       	jmp    80105bba <alltraps>

80106877 <vector200>:
80106877:	6a 00                	push   $0x0
80106879:	68 c8 00 00 00       	push   $0xc8
8010687e:	e9 37 f3 ff ff       	jmp    80105bba <alltraps>

80106883 <vector201>:
80106883:	6a 00                	push   $0x0
80106885:	68 c9 00 00 00       	push   $0xc9
8010688a:	e9 2b f3 ff ff       	jmp    80105bba <alltraps>

8010688f <vector202>:
8010688f:	6a 00                	push   $0x0
80106891:	68 ca 00 00 00       	push   $0xca
80106896:	e9 1f f3 ff ff       	jmp    80105bba <alltraps>

8010689b <vector203>:
8010689b:	6a 00                	push   $0x0
8010689d:	68 cb 00 00 00       	push   $0xcb
801068a2:	e9 13 f3 ff ff       	jmp    80105bba <alltraps>

801068a7 <vector204>:
801068a7:	6a 00                	push   $0x0
801068a9:	68 cc 00 00 00       	push   $0xcc
801068ae:	e9 07 f3 ff ff       	jmp    80105bba <alltraps>

801068b3 <vector205>:
801068b3:	6a 00                	push   $0x0
801068b5:	68 cd 00 00 00       	push   $0xcd
801068ba:	e9 fb f2 ff ff       	jmp    80105bba <alltraps>

801068bf <vector206>:
801068bf:	6a 00                	push   $0x0
801068c1:	68 ce 00 00 00       	push   $0xce
801068c6:	e9 ef f2 ff ff       	jmp    80105bba <alltraps>

801068cb <vector207>:
801068cb:	6a 00                	push   $0x0
801068cd:	68 cf 00 00 00       	push   $0xcf
801068d2:	e9 e3 f2 ff ff       	jmp    80105bba <alltraps>

801068d7 <vector208>:
801068d7:	6a 00                	push   $0x0
801068d9:	68 d0 00 00 00       	push   $0xd0
801068de:	e9 d7 f2 ff ff       	jmp    80105bba <alltraps>

801068e3 <vector209>:
801068e3:	6a 00                	push   $0x0
801068e5:	68 d1 00 00 00       	push   $0xd1
801068ea:	e9 cb f2 ff ff       	jmp    80105bba <alltraps>

801068ef <vector210>:
801068ef:	6a 00                	push   $0x0
801068f1:	68 d2 00 00 00       	push   $0xd2
801068f6:	e9 bf f2 ff ff       	jmp    80105bba <alltraps>

801068fb <vector211>:
801068fb:	6a 00                	push   $0x0
801068fd:	68 d3 00 00 00       	push   $0xd3
80106902:	e9 b3 f2 ff ff       	jmp    80105bba <alltraps>

80106907 <vector212>:
80106907:	6a 00                	push   $0x0
80106909:	68 d4 00 00 00       	push   $0xd4
8010690e:	e9 a7 f2 ff ff       	jmp    80105bba <alltraps>

80106913 <vector213>:
80106913:	6a 00                	push   $0x0
80106915:	68 d5 00 00 00       	push   $0xd5
8010691a:	e9 9b f2 ff ff       	jmp    80105bba <alltraps>

8010691f <vector214>:
8010691f:	6a 00                	push   $0x0
80106921:	68 d6 00 00 00       	push   $0xd6
80106926:	e9 8f f2 ff ff       	jmp    80105bba <alltraps>

8010692b <vector215>:
8010692b:	6a 00                	push   $0x0
8010692d:	68 d7 00 00 00       	push   $0xd7
80106932:	e9 83 f2 ff ff       	jmp    80105bba <alltraps>

80106937 <vector216>:
80106937:	6a 00                	push   $0x0
80106939:	68 d8 00 00 00       	push   $0xd8
8010693e:	e9 77 f2 ff ff       	jmp    80105bba <alltraps>

80106943 <vector217>:
80106943:	6a 00                	push   $0x0
80106945:	68 d9 00 00 00       	push   $0xd9
8010694a:	e9 6b f2 ff ff       	jmp    80105bba <alltraps>

8010694f <vector218>:
8010694f:	6a 00                	push   $0x0
80106951:	68 da 00 00 00       	push   $0xda
80106956:	e9 5f f2 ff ff       	jmp    80105bba <alltraps>

8010695b <vector219>:
8010695b:	6a 00                	push   $0x0
8010695d:	68 db 00 00 00       	push   $0xdb
80106962:	e9 53 f2 ff ff       	jmp    80105bba <alltraps>

80106967 <vector220>:
80106967:	6a 00                	push   $0x0
80106969:	68 dc 00 00 00       	push   $0xdc
8010696e:	e9 47 f2 ff ff       	jmp    80105bba <alltraps>

80106973 <vector221>:
80106973:	6a 00                	push   $0x0
80106975:	68 dd 00 00 00       	push   $0xdd
8010697a:	e9 3b f2 ff ff       	jmp    80105bba <alltraps>

8010697f <vector222>:
8010697f:	6a 00                	push   $0x0
80106981:	68 de 00 00 00       	push   $0xde
80106986:	e9 2f f2 ff ff       	jmp    80105bba <alltraps>

8010698b <vector223>:
8010698b:	6a 00                	push   $0x0
8010698d:	68 df 00 00 00       	push   $0xdf
80106992:	e9 23 f2 ff ff       	jmp    80105bba <alltraps>

80106997 <vector224>:
80106997:	6a 00                	push   $0x0
80106999:	68 e0 00 00 00       	push   $0xe0
8010699e:	e9 17 f2 ff ff       	jmp    80105bba <alltraps>

801069a3 <vector225>:
801069a3:	6a 00                	push   $0x0
801069a5:	68 e1 00 00 00       	push   $0xe1
801069aa:	e9 0b f2 ff ff       	jmp    80105bba <alltraps>

801069af <vector226>:
801069af:	6a 00                	push   $0x0
801069b1:	68 e2 00 00 00       	push   $0xe2
801069b6:	e9 ff f1 ff ff       	jmp    80105bba <alltraps>

801069bb <vector227>:
801069bb:	6a 00                	push   $0x0
801069bd:	68 e3 00 00 00       	push   $0xe3
801069c2:	e9 f3 f1 ff ff       	jmp    80105bba <alltraps>

801069c7 <vector228>:
801069c7:	6a 00                	push   $0x0
801069c9:	68 e4 00 00 00       	push   $0xe4
801069ce:	e9 e7 f1 ff ff       	jmp    80105bba <alltraps>

801069d3 <vector229>:
801069d3:	6a 00                	push   $0x0
801069d5:	68 e5 00 00 00       	push   $0xe5
801069da:	e9 db f1 ff ff       	jmp    80105bba <alltraps>

801069df <vector230>:
801069df:	6a 00                	push   $0x0
801069e1:	68 e6 00 00 00       	push   $0xe6
801069e6:	e9 cf f1 ff ff       	jmp    80105bba <alltraps>

801069eb <vector231>:
801069eb:	6a 00                	push   $0x0
801069ed:	68 e7 00 00 00       	push   $0xe7
801069f2:	e9 c3 f1 ff ff       	jmp    80105bba <alltraps>

801069f7 <vector232>:
801069f7:	6a 00                	push   $0x0
801069f9:	68 e8 00 00 00       	push   $0xe8
801069fe:	e9 b7 f1 ff ff       	jmp    80105bba <alltraps>

80106a03 <vector233>:
80106a03:	6a 00                	push   $0x0
80106a05:	68 e9 00 00 00       	push   $0xe9
80106a0a:	e9 ab f1 ff ff       	jmp    80105bba <alltraps>

80106a0f <vector234>:
80106a0f:	6a 00                	push   $0x0
80106a11:	68 ea 00 00 00       	push   $0xea
80106a16:	e9 9f f1 ff ff       	jmp    80105bba <alltraps>

80106a1b <vector235>:
80106a1b:	6a 00                	push   $0x0
80106a1d:	68 eb 00 00 00       	push   $0xeb
80106a22:	e9 93 f1 ff ff       	jmp    80105bba <alltraps>

80106a27 <vector236>:
80106a27:	6a 00                	push   $0x0
80106a29:	68 ec 00 00 00       	push   $0xec
80106a2e:	e9 87 f1 ff ff       	jmp    80105bba <alltraps>

80106a33 <vector237>:
80106a33:	6a 00                	push   $0x0
80106a35:	68 ed 00 00 00       	push   $0xed
80106a3a:	e9 7b f1 ff ff       	jmp    80105bba <alltraps>

80106a3f <vector238>:
80106a3f:	6a 00                	push   $0x0
80106a41:	68 ee 00 00 00       	push   $0xee
80106a46:	e9 6f f1 ff ff       	jmp    80105bba <alltraps>

80106a4b <vector239>:
80106a4b:	6a 00                	push   $0x0
80106a4d:	68 ef 00 00 00       	push   $0xef
80106a52:	e9 63 f1 ff ff       	jmp    80105bba <alltraps>

80106a57 <vector240>:
80106a57:	6a 00                	push   $0x0
80106a59:	68 f0 00 00 00       	push   $0xf0
80106a5e:	e9 57 f1 ff ff       	jmp    80105bba <alltraps>

80106a63 <vector241>:
80106a63:	6a 00                	push   $0x0
80106a65:	68 f1 00 00 00       	push   $0xf1
80106a6a:	e9 4b f1 ff ff       	jmp    80105bba <alltraps>

80106a6f <vector242>:
80106a6f:	6a 00                	push   $0x0
80106a71:	68 f2 00 00 00       	push   $0xf2
80106a76:	e9 3f f1 ff ff       	jmp    80105bba <alltraps>

80106a7b <vector243>:
80106a7b:	6a 00                	push   $0x0
80106a7d:	68 f3 00 00 00       	push   $0xf3
80106a82:	e9 33 f1 ff ff       	jmp    80105bba <alltraps>

80106a87 <vector244>:
80106a87:	6a 00                	push   $0x0
80106a89:	68 f4 00 00 00       	push   $0xf4
80106a8e:	e9 27 f1 ff ff       	jmp    80105bba <alltraps>

80106a93 <vector245>:
80106a93:	6a 00                	push   $0x0
80106a95:	68 f5 00 00 00       	push   $0xf5
80106a9a:	e9 1b f1 ff ff       	jmp    80105bba <alltraps>

80106a9f <vector246>:
80106a9f:	6a 00                	push   $0x0
80106aa1:	68 f6 00 00 00       	push   $0xf6
80106aa6:	e9 0f f1 ff ff       	jmp    80105bba <alltraps>

80106aab <vector247>:
80106aab:	6a 00                	push   $0x0
80106aad:	68 f7 00 00 00       	push   $0xf7
80106ab2:	e9 03 f1 ff ff       	jmp    80105bba <alltraps>

80106ab7 <vector248>:
80106ab7:	6a 00                	push   $0x0
80106ab9:	68 f8 00 00 00       	push   $0xf8
80106abe:	e9 f7 f0 ff ff       	jmp    80105bba <alltraps>

80106ac3 <vector249>:
80106ac3:	6a 00                	push   $0x0
80106ac5:	68 f9 00 00 00       	push   $0xf9
80106aca:	e9 eb f0 ff ff       	jmp    80105bba <alltraps>

80106acf <vector250>:
80106acf:	6a 00                	push   $0x0
80106ad1:	68 fa 00 00 00       	push   $0xfa
80106ad6:	e9 df f0 ff ff       	jmp    80105bba <alltraps>

80106adb <vector251>:
80106adb:	6a 00                	push   $0x0
80106add:	68 fb 00 00 00       	push   $0xfb
80106ae2:	e9 d3 f0 ff ff       	jmp    80105bba <alltraps>

80106ae7 <vector252>:
80106ae7:	6a 00                	push   $0x0
80106ae9:	68 fc 00 00 00       	push   $0xfc
80106aee:	e9 c7 f0 ff ff       	jmp    80105bba <alltraps>

80106af3 <vector253>:
80106af3:	6a 00                	push   $0x0
80106af5:	68 fd 00 00 00       	push   $0xfd
80106afa:	e9 bb f0 ff ff       	jmp    80105bba <alltraps>

80106aff <vector254>:
80106aff:	6a 00                	push   $0x0
80106b01:	68 fe 00 00 00       	push   $0xfe
80106b06:	e9 af f0 ff ff       	jmp    80105bba <alltraps>

80106b0b <vector255>:
80106b0b:	6a 00                	push   $0x0
80106b0d:	68 ff 00 00 00       	push   $0xff
80106b12:	e9 a3 f0 ff ff       	jmp    80105bba <alltraps>
80106b17:	66 90                	xchg   %ax,%ax
80106b19:	66 90                	xchg   %ax,%ax
80106b1b:	66 90                	xchg   %ax,%ax
80106b1d:	66 90                	xchg   %ax,%ax
80106b1f:	90                   	nop

80106b20 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106b20:	55                   	push   %ebp
80106b21:	89 e5                	mov    %esp,%ebp
80106b23:	57                   	push   %edi
80106b24:	56                   	push   %esi
80106b25:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106b26:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
80106b2c:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106b32:	83 ec 1c             	sub    $0x1c,%esp
80106b35:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106b38:	39 d3                	cmp    %edx,%ebx
80106b3a:	73 49                	jae    80106b85 <deallocuvm.part.0+0x65>
80106b3c:	89 c7                	mov    %eax,%edi
80106b3e:	eb 0c                	jmp    80106b4c <deallocuvm.part.0+0x2c>
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106b40:	83 c0 01             	add    $0x1,%eax
80106b43:	c1 e0 16             	shl    $0x16,%eax
80106b46:	89 c3                	mov    %eax,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106b48:	39 da                	cmp    %ebx,%edx
80106b4a:	76 39                	jbe    80106b85 <deallocuvm.part.0+0x65>
  pde = &pgdir[PDX(va)];
80106b4c:	89 d8                	mov    %ebx,%eax
80106b4e:	c1 e8 16             	shr    $0x16,%eax
  if(*pde & PTE_P){
80106b51:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
80106b54:	f6 c1 01             	test   $0x1,%cl
80106b57:	74 e7                	je     80106b40 <deallocuvm.part.0+0x20>
  return &pgtab[PTX(va)];
80106b59:	89 de                	mov    %ebx,%esi
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106b5b:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
  return &pgtab[PTX(va)];
80106b61:	c1 ee 0a             	shr    $0xa,%esi
80106b64:	81 e6 fc 0f 00 00    	and    $0xffc,%esi
80106b6a:	8d b4 31 00 00 00 80 	lea    -0x80000000(%ecx,%esi,1),%esi
    if(!pte)
80106b71:	85 f6                	test   %esi,%esi
80106b73:	74 cb                	je     80106b40 <deallocuvm.part.0+0x20>
    else if((*pte & PTE_P) != 0){
80106b75:	8b 06                	mov    (%esi),%eax
80106b77:	a8 01                	test   $0x1,%al
80106b79:	75 15                	jne    80106b90 <deallocuvm.part.0+0x70>
  for(; a  < oldsz; a += PGSIZE){
80106b7b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b81:	39 da                	cmp    %ebx,%edx
80106b83:	77 c7                	ja     80106b4c <deallocuvm.part.0+0x2c>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106b85:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106b88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b8b:	5b                   	pop    %ebx
80106b8c:	5e                   	pop    %esi
80106b8d:	5f                   	pop    %edi
80106b8e:	5d                   	pop    %ebp
80106b8f:	c3                   	ret    
      if(pa == 0)
80106b90:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b95:	74 25                	je     80106bbc <deallocuvm.part.0+0x9c>
      kfree(v);
80106b97:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106b9a:	05 00 00 00 80       	add    $0x80000000,%eax
80106b9f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106ba2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
      kfree(v);
80106ba8:	50                   	push   %eax
80106ba9:	e8 12 b9 ff ff       	call   801024c0 <kfree>
      *pte = 0;
80106bae:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  for(; a  < oldsz; a += PGSIZE){
80106bb4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106bb7:	83 c4 10             	add    $0x10,%esp
80106bba:	eb 8c                	jmp    80106b48 <deallocuvm.part.0+0x28>
        panic("kfree");
80106bbc:	83 ec 0c             	sub    $0xc,%esp
80106bbf:	68 86 77 10 80       	push   $0x80107786
80106bc4:	e8 b7 97 ff ff       	call   80100380 <panic>
80106bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106bd0 <mappages>:
{
80106bd0:	55                   	push   %ebp
80106bd1:	89 e5                	mov    %esp,%ebp
80106bd3:	57                   	push   %edi
80106bd4:	56                   	push   %esi
80106bd5:	53                   	push   %ebx
  a = (char*)PGROUNDDOWN((uint)va);
80106bd6:	89 d3                	mov    %edx,%ebx
80106bd8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
80106bde:	83 ec 1c             	sub    $0x1c,%esp
80106be1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106be4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106be8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106bed:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106bf0:	8b 45 08             	mov    0x8(%ebp),%eax
80106bf3:	29 d8                	sub    %ebx,%eax
80106bf5:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106bf8:	eb 3d                	jmp    80106c37 <mappages+0x67>
80106bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return &pgtab[PTX(va)];
80106c00:	89 da                	mov    %ebx,%edx
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106c02:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  return &pgtab[PTX(va)];
80106c07:	c1 ea 0a             	shr    $0xa,%edx
80106c0a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106c10:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106c17:	85 c0                	test   %eax,%eax
80106c19:	74 75                	je     80106c90 <mappages+0xc0>
    if(*pte & PTE_P)
80106c1b:	f6 00 01             	testb  $0x1,(%eax)
80106c1e:	0f 85 86 00 00 00    	jne    80106caa <mappages+0xda>
    *pte = pa | perm | PTE_P;
80106c24:	0b 75 0c             	or     0xc(%ebp),%esi
80106c27:	83 ce 01             	or     $0x1,%esi
80106c2a:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106c2c:	3b 5d dc             	cmp    -0x24(%ebp),%ebx
80106c2f:	74 6f                	je     80106ca0 <mappages+0xd0>
    a += PGSIZE;
80106c31:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  for(;;){
80106c37:	8b 45 e0             	mov    -0x20(%ebp),%eax
  pde = &pgdir[PDX(va)];
80106c3a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106c3d:	8d 34 18             	lea    (%eax,%ebx,1),%esi
80106c40:	89 d8                	mov    %ebx,%eax
80106c42:	c1 e8 16             	shr    $0x16,%eax
80106c45:	8d 3c 81             	lea    (%ecx,%eax,4),%edi
  if(*pde & PTE_P){
80106c48:	8b 07                	mov    (%edi),%eax
80106c4a:	a8 01                	test   $0x1,%al
80106c4c:	75 b2                	jne    80106c00 <mappages+0x30>
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106c4e:	e8 2d ba ff ff       	call   80102680 <kalloc>
80106c53:	85 c0                	test   %eax,%eax
80106c55:	74 39                	je     80106c90 <mappages+0xc0>
    memset(pgtab, 0, PGSIZE);
80106c57:	83 ec 04             	sub    $0x4,%esp
80106c5a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80106c5d:	68 00 10 00 00       	push   $0x1000
80106c62:	6a 00                	push   $0x0
80106c64:	50                   	push   %eax
80106c65:	e8 36 dc ff ff       	call   801048a0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106c6a:	8b 55 d8             	mov    -0x28(%ebp),%edx
  return &pgtab[PTX(va)];
80106c6d:	83 c4 10             	add    $0x10,%esp
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106c70:	8d 82 00 00 00 80    	lea    -0x80000000(%edx),%eax
80106c76:	83 c8 07             	or     $0x7,%eax
80106c79:	89 07                	mov    %eax,(%edi)
  return &pgtab[PTX(va)];
80106c7b:	89 d8                	mov    %ebx,%eax
80106c7d:	c1 e8 0a             	shr    $0xa,%eax
80106c80:	25 fc 0f 00 00       	and    $0xffc,%eax
80106c85:	01 d0                	add    %edx,%eax
80106c87:	eb 92                	jmp    80106c1b <mappages+0x4b>
80106c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
80106c90:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106c93:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106c98:	5b                   	pop    %ebx
80106c99:	5e                   	pop    %esi
80106c9a:	5f                   	pop    %edi
80106c9b:	5d                   	pop    %ebp
80106c9c:	c3                   	ret    
80106c9d:	8d 76 00             	lea    0x0(%esi),%esi
80106ca0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106ca3:	31 c0                	xor    %eax,%eax
}
80106ca5:	5b                   	pop    %ebx
80106ca6:	5e                   	pop    %esi
80106ca7:	5f                   	pop    %edi
80106ca8:	5d                   	pop    %ebp
80106ca9:	c3                   	ret    
      panic("remap");
80106caa:	83 ec 0c             	sub    $0xc,%esp
80106cad:	68 40 7e 10 80       	push   $0x80107e40
80106cb2:	e8 c9 96 ff ff       	call   80100380 <panic>
80106cb7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106cbe:	66 90                	xchg   %ax,%ax

80106cc0 <seginit>:
{
80106cc0:	55                   	push   %ebp
80106cc1:	89 e5                	mov    %esp,%ebp
80106cc3:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106cc6:	e8 c5 cb ff ff       	call   80103890 <cpuid>
  pd[0] = size-1;
80106ccb:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106cd0:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106cd6:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106cda:	c7 80 18 18 11 80 ff 	movl   $0xffff,-0x7feee7e8(%eax)
80106ce1:	ff 00 00 
80106ce4:	c7 80 1c 18 11 80 00 	movl   $0xcf9a00,-0x7feee7e4(%eax)
80106ceb:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106cee:	c7 80 20 18 11 80 ff 	movl   $0xffff,-0x7feee7e0(%eax)
80106cf5:	ff 00 00 
80106cf8:	c7 80 24 18 11 80 00 	movl   $0xcf9200,-0x7feee7dc(%eax)
80106cff:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106d02:	c7 80 28 18 11 80 ff 	movl   $0xffff,-0x7feee7d8(%eax)
80106d09:	ff 00 00 
80106d0c:	c7 80 2c 18 11 80 00 	movl   $0xcffa00,-0x7feee7d4(%eax)
80106d13:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106d16:	c7 80 30 18 11 80 ff 	movl   $0xffff,-0x7feee7d0(%eax)
80106d1d:	ff 00 00 
80106d20:	c7 80 34 18 11 80 00 	movl   $0xcff200,-0x7feee7cc(%eax)
80106d27:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80106d2a:	05 10 18 11 80       	add    $0x80111810,%eax
  pd[1] = (uint)p;
80106d2f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106d33:	c1 e8 10             	shr    $0x10,%eax
80106d36:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106d3a:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106d3d:	0f 01 10             	lgdtl  (%eax)
}
80106d40:	c9                   	leave  
80106d41:	c3                   	ret    
80106d42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106d50 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106d50:	a1 24 be 11 80       	mov    0x8011be24,%eax
80106d55:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106d5a:	0f 22 d8             	mov    %eax,%cr3
}
80106d5d:	c3                   	ret    
80106d5e:	66 90                	xchg   %ax,%ax

80106d60 <switchuvm>:
{
80106d60:	55                   	push   %ebp
80106d61:	89 e5                	mov    %esp,%ebp
80106d63:	57                   	push   %edi
80106d64:	56                   	push   %esi
80106d65:	53                   	push   %ebx
80106d66:	83 ec 1c             	sub    $0x1c,%esp
80106d69:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
80106d6c:	85 f6                	test   %esi,%esi
80106d6e:	0f 84 cb 00 00 00    	je     80106e3f <switchuvm+0xdf>
  if(p->kstack == 0)
80106d74:	8b 46 08             	mov    0x8(%esi),%eax
80106d77:	85 c0                	test   %eax,%eax
80106d79:	0f 84 da 00 00 00    	je     80106e59 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106d7f:	8b 46 04             	mov    0x4(%esi),%eax
80106d82:	85 c0                	test   %eax,%eax
80106d84:	0f 84 c2 00 00 00    	je     80106e4c <switchuvm+0xec>
  pushcli();
80106d8a:	e8 01 d9 ff ff       	call   80104690 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106d8f:	e8 9c ca ff ff       	call   80103830 <mycpu>
80106d94:	89 c3                	mov    %eax,%ebx
80106d96:	e8 95 ca ff ff       	call   80103830 <mycpu>
80106d9b:	89 c7                	mov    %eax,%edi
80106d9d:	e8 8e ca ff ff       	call   80103830 <mycpu>
80106da2:	83 c7 08             	add    $0x8,%edi
80106da5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106da8:	e8 83 ca ff ff       	call   80103830 <mycpu>
80106dad:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106db0:	ba 67 00 00 00       	mov    $0x67,%edx
80106db5:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106dbc:	83 c0 08             	add    $0x8,%eax
80106dbf:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106dc6:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106dcb:	83 c1 08             	add    $0x8,%ecx
80106dce:	c1 e8 18             	shr    $0x18,%eax
80106dd1:	c1 e9 10             	shr    $0x10,%ecx
80106dd4:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106dda:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106de0:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106de5:	66 89 8b 9d 00 00 00 	mov    %cx,0x9d(%ebx)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106dec:	bb 10 00 00 00       	mov    $0x10,%ebx
  mycpu()->gdt[SEG_TSS].s = 0;
80106df1:	e8 3a ca ff ff       	call   80103830 <mycpu>
80106df6:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106dfd:	e8 2e ca ff ff       	call   80103830 <mycpu>
80106e02:	66 89 58 10          	mov    %bx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106e06:	8b 5e 08             	mov    0x8(%esi),%ebx
80106e09:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e0f:	e8 1c ca ff ff       	call   80103830 <mycpu>
80106e14:	89 58 0c             	mov    %ebx,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106e17:	e8 14 ca ff ff       	call   80103830 <mycpu>
80106e1c:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106e20:	b8 28 00 00 00       	mov    $0x28,%eax
80106e25:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106e28:	8b 46 04             	mov    0x4(%esi),%eax
80106e2b:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106e30:	0f 22 d8             	mov    %eax,%cr3
}
80106e33:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e36:	5b                   	pop    %ebx
80106e37:	5e                   	pop    %esi
80106e38:	5f                   	pop    %edi
80106e39:	5d                   	pop    %ebp
  popcli();
80106e3a:	e9 a1 d8 ff ff       	jmp    801046e0 <popcli>
    panic("switchuvm: no process");
80106e3f:	83 ec 0c             	sub    $0xc,%esp
80106e42:	68 46 7e 10 80       	push   $0x80107e46
80106e47:	e8 34 95 ff ff       	call   80100380 <panic>
    panic("switchuvm: no pgdir");
80106e4c:	83 ec 0c             	sub    $0xc,%esp
80106e4f:	68 71 7e 10 80       	push   $0x80107e71
80106e54:	e8 27 95 ff ff       	call   80100380 <panic>
    panic("switchuvm: no kstack");
80106e59:	83 ec 0c             	sub    $0xc,%esp
80106e5c:	68 5c 7e 10 80       	push   $0x80107e5c
80106e61:	e8 1a 95 ff ff       	call   80100380 <panic>
80106e66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e6d:	8d 76 00             	lea    0x0(%esi),%esi

80106e70 <inituvm>:
{
80106e70:	55                   	push   %ebp
80106e71:	89 e5                	mov    %esp,%ebp
80106e73:	57                   	push   %edi
80106e74:	56                   	push   %esi
80106e75:	53                   	push   %ebx
80106e76:	83 ec 1c             	sub    $0x1c,%esp
80106e79:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e7c:	8b 75 10             	mov    0x10(%ebp),%esi
80106e7f:	8b 7d 08             	mov    0x8(%ebp),%edi
80106e82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106e85:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106e8b:	77 4b                	ja     80106ed8 <inituvm+0x68>
  mem = kalloc();
80106e8d:	e8 ee b7 ff ff       	call   80102680 <kalloc>
  memset(mem, 0, PGSIZE);
80106e92:	83 ec 04             	sub    $0x4,%esp
80106e95:	68 00 10 00 00       	push   $0x1000
  mem = kalloc();
80106e9a:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106e9c:	6a 00                	push   $0x0
80106e9e:	50                   	push   %eax
80106e9f:	e8 fc d9 ff ff       	call   801048a0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106ea4:	58                   	pop    %eax
80106ea5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106eab:	5a                   	pop    %edx
80106eac:	6a 06                	push   $0x6
80106eae:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106eb3:	31 d2                	xor    %edx,%edx
80106eb5:	50                   	push   %eax
80106eb6:	89 f8                	mov    %edi,%eax
80106eb8:	e8 13 fd ff ff       	call   80106bd0 <mappages>
  memmove(mem, init, sz);
80106ebd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106ec0:	89 75 10             	mov    %esi,0x10(%ebp)
80106ec3:	83 c4 10             	add    $0x10,%esp
80106ec6:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106ec9:	89 45 0c             	mov    %eax,0xc(%ebp)
}
80106ecc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ecf:	5b                   	pop    %ebx
80106ed0:	5e                   	pop    %esi
80106ed1:	5f                   	pop    %edi
80106ed2:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106ed3:	e9 68 da ff ff       	jmp    80104940 <memmove>
    panic("inituvm: more than a page");
80106ed8:	83 ec 0c             	sub    $0xc,%esp
80106edb:	68 85 7e 10 80       	push   $0x80107e85
80106ee0:	e8 9b 94 ff ff       	call   80100380 <panic>
80106ee5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106ef0 <loaduvm>:
{
80106ef0:	55                   	push   %ebp
80106ef1:	89 e5                	mov    %esp,%ebp
80106ef3:	57                   	push   %edi
80106ef4:	56                   	push   %esi
80106ef5:	53                   	push   %ebx
80106ef6:	83 ec 1c             	sub    $0x1c,%esp
80106ef9:	8b 45 0c             	mov    0xc(%ebp),%eax
80106efc:	8b 75 18             	mov    0x18(%ebp),%esi
  if((uint) addr % PGSIZE != 0)
80106eff:	a9 ff 0f 00 00       	test   $0xfff,%eax
80106f04:	0f 85 bb 00 00 00    	jne    80106fc5 <loaduvm+0xd5>
  for(i = 0; i < sz; i += PGSIZE){
80106f0a:	01 f0                	add    %esi,%eax
80106f0c:	89 f3                	mov    %esi,%ebx
80106f0e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106f11:	8b 45 14             	mov    0x14(%ebp),%eax
80106f14:	01 f0                	add    %esi,%eax
80106f16:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
80106f19:	85 f6                	test   %esi,%esi
80106f1b:	0f 84 87 00 00 00    	je     80106fa8 <loaduvm+0xb8>
80106f21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  pde = &pgdir[PDX(va)];
80106f28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  if(*pde & PTE_P){
80106f2b:	8b 4d 08             	mov    0x8(%ebp),%ecx
80106f2e:	29 d8                	sub    %ebx,%eax
  pde = &pgdir[PDX(va)];
80106f30:	89 c2                	mov    %eax,%edx
80106f32:	c1 ea 16             	shr    $0x16,%edx
  if(*pde & PTE_P){
80106f35:	8b 14 91             	mov    (%ecx,%edx,4),%edx
80106f38:	f6 c2 01             	test   $0x1,%dl
80106f3b:	75 13                	jne    80106f50 <loaduvm+0x60>
      panic("loaduvm: address should exist");
80106f3d:	83 ec 0c             	sub    $0xc,%esp
80106f40:	68 9f 7e 10 80       	push   $0x80107e9f
80106f45:	e8 36 94 ff ff       	call   80100380 <panic>
80106f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return &pgtab[PTX(va)];
80106f50:	c1 e8 0a             	shr    $0xa,%eax
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106f53:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  return &pgtab[PTX(va)];
80106f59:	25 fc 0f 00 00       	and    $0xffc,%eax
80106f5e:	8d 84 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%eax
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106f65:	85 c0                	test   %eax,%eax
80106f67:	74 d4                	je     80106f3d <loaduvm+0x4d>
    pa = PTE_ADDR(*pte);
80106f69:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106f6b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    if(sz - i < PGSIZE)
80106f6e:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80106f73:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106f78:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
80106f7e:	0f 46 fb             	cmovbe %ebx,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106f81:	29 d9                	sub    %ebx,%ecx
80106f83:	05 00 00 00 80       	add    $0x80000000,%eax
80106f88:	57                   	push   %edi
80106f89:	51                   	push   %ecx
80106f8a:	50                   	push   %eax
80106f8b:	ff 75 10             	push   0x10(%ebp)
80106f8e:	e8 fd aa ff ff       	call   80101a90 <readi>
80106f93:	83 c4 10             	add    $0x10,%esp
80106f96:	39 f8                	cmp    %edi,%eax
80106f98:	75 1e                	jne    80106fb8 <loaduvm+0xc8>
  for(i = 0; i < sz; i += PGSIZE){
80106f9a:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
80106fa0:	89 f0                	mov    %esi,%eax
80106fa2:	29 d8                	sub    %ebx,%eax
80106fa4:	39 c6                	cmp    %eax,%esi
80106fa6:	77 80                	ja     80106f28 <loaduvm+0x38>
}
80106fa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106fab:	31 c0                	xor    %eax,%eax
}
80106fad:	5b                   	pop    %ebx
80106fae:	5e                   	pop    %esi
80106faf:	5f                   	pop    %edi
80106fb0:	5d                   	pop    %ebp
80106fb1:	c3                   	ret    
80106fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106fb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106fbb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106fc0:	5b                   	pop    %ebx
80106fc1:	5e                   	pop    %esi
80106fc2:	5f                   	pop    %edi
80106fc3:	5d                   	pop    %ebp
80106fc4:	c3                   	ret    
    panic("loaduvm: addr must be page aligned");
80106fc5:	83 ec 0c             	sub    $0xc,%esp
80106fc8:	68 40 7f 10 80       	push   $0x80107f40
80106fcd:	e8 ae 93 ff ff       	call   80100380 <panic>
80106fd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106fe0 <allocuvm>:
{
80106fe0:	55                   	push   %ebp
80106fe1:	89 e5                	mov    %esp,%ebp
80106fe3:	57                   	push   %edi
80106fe4:	56                   	push   %esi
80106fe5:	53                   	push   %ebx
80106fe6:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80106fe9:	8b 45 10             	mov    0x10(%ebp),%eax
{
80106fec:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(newsz >= KERNBASE)
80106fef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ff2:	85 c0                	test   %eax,%eax
80106ff4:	0f 88 b6 00 00 00    	js     801070b0 <allocuvm+0xd0>
  if(newsz < oldsz)
80106ffa:	3b 45 0c             	cmp    0xc(%ebp),%eax
    return oldsz;
80106ffd:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(newsz < oldsz)
80107000:	0f 82 9a 00 00 00    	jb     801070a0 <allocuvm+0xc0>
  a = PGROUNDUP(oldsz);
80107006:	8d b0 ff 0f 00 00    	lea    0xfff(%eax),%esi
8010700c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  for(; a < newsz; a += PGSIZE){
80107012:	39 75 10             	cmp    %esi,0x10(%ebp)
80107015:	77 44                	ja     8010705b <allocuvm+0x7b>
80107017:	e9 87 00 00 00       	jmp    801070a3 <allocuvm+0xc3>
8010701c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    memset(mem, 0, PGSIZE);
80107020:	83 ec 04             	sub    $0x4,%esp
80107023:	68 00 10 00 00       	push   $0x1000
80107028:	6a 00                	push   $0x0
8010702a:	50                   	push   %eax
8010702b:	e8 70 d8 ff ff       	call   801048a0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80107030:	58                   	pop    %eax
80107031:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80107037:	5a                   	pop    %edx
80107038:	6a 06                	push   $0x6
8010703a:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010703f:	89 f2                	mov    %esi,%edx
80107041:	50                   	push   %eax
80107042:	89 f8                	mov    %edi,%eax
80107044:	e8 87 fb ff ff       	call   80106bd0 <mappages>
80107049:	83 c4 10             	add    $0x10,%esp
8010704c:	85 c0                	test   %eax,%eax
8010704e:	78 78                	js     801070c8 <allocuvm+0xe8>
  for(; a < newsz; a += PGSIZE){
80107050:	81 c6 00 10 00 00    	add    $0x1000,%esi
80107056:	39 75 10             	cmp    %esi,0x10(%ebp)
80107059:	76 48                	jbe    801070a3 <allocuvm+0xc3>
    mem = kalloc();
8010705b:	e8 20 b6 ff ff       	call   80102680 <kalloc>
80107060:	89 c3                	mov    %eax,%ebx
    if(mem == 0){
80107062:	85 c0                	test   %eax,%eax
80107064:	75 ba                	jne    80107020 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
80107066:	83 ec 0c             	sub    $0xc,%esp
80107069:	68 bd 7e 10 80       	push   $0x80107ebd
8010706e:	e8 2d 96 ff ff       	call   801006a0 <cprintf>
  if(newsz >= oldsz)
80107073:	8b 45 0c             	mov    0xc(%ebp),%eax
80107076:	83 c4 10             	add    $0x10,%esp
80107079:	39 45 10             	cmp    %eax,0x10(%ebp)
8010707c:	74 32                	je     801070b0 <allocuvm+0xd0>
8010707e:	8b 55 10             	mov    0x10(%ebp),%edx
80107081:	89 c1                	mov    %eax,%ecx
80107083:	89 f8                	mov    %edi,%eax
80107085:	e8 96 fa ff ff       	call   80106b20 <deallocuvm.part.0>
      return 0;
8010708a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
}
80107091:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107094:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107097:	5b                   	pop    %ebx
80107098:	5e                   	pop    %esi
80107099:	5f                   	pop    %edi
8010709a:	5d                   	pop    %ebp
8010709b:	c3                   	ret    
8010709c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return oldsz;
801070a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}
801070a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801070a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070a9:	5b                   	pop    %ebx
801070aa:	5e                   	pop    %esi
801070ab:	5f                   	pop    %edi
801070ac:	5d                   	pop    %ebp
801070ad:	c3                   	ret    
801070ae:	66 90                	xchg   %ax,%ax
    return 0;
801070b0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
}
801070b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801070ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070bd:	5b                   	pop    %ebx
801070be:	5e                   	pop    %esi
801070bf:	5f                   	pop    %edi
801070c0:	5d                   	pop    %ebp
801070c1:	c3                   	ret    
801070c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
801070c8:	83 ec 0c             	sub    $0xc,%esp
801070cb:	68 d5 7e 10 80       	push   $0x80107ed5
801070d0:	e8 cb 95 ff ff       	call   801006a0 <cprintf>
  if(newsz >= oldsz)
801070d5:	8b 45 0c             	mov    0xc(%ebp),%eax
801070d8:	83 c4 10             	add    $0x10,%esp
801070db:	39 45 10             	cmp    %eax,0x10(%ebp)
801070de:	74 0c                	je     801070ec <allocuvm+0x10c>
801070e0:	8b 55 10             	mov    0x10(%ebp),%edx
801070e3:	89 c1                	mov    %eax,%ecx
801070e5:	89 f8                	mov    %edi,%eax
801070e7:	e8 34 fa ff ff       	call   80106b20 <deallocuvm.part.0>
      kfree(mem);
801070ec:	83 ec 0c             	sub    $0xc,%esp
801070ef:	53                   	push   %ebx
801070f0:	e8 cb b3 ff ff       	call   801024c0 <kfree>
      return 0;
801070f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
801070fc:	83 c4 10             	add    $0x10,%esp
}
801070ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107102:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107105:	5b                   	pop    %ebx
80107106:	5e                   	pop    %esi
80107107:	5f                   	pop    %edi
80107108:	5d                   	pop    %ebp
80107109:	c3                   	ret    
8010710a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107110 <deallocuvm>:
{
80107110:	55                   	push   %ebp
80107111:	89 e5                	mov    %esp,%ebp
80107113:	8b 55 0c             	mov    0xc(%ebp),%edx
80107116:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107119:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
8010711c:	39 d1                	cmp    %edx,%ecx
8010711e:	73 10                	jae    80107130 <deallocuvm+0x20>
}
80107120:	5d                   	pop    %ebp
80107121:	e9 fa f9 ff ff       	jmp    80106b20 <deallocuvm.part.0>
80107126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010712d:	8d 76 00             	lea    0x0(%esi),%esi
80107130:	89 d0                	mov    %edx,%eax
80107132:	5d                   	pop    %ebp
80107133:	c3                   	ret    
80107134:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010713b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010713f:	90                   	nop

80107140 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107140:	55                   	push   %ebp
80107141:	89 e5                	mov    %esp,%ebp
80107143:	57                   	push   %edi
80107144:	56                   	push   %esi
80107145:	53                   	push   %ebx
80107146:	83 ec 0c             	sub    $0xc,%esp
80107149:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010714c:	85 f6                	test   %esi,%esi
8010714e:	74 59                	je     801071a9 <freevm+0x69>
  if(newsz >= oldsz)
80107150:	31 c9                	xor    %ecx,%ecx
80107152:	ba 00 00 00 80       	mov    $0x80000000,%edx
80107157:	89 f0                	mov    %esi,%eax
80107159:	89 f3                	mov    %esi,%ebx
8010715b:	e8 c0 f9 ff ff       	call   80106b20 <deallocuvm.part.0>
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107160:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107166:	eb 0f                	jmp    80107177 <freevm+0x37>
80107168:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010716f:	90                   	nop
80107170:	83 c3 04             	add    $0x4,%ebx
80107173:	39 df                	cmp    %ebx,%edi
80107175:	74 23                	je     8010719a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80107177:	8b 03                	mov    (%ebx),%eax
80107179:	a8 01                	test   $0x1,%al
8010717b:	74 f3                	je     80107170 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
8010717d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80107182:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < NPDENTRIES; i++){
80107185:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80107188:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
8010718d:	50                   	push   %eax
8010718e:	e8 2d b3 ff ff       	call   801024c0 <kfree>
80107193:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80107196:	39 df                	cmp    %ebx,%edi
80107198:	75 dd                	jne    80107177 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
8010719a:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010719d:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071a0:	5b                   	pop    %ebx
801071a1:	5e                   	pop    %esi
801071a2:	5f                   	pop    %edi
801071a3:	5d                   	pop    %ebp
  kfree((char*)pgdir);
801071a4:	e9 17 b3 ff ff       	jmp    801024c0 <kfree>
    panic("freevm: no pgdir");
801071a9:	83 ec 0c             	sub    $0xc,%esp
801071ac:	68 f1 7e 10 80       	push   $0x80107ef1
801071b1:	e8 ca 91 ff ff       	call   80100380 <panic>
801071b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801071bd:	8d 76 00             	lea    0x0(%esi),%esi

801071c0 <setupkvm>:
{
801071c0:	55                   	push   %ebp
801071c1:	89 e5                	mov    %esp,%ebp
801071c3:	56                   	push   %esi
801071c4:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
801071c5:	e8 b6 b4 ff ff       	call   80102680 <kalloc>
801071ca:	89 c6                	mov    %eax,%esi
801071cc:	85 c0                	test   %eax,%eax
801071ce:	74 42                	je     80107212 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
801071d0:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
801071d3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  memset(pgdir, 0, PGSIZE);
801071d8:	68 00 10 00 00       	push   $0x1000
801071dd:	6a 00                	push   $0x0
801071df:	50                   	push   %eax
801071e0:	e8 bb d6 ff ff       	call   801048a0 <memset>
801071e5:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
801071e8:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
801071eb:	83 ec 08             	sub    $0x8,%esp
801071ee:	8b 4b 08             	mov    0x8(%ebx),%ecx
801071f1:	ff 73 0c             	push   0xc(%ebx)
801071f4:	8b 13                	mov    (%ebx),%edx
801071f6:	50                   	push   %eax
801071f7:	29 c1                	sub    %eax,%ecx
801071f9:	89 f0                	mov    %esi,%eax
801071fb:	e8 d0 f9 ff ff       	call   80106bd0 <mappages>
80107200:	83 c4 10             	add    $0x10,%esp
80107203:	85 c0                	test   %eax,%eax
80107205:	78 19                	js     80107220 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107207:	83 c3 10             	add    $0x10,%ebx
8010720a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80107210:	75 d6                	jne    801071e8 <setupkvm+0x28>
}
80107212:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107215:	89 f0                	mov    %esi,%eax
80107217:	5b                   	pop    %ebx
80107218:	5e                   	pop    %esi
80107219:	5d                   	pop    %ebp
8010721a:	c3                   	ret    
8010721b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010721f:	90                   	nop
      freevm(pgdir);
80107220:	83 ec 0c             	sub    $0xc,%esp
80107223:	56                   	push   %esi
      return 0;
80107224:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
80107226:	e8 15 ff ff ff       	call   80107140 <freevm>
      return 0;
8010722b:	83 c4 10             	add    $0x10,%esp
}
8010722e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107231:	89 f0                	mov    %esi,%eax
80107233:	5b                   	pop    %ebx
80107234:	5e                   	pop    %esi
80107235:	5d                   	pop    %ebp
80107236:	c3                   	ret    
80107237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010723e:	66 90                	xchg   %ax,%ax

80107240 <kvmalloc>:
{
80107240:	55                   	push   %ebp
80107241:	89 e5                	mov    %esp,%ebp
80107243:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107246:	e8 75 ff ff ff       	call   801071c0 <setupkvm>
8010724b:	a3 24 be 11 80       	mov    %eax,0x8011be24
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107250:	05 00 00 00 80       	add    $0x80000000,%eax
80107255:	0f 22 d8             	mov    %eax,%cr3
}
80107258:	c9                   	leave  
80107259:	c3                   	ret    
8010725a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107260 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107260:	55                   	push   %ebp
80107261:	89 e5                	mov    %esp,%ebp
80107263:	83 ec 08             	sub    $0x8,%esp
80107266:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(*pde & PTE_P){
80107269:	8b 55 08             	mov    0x8(%ebp),%edx
  pde = &pgdir[PDX(va)];
8010726c:	89 c1                	mov    %eax,%ecx
8010726e:	c1 e9 16             	shr    $0x16,%ecx
  if(*pde & PTE_P){
80107271:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
80107274:	f6 c2 01             	test   $0x1,%dl
80107277:	75 17                	jne    80107290 <clearpteu+0x30>
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80107279:	83 ec 0c             	sub    $0xc,%esp
8010727c:	68 02 7f 10 80       	push   $0x80107f02
80107281:	e8 fa 90 ff ff       	call   80100380 <panic>
80107286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010728d:	8d 76 00             	lea    0x0(%esi),%esi
  return &pgtab[PTX(va)];
80107290:	c1 e8 0a             	shr    $0xa,%eax
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80107293:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  return &pgtab[PTX(va)];
80107299:	25 fc 0f 00 00       	and    $0xffc,%eax
8010729e:	8d 84 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%eax
  if(pte == 0)
801072a5:	85 c0                	test   %eax,%eax
801072a7:	74 d0                	je     80107279 <clearpteu+0x19>
  *pte &= ~PTE_U;
801072a9:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801072ac:	c9                   	leave  
801072ad:	c3                   	ret    
801072ae:	66 90                	xchg   %ax,%ax

801072b0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801072b0:	55                   	push   %ebp
801072b1:	89 e5                	mov    %esp,%ebp
801072b3:	57                   	push   %edi
801072b4:	56                   	push   %esi
801072b5:	53                   	push   %ebx
801072b6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
801072b9:	e8 02 ff ff ff       	call   801071c0 <setupkvm>
801072be:	89 45 e0             	mov    %eax,-0x20(%ebp)
801072c1:	85 c0                	test   %eax,%eax
801072c3:	0f 84 bd 00 00 00    	je     80107386 <copyuvm+0xd6>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801072c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801072cc:	85 c9                	test   %ecx,%ecx
801072ce:	0f 84 b2 00 00 00    	je     80107386 <copyuvm+0xd6>
801072d4:	31 f6                	xor    %esi,%esi
801072d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801072dd:	8d 76 00             	lea    0x0(%esi),%esi
  if(*pde & PTE_P){
801072e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  pde = &pgdir[PDX(va)];
801072e3:	89 f0                	mov    %esi,%eax
801072e5:	c1 e8 16             	shr    $0x16,%eax
  if(*pde & PTE_P){
801072e8:	8b 04 81             	mov    (%ecx,%eax,4),%eax
801072eb:	a8 01                	test   $0x1,%al
801072ed:	75 11                	jne    80107300 <copyuvm+0x50>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
801072ef:	83 ec 0c             	sub    $0xc,%esp
801072f2:	68 0c 7f 10 80       	push   $0x80107f0c
801072f7:	e8 84 90 ff ff       	call   80100380 <panic>
801072fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return &pgtab[PTX(va)];
80107300:	89 f2                	mov    %esi,%edx
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80107302:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  return &pgtab[PTX(va)];
80107307:	c1 ea 0a             	shr    $0xa,%edx
8010730a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80107310:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107317:	85 c0                	test   %eax,%eax
80107319:	74 d4                	je     801072ef <copyuvm+0x3f>
    if(!(*pte & PTE_P))
8010731b:	8b 00                	mov    (%eax),%eax
8010731d:	a8 01                	test   $0x1,%al
8010731f:	0f 84 9f 00 00 00    	je     801073c4 <copyuvm+0x114>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80107325:	89 c7                	mov    %eax,%edi
    flags = PTE_FLAGS(*pte);
80107327:	25 ff 0f 00 00       	and    $0xfff,%eax
8010732c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    pa = PTE_ADDR(*pte);
8010732f:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    if((mem = kalloc()) == 0)
80107335:	e8 46 b3 ff ff       	call   80102680 <kalloc>
8010733a:	89 c3                	mov    %eax,%ebx
8010733c:	85 c0                	test   %eax,%eax
8010733e:	74 64                	je     801073a4 <copyuvm+0xf4>
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107340:	83 ec 04             	sub    $0x4,%esp
80107343:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80107349:	68 00 10 00 00       	push   $0x1000
8010734e:	57                   	push   %edi
8010734f:	50                   	push   %eax
80107350:	e8 eb d5 ff ff       	call   80104940 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80107355:	58                   	pop    %eax
80107356:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010735c:	5a                   	pop    %edx
8010735d:	ff 75 e4             	push   -0x1c(%ebp)
80107360:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107365:	89 f2                	mov    %esi,%edx
80107367:	50                   	push   %eax
80107368:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010736b:	e8 60 f8 ff ff       	call   80106bd0 <mappages>
80107370:	83 c4 10             	add    $0x10,%esp
80107373:	85 c0                	test   %eax,%eax
80107375:	78 21                	js     80107398 <copyuvm+0xe8>
  for(i = 0; i < sz; i += PGSIZE){
80107377:	81 c6 00 10 00 00    	add    $0x1000,%esi
8010737d:	39 75 0c             	cmp    %esi,0xc(%ebp)
80107380:	0f 87 5a ff ff ff    	ja     801072e0 <copyuvm+0x30>
  return d;

bad:
  freevm(d);
  return 0;
}
80107386:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107389:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010738c:	5b                   	pop    %ebx
8010738d:	5e                   	pop    %esi
8010738e:	5f                   	pop    %edi
8010738f:	5d                   	pop    %ebp
80107390:	c3                   	ret    
80107391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
80107398:	83 ec 0c             	sub    $0xc,%esp
8010739b:	53                   	push   %ebx
8010739c:	e8 1f b1 ff ff       	call   801024c0 <kfree>
      goto bad;
801073a1:	83 c4 10             	add    $0x10,%esp
  freevm(d);
801073a4:	83 ec 0c             	sub    $0xc,%esp
801073a7:	ff 75 e0             	push   -0x20(%ebp)
801073aa:	e8 91 fd ff ff       	call   80107140 <freevm>
  return 0;
801073af:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
801073b6:	83 c4 10             	add    $0x10,%esp
}
801073b9:	8b 45 e0             	mov    -0x20(%ebp),%eax
801073bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801073bf:	5b                   	pop    %ebx
801073c0:	5e                   	pop    %esi
801073c1:	5f                   	pop    %edi
801073c2:	5d                   	pop    %ebp
801073c3:	c3                   	ret    
      panic("copyuvm: page not present");
801073c4:	83 ec 0c             	sub    $0xc,%esp
801073c7:	68 26 7f 10 80       	push   $0x80107f26
801073cc:	e8 af 8f ff ff       	call   80100380 <panic>
801073d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801073d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801073df:	90                   	nop

801073e0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801073e0:	55                   	push   %ebp
801073e1:	89 e5                	mov    %esp,%ebp
801073e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(*pde & PTE_P){
801073e6:	8b 55 08             	mov    0x8(%ebp),%edx
  pde = &pgdir[PDX(va)];
801073e9:	89 c1                	mov    %eax,%ecx
801073eb:	c1 e9 16             	shr    $0x16,%ecx
  if(*pde & PTE_P){
801073ee:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
801073f1:	f6 c2 01             	test   $0x1,%dl
801073f4:	0f 84 00 01 00 00    	je     801074fa <uva2ka.cold>
  return &pgtab[PTX(va)];
801073fa:	c1 e8 0c             	shr    $0xc,%eax
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801073fd:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80107403:	5d                   	pop    %ebp
  return &pgtab[PTX(va)];
80107404:	25 ff 03 00 00       	and    $0x3ff,%eax
  if((*pte & PTE_P) == 0)
80107409:	8b 84 82 00 00 00 80 	mov    -0x80000000(%edx,%eax,4),%eax
  if((*pte & PTE_U) == 0)
80107410:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107412:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
80107417:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
8010741a:	05 00 00 00 80       	add    $0x80000000,%eax
8010741f:	83 fa 05             	cmp    $0x5,%edx
80107422:	ba 00 00 00 00       	mov    $0x0,%edx
80107427:	0f 45 c2             	cmovne %edx,%eax
}
8010742a:	c3                   	ret    
8010742b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010742f:	90                   	nop

80107430 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107430:	55                   	push   %ebp
80107431:	89 e5                	mov    %esp,%ebp
80107433:	57                   	push   %edi
80107434:	56                   	push   %esi
80107435:	53                   	push   %ebx
80107436:	83 ec 0c             	sub    $0xc,%esp
80107439:	8b 75 14             	mov    0x14(%ebp),%esi
8010743c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010743f:	8b 55 10             	mov    0x10(%ebp),%edx
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107442:	85 f6                	test   %esi,%esi
80107444:	75 51                	jne    80107497 <copyout+0x67>
80107446:	e9 a5 00 00 00       	jmp    801074f0 <copyout+0xc0>
8010744b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010744f:	90                   	nop
  return (char*)P2V(PTE_ADDR(*pte));
80107450:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80107456:	8d 8b 00 00 00 80    	lea    -0x80000000(%ebx),%ecx
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
8010745c:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
80107462:	74 75                	je     801074d9 <copyout+0xa9>
      return -1;
    n = PGSIZE - (va - va0);
80107464:	89 fb                	mov    %edi,%ebx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107466:	89 55 10             	mov    %edx,0x10(%ebp)
    n = PGSIZE - (va - va0);
80107469:	29 c3                	sub    %eax,%ebx
8010746b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80107471:	39 f3                	cmp    %esi,%ebx
80107473:	0f 47 de             	cmova  %esi,%ebx
    memmove(pa0 + (va - va0), buf, n);
80107476:	29 f8                	sub    %edi,%eax
80107478:	83 ec 04             	sub    $0x4,%esp
8010747b:	01 c1                	add    %eax,%ecx
8010747d:	53                   	push   %ebx
8010747e:	52                   	push   %edx
8010747f:	51                   	push   %ecx
80107480:	e8 bb d4 ff ff       	call   80104940 <memmove>
    len -= n;
    buf += n;
80107485:	8b 55 10             	mov    0x10(%ebp),%edx
    va = va0 + PGSIZE;
80107488:	8d 87 00 10 00 00    	lea    0x1000(%edi),%eax
  while(len > 0){
8010748e:	83 c4 10             	add    $0x10,%esp
    buf += n;
80107491:	01 da                	add    %ebx,%edx
  while(len > 0){
80107493:	29 de                	sub    %ebx,%esi
80107495:	74 59                	je     801074f0 <copyout+0xc0>
  if(*pde & PTE_P){
80107497:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pde = &pgdir[PDX(va)];
8010749a:	89 c1                	mov    %eax,%ecx
    va0 = (uint)PGROUNDDOWN(va);
8010749c:	89 c7                	mov    %eax,%edi
  pde = &pgdir[PDX(va)];
8010749e:	c1 e9 16             	shr    $0x16,%ecx
    va0 = (uint)PGROUNDDOWN(va);
801074a1:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  if(*pde & PTE_P){
801074a7:	8b 0c 8b             	mov    (%ebx,%ecx,4),%ecx
801074aa:	f6 c1 01             	test   $0x1,%cl
801074ad:	0f 84 4e 00 00 00    	je     80107501 <copyout.cold>
  return &pgtab[PTX(va)];
801074b3:	89 fb                	mov    %edi,%ebx
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801074b5:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
  return &pgtab[PTX(va)];
801074bb:	c1 eb 0c             	shr    $0xc,%ebx
801074be:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
  if((*pte & PTE_P) == 0)
801074c4:	8b 9c 99 00 00 00 80 	mov    -0x80000000(%ecx,%ebx,4),%ebx
  if((*pte & PTE_U) == 0)
801074cb:	89 d9                	mov    %ebx,%ecx
801074cd:	83 e1 05             	and    $0x5,%ecx
801074d0:	83 f9 05             	cmp    $0x5,%ecx
801074d3:	0f 84 77 ff ff ff    	je     80107450 <copyout+0x20>
  }
  return 0;
}
801074d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801074dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801074e1:	5b                   	pop    %ebx
801074e2:	5e                   	pop    %esi
801074e3:	5f                   	pop    %edi
801074e4:	5d                   	pop    %ebp
801074e5:	c3                   	ret    
801074e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801074ed:	8d 76 00             	lea    0x0(%esi),%esi
801074f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801074f3:	31 c0                	xor    %eax,%eax
}
801074f5:	5b                   	pop    %ebx
801074f6:	5e                   	pop    %esi
801074f7:	5f                   	pop    %edi
801074f8:	5d                   	pop    %ebp
801074f9:	c3                   	ret    

801074fa <uva2ka.cold>:
  if((*pte & PTE_P) == 0)
801074fa:	a1 00 00 00 00       	mov    0x0,%eax
801074ff:	0f 0b                	ud2    

80107501 <copyout.cold>:
80107501:	a1 00 00 00 00       	mov    0x0,%eax
80107506:	0f 0b                	ud2    
