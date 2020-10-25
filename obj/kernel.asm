
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 16 ea 10 00       	push   $0x10ea16
  10001f:	e8 15 2b 00 00       	call   102b39 <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 5e 14 00 00       	call   10148a <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 e0 32 10 00 	movl   $0x1032e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 fc 32 10 00       	push   $0x1032fc
  10003e:	e8 fa 01 00 00       	call   10023d <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 7c 08 00 00       	call   1008c7 <print_kerninfo>

    grade_backtrace();
  10004b:	e8 74 00 00 00       	call   1000c4 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 a8 27 00 00       	call   1027fd <pmm_init>

    pic_init();                 // init interrupt controller
  100055:	e8 73 15 00 00       	call   1015cd <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005a:	e8 d4 16 00 00       	call   101733 <idt_init>

    clock_init();               // init clock interrupt
  10005f:	e8 07 0c 00 00       	call   100c6b <clock_init>
    intr_enable();              // enable irq interrupt
  100064:	e8 a1 16 00 00       	call   10170a <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  100069:	eb fe                	jmp    100069 <kern_init+0x69>

0010006b <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10006b:	55                   	push   %ebp
  10006c:	89 e5                	mov    %esp,%ebp
  10006e:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100071:	83 ec 04             	sub    $0x4,%esp
  100074:	6a 00                	push   $0x0
  100076:	6a 00                	push   $0x0
  100078:	6a 00                	push   $0x0
  10007a:	e8 da 0b 00 00       	call   100c59 <mon_backtrace>
  10007f:	83 c4 10             	add    $0x10,%esp
}
  100082:	90                   	nop
  100083:	c9                   	leave  
  100084:	c3                   	ret    

00100085 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100085:	55                   	push   %ebp
  100086:	89 e5                	mov    %esp,%ebp
  100088:	53                   	push   %ebx
  100089:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10008c:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10008f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100092:	8d 5d 08             	lea    0x8(%ebp),%ebx
  100095:	8b 45 08             	mov    0x8(%ebp),%eax
  100098:	51                   	push   %ecx
  100099:	52                   	push   %edx
  10009a:	53                   	push   %ebx
  10009b:	50                   	push   %eax
  10009c:	e8 ca ff ff ff       	call   10006b <grade_backtrace2>
  1000a1:	83 c4 10             	add    $0x10,%esp
}
  1000a4:	90                   	nop
  1000a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000a8:	c9                   	leave  
  1000a9:	c3                   	ret    

001000aa <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000aa:	55                   	push   %ebp
  1000ab:	89 e5                	mov    %esp,%ebp
  1000ad:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000b0:	83 ec 08             	sub    $0x8,%esp
  1000b3:	ff 75 10             	pushl  0x10(%ebp)
  1000b6:	ff 75 08             	pushl  0x8(%ebp)
  1000b9:	e8 c7 ff ff ff       	call   100085 <grade_backtrace1>
  1000be:	83 c4 10             	add    $0x10,%esp
}
  1000c1:	90                   	nop
  1000c2:	c9                   	leave  
  1000c3:	c3                   	ret    

001000c4 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c4:	55                   	push   %ebp
  1000c5:	89 e5                	mov    %esp,%ebp
  1000c7:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000ca:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000cf:	83 ec 04             	sub    $0x4,%esp
  1000d2:	68 00 00 ff ff       	push   $0xffff0000
  1000d7:	50                   	push   %eax
  1000d8:	6a 00                	push   $0x0
  1000da:	e8 cb ff ff ff       	call   1000aa <grade_backtrace0>
  1000df:	83 c4 10             	add    $0x10,%esp
}
  1000e2:	90                   	nop
  1000e3:	c9                   	leave  
  1000e4:	c3                   	ret    

001000e5 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000e5:	55                   	push   %ebp
  1000e6:	89 e5                	mov    %esp,%ebp
  1000e8:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000eb:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000ee:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f1:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f4:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000f7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1000fb:	0f b7 c0             	movzwl %ax,%eax
  1000fe:	83 e0 03             	and    $0x3,%eax
  100101:	89 c2                	mov    %eax,%edx
  100103:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100108:	83 ec 04             	sub    $0x4,%esp
  10010b:	52                   	push   %edx
  10010c:	50                   	push   %eax
  10010d:	68 01 33 10 00       	push   $0x103301
  100112:	e8 26 01 00 00       	call   10023d <cprintf>
  100117:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10011a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011e:	0f b7 d0             	movzwl %ax,%edx
  100121:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100126:	83 ec 04             	sub    $0x4,%esp
  100129:	52                   	push   %edx
  10012a:	50                   	push   %eax
  10012b:	68 0f 33 10 00       	push   $0x10330f
  100130:	e8 08 01 00 00       	call   10023d <cprintf>
  100135:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  100138:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10013c:	0f b7 d0             	movzwl %ax,%edx
  10013f:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100144:	83 ec 04             	sub    $0x4,%esp
  100147:	52                   	push   %edx
  100148:	50                   	push   %eax
  100149:	68 1d 33 10 00       	push   $0x10331d
  10014e:	e8 ea 00 00 00       	call   10023d <cprintf>
  100153:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  100156:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10015a:	0f b7 d0             	movzwl %ax,%edx
  10015d:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100162:	83 ec 04             	sub    $0x4,%esp
  100165:	52                   	push   %edx
  100166:	50                   	push   %eax
  100167:	68 2b 33 10 00       	push   $0x10332b
  10016c:	e8 cc 00 00 00       	call   10023d <cprintf>
  100171:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100174:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100178:	0f b7 d0             	movzwl %ax,%edx
  10017b:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100180:	83 ec 04             	sub    $0x4,%esp
  100183:	52                   	push   %edx
  100184:	50                   	push   %eax
  100185:	68 39 33 10 00       	push   $0x103339
  10018a:	e8 ae 00 00 00       	call   10023d <cprintf>
  10018f:	83 c4 10             	add    $0x10,%esp
    round ++;
  100192:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100197:	83 c0 01             	add    $0x1,%eax
  10019a:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  10019f:	90                   	nop
  1001a0:	c9                   	leave  
  1001a1:	c3                   	ret    

001001a2 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001a2:	55                   	push   %ebp
  1001a3:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001a5:	90                   	nop
  1001a6:	5d                   	pop    %ebp
  1001a7:	c3                   	ret    

001001a8 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001a8:	55                   	push   %ebp
  1001a9:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ab:	90                   	nop
  1001ac:	5d                   	pop    %ebp
  1001ad:	c3                   	ret    

001001ae <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ae:	55                   	push   %ebp
  1001af:	89 e5                	mov    %esp,%ebp
  1001b1:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001b4:	e8 2c ff ff ff       	call   1000e5 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001b9:	83 ec 0c             	sub    $0xc,%esp
  1001bc:	68 48 33 10 00       	push   $0x103348
  1001c1:	e8 77 00 00 00       	call   10023d <cprintf>
  1001c6:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001c9:	e8 d4 ff ff ff       	call   1001a2 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ce:	e8 12 ff ff ff       	call   1000e5 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001d3:	83 ec 0c             	sub    $0xc,%esp
  1001d6:	68 68 33 10 00       	push   $0x103368
  1001db:	e8 5d 00 00 00       	call   10023d <cprintf>
  1001e0:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  1001e3:	e8 c0 ff ff ff       	call   1001a8 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001e8:	e8 f8 fe ff ff       	call   1000e5 <lab1_print_cur_status>
}
  1001ed:	90                   	nop
  1001ee:	c9                   	leave  
  1001ef:	c3                   	ret    

001001f0 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1001f0:	55                   	push   %ebp
  1001f1:	89 e5                	mov    %esp,%ebp
  1001f3:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  1001f6:	83 ec 0c             	sub    $0xc,%esp
  1001f9:	ff 75 08             	pushl  0x8(%ebp)
  1001fc:	e8 ba 12 00 00       	call   1014bb <cons_putc>
  100201:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  100204:	8b 45 0c             	mov    0xc(%ebp),%eax
  100207:	8b 00                	mov    (%eax),%eax
  100209:	8d 50 01             	lea    0x1(%eax),%edx
  10020c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10020f:	89 10                	mov    %edx,(%eax)
}
  100211:	90                   	nop
  100212:	c9                   	leave  
  100213:	c3                   	ret    

00100214 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100214:	55                   	push   %ebp
  100215:	89 e5                	mov    %esp,%ebp
  100217:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  10021a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100221:	ff 75 0c             	pushl  0xc(%ebp)
  100224:	ff 75 08             	pushl  0x8(%ebp)
  100227:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10022a:	50                   	push   %eax
  10022b:	68 f0 01 10 00       	push   $0x1001f0
  100230:	e8 3a 2c 00 00       	call   102e6f <vprintfmt>
  100235:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100238:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10023b:	c9                   	leave  
  10023c:	c3                   	ret    

0010023d <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10023d:	55                   	push   %ebp
  10023e:	89 e5                	mov    %esp,%ebp
  100240:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100243:	8d 45 0c             	lea    0xc(%ebp),%eax
  100246:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100249:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10024c:	83 ec 08             	sub    $0x8,%esp
  10024f:	50                   	push   %eax
  100250:	ff 75 08             	pushl  0x8(%ebp)
  100253:	e8 bc ff ff ff       	call   100214 <vcprintf>
  100258:	83 c4 10             	add    $0x10,%esp
  10025b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100261:	c9                   	leave  
  100262:	c3                   	ret    

00100263 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100263:	55                   	push   %ebp
  100264:	89 e5                	mov    %esp,%ebp
  100266:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100269:	83 ec 0c             	sub    $0xc,%esp
  10026c:	ff 75 08             	pushl  0x8(%ebp)
  10026f:	e8 47 12 00 00       	call   1014bb <cons_putc>
  100274:	83 c4 10             	add    $0x10,%esp
}
  100277:	90                   	nop
  100278:	c9                   	leave  
  100279:	c3                   	ret    

0010027a <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10027a:	55                   	push   %ebp
  10027b:	89 e5                	mov    %esp,%ebp
  10027d:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100280:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100287:	eb 14                	jmp    10029d <cputs+0x23>
        cputch(c, &cnt);
  100289:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10028d:	83 ec 08             	sub    $0x8,%esp
  100290:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100293:	52                   	push   %edx
  100294:	50                   	push   %eax
  100295:	e8 56 ff ff ff       	call   1001f0 <cputch>
  10029a:	83 c4 10             	add    $0x10,%esp
    while ((c = *str ++) != '\0') {
  10029d:	8b 45 08             	mov    0x8(%ebp),%eax
  1002a0:	8d 50 01             	lea    0x1(%eax),%edx
  1002a3:	89 55 08             	mov    %edx,0x8(%ebp)
  1002a6:	0f b6 00             	movzbl (%eax),%eax
  1002a9:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002ac:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002b0:	75 d7                	jne    100289 <cputs+0xf>
    }
    cputch('\n', &cnt);
  1002b2:	83 ec 08             	sub    $0x8,%esp
  1002b5:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002b8:	50                   	push   %eax
  1002b9:	6a 0a                	push   $0xa
  1002bb:	e8 30 ff ff ff       	call   1001f0 <cputch>
  1002c0:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002c6:	c9                   	leave  
  1002c7:	c3                   	ret    

001002c8 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002c8:	55                   	push   %ebp
  1002c9:	89 e5                	mov    %esp,%ebp
  1002cb:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002ce:	e8 18 12 00 00       	call   1014eb <cons_getc>
  1002d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002da:	74 f2                	je     1002ce <getchar+0x6>
        /* do nothing */;
    return c;
  1002dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002df:	c9                   	leave  
  1002e0:	c3                   	ret    

001002e1 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002e1:	55                   	push   %ebp
  1002e2:	89 e5                	mov    %esp,%ebp
  1002e4:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  1002e7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1002eb:	74 13                	je     100300 <readline+0x1f>
        cprintf("%s", prompt);
  1002ed:	83 ec 08             	sub    $0x8,%esp
  1002f0:	ff 75 08             	pushl  0x8(%ebp)
  1002f3:	68 87 33 10 00       	push   $0x103387
  1002f8:	e8 40 ff ff ff       	call   10023d <cprintf>
  1002fd:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  100300:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100307:	e8 bc ff ff ff       	call   1002c8 <getchar>
  10030c:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10030f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100313:	79 0a                	jns    10031f <readline+0x3e>
            return NULL;
  100315:	b8 00 00 00 00       	mov    $0x0,%eax
  10031a:	e9 82 00 00 00       	jmp    1003a1 <readline+0xc0>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10031f:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100323:	7e 2b                	jle    100350 <readline+0x6f>
  100325:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  10032c:	7f 22                	jg     100350 <readline+0x6f>
            cputchar(c);
  10032e:	83 ec 0c             	sub    $0xc,%esp
  100331:	ff 75 f0             	pushl  -0x10(%ebp)
  100334:	e8 2a ff ff ff       	call   100263 <cputchar>
  100339:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  10033c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10033f:	8d 50 01             	lea    0x1(%eax),%edx
  100342:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100345:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100348:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  10034e:	eb 4c                	jmp    10039c <readline+0xbb>
        }
        else if (c == '\b' && i > 0) {
  100350:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100354:	75 1a                	jne    100370 <readline+0x8f>
  100356:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10035a:	7e 14                	jle    100370 <readline+0x8f>
            cputchar(c);
  10035c:	83 ec 0c             	sub    $0xc,%esp
  10035f:	ff 75 f0             	pushl  -0x10(%ebp)
  100362:	e8 fc fe ff ff       	call   100263 <cputchar>
  100367:	83 c4 10             	add    $0x10,%esp
            i --;
  10036a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10036e:	eb 2c                	jmp    10039c <readline+0xbb>
        }
        else if (c == '\n' || c == '\r') {
  100370:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100374:	74 06                	je     10037c <readline+0x9b>
  100376:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10037a:	75 8b                	jne    100307 <readline+0x26>
            cputchar(c);
  10037c:	83 ec 0c             	sub    $0xc,%esp
  10037f:	ff 75 f0             	pushl  -0x10(%ebp)
  100382:	e8 dc fe ff ff       	call   100263 <cputchar>
  100387:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  10038a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10038d:	05 40 ea 10 00       	add    $0x10ea40,%eax
  100392:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  100395:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  10039a:	eb 05                	jmp    1003a1 <readline+0xc0>
        c = getchar();
  10039c:	e9 66 ff ff ff       	jmp    100307 <readline+0x26>
        }
    }
}
  1003a1:	c9                   	leave  
  1003a2:	c3                   	ret    

001003a3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003a3:	55                   	push   %ebp
  1003a4:	89 e5                	mov    %esp,%ebp
  1003a6:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  1003a9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003ae:	85 c0                	test   %eax,%eax
  1003b0:	75 4a                	jne    1003fc <__panic+0x59>
        goto panic_dead;
    }
    is_panic = 1;
  1003b2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003b9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003bc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003c2:	83 ec 04             	sub    $0x4,%esp
  1003c5:	ff 75 0c             	pushl  0xc(%ebp)
  1003c8:	ff 75 08             	pushl  0x8(%ebp)
  1003cb:	68 8a 33 10 00       	push   $0x10338a
  1003d0:	e8 68 fe ff ff       	call   10023d <cprintf>
  1003d5:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1003d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003db:	83 ec 08             	sub    $0x8,%esp
  1003de:	50                   	push   %eax
  1003df:	ff 75 10             	pushl  0x10(%ebp)
  1003e2:	e8 2d fe ff ff       	call   100214 <vcprintf>
  1003e7:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1003ea:	83 ec 0c             	sub    $0xc,%esp
  1003ed:	68 a6 33 10 00       	push   $0x1033a6
  1003f2:	e8 46 fe ff ff       	call   10023d <cprintf>
  1003f7:	83 c4 10             	add    $0x10,%esp
  1003fa:	eb 01                	jmp    1003fd <__panic+0x5a>
        goto panic_dead;
  1003fc:	90                   	nop
    va_end(ap);

panic_dead:
    intr_disable();
  1003fd:	e8 0f 13 00 00       	call   101711 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100402:	83 ec 0c             	sub    $0xc,%esp
  100405:	6a 00                	push   $0x0
  100407:	e8 73 07 00 00       	call   100b7f <kmonitor>
  10040c:	83 c4 10             	add    $0x10,%esp
  10040f:	eb f1                	jmp    100402 <__panic+0x5f>

00100411 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100411:	55                   	push   %ebp
  100412:	89 e5                	mov    %esp,%ebp
  100414:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  100417:	8d 45 14             	lea    0x14(%ebp),%eax
  10041a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10041d:	83 ec 04             	sub    $0x4,%esp
  100420:	ff 75 0c             	pushl  0xc(%ebp)
  100423:	ff 75 08             	pushl  0x8(%ebp)
  100426:	68 a8 33 10 00       	push   $0x1033a8
  10042b:	e8 0d fe ff ff       	call   10023d <cprintf>
  100430:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100433:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100436:	83 ec 08             	sub    $0x8,%esp
  100439:	50                   	push   %eax
  10043a:	ff 75 10             	pushl  0x10(%ebp)
  10043d:	e8 d2 fd ff ff       	call   100214 <vcprintf>
  100442:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  100445:	83 ec 0c             	sub    $0xc,%esp
  100448:	68 a6 33 10 00       	push   $0x1033a6
  10044d:	e8 eb fd ff ff       	call   10023d <cprintf>
  100452:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  100455:	90                   	nop
  100456:	c9                   	leave  
  100457:	c3                   	ret    

00100458 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100458:	55                   	push   %ebp
  100459:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10045b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100460:	5d                   	pop    %ebp
  100461:	c3                   	ret    

00100462 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100462:	55                   	push   %ebp
  100463:	89 e5                	mov    %esp,%ebp
  100465:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100468:	8b 45 0c             	mov    0xc(%ebp),%eax
  10046b:	8b 00                	mov    (%eax),%eax
  10046d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100470:	8b 45 10             	mov    0x10(%ebp),%eax
  100473:	8b 00                	mov    (%eax),%eax
  100475:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  10047f:	e9 d2 00 00 00       	jmp    100556 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  100484:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100487:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10048a:	01 d0                	add    %edx,%eax
  10048c:	89 c2                	mov    %eax,%edx
  10048e:	c1 ea 1f             	shr    $0x1f,%edx
  100491:	01 d0                	add    %edx,%eax
  100493:	d1 f8                	sar    %eax
  100495:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100498:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10049b:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10049e:	eb 04                	jmp    1004a4 <stab_binsearch+0x42>
            m --;
  1004a0:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1004a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004aa:	7c 1f                	jl     1004cb <stab_binsearch+0x69>
  1004ac:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004af:	89 d0                	mov    %edx,%eax
  1004b1:	01 c0                	add    %eax,%eax
  1004b3:	01 d0                	add    %edx,%eax
  1004b5:	c1 e0 02             	shl    $0x2,%eax
  1004b8:	89 c2                	mov    %eax,%edx
  1004ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1004bd:	01 d0                	add    %edx,%eax
  1004bf:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004c3:	0f b6 c0             	movzbl %al,%eax
  1004c6:	39 45 14             	cmp    %eax,0x14(%ebp)
  1004c9:	75 d5                	jne    1004a0 <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  1004cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004ce:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004d1:	7d 0b                	jge    1004de <stab_binsearch+0x7c>
            l = true_m + 1;
  1004d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004d6:	83 c0 01             	add    $0x1,%eax
  1004d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004dc:	eb 78                	jmp    100556 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  1004de:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  1004e5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004e8:	89 d0                	mov    %edx,%eax
  1004ea:	01 c0                	add    %eax,%eax
  1004ec:	01 d0                	add    %edx,%eax
  1004ee:	c1 e0 02             	shl    $0x2,%eax
  1004f1:	89 c2                	mov    %eax,%edx
  1004f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f6:	01 d0                	add    %edx,%eax
  1004f8:	8b 40 08             	mov    0x8(%eax),%eax
  1004fb:	39 45 18             	cmp    %eax,0x18(%ebp)
  1004fe:	76 13                	jbe    100513 <stab_binsearch+0xb1>
            *region_left = m;
  100500:	8b 45 0c             	mov    0xc(%ebp),%eax
  100503:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100506:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100508:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10050b:	83 c0 01             	add    $0x1,%eax
  10050e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100511:	eb 43                	jmp    100556 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100513:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100516:	89 d0                	mov    %edx,%eax
  100518:	01 c0                	add    %eax,%eax
  10051a:	01 d0                	add    %edx,%eax
  10051c:	c1 e0 02             	shl    $0x2,%eax
  10051f:	89 c2                	mov    %eax,%edx
  100521:	8b 45 08             	mov    0x8(%ebp),%eax
  100524:	01 d0                	add    %edx,%eax
  100526:	8b 40 08             	mov    0x8(%eax),%eax
  100529:	39 45 18             	cmp    %eax,0x18(%ebp)
  10052c:	73 16                	jae    100544 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10052e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100531:	8d 50 ff             	lea    -0x1(%eax),%edx
  100534:	8b 45 10             	mov    0x10(%ebp),%eax
  100537:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100539:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053c:	83 e8 01             	sub    $0x1,%eax
  10053f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100542:	eb 12                	jmp    100556 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100544:	8b 45 0c             	mov    0xc(%ebp),%eax
  100547:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10054a:	89 10                	mov    %edx,(%eax)
            l = m;
  10054c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10054f:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100552:	83 45 18 01          	addl   $0x1,0x18(%ebp)
    while (l <= r) {
  100556:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100559:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  10055c:	0f 8e 22 ff ff ff    	jle    100484 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  100562:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100566:	75 0f                	jne    100577 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  100568:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056b:	8b 00                	mov    (%eax),%eax
  10056d:	8d 50 ff             	lea    -0x1(%eax),%edx
  100570:	8b 45 10             	mov    0x10(%ebp),%eax
  100573:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  100575:	eb 3f                	jmp    1005b6 <stab_binsearch+0x154>
        l = *region_right;
  100577:	8b 45 10             	mov    0x10(%ebp),%eax
  10057a:	8b 00                	mov    (%eax),%eax
  10057c:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  10057f:	eb 04                	jmp    100585 <stab_binsearch+0x123>
  100581:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  100585:	8b 45 0c             	mov    0xc(%ebp),%eax
  100588:	8b 00                	mov    (%eax),%eax
  10058a:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  10058d:	7e 1f                	jle    1005ae <stab_binsearch+0x14c>
  10058f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100592:	89 d0                	mov    %edx,%eax
  100594:	01 c0                	add    %eax,%eax
  100596:	01 d0                	add    %edx,%eax
  100598:	c1 e0 02             	shl    $0x2,%eax
  10059b:	89 c2                	mov    %eax,%edx
  10059d:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a0:	01 d0                	add    %edx,%eax
  1005a2:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005a6:	0f b6 c0             	movzbl %al,%eax
  1005a9:	39 45 14             	cmp    %eax,0x14(%ebp)
  1005ac:	75 d3                	jne    100581 <stab_binsearch+0x11f>
        *region_left = l;
  1005ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005b1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005b4:	89 10                	mov    %edx,(%eax)
}
  1005b6:	90                   	nop
  1005b7:	c9                   	leave  
  1005b8:	c3                   	ret    

001005b9 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005b9:	55                   	push   %ebp
  1005ba:	89 e5                	mov    %esp,%ebp
  1005bc:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c2:	c7 00 c8 33 10 00    	movl   $0x1033c8,(%eax)
    info->eip_line = 0;
  1005c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005cb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d5:	c7 40 08 c8 33 10 00 	movl   $0x1033c8,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005df:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e9:	8b 55 08             	mov    0x8(%ebp),%edx
  1005ec:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  1005ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f2:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  1005f9:	c7 45 f4 ac 3b 10 00 	movl   $0x103bac,-0xc(%ebp)
    stab_end = __STAB_END__;
  100600:	c7 45 f0 e8 b6 10 00 	movl   $0x10b6e8,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100607:	c7 45 ec e9 b6 10 00 	movl   $0x10b6e9,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10060e:	c7 45 e8 9b d7 10 00 	movl   $0x10d79b,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100615:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100618:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10061b:	76 0d                	jbe    10062a <debuginfo_eip+0x71>
  10061d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100620:	83 e8 01             	sub    $0x1,%eax
  100623:	0f b6 00             	movzbl (%eax),%eax
  100626:	84 c0                	test   %al,%al
  100628:	74 0a                	je     100634 <debuginfo_eip+0x7b>
        return -1;
  10062a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10062f:	e9 91 02 00 00       	jmp    1008c5 <debuginfo_eip+0x30c>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100634:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10063b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10063e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100641:	29 c2                	sub    %eax,%edx
  100643:	89 d0                	mov    %edx,%eax
  100645:	c1 f8 02             	sar    $0x2,%eax
  100648:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10064e:	83 e8 01             	sub    $0x1,%eax
  100651:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100654:	ff 75 08             	pushl  0x8(%ebp)
  100657:	6a 64                	push   $0x64
  100659:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10065c:	50                   	push   %eax
  10065d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100660:	50                   	push   %eax
  100661:	ff 75 f4             	pushl  -0xc(%ebp)
  100664:	e8 f9 fd ff ff       	call   100462 <stab_binsearch>
  100669:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  10066c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10066f:	85 c0                	test   %eax,%eax
  100671:	75 0a                	jne    10067d <debuginfo_eip+0xc4>
        return -1;
  100673:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100678:	e9 48 02 00 00       	jmp    1008c5 <debuginfo_eip+0x30c>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  10067d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100680:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100683:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100686:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  100689:	ff 75 08             	pushl  0x8(%ebp)
  10068c:	6a 24                	push   $0x24
  10068e:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100691:	50                   	push   %eax
  100692:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100695:	50                   	push   %eax
  100696:	ff 75 f4             	pushl  -0xc(%ebp)
  100699:	e8 c4 fd ff ff       	call   100462 <stab_binsearch>
  10069e:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1006a1:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006a7:	39 c2                	cmp    %eax,%edx
  1006a9:	7f 7c                	jg     100727 <debuginfo_eip+0x16e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006ab:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006ae:	89 c2                	mov    %eax,%edx
  1006b0:	89 d0                	mov    %edx,%eax
  1006b2:	01 c0                	add    %eax,%eax
  1006b4:	01 d0                	add    %edx,%eax
  1006b6:	c1 e0 02             	shl    $0x2,%eax
  1006b9:	89 c2                	mov    %eax,%edx
  1006bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006be:	01 d0                	add    %edx,%eax
  1006c0:	8b 00                	mov    (%eax),%eax
  1006c2:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006c5:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006c8:	29 d1                	sub    %edx,%ecx
  1006ca:	89 ca                	mov    %ecx,%edx
  1006cc:	39 d0                	cmp    %edx,%eax
  1006ce:	73 22                	jae    1006f2 <debuginfo_eip+0x139>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  1006d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006d3:	89 c2                	mov    %eax,%edx
  1006d5:	89 d0                	mov    %edx,%eax
  1006d7:	01 c0                	add    %eax,%eax
  1006d9:	01 d0                	add    %edx,%eax
  1006db:	c1 e0 02             	shl    $0x2,%eax
  1006de:	89 c2                	mov    %eax,%edx
  1006e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006e3:	01 d0                	add    %edx,%eax
  1006e5:	8b 10                	mov    (%eax),%edx
  1006e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1006ea:	01 c2                	add    %eax,%edx
  1006ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006ef:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  1006f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006f5:	89 c2                	mov    %eax,%edx
  1006f7:	89 d0                	mov    %edx,%eax
  1006f9:	01 c0                	add    %eax,%eax
  1006fb:	01 d0                	add    %edx,%eax
  1006fd:	c1 e0 02             	shl    $0x2,%eax
  100700:	89 c2                	mov    %eax,%edx
  100702:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100705:	01 d0                	add    %edx,%eax
  100707:	8b 50 08             	mov    0x8(%eax),%edx
  10070a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10070d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100710:	8b 45 0c             	mov    0xc(%ebp),%eax
  100713:	8b 40 10             	mov    0x10(%eax),%eax
  100716:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100719:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10071c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10071f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100722:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100725:	eb 15                	jmp    10073c <debuginfo_eip+0x183>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100727:	8b 45 0c             	mov    0xc(%ebp),%eax
  10072a:	8b 55 08             	mov    0x8(%ebp),%edx
  10072d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100730:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100733:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100736:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100739:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10073c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10073f:	8b 40 08             	mov    0x8(%eax),%eax
  100742:	83 ec 08             	sub    $0x8,%esp
  100745:	6a 3a                	push   $0x3a
  100747:	50                   	push   %eax
  100748:	e8 60 22 00 00       	call   1029ad <strfind>
  10074d:	83 c4 10             	add    $0x10,%esp
  100750:	89 c2                	mov    %eax,%edx
  100752:	8b 45 0c             	mov    0xc(%ebp),%eax
  100755:	8b 40 08             	mov    0x8(%eax),%eax
  100758:	29 c2                	sub    %eax,%edx
  10075a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10075d:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100760:	83 ec 0c             	sub    $0xc,%esp
  100763:	ff 75 08             	pushl  0x8(%ebp)
  100766:	6a 44                	push   $0x44
  100768:	8d 45 d0             	lea    -0x30(%ebp),%eax
  10076b:	50                   	push   %eax
  10076c:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  10076f:	50                   	push   %eax
  100770:	ff 75 f4             	pushl  -0xc(%ebp)
  100773:	e8 ea fc ff ff       	call   100462 <stab_binsearch>
  100778:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  10077b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10077e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100781:	39 c2                	cmp    %eax,%edx
  100783:	7f 24                	jg     1007a9 <debuginfo_eip+0x1f0>
        info->eip_line = stabs[rline].n_desc;
  100785:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100788:	89 c2                	mov    %eax,%edx
  10078a:	89 d0                	mov    %edx,%eax
  10078c:	01 c0                	add    %eax,%eax
  10078e:	01 d0                	add    %edx,%eax
  100790:	c1 e0 02             	shl    $0x2,%eax
  100793:	89 c2                	mov    %eax,%edx
  100795:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100798:	01 d0                	add    %edx,%eax
  10079a:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10079e:	0f b7 d0             	movzwl %ax,%edx
  1007a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a4:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007a7:	eb 13                	jmp    1007bc <debuginfo_eip+0x203>
        return -1;
  1007a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007ae:	e9 12 01 00 00       	jmp    1008c5 <debuginfo_eip+0x30c>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007b6:	83 e8 01             	sub    $0x1,%eax
  1007b9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  1007bc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007c2:	39 c2                	cmp    %eax,%edx
  1007c4:	7c 56                	jl     10081c <debuginfo_eip+0x263>
           && stabs[lline].n_type != N_SOL
  1007c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007c9:	89 c2                	mov    %eax,%edx
  1007cb:	89 d0                	mov    %edx,%eax
  1007cd:	01 c0                	add    %eax,%eax
  1007cf:	01 d0                	add    %edx,%eax
  1007d1:	c1 e0 02             	shl    $0x2,%eax
  1007d4:	89 c2                	mov    %eax,%edx
  1007d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007d9:	01 d0                	add    %edx,%eax
  1007db:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007df:	3c 84                	cmp    $0x84,%al
  1007e1:	74 39                	je     10081c <debuginfo_eip+0x263>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  1007e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007e6:	89 c2                	mov    %eax,%edx
  1007e8:	89 d0                	mov    %edx,%eax
  1007ea:	01 c0                	add    %eax,%eax
  1007ec:	01 d0                	add    %edx,%eax
  1007ee:	c1 e0 02             	shl    $0x2,%eax
  1007f1:	89 c2                	mov    %eax,%edx
  1007f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007f6:	01 d0                	add    %edx,%eax
  1007f8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007fc:	3c 64                	cmp    $0x64,%al
  1007fe:	75 b3                	jne    1007b3 <debuginfo_eip+0x1fa>
  100800:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100803:	89 c2                	mov    %eax,%edx
  100805:	89 d0                	mov    %edx,%eax
  100807:	01 c0                	add    %eax,%eax
  100809:	01 d0                	add    %edx,%eax
  10080b:	c1 e0 02             	shl    $0x2,%eax
  10080e:	89 c2                	mov    %eax,%edx
  100810:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100813:	01 d0                	add    %edx,%eax
  100815:	8b 40 08             	mov    0x8(%eax),%eax
  100818:	85 c0                	test   %eax,%eax
  10081a:	74 97                	je     1007b3 <debuginfo_eip+0x1fa>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10081c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100822:	39 c2                	cmp    %eax,%edx
  100824:	7c 46                	jl     10086c <debuginfo_eip+0x2b3>
  100826:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	89 d0                	mov    %edx,%eax
  10082d:	01 c0                	add    %eax,%eax
  10082f:	01 d0                	add    %edx,%eax
  100831:	c1 e0 02             	shl    $0x2,%eax
  100834:	89 c2                	mov    %eax,%edx
  100836:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100839:	01 d0                	add    %edx,%eax
  10083b:	8b 00                	mov    (%eax),%eax
  10083d:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100840:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100843:	29 d1                	sub    %edx,%ecx
  100845:	89 ca                	mov    %ecx,%edx
  100847:	39 d0                	cmp    %edx,%eax
  100849:	73 21                	jae    10086c <debuginfo_eip+0x2b3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10084b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10084e:	89 c2                	mov    %eax,%edx
  100850:	89 d0                	mov    %edx,%eax
  100852:	01 c0                	add    %eax,%eax
  100854:	01 d0                	add    %edx,%eax
  100856:	c1 e0 02             	shl    $0x2,%eax
  100859:	89 c2                	mov    %eax,%edx
  10085b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10085e:	01 d0                	add    %edx,%eax
  100860:	8b 10                	mov    (%eax),%edx
  100862:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100865:	01 c2                	add    %eax,%edx
  100867:	8b 45 0c             	mov    0xc(%ebp),%eax
  10086a:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  10086c:	8b 55 dc             	mov    -0x24(%ebp),%edx
  10086f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100872:	39 c2                	cmp    %eax,%edx
  100874:	7d 4a                	jge    1008c0 <debuginfo_eip+0x307>
        for (lline = lfun + 1;
  100876:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100879:	83 c0 01             	add    $0x1,%eax
  10087c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  10087f:	eb 18                	jmp    100899 <debuginfo_eip+0x2e0>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100881:	8b 45 0c             	mov    0xc(%ebp),%eax
  100884:	8b 40 14             	mov    0x14(%eax),%eax
  100887:	8d 50 01             	lea    0x1(%eax),%edx
  10088a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10088d:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100890:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100893:	83 c0 01             	add    $0x1,%eax
  100896:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100899:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10089c:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10089f:	39 c2                	cmp    %eax,%edx
  1008a1:	7d 1d                	jge    1008c0 <debuginfo_eip+0x307>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008a6:	89 c2                	mov    %eax,%edx
  1008a8:	89 d0                	mov    %edx,%eax
  1008aa:	01 c0                	add    %eax,%eax
  1008ac:	01 d0                	add    %edx,%eax
  1008ae:	c1 e0 02             	shl    $0x2,%eax
  1008b1:	89 c2                	mov    %eax,%edx
  1008b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008b6:	01 d0                	add    %edx,%eax
  1008b8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008bc:	3c a0                	cmp    $0xa0,%al
  1008be:	74 c1                	je     100881 <debuginfo_eip+0x2c8>
        }
    }
    return 0;
  1008c0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1008c5:	c9                   	leave  
  1008c6:	c3                   	ret    

001008c7 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  1008c7:	55                   	push   %ebp
  1008c8:	89 e5                	mov    %esp,%ebp
  1008ca:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  1008cd:	83 ec 0c             	sub    $0xc,%esp
  1008d0:	68 d2 33 10 00       	push   $0x1033d2
  1008d5:	e8 63 f9 ff ff       	call   10023d <cprintf>
  1008da:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  1008dd:	83 ec 08             	sub    $0x8,%esp
  1008e0:	68 00 00 10 00       	push   $0x100000
  1008e5:	68 eb 33 10 00       	push   $0x1033eb
  1008ea:	e8 4e f9 ff ff       	call   10023d <cprintf>
  1008ef:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  1008f2:	83 ec 08             	sub    $0x8,%esp
  1008f5:	68 d0 32 10 00       	push   $0x1032d0
  1008fa:	68 03 34 10 00       	push   $0x103403
  1008ff:	e8 39 f9 ff ff       	call   10023d <cprintf>
  100904:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  100907:	83 ec 08             	sub    $0x8,%esp
  10090a:	68 16 ea 10 00       	push   $0x10ea16
  10090f:	68 1b 34 10 00       	push   $0x10341b
  100914:	e8 24 f9 ff ff       	call   10023d <cprintf>
  100919:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  10091c:	83 ec 08             	sub    $0x8,%esp
  10091f:	68 20 fd 10 00       	push   $0x10fd20
  100924:	68 33 34 10 00       	push   $0x103433
  100929:	e8 0f f9 ff ff       	call   10023d <cprintf>
  10092e:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100931:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  100936:	05 ff 03 00 00       	add    $0x3ff,%eax
  10093b:	ba 00 00 10 00       	mov    $0x100000,%edx
  100940:	29 d0                	sub    %edx,%eax
  100942:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100948:	85 c0                	test   %eax,%eax
  10094a:	0f 48 c2             	cmovs  %edx,%eax
  10094d:	c1 f8 0a             	sar    $0xa,%eax
  100950:	83 ec 08             	sub    $0x8,%esp
  100953:	50                   	push   %eax
  100954:	68 4c 34 10 00       	push   $0x10344c
  100959:	e8 df f8 ff ff       	call   10023d <cprintf>
  10095e:	83 c4 10             	add    $0x10,%esp
}
  100961:	90                   	nop
  100962:	c9                   	leave  
  100963:	c3                   	ret    

00100964 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100964:	55                   	push   %ebp
  100965:	89 e5                	mov    %esp,%ebp
  100967:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  10096d:	83 ec 08             	sub    $0x8,%esp
  100970:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100973:	50                   	push   %eax
  100974:	ff 75 08             	pushl  0x8(%ebp)
  100977:	e8 3d fc ff ff       	call   1005b9 <debuginfo_eip>
  10097c:	83 c4 10             	add    $0x10,%esp
  10097f:	85 c0                	test   %eax,%eax
  100981:	74 15                	je     100998 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100983:	83 ec 08             	sub    $0x8,%esp
  100986:	ff 75 08             	pushl  0x8(%ebp)
  100989:	68 76 34 10 00       	push   $0x103476
  10098e:	e8 aa f8 ff ff       	call   10023d <cprintf>
  100993:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100996:	eb 65                	jmp    1009fd <print_debuginfo+0x99>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100998:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10099f:	eb 1c                	jmp    1009bd <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  1009a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009a7:	01 d0                	add    %edx,%eax
  1009a9:	0f b6 00             	movzbl (%eax),%eax
  1009ac:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009b5:	01 ca                	add    %ecx,%edx
  1009b7:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1009bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009c0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1009c3:	7c dc                	jl     1009a1 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  1009c5:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ce:	01 d0                	add    %edx,%eax
  1009d0:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  1009d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  1009d6:	8b 55 08             	mov    0x8(%ebp),%edx
  1009d9:	89 d1                	mov    %edx,%ecx
  1009db:	29 c1                	sub    %eax,%ecx
  1009dd:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1009e0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009e3:	83 ec 0c             	sub    $0xc,%esp
  1009e6:	51                   	push   %ecx
  1009e7:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009ed:	51                   	push   %ecx
  1009ee:	52                   	push   %edx
  1009ef:	50                   	push   %eax
  1009f0:	68 92 34 10 00       	push   $0x103492
  1009f5:	e8 43 f8 ff ff       	call   10023d <cprintf>
  1009fa:	83 c4 20             	add    $0x20,%esp
}
  1009fd:	90                   	nop
  1009fe:	c9                   	leave  
  1009ff:	c3                   	ret    

00100a00 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a00:	55                   	push   %ebp
  100a01:	89 e5                	mov    %esp,%ebp
  100a03:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a06:	8b 45 04             	mov    0x4(%ebp),%eax
  100a09:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a0f:	c9                   	leave  
  100a10:	c3                   	ret    

00100a11 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a11:	55                   	push   %ebp
  100a12:	89 e5                	mov    %esp,%ebp
		print_debuginfo(eip - 1);
		eip = ((uint32_t *)ebp)[1];
		ebp = ((uint32_t*)ebp)[0];
	}
	*/
}
  100a14:	90                   	nop
  100a15:	5d                   	pop    %ebp
  100a16:	c3                   	ret    

00100a17 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a17:	55                   	push   %ebp
  100a18:	89 e5                	mov    %esp,%ebp
  100a1a:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100a1d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a24:	eb 0c                	jmp    100a32 <parse+0x1b>
            *buf ++ = '\0';
  100a26:	8b 45 08             	mov    0x8(%ebp),%eax
  100a29:	8d 50 01             	lea    0x1(%eax),%edx
  100a2c:	89 55 08             	mov    %edx,0x8(%ebp)
  100a2f:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a32:	8b 45 08             	mov    0x8(%ebp),%eax
  100a35:	0f b6 00             	movzbl (%eax),%eax
  100a38:	84 c0                	test   %al,%al
  100a3a:	74 1e                	je     100a5a <parse+0x43>
  100a3c:	8b 45 08             	mov    0x8(%ebp),%eax
  100a3f:	0f b6 00             	movzbl (%eax),%eax
  100a42:	0f be c0             	movsbl %al,%eax
  100a45:	83 ec 08             	sub    $0x8,%esp
  100a48:	50                   	push   %eax
  100a49:	68 24 35 10 00       	push   $0x103524
  100a4e:	e8 27 1f 00 00       	call   10297a <strchr>
  100a53:	83 c4 10             	add    $0x10,%esp
  100a56:	85 c0                	test   %eax,%eax
  100a58:	75 cc                	jne    100a26 <parse+0xf>
        }
        if (*buf == '\0') {
  100a5a:	8b 45 08             	mov    0x8(%ebp),%eax
  100a5d:	0f b6 00             	movzbl (%eax),%eax
  100a60:	84 c0                	test   %al,%al
  100a62:	74 65                	je     100ac9 <parse+0xb2>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a64:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a68:	75 12                	jne    100a7c <parse+0x65>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a6a:	83 ec 08             	sub    $0x8,%esp
  100a6d:	6a 10                	push   $0x10
  100a6f:	68 29 35 10 00       	push   $0x103529
  100a74:	e8 c4 f7 ff ff       	call   10023d <cprintf>
  100a79:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a7f:	8d 50 01             	lea    0x1(%eax),%edx
  100a82:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100a85:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a8c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a8f:	01 c2                	add    %eax,%edx
  100a91:	8b 45 08             	mov    0x8(%ebp),%eax
  100a94:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a96:	eb 04                	jmp    100a9c <parse+0x85>
            buf ++;
  100a98:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a9c:	8b 45 08             	mov    0x8(%ebp),%eax
  100a9f:	0f b6 00             	movzbl (%eax),%eax
  100aa2:	84 c0                	test   %al,%al
  100aa4:	74 8c                	je     100a32 <parse+0x1b>
  100aa6:	8b 45 08             	mov    0x8(%ebp),%eax
  100aa9:	0f b6 00             	movzbl (%eax),%eax
  100aac:	0f be c0             	movsbl %al,%eax
  100aaf:	83 ec 08             	sub    $0x8,%esp
  100ab2:	50                   	push   %eax
  100ab3:	68 24 35 10 00       	push   $0x103524
  100ab8:	e8 bd 1e 00 00       	call   10297a <strchr>
  100abd:	83 c4 10             	add    $0x10,%esp
  100ac0:	85 c0                	test   %eax,%eax
  100ac2:	74 d4                	je     100a98 <parse+0x81>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ac4:	e9 69 ff ff ff       	jmp    100a32 <parse+0x1b>
            break;
  100ac9:	90                   	nop
        }
    }
    return argc;
  100aca:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100acd:	c9                   	leave  
  100ace:	c3                   	ret    

00100acf <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100acf:	55                   	push   %ebp
  100ad0:	89 e5                	mov    %esp,%ebp
  100ad2:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100ad5:	83 ec 08             	sub    $0x8,%esp
  100ad8:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100adb:	50                   	push   %eax
  100adc:	ff 75 08             	pushl  0x8(%ebp)
  100adf:	e8 33 ff ff ff       	call   100a17 <parse>
  100ae4:	83 c4 10             	add    $0x10,%esp
  100ae7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100aea:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100aee:	75 0a                	jne    100afa <runcmd+0x2b>
        return 0;
  100af0:	b8 00 00 00 00       	mov    $0x0,%eax
  100af5:	e9 83 00 00 00       	jmp    100b7d <runcmd+0xae>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100afa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b01:	eb 59                	jmp    100b5c <runcmd+0x8d>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b03:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b06:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b09:	89 d0                	mov    %edx,%eax
  100b0b:	01 c0                	add    %eax,%eax
  100b0d:	01 d0                	add    %edx,%eax
  100b0f:	c1 e0 02             	shl    $0x2,%eax
  100b12:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b17:	8b 00                	mov    (%eax),%eax
  100b19:	83 ec 08             	sub    $0x8,%esp
  100b1c:	51                   	push   %ecx
  100b1d:	50                   	push   %eax
  100b1e:	e8 b7 1d 00 00       	call   1028da <strcmp>
  100b23:	83 c4 10             	add    $0x10,%esp
  100b26:	85 c0                	test   %eax,%eax
  100b28:	75 2e                	jne    100b58 <runcmd+0x89>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b2a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b2d:	89 d0                	mov    %edx,%eax
  100b2f:	01 c0                	add    %eax,%eax
  100b31:	01 d0                	add    %edx,%eax
  100b33:	c1 e0 02             	shl    $0x2,%eax
  100b36:	05 08 e0 10 00       	add    $0x10e008,%eax
  100b3b:	8b 10                	mov    (%eax),%edx
  100b3d:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b40:	83 c0 04             	add    $0x4,%eax
  100b43:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100b46:	83 e9 01             	sub    $0x1,%ecx
  100b49:	83 ec 04             	sub    $0x4,%esp
  100b4c:	ff 75 0c             	pushl  0xc(%ebp)
  100b4f:	50                   	push   %eax
  100b50:	51                   	push   %ecx
  100b51:	ff d2                	call   *%edx
  100b53:	83 c4 10             	add    $0x10,%esp
  100b56:	eb 25                	jmp    100b7d <runcmd+0xae>
    for (i = 0; i < NCOMMANDS; i ++) {
  100b58:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b5f:	83 f8 02             	cmp    $0x2,%eax
  100b62:	76 9f                	jbe    100b03 <runcmd+0x34>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b64:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b67:	83 ec 08             	sub    $0x8,%esp
  100b6a:	50                   	push   %eax
  100b6b:	68 47 35 10 00       	push   $0x103547
  100b70:	e8 c8 f6 ff ff       	call   10023d <cprintf>
  100b75:	83 c4 10             	add    $0x10,%esp
    return 0;
  100b78:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b7d:	c9                   	leave  
  100b7e:	c3                   	ret    

00100b7f <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100b7f:	55                   	push   %ebp
  100b80:	89 e5                	mov    %esp,%ebp
  100b82:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100b85:	83 ec 0c             	sub    $0xc,%esp
  100b88:	68 60 35 10 00       	push   $0x103560
  100b8d:	e8 ab f6 ff ff       	call   10023d <cprintf>
  100b92:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100b95:	83 ec 0c             	sub    $0xc,%esp
  100b98:	68 88 35 10 00       	push   $0x103588
  100b9d:	e8 9b f6 ff ff       	call   10023d <cprintf>
  100ba2:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100ba5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100ba9:	74 0e                	je     100bb9 <kmonitor+0x3a>
        print_trapframe(tf);
  100bab:	83 ec 0c             	sub    $0xc,%esp
  100bae:	ff 75 08             	pushl  0x8(%ebp)
  100bb1:	e8 b6 0c 00 00       	call   10186c <print_trapframe>
  100bb6:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bb9:	83 ec 0c             	sub    $0xc,%esp
  100bbc:	68 ad 35 10 00       	push   $0x1035ad
  100bc1:	e8 1b f7 ff ff       	call   1002e1 <readline>
  100bc6:	83 c4 10             	add    $0x10,%esp
  100bc9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bcc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bd0:	74 e7                	je     100bb9 <kmonitor+0x3a>
            if (runcmd(buf, tf) < 0) {
  100bd2:	83 ec 08             	sub    $0x8,%esp
  100bd5:	ff 75 08             	pushl  0x8(%ebp)
  100bd8:	ff 75 f4             	pushl  -0xc(%ebp)
  100bdb:	e8 ef fe ff ff       	call   100acf <runcmd>
  100be0:	83 c4 10             	add    $0x10,%esp
  100be3:	85 c0                	test   %eax,%eax
  100be5:	78 02                	js     100be9 <kmonitor+0x6a>
        if ((buf = readline("K> ")) != NULL) {
  100be7:	eb d0                	jmp    100bb9 <kmonitor+0x3a>
                break;
  100be9:	90                   	nop
            }
        }
    }
}
  100bea:	90                   	nop
  100beb:	c9                   	leave  
  100bec:	c3                   	ret    

00100bed <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100bed:	55                   	push   %ebp
  100bee:	89 e5                	mov    %esp,%ebp
  100bf0:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bf3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bfa:	eb 3c                	jmp    100c38 <mon_help+0x4b>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100bfc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bff:	89 d0                	mov    %edx,%eax
  100c01:	01 c0                	add    %eax,%eax
  100c03:	01 d0                	add    %edx,%eax
  100c05:	c1 e0 02             	shl    $0x2,%eax
  100c08:	05 04 e0 10 00       	add    $0x10e004,%eax
  100c0d:	8b 08                	mov    (%eax),%ecx
  100c0f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c12:	89 d0                	mov    %edx,%eax
  100c14:	01 c0                	add    %eax,%eax
  100c16:	01 d0                	add    %edx,%eax
  100c18:	c1 e0 02             	shl    $0x2,%eax
  100c1b:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c20:	8b 00                	mov    (%eax),%eax
  100c22:	83 ec 04             	sub    $0x4,%esp
  100c25:	51                   	push   %ecx
  100c26:	50                   	push   %eax
  100c27:	68 b1 35 10 00       	push   $0x1035b1
  100c2c:	e8 0c f6 ff ff       	call   10023d <cprintf>
  100c31:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < NCOMMANDS; i ++) {
  100c34:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c3b:	83 f8 02             	cmp    $0x2,%eax
  100c3e:	76 bc                	jbe    100bfc <mon_help+0xf>
    }
    return 0;
  100c40:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c45:	c9                   	leave  
  100c46:	c3                   	ret    

00100c47 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c47:	55                   	push   %ebp
  100c48:	89 e5                	mov    %esp,%ebp
  100c4a:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c4d:	e8 75 fc ff ff       	call   1008c7 <print_kerninfo>
    return 0;
  100c52:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c57:	c9                   	leave  
  100c58:	c3                   	ret    

00100c59 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c59:	55                   	push   %ebp
  100c5a:	89 e5                	mov    %esp,%ebp
  100c5c:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c5f:	e8 ad fd ff ff       	call   100a11 <print_stackframe>
    return 0;
  100c64:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c69:	c9                   	leave  
  100c6a:	c3                   	ret    

00100c6b <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100c6b:	55                   	push   %ebp
  100c6c:	89 e5                	mov    %esp,%ebp
  100c6e:	83 ec 18             	sub    $0x18,%esp
  100c71:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100c77:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100c7b:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100c7f:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100c83:	ee                   	out    %al,(%dx)
  100c84:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100c8a:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100c8e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100c92:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100c96:	ee                   	out    %al,(%dx)
  100c97:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100c9d:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
  100ca1:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100ca5:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ca9:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100caa:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100cb1:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100cb4:	83 ec 0c             	sub    $0xc,%esp
  100cb7:	68 ba 35 10 00       	push   $0x1035ba
  100cbc:	e8 7c f5 ff ff       	call   10023d <cprintf>
  100cc1:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100cc4:	83 ec 0c             	sub    $0xc,%esp
  100cc7:	6a 00                	push   $0x0
  100cc9:	e8 d2 08 00 00       	call   1015a0 <pic_enable>
  100cce:	83 c4 10             	add    $0x10,%esp
}
  100cd1:	90                   	nop
  100cd2:	c9                   	leave  
  100cd3:	c3                   	ret    

00100cd4 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100cd4:	55                   	push   %ebp
  100cd5:	89 e5                	mov    %esp,%ebp
  100cd7:	83 ec 10             	sub    $0x10,%esp
  100cda:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ce0:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100ce4:	89 c2                	mov    %eax,%edx
  100ce6:	ec                   	in     (%dx),%al
  100ce7:	88 45 f1             	mov    %al,-0xf(%ebp)
  100cea:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100cf0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100cf4:	89 c2                	mov    %eax,%edx
  100cf6:	ec                   	in     (%dx),%al
  100cf7:	88 45 f5             	mov    %al,-0xb(%ebp)
  100cfa:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100d00:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100d04:	89 c2                	mov    %eax,%edx
  100d06:	ec                   	in     (%dx),%al
  100d07:	88 45 f9             	mov    %al,-0x7(%ebp)
  100d0a:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100d10:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100d14:	89 c2                	mov    %eax,%edx
  100d16:	ec                   	in     (%dx),%al
  100d17:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100d1a:	90                   	nop
  100d1b:	c9                   	leave  
  100d1c:	c3                   	ret    

00100d1d <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100d1d:	55                   	push   %ebp
  100d1e:	89 e5                	mov    %esp,%ebp
  100d20:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100d23:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100d2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d2d:	0f b7 00             	movzwl (%eax),%eax
  100d30:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100d34:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d37:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100d3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d3f:	0f b7 00             	movzwl (%eax),%eax
  100d42:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100d46:	74 12                	je     100d5a <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100d48:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100d4f:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100d56:	b4 03 
  100d58:	eb 13                	jmp    100d6d <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100d5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d5d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100d61:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100d64:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100d6b:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100d6d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100d74:	0f b7 c0             	movzwl %ax,%eax
  100d77:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100d7b:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d7f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100d83:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100d87:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100d88:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100d8f:	83 c0 01             	add    $0x1,%eax
  100d92:	0f b7 c0             	movzwl %ax,%eax
  100d95:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100d99:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100d9d:	89 c2                	mov    %eax,%edx
  100d9f:	ec                   	in     (%dx),%al
  100da0:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100da3:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100da7:	0f b6 c0             	movzbl %al,%eax
  100daa:	c1 e0 08             	shl    $0x8,%eax
  100dad:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100db0:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100db7:	0f b7 c0             	movzwl %ax,%eax
  100dba:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100dbe:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dc2:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100dc6:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100dca:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100dcb:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100dd2:	83 c0 01             	add    $0x1,%eax
  100dd5:	0f b7 c0             	movzwl %ax,%eax
  100dd8:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ddc:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100de0:	89 c2                	mov    %eax,%edx
  100de2:	ec                   	in     (%dx),%al
  100de3:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100de6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100dea:	0f b6 c0             	movzbl %al,%eax
  100ded:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100df0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100df3:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100df8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dfb:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100e01:	90                   	nop
  100e02:	c9                   	leave  
  100e03:	c3                   	ret    

00100e04 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100e04:	55                   	push   %ebp
  100e05:	89 e5                	mov    %esp,%ebp
  100e07:	83 ec 38             	sub    $0x38,%esp
  100e0a:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100e10:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e14:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100e18:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100e1c:	ee                   	out    %al,(%dx)
  100e1d:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100e23:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
  100e27:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100e2b:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100e2f:	ee                   	out    %al,(%dx)
  100e30:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100e36:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
  100e3a:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100e3e:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100e42:	ee                   	out    %al,(%dx)
  100e43:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100e49:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100e4d:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100e51:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100e55:	ee                   	out    %al,(%dx)
  100e56:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100e5c:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
  100e60:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100e64:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100e68:	ee                   	out    %al,(%dx)
  100e69:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100e6f:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
  100e73:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e77:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e7b:	ee                   	out    %al,(%dx)
  100e7c:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100e82:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
  100e86:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e8a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e8e:	ee                   	out    %al,(%dx)
  100e8f:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e95:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e99:	89 c2                	mov    %eax,%edx
  100e9b:	ec                   	in     (%dx),%al
  100e9c:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e9f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100ea3:	3c ff                	cmp    $0xff,%al
  100ea5:	0f 95 c0             	setne  %al
  100ea8:	0f b6 c0             	movzbl %al,%eax
  100eab:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100eb0:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eb6:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100eba:	89 c2                	mov    %eax,%edx
  100ebc:	ec                   	in     (%dx),%al
  100ebd:	88 45 f1             	mov    %al,-0xf(%ebp)
  100ec0:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100ec6:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100eca:	89 c2                	mov    %eax,%edx
  100ecc:	ec                   	in     (%dx),%al
  100ecd:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100ed0:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100ed5:	85 c0                	test   %eax,%eax
  100ed7:	74 0d                	je     100ee6 <serial_init+0xe2>
        pic_enable(IRQ_COM1);
  100ed9:	83 ec 0c             	sub    $0xc,%esp
  100edc:	6a 04                	push   $0x4
  100ede:	e8 bd 06 00 00       	call   1015a0 <pic_enable>
  100ee3:	83 c4 10             	add    $0x10,%esp
    }
}
  100ee6:	90                   	nop
  100ee7:	c9                   	leave  
  100ee8:	c3                   	ret    

00100ee9 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100ee9:	55                   	push   %ebp
  100eea:	89 e5                	mov    %esp,%ebp
  100eec:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100eef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100ef6:	eb 09                	jmp    100f01 <lpt_putc_sub+0x18>
        delay();
  100ef8:	e8 d7 fd ff ff       	call   100cd4 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100efd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100f01:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100f07:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100f0b:	89 c2                	mov    %eax,%edx
  100f0d:	ec                   	in     (%dx),%al
  100f0e:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100f11:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100f15:	84 c0                	test   %al,%al
  100f17:	78 09                	js     100f22 <lpt_putc_sub+0x39>
  100f19:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100f20:	7e d6                	jle    100ef8 <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  100f22:	8b 45 08             	mov    0x8(%ebp),%eax
  100f25:	0f b6 c0             	movzbl %al,%eax
  100f28:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  100f2e:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f31:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f35:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f39:	ee                   	out    %al,(%dx)
  100f3a:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  100f40:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  100f44:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f48:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f4c:	ee                   	out    %al,(%dx)
  100f4d:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  100f53:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
  100f57:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f5b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f5f:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  100f60:	90                   	nop
  100f61:	c9                   	leave  
  100f62:	c3                   	ret    

00100f63 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  100f63:	55                   	push   %ebp
  100f64:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  100f66:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  100f6a:	74 0d                	je     100f79 <lpt_putc+0x16>
        lpt_putc_sub(c);
  100f6c:	ff 75 08             	pushl  0x8(%ebp)
  100f6f:	e8 75 ff ff ff       	call   100ee9 <lpt_putc_sub>
  100f74:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  100f77:	eb 1e                	jmp    100f97 <lpt_putc+0x34>
        lpt_putc_sub('\b');
  100f79:	6a 08                	push   $0x8
  100f7b:	e8 69 ff ff ff       	call   100ee9 <lpt_putc_sub>
  100f80:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  100f83:	6a 20                	push   $0x20
  100f85:	e8 5f ff ff ff       	call   100ee9 <lpt_putc_sub>
  100f8a:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  100f8d:	6a 08                	push   $0x8
  100f8f:	e8 55 ff ff ff       	call   100ee9 <lpt_putc_sub>
  100f94:	83 c4 04             	add    $0x4,%esp
}
  100f97:	90                   	nop
  100f98:	c9                   	leave  
  100f99:	c3                   	ret    

00100f9a <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  100f9a:	55                   	push   %ebp
  100f9b:	89 e5                	mov    %esp,%ebp
  100f9d:	53                   	push   %ebx
  100f9e:	83 ec 24             	sub    $0x24,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  100fa1:	8b 45 08             	mov    0x8(%ebp),%eax
  100fa4:	b0 00                	mov    $0x0,%al
  100fa6:	85 c0                	test   %eax,%eax
  100fa8:	75 07                	jne    100fb1 <cga_putc+0x17>
        c |= 0x0700;
  100faa:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  100fb1:	8b 45 08             	mov    0x8(%ebp),%eax
  100fb4:	0f b6 c0             	movzbl %al,%eax
  100fb7:	83 f8 0a             	cmp    $0xa,%eax
  100fba:	74 52                	je     10100e <cga_putc+0x74>
  100fbc:	83 f8 0d             	cmp    $0xd,%eax
  100fbf:	74 5d                	je     10101e <cga_putc+0x84>
  100fc1:	83 f8 08             	cmp    $0x8,%eax
  100fc4:	0f 85 8e 00 00 00    	jne    101058 <cga_putc+0xbe>
    case '\b':
        if (crt_pos > 0) {
  100fca:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  100fd1:	66 85 c0             	test   %ax,%ax
  100fd4:	0f 84 a4 00 00 00    	je     10107e <cga_putc+0xe4>
            crt_pos --;
  100fda:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  100fe1:	83 e8 01             	sub    $0x1,%eax
  100fe4:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  100fea:	8b 45 08             	mov    0x8(%ebp),%eax
  100fed:	b0 00                	mov    $0x0,%al
  100fef:	83 c8 20             	or     $0x20,%eax
  100ff2:	89 c1                	mov    %eax,%ecx
  100ff4:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  100ff9:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  101000:	0f b7 d2             	movzwl %dx,%edx
  101003:	01 d2                	add    %edx,%edx
  101005:	01 d0                	add    %edx,%eax
  101007:	89 ca                	mov    %ecx,%edx
  101009:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  10100c:	eb 70                	jmp    10107e <cga_putc+0xe4>
    case '\n':
        crt_pos += CRT_COLS;
  10100e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101015:	83 c0 50             	add    $0x50,%eax
  101018:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10101e:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101025:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  10102c:	0f b7 c1             	movzwl %cx,%eax
  10102f:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  101035:	c1 e8 10             	shr    $0x10,%eax
  101038:	89 c2                	mov    %eax,%edx
  10103a:	66 c1 ea 06          	shr    $0x6,%dx
  10103e:	89 d0                	mov    %edx,%eax
  101040:	c1 e0 02             	shl    $0x2,%eax
  101043:	01 d0                	add    %edx,%eax
  101045:	c1 e0 04             	shl    $0x4,%eax
  101048:	29 c1                	sub    %eax,%ecx
  10104a:	89 ca                	mov    %ecx,%edx
  10104c:	89 d8                	mov    %ebx,%eax
  10104e:	29 d0                	sub    %edx,%eax
  101050:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101056:	eb 27                	jmp    10107f <cga_putc+0xe5>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101058:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  10105e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101065:	8d 50 01             	lea    0x1(%eax),%edx
  101068:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10106f:	0f b7 c0             	movzwl %ax,%eax
  101072:	01 c0                	add    %eax,%eax
  101074:	01 c8                	add    %ecx,%eax
  101076:	8b 55 08             	mov    0x8(%ebp),%edx
  101079:	66 89 10             	mov    %dx,(%eax)
        break;
  10107c:	eb 01                	jmp    10107f <cga_putc+0xe5>
        break;
  10107e:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10107f:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101086:	66 3d cf 07          	cmp    $0x7cf,%ax
  10108a:	76 59                	jbe    1010e5 <cga_putc+0x14b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10108c:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101091:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101097:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10109c:	83 ec 04             	sub    $0x4,%esp
  10109f:	68 00 0f 00 00       	push   $0xf00
  1010a4:	52                   	push   %edx
  1010a5:	50                   	push   %eax
  1010a6:	e8 ce 1a 00 00       	call   102b79 <memmove>
  1010ab:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1010ae:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1010b5:	eb 15                	jmp    1010cc <cga_putc+0x132>
            crt_buf[i] = 0x0700 | ' ';
  1010b7:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1010bf:	01 d2                	add    %edx,%edx
  1010c1:	01 d0                	add    %edx,%eax
  1010c3:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1010c8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1010cc:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1010d3:	7e e2                	jle    1010b7 <cga_putc+0x11d>
        }
        crt_pos -= CRT_COLS;
  1010d5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010dc:	83 e8 50             	sub    $0x50,%eax
  1010df:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1010e5:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1010ec:	0f b7 c0             	movzwl %ax,%eax
  1010ef:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  1010f3:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
  1010f7:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1010fb:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1010ff:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  101100:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101107:	66 c1 e8 08          	shr    $0x8,%ax
  10110b:	0f b6 c0             	movzbl %al,%eax
  10110e:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101115:	83 c2 01             	add    $0x1,%edx
  101118:	0f b7 d2             	movzwl %dx,%edx
  10111b:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  10111f:	88 45 e9             	mov    %al,-0x17(%ebp)
  101122:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101126:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10112a:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  10112b:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101132:	0f b7 c0             	movzwl %ax,%eax
  101135:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101139:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
  10113d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101141:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101145:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101146:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10114d:	0f b6 c0             	movzbl %al,%eax
  101150:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101157:	83 c2 01             	add    $0x1,%edx
  10115a:	0f b7 d2             	movzwl %dx,%edx
  10115d:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  101161:	88 45 f1             	mov    %al,-0xf(%ebp)
  101164:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101168:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10116c:	ee                   	out    %al,(%dx)
}
  10116d:	90                   	nop
  10116e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101171:	c9                   	leave  
  101172:	c3                   	ret    

00101173 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101173:	55                   	push   %ebp
  101174:	89 e5                	mov    %esp,%ebp
  101176:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101179:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101180:	eb 09                	jmp    10118b <serial_putc_sub+0x18>
        delay();
  101182:	e8 4d fb ff ff       	call   100cd4 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101187:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10118b:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101191:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101195:	89 c2                	mov    %eax,%edx
  101197:	ec                   	in     (%dx),%al
  101198:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10119b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10119f:	0f b6 c0             	movzbl %al,%eax
  1011a2:	83 e0 20             	and    $0x20,%eax
  1011a5:	85 c0                	test   %eax,%eax
  1011a7:	75 09                	jne    1011b2 <serial_putc_sub+0x3f>
  1011a9:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1011b0:	7e d0                	jle    101182 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1011b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1011b5:	0f b6 c0             	movzbl %al,%eax
  1011b8:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1011be:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1011c1:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1011c5:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1011c9:	ee                   	out    %al,(%dx)
}
  1011ca:	90                   	nop
  1011cb:	c9                   	leave  
  1011cc:	c3                   	ret    

001011cd <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1011cd:	55                   	push   %ebp
  1011ce:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  1011d0:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1011d4:	74 0d                	je     1011e3 <serial_putc+0x16>
        serial_putc_sub(c);
  1011d6:	ff 75 08             	pushl  0x8(%ebp)
  1011d9:	e8 95 ff ff ff       	call   101173 <serial_putc_sub>
  1011de:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1011e1:	eb 1e                	jmp    101201 <serial_putc+0x34>
        serial_putc_sub('\b');
  1011e3:	6a 08                	push   $0x8
  1011e5:	e8 89 ff ff ff       	call   101173 <serial_putc_sub>
  1011ea:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  1011ed:	6a 20                	push   $0x20
  1011ef:	e8 7f ff ff ff       	call   101173 <serial_putc_sub>
  1011f4:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  1011f7:	6a 08                	push   $0x8
  1011f9:	e8 75 ff ff ff       	call   101173 <serial_putc_sub>
  1011fe:	83 c4 04             	add    $0x4,%esp
}
  101201:	90                   	nop
  101202:	c9                   	leave  
  101203:	c3                   	ret    

00101204 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101204:	55                   	push   %ebp
  101205:	89 e5                	mov    %esp,%ebp
  101207:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  10120a:	eb 33                	jmp    10123f <cons_intr+0x3b>
        if (c != 0) {
  10120c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101210:	74 2d                	je     10123f <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101212:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101217:	8d 50 01             	lea    0x1(%eax),%edx
  10121a:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101220:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101223:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101229:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10122e:	3d 00 02 00 00       	cmp    $0x200,%eax
  101233:	75 0a                	jne    10123f <cons_intr+0x3b>
                cons.wpos = 0;
  101235:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  10123c:	00 00 00 
    while ((c = (*proc)()) != -1) {
  10123f:	8b 45 08             	mov    0x8(%ebp),%eax
  101242:	ff d0                	call   *%eax
  101244:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101247:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10124b:	75 bf                	jne    10120c <cons_intr+0x8>
            }
        }
    }
}
  10124d:	90                   	nop
  10124e:	c9                   	leave  
  10124f:	c3                   	ret    

00101250 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101250:	55                   	push   %ebp
  101251:	89 e5                	mov    %esp,%ebp
  101253:	83 ec 10             	sub    $0x10,%esp
  101256:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10125c:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101260:	89 c2                	mov    %eax,%edx
  101262:	ec                   	in     (%dx),%al
  101263:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101266:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10126a:	0f b6 c0             	movzbl %al,%eax
  10126d:	83 e0 01             	and    $0x1,%eax
  101270:	85 c0                	test   %eax,%eax
  101272:	75 07                	jne    10127b <serial_proc_data+0x2b>
        return -1;
  101274:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101279:	eb 2a                	jmp    1012a5 <serial_proc_data+0x55>
  10127b:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101281:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101285:	89 c2                	mov    %eax,%edx
  101287:	ec                   	in     (%dx),%al
  101288:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  10128b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10128f:	0f b6 c0             	movzbl %al,%eax
  101292:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101295:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101299:	75 07                	jne    1012a2 <serial_proc_data+0x52>
        c = '\b';
  10129b:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1012a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1012a5:	c9                   	leave  
  1012a6:	c3                   	ret    

001012a7 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1012a7:	55                   	push   %ebp
  1012a8:	89 e5                	mov    %esp,%ebp
  1012aa:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  1012ad:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1012b2:	85 c0                	test   %eax,%eax
  1012b4:	74 10                	je     1012c6 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  1012b6:	83 ec 0c             	sub    $0xc,%esp
  1012b9:	68 50 12 10 00       	push   $0x101250
  1012be:	e8 41 ff ff ff       	call   101204 <cons_intr>
  1012c3:	83 c4 10             	add    $0x10,%esp
    }
}
  1012c6:	90                   	nop
  1012c7:	c9                   	leave  
  1012c8:	c3                   	ret    

001012c9 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1012c9:	55                   	push   %ebp
  1012ca:	89 e5                	mov    %esp,%ebp
  1012cc:	83 ec 28             	sub    $0x28,%esp
  1012cf:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012d5:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1012d9:	89 c2                	mov    %eax,%edx
  1012db:	ec                   	in     (%dx),%al
  1012dc:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1012df:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1012e3:	0f b6 c0             	movzbl %al,%eax
  1012e6:	83 e0 01             	and    $0x1,%eax
  1012e9:	85 c0                	test   %eax,%eax
  1012eb:	75 0a                	jne    1012f7 <kbd_proc_data+0x2e>
        return -1;
  1012ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1012f2:	e9 5d 01 00 00       	jmp    101454 <kbd_proc_data+0x18b>
  1012f7:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012fd:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101301:	89 c2                	mov    %eax,%edx
  101303:	ec                   	in     (%dx),%al
  101304:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101307:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  10130b:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10130e:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101312:	75 17                	jne    10132b <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  101314:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101319:	83 c8 40             	or     $0x40,%eax
  10131c:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101321:	b8 00 00 00 00       	mov    $0x0,%eax
  101326:	e9 29 01 00 00       	jmp    101454 <kbd_proc_data+0x18b>
    } else if (data & 0x80) {
  10132b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10132f:	84 c0                	test   %al,%al
  101331:	79 47                	jns    10137a <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101333:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101338:	83 e0 40             	and    $0x40,%eax
  10133b:	85 c0                	test   %eax,%eax
  10133d:	75 09                	jne    101348 <kbd_proc_data+0x7f>
  10133f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101343:	83 e0 7f             	and    $0x7f,%eax
  101346:	eb 04                	jmp    10134c <kbd_proc_data+0x83>
  101348:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10134c:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10134f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101353:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10135a:	83 c8 40             	or     $0x40,%eax
  10135d:	0f b6 c0             	movzbl %al,%eax
  101360:	f7 d0                	not    %eax
  101362:	89 c2                	mov    %eax,%edx
  101364:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101369:	21 d0                	and    %edx,%eax
  10136b:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101370:	b8 00 00 00 00       	mov    $0x0,%eax
  101375:	e9 da 00 00 00       	jmp    101454 <kbd_proc_data+0x18b>
    } else if (shift & E0ESC) {
  10137a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10137f:	83 e0 40             	and    $0x40,%eax
  101382:	85 c0                	test   %eax,%eax
  101384:	74 11                	je     101397 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101386:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10138a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10138f:	83 e0 bf             	and    $0xffffffbf,%eax
  101392:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101397:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10139b:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1013a2:	0f b6 d0             	movzbl %al,%edx
  1013a5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013aa:	09 d0                	or     %edx,%eax
  1013ac:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1013b1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013b5:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1013bc:	0f b6 d0             	movzbl %al,%edx
  1013bf:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013c4:	31 d0                	xor    %edx,%eax
  1013c6:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1013cb:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013d0:	83 e0 03             	and    $0x3,%eax
  1013d3:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1013da:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013de:	01 d0                	add    %edx,%eax
  1013e0:	0f b6 00             	movzbl (%eax),%eax
  1013e3:	0f b6 c0             	movzbl %al,%eax
  1013e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1013e9:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013ee:	83 e0 08             	and    $0x8,%eax
  1013f1:	85 c0                	test   %eax,%eax
  1013f3:	74 22                	je     101417 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1013f5:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1013f9:	7e 0c                	jle    101407 <kbd_proc_data+0x13e>
  1013fb:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1013ff:	7f 06                	jg     101407 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  101401:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101405:	eb 10                	jmp    101417 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  101407:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  10140b:	7e 0a                	jle    101417 <kbd_proc_data+0x14e>
  10140d:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101411:	7f 04                	jg     101417 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  101413:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101417:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10141c:	f7 d0                	not    %eax
  10141e:	83 e0 06             	and    $0x6,%eax
  101421:	85 c0                	test   %eax,%eax
  101423:	75 2c                	jne    101451 <kbd_proc_data+0x188>
  101425:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10142c:	75 23                	jne    101451 <kbd_proc_data+0x188>
        cprintf("Rebooting!\n");
  10142e:	83 ec 0c             	sub    $0xc,%esp
  101431:	68 d5 35 10 00       	push   $0x1035d5
  101436:	e8 02 ee ff ff       	call   10023d <cprintf>
  10143b:	83 c4 10             	add    $0x10,%esp
  10143e:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101444:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101448:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  10144c:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101450:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101451:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101454:	c9                   	leave  
  101455:	c3                   	ret    

00101456 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101456:	55                   	push   %ebp
  101457:	89 e5                	mov    %esp,%ebp
  101459:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  10145c:	83 ec 0c             	sub    $0xc,%esp
  10145f:	68 c9 12 10 00       	push   $0x1012c9
  101464:	e8 9b fd ff ff       	call   101204 <cons_intr>
  101469:	83 c4 10             	add    $0x10,%esp
}
  10146c:	90                   	nop
  10146d:	c9                   	leave  
  10146e:	c3                   	ret    

0010146f <kbd_init>:

static void
kbd_init(void) {
  10146f:	55                   	push   %ebp
  101470:	89 e5                	mov    %esp,%ebp
  101472:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  101475:	e8 dc ff ff ff       	call   101456 <kbd_intr>
    pic_enable(IRQ_KBD);
  10147a:	83 ec 0c             	sub    $0xc,%esp
  10147d:	6a 01                	push   $0x1
  10147f:	e8 1c 01 00 00       	call   1015a0 <pic_enable>
  101484:	83 c4 10             	add    $0x10,%esp
}
  101487:	90                   	nop
  101488:	c9                   	leave  
  101489:	c3                   	ret    

0010148a <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10148a:	55                   	push   %ebp
  10148b:	89 e5                	mov    %esp,%ebp
  10148d:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  101490:	e8 88 f8 ff ff       	call   100d1d <cga_init>
    serial_init();
  101495:	e8 6a f9 ff ff       	call   100e04 <serial_init>
    kbd_init();
  10149a:	e8 d0 ff ff ff       	call   10146f <kbd_init>
    if (!serial_exists) {
  10149f:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1014a4:	85 c0                	test   %eax,%eax
  1014a6:	75 10                	jne    1014b8 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  1014a8:	83 ec 0c             	sub    $0xc,%esp
  1014ab:	68 e1 35 10 00       	push   $0x1035e1
  1014b0:	e8 88 ed ff ff       	call   10023d <cprintf>
  1014b5:	83 c4 10             	add    $0x10,%esp
    }
}
  1014b8:	90                   	nop
  1014b9:	c9                   	leave  
  1014ba:	c3                   	ret    

001014bb <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1014bb:	55                   	push   %ebp
  1014bc:	89 e5                	mov    %esp,%ebp
  1014be:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  1014c1:	ff 75 08             	pushl  0x8(%ebp)
  1014c4:	e8 9a fa ff ff       	call   100f63 <lpt_putc>
  1014c9:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  1014cc:	83 ec 0c             	sub    $0xc,%esp
  1014cf:	ff 75 08             	pushl  0x8(%ebp)
  1014d2:	e8 c3 fa ff ff       	call   100f9a <cga_putc>
  1014d7:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  1014da:	83 ec 0c             	sub    $0xc,%esp
  1014dd:	ff 75 08             	pushl  0x8(%ebp)
  1014e0:	e8 e8 fc ff ff       	call   1011cd <serial_putc>
  1014e5:	83 c4 10             	add    $0x10,%esp
}
  1014e8:	90                   	nop
  1014e9:	c9                   	leave  
  1014ea:	c3                   	ret    

001014eb <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1014eb:	55                   	push   %ebp
  1014ec:	89 e5                	mov    %esp,%ebp
  1014ee:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1014f1:	e8 b1 fd ff ff       	call   1012a7 <serial_intr>
    kbd_intr();
  1014f6:	e8 5b ff ff ff       	call   101456 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1014fb:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  101501:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101506:	39 c2                	cmp    %eax,%edx
  101508:	74 36                	je     101540 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  10150a:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10150f:	8d 50 01             	lea    0x1(%eax),%edx
  101512:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  101518:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  10151f:	0f b6 c0             	movzbl %al,%eax
  101522:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101525:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10152a:	3d 00 02 00 00       	cmp    $0x200,%eax
  10152f:	75 0a                	jne    10153b <cons_getc+0x50>
            cons.rpos = 0;
  101531:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101538:	00 00 00 
        }
        return c;
  10153b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10153e:	eb 05                	jmp    101545 <cons_getc+0x5a>
    }
    return 0;
  101540:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101545:	c9                   	leave  
  101546:	c3                   	ret    

00101547 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101547:	55                   	push   %ebp
  101548:	89 e5                	mov    %esp,%ebp
  10154a:	83 ec 14             	sub    $0x14,%esp
  10154d:	8b 45 08             	mov    0x8(%ebp),%eax
  101550:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101554:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101558:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10155e:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101563:	85 c0                	test   %eax,%eax
  101565:	74 36                	je     10159d <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101567:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10156b:	0f b6 c0             	movzbl %al,%eax
  10156e:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101574:	88 45 f9             	mov    %al,-0x7(%ebp)
  101577:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10157b:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10157f:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101580:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101584:	66 c1 e8 08          	shr    $0x8,%ax
  101588:	0f b6 c0             	movzbl %al,%eax
  10158b:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101591:	88 45 fd             	mov    %al,-0x3(%ebp)
  101594:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101598:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10159c:	ee                   	out    %al,(%dx)
    }
}
  10159d:	90                   	nop
  10159e:	c9                   	leave  
  10159f:	c3                   	ret    

001015a0 <pic_enable>:

void
pic_enable(unsigned int irq) {
  1015a0:	55                   	push   %ebp
  1015a1:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  1015a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1015a6:	ba 01 00 00 00       	mov    $0x1,%edx
  1015ab:	89 c1                	mov    %eax,%ecx
  1015ad:	d3 e2                	shl    %cl,%edx
  1015af:	89 d0                	mov    %edx,%eax
  1015b1:	f7 d0                	not    %eax
  1015b3:	89 c2                	mov    %eax,%edx
  1015b5:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1015bc:	21 d0                	and    %edx,%eax
  1015be:	0f b7 c0             	movzwl %ax,%eax
  1015c1:	50                   	push   %eax
  1015c2:	e8 80 ff ff ff       	call   101547 <pic_setmask>
  1015c7:	83 c4 04             	add    $0x4,%esp
}
  1015ca:	90                   	nop
  1015cb:	c9                   	leave  
  1015cc:	c3                   	ret    

001015cd <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1015cd:	55                   	push   %ebp
  1015ce:	89 e5                	mov    %esp,%ebp
  1015d0:	83 ec 40             	sub    $0x40,%esp
    did_init = 1;
  1015d3:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1015da:	00 00 00 
  1015dd:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1015e3:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
  1015e7:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1015eb:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1015ef:	ee                   	out    %al,(%dx)
  1015f0:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1015f6:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
  1015fa:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1015fe:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101602:	ee                   	out    %al,(%dx)
  101603:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101609:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
  10160d:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101611:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101615:	ee                   	out    %al,(%dx)
  101616:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  10161c:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
  101620:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101624:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101628:	ee                   	out    %al,(%dx)
  101629:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  10162f:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
  101633:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101637:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10163b:	ee                   	out    %al,(%dx)
  10163c:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101642:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
  101646:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10164a:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10164e:	ee                   	out    %al,(%dx)
  10164f:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101655:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
  101659:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10165d:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101661:	ee                   	out    %al,(%dx)
  101662:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101668:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
  10166c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101670:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101674:	ee                   	out    %al,(%dx)
  101675:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  10167b:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
  10167f:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101683:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101687:	ee                   	out    %al,(%dx)
  101688:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10168e:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
  101692:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101696:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10169a:	ee                   	out    %al,(%dx)
  10169b:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  1016a1:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
  1016a5:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1016a9:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1016ad:	ee                   	out    %al,(%dx)
  1016ae:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016b4:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
  1016b8:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016bc:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016c0:	ee                   	out    %al,(%dx)
  1016c1:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1016c7:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
  1016cb:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016cf:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016d3:	ee                   	out    %al,(%dx)
  1016d4:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1016da:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
  1016de:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016e2:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016e6:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1016e7:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016ee:	66 83 f8 ff          	cmp    $0xffff,%ax
  1016f2:	74 13                	je     101707 <pic_init+0x13a>
        pic_setmask(irq_mask);
  1016f4:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016fb:	0f b7 c0             	movzwl %ax,%eax
  1016fe:	50                   	push   %eax
  1016ff:	e8 43 fe ff ff       	call   101547 <pic_setmask>
  101704:	83 c4 04             	add    $0x4,%esp
    }
}
  101707:	90                   	nop
  101708:	c9                   	leave  
  101709:	c3                   	ret    

0010170a <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  10170a:	55                   	push   %ebp
  10170b:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  10170d:	fb                   	sti    
    sti();
}
  10170e:	90                   	nop
  10170f:	5d                   	pop    %ebp
  101710:	c3                   	ret    

00101711 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101711:	55                   	push   %ebp
  101712:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101714:	fa                   	cli    
    cli();
}
  101715:	90                   	nop
  101716:	5d                   	pop    %ebp
  101717:	c3                   	ret    

00101718 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101718:	55                   	push   %ebp
  101719:	89 e5                	mov    %esp,%ebp
  10171b:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10171e:	83 ec 08             	sub    $0x8,%esp
  101721:	6a 64                	push   $0x64
  101723:	68 00 36 10 00       	push   $0x103600
  101728:	e8 10 eb ff ff       	call   10023d <cprintf>
  10172d:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101730:	90                   	nop
  101731:	c9                   	leave  
  101732:	c3                   	ret    

00101733 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101733:	55                   	push   %ebp
  101734:	89 e5                	mov    %esp,%ebp
  101736:	83 ec 10             	sub    $0x10,%esp
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t  __vectors[];
	for (int i = 0; i < 256; i++) {
  101739:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101740:	e9 c3 00 00 00       	jmp    101808 <idt_init+0xd5>
		SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], 0);
  101745:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101748:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10174f:	89 c2                	mov    %eax,%edx
  101751:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101754:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10175b:	00 
  10175c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10175f:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101766:	00 08 00 
  101769:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10176c:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101773:	00 
  101774:	83 e2 e0             	and    $0xffffffe0,%edx
  101777:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10177e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101781:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101788:	00 
  101789:	83 e2 1f             	and    $0x1f,%edx
  10178c:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101793:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101796:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10179d:	00 
  10179e:	83 e2 f0             	and    $0xfffffff0,%edx
  1017a1:	83 ca 0e             	or     $0xe,%edx
  1017a4:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1017ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017ae:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1017b5:	00 
  1017b6:	83 e2 ef             	and    $0xffffffef,%edx
  1017b9:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1017c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017c3:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1017ca:	00 
  1017cb:	83 e2 9f             	and    $0xffffff9f,%edx
  1017ce:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1017d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017d8:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1017df:	00 
  1017e0:	83 ca 80             	or     $0xffffff80,%edx
  1017e3:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1017ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017ed:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1017f4:	c1 e8 10             	shr    $0x10,%eax
  1017f7:	89 c2                	mov    %eax,%edx
  1017f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017fc:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  101803:	00 
	for (int i = 0; i < 256; i++) {
  101804:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101808:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  10180f:	0f 8e 30 ff ff ff    	jle    101745 <idt_init+0x12>
  101815:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  10181c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10181f:	0f 01 18             	lidtl  (%eax)
	}
	lidt(&idt_pd);
}
  101822:	90                   	nop
  101823:	c9                   	leave  
  101824:	c3                   	ret    

00101825 <trapname>:

static const char *
trapname(int trapno) {
  101825:	55                   	push   %ebp
  101826:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101828:	8b 45 08             	mov    0x8(%ebp),%eax
  10182b:	83 f8 13             	cmp    $0x13,%eax
  10182e:	77 0c                	ja     10183c <trapname+0x17>
        return excnames[trapno];
  101830:	8b 45 08             	mov    0x8(%ebp),%eax
  101833:	8b 04 85 60 39 10 00 	mov    0x103960(,%eax,4),%eax
  10183a:	eb 18                	jmp    101854 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  10183c:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101840:	7e 0d                	jle    10184f <trapname+0x2a>
  101842:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101846:	7f 07                	jg     10184f <trapname+0x2a>
        return "Hardware Interrupt";
  101848:	b8 0a 36 10 00       	mov    $0x10360a,%eax
  10184d:	eb 05                	jmp    101854 <trapname+0x2f>
    }
    return "(unknown trap)";
  10184f:	b8 1d 36 10 00       	mov    $0x10361d,%eax
}
  101854:	5d                   	pop    %ebp
  101855:	c3                   	ret    

00101856 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101856:	55                   	push   %ebp
  101857:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101859:	8b 45 08             	mov    0x8(%ebp),%eax
  10185c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101860:	66 83 f8 08          	cmp    $0x8,%ax
  101864:	0f 94 c0             	sete   %al
  101867:	0f b6 c0             	movzbl %al,%eax
}
  10186a:	5d                   	pop    %ebp
  10186b:	c3                   	ret    

0010186c <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  10186c:	55                   	push   %ebp
  10186d:	89 e5                	mov    %esp,%ebp
  10186f:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  101872:	83 ec 08             	sub    $0x8,%esp
  101875:	ff 75 08             	pushl  0x8(%ebp)
  101878:	68 5e 36 10 00       	push   $0x10365e
  10187d:	e8 bb e9 ff ff       	call   10023d <cprintf>
  101882:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101885:	8b 45 08             	mov    0x8(%ebp),%eax
  101888:	83 ec 0c             	sub    $0xc,%esp
  10188b:	50                   	push   %eax
  10188c:	e8 b6 01 00 00       	call   101a47 <print_regs>
  101891:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101894:	8b 45 08             	mov    0x8(%ebp),%eax
  101897:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  10189b:	0f b7 c0             	movzwl %ax,%eax
  10189e:	83 ec 08             	sub    $0x8,%esp
  1018a1:	50                   	push   %eax
  1018a2:	68 6f 36 10 00       	push   $0x10366f
  1018a7:	e8 91 e9 ff ff       	call   10023d <cprintf>
  1018ac:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1018af:	8b 45 08             	mov    0x8(%ebp),%eax
  1018b2:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1018b6:	0f b7 c0             	movzwl %ax,%eax
  1018b9:	83 ec 08             	sub    $0x8,%esp
  1018bc:	50                   	push   %eax
  1018bd:	68 82 36 10 00       	push   $0x103682
  1018c2:	e8 76 e9 ff ff       	call   10023d <cprintf>
  1018c7:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1018ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1018cd:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1018d1:	0f b7 c0             	movzwl %ax,%eax
  1018d4:	83 ec 08             	sub    $0x8,%esp
  1018d7:	50                   	push   %eax
  1018d8:	68 95 36 10 00       	push   $0x103695
  1018dd:	e8 5b e9 ff ff       	call   10023d <cprintf>
  1018e2:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1018e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1018e8:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1018ec:	0f b7 c0             	movzwl %ax,%eax
  1018ef:	83 ec 08             	sub    $0x8,%esp
  1018f2:	50                   	push   %eax
  1018f3:	68 a8 36 10 00       	push   $0x1036a8
  1018f8:	e8 40 e9 ff ff       	call   10023d <cprintf>
  1018fd:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101900:	8b 45 08             	mov    0x8(%ebp),%eax
  101903:	8b 40 30             	mov    0x30(%eax),%eax
  101906:	83 ec 0c             	sub    $0xc,%esp
  101909:	50                   	push   %eax
  10190a:	e8 16 ff ff ff       	call   101825 <trapname>
  10190f:	83 c4 10             	add    $0x10,%esp
  101912:	89 c2                	mov    %eax,%edx
  101914:	8b 45 08             	mov    0x8(%ebp),%eax
  101917:	8b 40 30             	mov    0x30(%eax),%eax
  10191a:	83 ec 04             	sub    $0x4,%esp
  10191d:	52                   	push   %edx
  10191e:	50                   	push   %eax
  10191f:	68 bb 36 10 00       	push   $0x1036bb
  101924:	e8 14 e9 ff ff       	call   10023d <cprintf>
  101929:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  10192c:	8b 45 08             	mov    0x8(%ebp),%eax
  10192f:	8b 40 34             	mov    0x34(%eax),%eax
  101932:	83 ec 08             	sub    $0x8,%esp
  101935:	50                   	push   %eax
  101936:	68 cd 36 10 00       	push   $0x1036cd
  10193b:	e8 fd e8 ff ff       	call   10023d <cprintf>
  101940:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101943:	8b 45 08             	mov    0x8(%ebp),%eax
  101946:	8b 40 38             	mov    0x38(%eax),%eax
  101949:	83 ec 08             	sub    $0x8,%esp
  10194c:	50                   	push   %eax
  10194d:	68 dc 36 10 00       	push   $0x1036dc
  101952:	e8 e6 e8 ff ff       	call   10023d <cprintf>
  101957:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  10195a:	8b 45 08             	mov    0x8(%ebp),%eax
  10195d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101961:	0f b7 c0             	movzwl %ax,%eax
  101964:	83 ec 08             	sub    $0x8,%esp
  101967:	50                   	push   %eax
  101968:	68 eb 36 10 00       	push   $0x1036eb
  10196d:	e8 cb e8 ff ff       	call   10023d <cprintf>
  101972:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101975:	8b 45 08             	mov    0x8(%ebp),%eax
  101978:	8b 40 40             	mov    0x40(%eax),%eax
  10197b:	83 ec 08             	sub    $0x8,%esp
  10197e:	50                   	push   %eax
  10197f:	68 fe 36 10 00       	push   $0x1036fe
  101984:	e8 b4 e8 ff ff       	call   10023d <cprintf>
  101989:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  10198c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101993:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  10199a:	eb 3f                	jmp    1019db <print_trapframe+0x16f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  10199c:	8b 45 08             	mov    0x8(%ebp),%eax
  10199f:	8b 50 40             	mov    0x40(%eax),%edx
  1019a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1019a5:	21 d0                	and    %edx,%eax
  1019a7:	85 c0                	test   %eax,%eax
  1019a9:	74 29                	je     1019d4 <print_trapframe+0x168>
  1019ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019ae:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  1019b5:	85 c0                	test   %eax,%eax
  1019b7:	74 1b                	je     1019d4 <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  1019b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019bc:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  1019c3:	83 ec 08             	sub    $0x8,%esp
  1019c6:	50                   	push   %eax
  1019c7:	68 0d 37 10 00       	push   $0x10370d
  1019cc:	e8 6c e8 ff ff       	call   10023d <cprintf>
  1019d1:	83 c4 10             	add    $0x10,%esp
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  1019d4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1019d8:	d1 65 f0             	shll   -0x10(%ebp)
  1019db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019de:	83 f8 17             	cmp    $0x17,%eax
  1019e1:	76 b9                	jbe    10199c <print_trapframe+0x130>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  1019e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e6:	8b 40 40             	mov    0x40(%eax),%eax
  1019e9:	c1 e8 0c             	shr    $0xc,%eax
  1019ec:	83 e0 03             	and    $0x3,%eax
  1019ef:	83 ec 08             	sub    $0x8,%esp
  1019f2:	50                   	push   %eax
  1019f3:	68 11 37 10 00       	push   $0x103711
  1019f8:	e8 40 e8 ff ff       	call   10023d <cprintf>
  1019fd:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101a00:	83 ec 0c             	sub    $0xc,%esp
  101a03:	ff 75 08             	pushl  0x8(%ebp)
  101a06:	e8 4b fe ff ff       	call   101856 <trap_in_kernel>
  101a0b:	83 c4 10             	add    $0x10,%esp
  101a0e:	85 c0                	test   %eax,%eax
  101a10:	75 32                	jne    101a44 <print_trapframe+0x1d8>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101a12:	8b 45 08             	mov    0x8(%ebp),%eax
  101a15:	8b 40 44             	mov    0x44(%eax),%eax
  101a18:	83 ec 08             	sub    $0x8,%esp
  101a1b:	50                   	push   %eax
  101a1c:	68 1a 37 10 00       	push   $0x10371a
  101a21:	e8 17 e8 ff ff       	call   10023d <cprintf>
  101a26:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101a29:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2c:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101a30:	0f b7 c0             	movzwl %ax,%eax
  101a33:	83 ec 08             	sub    $0x8,%esp
  101a36:	50                   	push   %eax
  101a37:	68 29 37 10 00       	push   $0x103729
  101a3c:	e8 fc e7 ff ff       	call   10023d <cprintf>
  101a41:	83 c4 10             	add    $0x10,%esp
    }
}
  101a44:	90                   	nop
  101a45:	c9                   	leave  
  101a46:	c3                   	ret    

00101a47 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101a47:	55                   	push   %ebp
  101a48:	89 e5                	mov    %esp,%ebp
  101a4a:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101a4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a50:	8b 00                	mov    (%eax),%eax
  101a52:	83 ec 08             	sub    $0x8,%esp
  101a55:	50                   	push   %eax
  101a56:	68 3c 37 10 00       	push   $0x10373c
  101a5b:	e8 dd e7 ff ff       	call   10023d <cprintf>
  101a60:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101a63:	8b 45 08             	mov    0x8(%ebp),%eax
  101a66:	8b 40 04             	mov    0x4(%eax),%eax
  101a69:	83 ec 08             	sub    $0x8,%esp
  101a6c:	50                   	push   %eax
  101a6d:	68 4b 37 10 00       	push   $0x10374b
  101a72:	e8 c6 e7 ff ff       	call   10023d <cprintf>
  101a77:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101a7a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7d:	8b 40 08             	mov    0x8(%eax),%eax
  101a80:	83 ec 08             	sub    $0x8,%esp
  101a83:	50                   	push   %eax
  101a84:	68 5a 37 10 00       	push   $0x10375a
  101a89:	e8 af e7 ff ff       	call   10023d <cprintf>
  101a8e:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101a91:	8b 45 08             	mov    0x8(%ebp),%eax
  101a94:	8b 40 0c             	mov    0xc(%eax),%eax
  101a97:	83 ec 08             	sub    $0x8,%esp
  101a9a:	50                   	push   %eax
  101a9b:	68 69 37 10 00       	push   $0x103769
  101aa0:	e8 98 e7 ff ff       	call   10023d <cprintf>
  101aa5:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101aa8:	8b 45 08             	mov    0x8(%ebp),%eax
  101aab:	8b 40 10             	mov    0x10(%eax),%eax
  101aae:	83 ec 08             	sub    $0x8,%esp
  101ab1:	50                   	push   %eax
  101ab2:	68 78 37 10 00       	push   $0x103778
  101ab7:	e8 81 e7 ff ff       	call   10023d <cprintf>
  101abc:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101abf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac2:	8b 40 14             	mov    0x14(%eax),%eax
  101ac5:	83 ec 08             	sub    $0x8,%esp
  101ac8:	50                   	push   %eax
  101ac9:	68 87 37 10 00       	push   $0x103787
  101ace:	e8 6a e7 ff ff       	call   10023d <cprintf>
  101ad3:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101ad6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad9:	8b 40 18             	mov    0x18(%eax),%eax
  101adc:	83 ec 08             	sub    $0x8,%esp
  101adf:	50                   	push   %eax
  101ae0:	68 96 37 10 00       	push   $0x103796
  101ae5:	e8 53 e7 ff ff       	call   10023d <cprintf>
  101aea:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101aed:	8b 45 08             	mov    0x8(%ebp),%eax
  101af0:	8b 40 1c             	mov    0x1c(%eax),%eax
  101af3:	83 ec 08             	sub    $0x8,%esp
  101af6:	50                   	push   %eax
  101af7:	68 a5 37 10 00       	push   $0x1037a5
  101afc:	e8 3c e7 ff ff       	call   10023d <cprintf>
  101b01:	83 c4 10             	add    $0x10,%esp
}
  101b04:	90                   	nop
  101b05:	c9                   	leave  
  101b06:	c3                   	ret    

00101b07 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101b07:	55                   	push   %ebp
  101b08:	89 e5                	mov    %esp,%ebp
  101b0a:	83 ec 18             	sub    $0x18,%esp
    char c;

    switch (tf->tf_trapno) {
  101b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b10:	8b 40 30             	mov    0x30(%eax),%eax
  101b13:	83 f8 2f             	cmp    $0x2f,%eax
  101b16:	77 1d                	ja     101b35 <trap_dispatch+0x2e>
  101b18:	83 f8 2e             	cmp    $0x2e,%eax
  101b1b:	0f 83 f4 00 00 00    	jae    101c15 <trap_dispatch+0x10e>
  101b21:	83 f8 21             	cmp    $0x21,%eax
  101b24:	74 7e                	je     101ba4 <trap_dispatch+0x9d>
  101b26:	83 f8 24             	cmp    $0x24,%eax
  101b29:	74 55                	je     101b80 <trap_dispatch+0x79>
  101b2b:	83 f8 20             	cmp    $0x20,%eax
  101b2e:	74 16                	je     101b46 <trap_dispatch+0x3f>
  101b30:	e9 aa 00 00 00       	jmp    101bdf <trap_dispatch+0xd8>
  101b35:	83 e8 78             	sub    $0x78,%eax
  101b38:	83 f8 01             	cmp    $0x1,%eax
  101b3b:	0f 87 9e 00 00 00    	ja     101bdf <trap_dispatch+0xd8>
  101b41:	e9 82 00 00 00       	jmp    101bc8 <trap_dispatch+0xc1>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
		ticks += 1;
  101b46:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101b4b:	83 c0 01             	add    $0x1,%eax
  101b4e:	a3 08 f9 10 00       	mov    %eax,0x10f908
		if (ticks%TICK_NUM == 0) {
  101b53:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101b59:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101b5e:	89 c8                	mov    %ecx,%eax
  101b60:	f7 e2                	mul    %edx
  101b62:	89 d0                	mov    %edx,%eax
  101b64:	c1 e8 05             	shr    $0x5,%eax
  101b67:	6b c0 64             	imul   $0x64,%eax,%eax
  101b6a:	29 c1                	sub    %eax,%ecx
  101b6c:	89 c8                	mov    %ecx,%eax
  101b6e:	85 c0                	test   %eax,%eax
  101b70:	0f 85 a2 00 00 00    	jne    101c18 <trap_dispatch+0x111>
			print_ticks();
  101b76:	e8 9d fb ff ff       	call   101718 <print_ticks>
		}
        break;
  101b7b:	e9 98 00 00 00       	jmp    101c18 <trap_dispatch+0x111>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101b80:	e8 66 f9 ff ff       	call   1014eb <cons_getc>
  101b85:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101b88:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b8c:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b90:	83 ec 04             	sub    $0x4,%esp
  101b93:	52                   	push   %edx
  101b94:	50                   	push   %eax
  101b95:	68 b4 37 10 00       	push   $0x1037b4
  101b9a:	e8 9e e6 ff ff       	call   10023d <cprintf>
  101b9f:	83 c4 10             	add    $0x10,%esp
        break;
  101ba2:	eb 75                	jmp    101c19 <trap_dispatch+0x112>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101ba4:	e8 42 f9 ff ff       	call   1014eb <cons_getc>
  101ba9:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101bac:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101bb0:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101bb4:	83 ec 04             	sub    $0x4,%esp
  101bb7:	52                   	push   %edx
  101bb8:	50                   	push   %eax
  101bb9:	68 c6 37 10 00       	push   $0x1037c6
  101bbe:	e8 7a e6 ff ff       	call   10023d <cprintf>
  101bc3:	83 c4 10             	add    $0x10,%esp
        break;
  101bc6:	eb 51                	jmp    101c19 <trap_dispatch+0x112>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101bc8:	83 ec 04             	sub    $0x4,%esp
  101bcb:	68 d5 37 10 00       	push   $0x1037d5
  101bd0:	68 ab 00 00 00       	push   $0xab
  101bd5:	68 e5 37 10 00       	push   $0x1037e5
  101bda:	e8 c4 e7 ff ff       	call   1003a3 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101bdf:	8b 45 08             	mov    0x8(%ebp),%eax
  101be2:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101be6:	0f b7 c0             	movzwl %ax,%eax
  101be9:	83 e0 03             	and    $0x3,%eax
  101bec:	85 c0                	test   %eax,%eax
  101bee:	75 29                	jne    101c19 <trap_dispatch+0x112>
            print_trapframe(tf);
  101bf0:	83 ec 0c             	sub    $0xc,%esp
  101bf3:	ff 75 08             	pushl  0x8(%ebp)
  101bf6:	e8 71 fc ff ff       	call   10186c <print_trapframe>
  101bfb:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101bfe:	83 ec 04             	sub    $0x4,%esp
  101c01:	68 f6 37 10 00       	push   $0x1037f6
  101c06:	68 b5 00 00 00       	push   $0xb5
  101c0b:	68 e5 37 10 00       	push   $0x1037e5
  101c10:	e8 8e e7 ff ff       	call   1003a3 <__panic>
        break;
  101c15:	90                   	nop
  101c16:	eb 01                	jmp    101c19 <trap_dispatch+0x112>
        break;
  101c18:	90                   	nop
        }
    }
}
  101c19:	90                   	nop
  101c1a:	c9                   	leave  
  101c1b:	c3                   	ret    

00101c1c <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101c1c:	55                   	push   %ebp
  101c1d:	89 e5                	mov    %esp,%ebp
  101c1f:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101c22:	83 ec 0c             	sub    $0xc,%esp
  101c25:	ff 75 08             	pushl  0x8(%ebp)
  101c28:	e8 da fe ff ff       	call   101b07 <trap_dispatch>
  101c2d:	83 c4 10             	add    $0x10,%esp
}
  101c30:	90                   	nop
  101c31:	c9                   	leave  
  101c32:	c3                   	ret    

00101c33 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101c33:	6a 00                	push   $0x0
  pushl $0
  101c35:	6a 00                	push   $0x0
  jmp __alltraps
  101c37:	e9 67 0a 00 00       	jmp    1026a3 <__alltraps>

00101c3c <vector1>:
.globl vector1
vector1:
  pushl $0
  101c3c:	6a 00                	push   $0x0
  pushl $1
  101c3e:	6a 01                	push   $0x1
  jmp __alltraps
  101c40:	e9 5e 0a 00 00       	jmp    1026a3 <__alltraps>

00101c45 <vector2>:
.globl vector2
vector2:
  pushl $0
  101c45:	6a 00                	push   $0x0
  pushl $2
  101c47:	6a 02                	push   $0x2
  jmp __alltraps
  101c49:	e9 55 0a 00 00       	jmp    1026a3 <__alltraps>

00101c4e <vector3>:
.globl vector3
vector3:
  pushl $0
  101c4e:	6a 00                	push   $0x0
  pushl $3
  101c50:	6a 03                	push   $0x3
  jmp __alltraps
  101c52:	e9 4c 0a 00 00       	jmp    1026a3 <__alltraps>

00101c57 <vector4>:
.globl vector4
vector4:
  pushl $0
  101c57:	6a 00                	push   $0x0
  pushl $4
  101c59:	6a 04                	push   $0x4
  jmp __alltraps
  101c5b:	e9 43 0a 00 00       	jmp    1026a3 <__alltraps>

00101c60 <vector5>:
.globl vector5
vector5:
  pushl $0
  101c60:	6a 00                	push   $0x0
  pushl $5
  101c62:	6a 05                	push   $0x5
  jmp __alltraps
  101c64:	e9 3a 0a 00 00       	jmp    1026a3 <__alltraps>

00101c69 <vector6>:
.globl vector6
vector6:
  pushl $0
  101c69:	6a 00                	push   $0x0
  pushl $6
  101c6b:	6a 06                	push   $0x6
  jmp __alltraps
  101c6d:	e9 31 0a 00 00       	jmp    1026a3 <__alltraps>

00101c72 <vector7>:
.globl vector7
vector7:
  pushl $0
  101c72:	6a 00                	push   $0x0
  pushl $7
  101c74:	6a 07                	push   $0x7
  jmp __alltraps
  101c76:	e9 28 0a 00 00       	jmp    1026a3 <__alltraps>

00101c7b <vector8>:
.globl vector8
vector8:
  pushl $8
  101c7b:	6a 08                	push   $0x8
  jmp __alltraps
  101c7d:	e9 21 0a 00 00       	jmp    1026a3 <__alltraps>

00101c82 <vector9>:
.globl vector9
vector9:
  pushl $9
  101c82:	6a 09                	push   $0x9
  jmp __alltraps
  101c84:	e9 1a 0a 00 00       	jmp    1026a3 <__alltraps>

00101c89 <vector10>:
.globl vector10
vector10:
  pushl $10
  101c89:	6a 0a                	push   $0xa
  jmp __alltraps
  101c8b:	e9 13 0a 00 00       	jmp    1026a3 <__alltraps>

00101c90 <vector11>:
.globl vector11
vector11:
  pushl $11
  101c90:	6a 0b                	push   $0xb
  jmp __alltraps
  101c92:	e9 0c 0a 00 00       	jmp    1026a3 <__alltraps>

00101c97 <vector12>:
.globl vector12
vector12:
  pushl $12
  101c97:	6a 0c                	push   $0xc
  jmp __alltraps
  101c99:	e9 05 0a 00 00       	jmp    1026a3 <__alltraps>

00101c9e <vector13>:
.globl vector13
vector13:
  pushl $13
  101c9e:	6a 0d                	push   $0xd
  jmp __alltraps
  101ca0:	e9 fe 09 00 00       	jmp    1026a3 <__alltraps>

00101ca5 <vector14>:
.globl vector14
vector14:
  pushl $14
  101ca5:	6a 0e                	push   $0xe
  jmp __alltraps
  101ca7:	e9 f7 09 00 00       	jmp    1026a3 <__alltraps>

00101cac <vector15>:
.globl vector15
vector15:
  pushl $0
  101cac:	6a 00                	push   $0x0
  pushl $15
  101cae:	6a 0f                	push   $0xf
  jmp __alltraps
  101cb0:	e9 ee 09 00 00       	jmp    1026a3 <__alltraps>

00101cb5 <vector16>:
.globl vector16
vector16:
  pushl $0
  101cb5:	6a 00                	push   $0x0
  pushl $16
  101cb7:	6a 10                	push   $0x10
  jmp __alltraps
  101cb9:	e9 e5 09 00 00       	jmp    1026a3 <__alltraps>

00101cbe <vector17>:
.globl vector17
vector17:
  pushl $17
  101cbe:	6a 11                	push   $0x11
  jmp __alltraps
  101cc0:	e9 de 09 00 00       	jmp    1026a3 <__alltraps>

00101cc5 <vector18>:
.globl vector18
vector18:
  pushl $0
  101cc5:	6a 00                	push   $0x0
  pushl $18
  101cc7:	6a 12                	push   $0x12
  jmp __alltraps
  101cc9:	e9 d5 09 00 00       	jmp    1026a3 <__alltraps>

00101cce <vector19>:
.globl vector19
vector19:
  pushl $0
  101cce:	6a 00                	push   $0x0
  pushl $19
  101cd0:	6a 13                	push   $0x13
  jmp __alltraps
  101cd2:	e9 cc 09 00 00       	jmp    1026a3 <__alltraps>

00101cd7 <vector20>:
.globl vector20
vector20:
  pushl $0
  101cd7:	6a 00                	push   $0x0
  pushl $20
  101cd9:	6a 14                	push   $0x14
  jmp __alltraps
  101cdb:	e9 c3 09 00 00       	jmp    1026a3 <__alltraps>

00101ce0 <vector21>:
.globl vector21
vector21:
  pushl $0
  101ce0:	6a 00                	push   $0x0
  pushl $21
  101ce2:	6a 15                	push   $0x15
  jmp __alltraps
  101ce4:	e9 ba 09 00 00       	jmp    1026a3 <__alltraps>

00101ce9 <vector22>:
.globl vector22
vector22:
  pushl $0
  101ce9:	6a 00                	push   $0x0
  pushl $22
  101ceb:	6a 16                	push   $0x16
  jmp __alltraps
  101ced:	e9 b1 09 00 00       	jmp    1026a3 <__alltraps>

00101cf2 <vector23>:
.globl vector23
vector23:
  pushl $0
  101cf2:	6a 00                	push   $0x0
  pushl $23
  101cf4:	6a 17                	push   $0x17
  jmp __alltraps
  101cf6:	e9 a8 09 00 00       	jmp    1026a3 <__alltraps>

00101cfb <vector24>:
.globl vector24
vector24:
  pushl $0
  101cfb:	6a 00                	push   $0x0
  pushl $24
  101cfd:	6a 18                	push   $0x18
  jmp __alltraps
  101cff:	e9 9f 09 00 00       	jmp    1026a3 <__alltraps>

00101d04 <vector25>:
.globl vector25
vector25:
  pushl $0
  101d04:	6a 00                	push   $0x0
  pushl $25
  101d06:	6a 19                	push   $0x19
  jmp __alltraps
  101d08:	e9 96 09 00 00       	jmp    1026a3 <__alltraps>

00101d0d <vector26>:
.globl vector26
vector26:
  pushl $0
  101d0d:	6a 00                	push   $0x0
  pushl $26
  101d0f:	6a 1a                	push   $0x1a
  jmp __alltraps
  101d11:	e9 8d 09 00 00       	jmp    1026a3 <__alltraps>

00101d16 <vector27>:
.globl vector27
vector27:
  pushl $0
  101d16:	6a 00                	push   $0x0
  pushl $27
  101d18:	6a 1b                	push   $0x1b
  jmp __alltraps
  101d1a:	e9 84 09 00 00       	jmp    1026a3 <__alltraps>

00101d1f <vector28>:
.globl vector28
vector28:
  pushl $0
  101d1f:	6a 00                	push   $0x0
  pushl $28
  101d21:	6a 1c                	push   $0x1c
  jmp __alltraps
  101d23:	e9 7b 09 00 00       	jmp    1026a3 <__alltraps>

00101d28 <vector29>:
.globl vector29
vector29:
  pushl $0
  101d28:	6a 00                	push   $0x0
  pushl $29
  101d2a:	6a 1d                	push   $0x1d
  jmp __alltraps
  101d2c:	e9 72 09 00 00       	jmp    1026a3 <__alltraps>

00101d31 <vector30>:
.globl vector30
vector30:
  pushl $0
  101d31:	6a 00                	push   $0x0
  pushl $30
  101d33:	6a 1e                	push   $0x1e
  jmp __alltraps
  101d35:	e9 69 09 00 00       	jmp    1026a3 <__alltraps>

00101d3a <vector31>:
.globl vector31
vector31:
  pushl $0
  101d3a:	6a 00                	push   $0x0
  pushl $31
  101d3c:	6a 1f                	push   $0x1f
  jmp __alltraps
  101d3e:	e9 60 09 00 00       	jmp    1026a3 <__alltraps>

00101d43 <vector32>:
.globl vector32
vector32:
  pushl $0
  101d43:	6a 00                	push   $0x0
  pushl $32
  101d45:	6a 20                	push   $0x20
  jmp __alltraps
  101d47:	e9 57 09 00 00       	jmp    1026a3 <__alltraps>

00101d4c <vector33>:
.globl vector33
vector33:
  pushl $0
  101d4c:	6a 00                	push   $0x0
  pushl $33
  101d4e:	6a 21                	push   $0x21
  jmp __alltraps
  101d50:	e9 4e 09 00 00       	jmp    1026a3 <__alltraps>

00101d55 <vector34>:
.globl vector34
vector34:
  pushl $0
  101d55:	6a 00                	push   $0x0
  pushl $34
  101d57:	6a 22                	push   $0x22
  jmp __alltraps
  101d59:	e9 45 09 00 00       	jmp    1026a3 <__alltraps>

00101d5e <vector35>:
.globl vector35
vector35:
  pushl $0
  101d5e:	6a 00                	push   $0x0
  pushl $35
  101d60:	6a 23                	push   $0x23
  jmp __alltraps
  101d62:	e9 3c 09 00 00       	jmp    1026a3 <__alltraps>

00101d67 <vector36>:
.globl vector36
vector36:
  pushl $0
  101d67:	6a 00                	push   $0x0
  pushl $36
  101d69:	6a 24                	push   $0x24
  jmp __alltraps
  101d6b:	e9 33 09 00 00       	jmp    1026a3 <__alltraps>

00101d70 <vector37>:
.globl vector37
vector37:
  pushl $0
  101d70:	6a 00                	push   $0x0
  pushl $37
  101d72:	6a 25                	push   $0x25
  jmp __alltraps
  101d74:	e9 2a 09 00 00       	jmp    1026a3 <__alltraps>

00101d79 <vector38>:
.globl vector38
vector38:
  pushl $0
  101d79:	6a 00                	push   $0x0
  pushl $38
  101d7b:	6a 26                	push   $0x26
  jmp __alltraps
  101d7d:	e9 21 09 00 00       	jmp    1026a3 <__alltraps>

00101d82 <vector39>:
.globl vector39
vector39:
  pushl $0
  101d82:	6a 00                	push   $0x0
  pushl $39
  101d84:	6a 27                	push   $0x27
  jmp __alltraps
  101d86:	e9 18 09 00 00       	jmp    1026a3 <__alltraps>

00101d8b <vector40>:
.globl vector40
vector40:
  pushl $0
  101d8b:	6a 00                	push   $0x0
  pushl $40
  101d8d:	6a 28                	push   $0x28
  jmp __alltraps
  101d8f:	e9 0f 09 00 00       	jmp    1026a3 <__alltraps>

00101d94 <vector41>:
.globl vector41
vector41:
  pushl $0
  101d94:	6a 00                	push   $0x0
  pushl $41
  101d96:	6a 29                	push   $0x29
  jmp __alltraps
  101d98:	e9 06 09 00 00       	jmp    1026a3 <__alltraps>

00101d9d <vector42>:
.globl vector42
vector42:
  pushl $0
  101d9d:	6a 00                	push   $0x0
  pushl $42
  101d9f:	6a 2a                	push   $0x2a
  jmp __alltraps
  101da1:	e9 fd 08 00 00       	jmp    1026a3 <__alltraps>

00101da6 <vector43>:
.globl vector43
vector43:
  pushl $0
  101da6:	6a 00                	push   $0x0
  pushl $43
  101da8:	6a 2b                	push   $0x2b
  jmp __alltraps
  101daa:	e9 f4 08 00 00       	jmp    1026a3 <__alltraps>

00101daf <vector44>:
.globl vector44
vector44:
  pushl $0
  101daf:	6a 00                	push   $0x0
  pushl $44
  101db1:	6a 2c                	push   $0x2c
  jmp __alltraps
  101db3:	e9 eb 08 00 00       	jmp    1026a3 <__alltraps>

00101db8 <vector45>:
.globl vector45
vector45:
  pushl $0
  101db8:	6a 00                	push   $0x0
  pushl $45
  101dba:	6a 2d                	push   $0x2d
  jmp __alltraps
  101dbc:	e9 e2 08 00 00       	jmp    1026a3 <__alltraps>

00101dc1 <vector46>:
.globl vector46
vector46:
  pushl $0
  101dc1:	6a 00                	push   $0x0
  pushl $46
  101dc3:	6a 2e                	push   $0x2e
  jmp __alltraps
  101dc5:	e9 d9 08 00 00       	jmp    1026a3 <__alltraps>

00101dca <vector47>:
.globl vector47
vector47:
  pushl $0
  101dca:	6a 00                	push   $0x0
  pushl $47
  101dcc:	6a 2f                	push   $0x2f
  jmp __alltraps
  101dce:	e9 d0 08 00 00       	jmp    1026a3 <__alltraps>

00101dd3 <vector48>:
.globl vector48
vector48:
  pushl $0
  101dd3:	6a 00                	push   $0x0
  pushl $48
  101dd5:	6a 30                	push   $0x30
  jmp __alltraps
  101dd7:	e9 c7 08 00 00       	jmp    1026a3 <__alltraps>

00101ddc <vector49>:
.globl vector49
vector49:
  pushl $0
  101ddc:	6a 00                	push   $0x0
  pushl $49
  101dde:	6a 31                	push   $0x31
  jmp __alltraps
  101de0:	e9 be 08 00 00       	jmp    1026a3 <__alltraps>

00101de5 <vector50>:
.globl vector50
vector50:
  pushl $0
  101de5:	6a 00                	push   $0x0
  pushl $50
  101de7:	6a 32                	push   $0x32
  jmp __alltraps
  101de9:	e9 b5 08 00 00       	jmp    1026a3 <__alltraps>

00101dee <vector51>:
.globl vector51
vector51:
  pushl $0
  101dee:	6a 00                	push   $0x0
  pushl $51
  101df0:	6a 33                	push   $0x33
  jmp __alltraps
  101df2:	e9 ac 08 00 00       	jmp    1026a3 <__alltraps>

00101df7 <vector52>:
.globl vector52
vector52:
  pushl $0
  101df7:	6a 00                	push   $0x0
  pushl $52
  101df9:	6a 34                	push   $0x34
  jmp __alltraps
  101dfb:	e9 a3 08 00 00       	jmp    1026a3 <__alltraps>

00101e00 <vector53>:
.globl vector53
vector53:
  pushl $0
  101e00:	6a 00                	push   $0x0
  pushl $53
  101e02:	6a 35                	push   $0x35
  jmp __alltraps
  101e04:	e9 9a 08 00 00       	jmp    1026a3 <__alltraps>

00101e09 <vector54>:
.globl vector54
vector54:
  pushl $0
  101e09:	6a 00                	push   $0x0
  pushl $54
  101e0b:	6a 36                	push   $0x36
  jmp __alltraps
  101e0d:	e9 91 08 00 00       	jmp    1026a3 <__alltraps>

00101e12 <vector55>:
.globl vector55
vector55:
  pushl $0
  101e12:	6a 00                	push   $0x0
  pushl $55
  101e14:	6a 37                	push   $0x37
  jmp __alltraps
  101e16:	e9 88 08 00 00       	jmp    1026a3 <__alltraps>

00101e1b <vector56>:
.globl vector56
vector56:
  pushl $0
  101e1b:	6a 00                	push   $0x0
  pushl $56
  101e1d:	6a 38                	push   $0x38
  jmp __alltraps
  101e1f:	e9 7f 08 00 00       	jmp    1026a3 <__alltraps>

00101e24 <vector57>:
.globl vector57
vector57:
  pushl $0
  101e24:	6a 00                	push   $0x0
  pushl $57
  101e26:	6a 39                	push   $0x39
  jmp __alltraps
  101e28:	e9 76 08 00 00       	jmp    1026a3 <__alltraps>

00101e2d <vector58>:
.globl vector58
vector58:
  pushl $0
  101e2d:	6a 00                	push   $0x0
  pushl $58
  101e2f:	6a 3a                	push   $0x3a
  jmp __alltraps
  101e31:	e9 6d 08 00 00       	jmp    1026a3 <__alltraps>

00101e36 <vector59>:
.globl vector59
vector59:
  pushl $0
  101e36:	6a 00                	push   $0x0
  pushl $59
  101e38:	6a 3b                	push   $0x3b
  jmp __alltraps
  101e3a:	e9 64 08 00 00       	jmp    1026a3 <__alltraps>

00101e3f <vector60>:
.globl vector60
vector60:
  pushl $0
  101e3f:	6a 00                	push   $0x0
  pushl $60
  101e41:	6a 3c                	push   $0x3c
  jmp __alltraps
  101e43:	e9 5b 08 00 00       	jmp    1026a3 <__alltraps>

00101e48 <vector61>:
.globl vector61
vector61:
  pushl $0
  101e48:	6a 00                	push   $0x0
  pushl $61
  101e4a:	6a 3d                	push   $0x3d
  jmp __alltraps
  101e4c:	e9 52 08 00 00       	jmp    1026a3 <__alltraps>

00101e51 <vector62>:
.globl vector62
vector62:
  pushl $0
  101e51:	6a 00                	push   $0x0
  pushl $62
  101e53:	6a 3e                	push   $0x3e
  jmp __alltraps
  101e55:	e9 49 08 00 00       	jmp    1026a3 <__alltraps>

00101e5a <vector63>:
.globl vector63
vector63:
  pushl $0
  101e5a:	6a 00                	push   $0x0
  pushl $63
  101e5c:	6a 3f                	push   $0x3f
  jmp __alltraps
  101e5e:	e9 40 08 00 00       	jmp    1026a3 <__alltraps>

00101e63 <vector64>:
.globl vector64
vector64:
  pushl $0
  101e63:	6a 00                	push   $0x0
  pushl $64
  101e65:	6a 40                	push   $0x40
  jmp __alltraps
  101e67:	e9 37 08 00 00       	jmp    1026a3 <__alltraps>

00101e6c <vector65>:
.globl vector65
vector65:
  pushl $0
  101e6c:	6a 00                	push   $0x0
  pushl $65
  101e6e:	6a 41                	push   $0x41
  jmp __alltraps
  101e70:	e9 2e 08 00 00       	jmp    1026a3 <__alltraps>

00101e75 <vector66>:
.globl vector66
vector66:
  pushl $0
  101e75:	6a 00                	push   $0x0
  pushl $66
  101e77:	6a 42                	push   $0x42
  jmp __alltraps
  101e79:	e9 25 08 00 00       	jmp    1026a3 <__alltraps>

00101e7e <vector67>:
.globl vector67
vector67:
  pushl $0
  101e7e:	6a 00                	push   $0x0
  pushl $67
  101e80:	6a 43                	push   $0x43
  jmp __alltraps
  101e82:	e9 1c 08 00 00       	jmp    1026a3 <__alltraps>

00101e87 <vector68>:
.globl vector68
vector68:
  pushl $0
  101e87:	6a 00                	push   $0x0
  pushl $68
  101e89:	6a 44                	push   $0x44
  jmp __alltraps
  101e8b:	e9 13 08 00 00       	jmp    1026a3 <__alltraps>

00101e90 <vector69>:
.globl vector69
vector69:
  pushl $0
  101e90:	6a 00                	push   $0x0
  pushl $69
  101e92:	6a 45                	push   $0x45
  jmp __alltraps
  101e94:	e9 0a 08 00 00       	jmp    1026a3 <__alltraps>

00101e99 <vector70>:
.globl vector70
vector70:
  pushl $0
  101e99:	6a 00                	push   $0x0
  pushl $70
  101e9b:	6a 46                	push   $0x46
  jmp __alltraps
  101e9d:	e9 01 08 00 00       	jmp    1026a3 <__alltraps>

00101ea2 <vector71>:
.globl vector71
vector71:
  pushl $0
  101ea2:	6a 00                	push   $0x0
  pushl $71
  101ea4:	6a 47                	push   $0x47
  jmp __alltraps
  101ea6:	e9 f8 07 00 00       	jmp    1026a3 <__alltraps>

00101eab <vector72>:
.globl vector72
vector72:
  pushl $0
  101eab:	6a 00                	push   $0x0
  pushl $72
  101ead:	6a 48                	push   $0x48
  jmp __alltraps
  101eaf:	e9 ef 07 00 00       	jmp    1026a3 <__alltraps>

00101eb4 <vector73>:
.globl vector73
vector73:
  pushl $0
  101eb4:	6a 00                	push   $0x0
  pushl $73
  101eb6:	6a 49                	push   $0x49
  jmp __alltraps
  101eb8:	e9 e6 07 00 00       	jmp    1026a3 <__alltraps>

00101ebd <vector74>:
.globl vector74
vector74:
  pushl $0
  101ebd:	6a 00                	push   $0x0
  pushl $74
  101ebf:	6a 4a                	push   $0x4a
  jmp __alltraps
  101ec1:	e9 dd 07 00 00       	jmp    1026a3 <__alltraps>

00101ec6 <vector75>:
.globl vector75
vector75:
  pushl $0
  101ec6:	6a 00                	push   $0x0
  pushl $75
  101ec8:	6a 4b                	push   $0x4b
  jmp __alltraps
  101eca:	e9 d4 07 00 00       	jmp    1026a3 <__alltraps>

00101ecf <vector76>:
.globl vector76
vector76:
  pushl $0
  101ecf:	6a 00                	push   $0x0
  pushl $76
  101ed1:	6a 4c                	push   $0x4c
  jmp __alltraps
  101ed3:	e9 cb 07 00 00       	jmp    1026a3 <__alltraps>

00101ed8 <vector77>:
.globl vector77
vector77:
  pushl $0
  101ed8:	6a 00                	push   $0x0
  pushl $77
  101eda:	6a 4d                	push   $0x4d
  jmp __alltraps
  101edc:	e9 c2 07 00 00       	jmp    1026a3 <__alltraps>

00101ee1 <vector78>:
.globl vector78
vector78:
  pushl $0
  101ee1:	6a 00                	push   $0x0
  pushl $78
  101ee3:	6a 4e                	push   $0x4e
  jmp __alltraps
  101ee5:	e9 b9 07 00 00       	jmp    1026a3 <__alltraps>

00101eea <vector79>:
.globl vector79
vector79:
  pushl $0
  101eea:	6a 00                	push   $0x0
  pushl $79
  101eec:	6a 4f                	push   $0x4f
  jmp __alltraps
  101eee:	e9 b0 07 00 00       	jmp    1026a3 <__alltraps>

00101ef3 <vector80>:
.globl vector80
vector80:
  pushl $0
  101ef3:	6a 00                	push   $0x0
  pushl $80
  101ef5:	6a 50                	push   $0x50
  jmp __alltraps
  101ef7:	e9 a7 07 00 00       	jmp    1026a3 <__alltraps>

00101efc <vector81>:
.globl vector81
vector81:
  pushl $0
  101efc:	6a 00                	push   $0x0
  pushl $81
  101efe:	6a 51                	push   $0x51
  jmp __alltraps
  101f00:	e9 9e 07 00 00       	jmp    1026a3 <__alltraps>

00101f05 <vector82>:
.globl vector82
vector82:
  pushl $0
  101f05:	6a 00                	push   $0x0
  pushl $82
  101f07:	6a 52                	push   $0x52
  jmp __alltraps
  101f09:	e9 95 07 00 00       	jmp    1026a3 <__alltraps>

00101f0e <vector83>:
.globl vector83
vector83:
  pushl $0
  101f0e:	6a 00                	push   $0x0
  pushl $83
  101f10:	6a 53                	push   $0x53
  jmp __alltraps
  101f12:	e9 8c 07 00 00       	jmp    1026a3 <__alltraps>

00101f17 <vector84>:
.globl vector84
vector84:
  pushl $0
  101f17:	6a 00                	push   $0x0
  pushl $84
  101f19:	6a 54                	push   $0x54
  jmp __alltraps
  101f1b:	e9 83 07 00 00       	jmp    1026a3 <__alltraps>

00101f20 <vector85>:
.globl vector85
vector85:
  pushl $0
  101f20:	6a 00                	push   $0x0
  pushl $85
  101f22:	6a 55                	push   $0x55
  jmp __alltraps
  101f24:	e9 7a 07 00 00       	jmp    1026a3 <__alltraps>

00101f29 <vector86>:
.globl vector86
vector86:
  pushl $0
  101f29:	6a 00                	push   $0x0
  pushl $86
  101f2b:	6a 56                	push   $0x56
  jmp __alltraps
  101f2d:	e9 71 07 00 00       	jmp    1026a3 <__alltraps>

00101f32 <vector87>:
.globl vector87
vector87:
  pushl $0
  101f32:	6a 00                	push   $0x0
  pushl $87
  101f34:	6a 57                	push   $0x57
  jmp __alltraps
  101f36:	e9 68 07 00 00       	jmp    1026a3 <__alltraps>

00101f3b <vector88>:
.globl vector88
vector88:
  pushl $0
  101f3b:	6a 00                	push   $0x0
  pushl $88
  101f3d:	6a 58                	push   $0x58
  jmp __alltraps
  101f3f:	e9 5f 07 00 00       	jmp    1026a3 <__alltraps>

00101f44 <vector89>:
.globl vector89
vector89:
  pushl $0
  101f44:	6a 00                	push   $0x0
  pushl $89
  101f46:	6a 59                	push   $0x59
  jmp __alltraps
  101f48:	e9 56 07 00 00       	jmp    1026a3 <__alltraps>

00101f4d <vector90>:
.globl vector90
vector90:
  pushl $0
  101f4d:	6a 00                	push   $0x0
  pushl $90
  101f4f:	6a 5a                	push   $0x5a
  jmp __alltraps
  101f51:	e9 4d 07 00 00       	jmp    1026a3 <__alltraps>

00101f56 <vector91>:
.globl vector91
vector91:
  pushl $0
  101f56:	6a 00                	push   $0x0
  pushl $91
  101f58:	6a 5b                	push   $0x5b
  jmp __alltraps
  101f5a:	e9 44 07 00 00       	jmp    1026a3 <__alltraps>

00101f5f <vector92>:
.globl vector92
vector92:
  pushl $0
  101f5f:	6a 00                	push   $0x0
  pushl $92
  101f61:	6a 5c                	push   $0x5c
  jmp __alltraps
  101f63:	e9 3b 07 00 00       	jmp    1026a3 <__alltraps>

00101f68 <vector93>:
.globl vector93
vector93:
  pushl $0
  101f68:	6a 00                	push   $0x0
  pushl $93
  101f6a:	6a 5d                	push   $0x5d
  jmp __alltraps
  101f6c:	e9 32 07 00 00       	jmp    1026a3 <__alltraps>

00101f71 <vector94>:
.globl vector94
vector94:
  pushl $0
  101f71:	6a 00                	push   $0x0
  pushl $94
  101f73:	6a 5e                	push   $0x5e
  jmp __alltraps
  101f75:	e9 29 07 00 00       	jmp    1026a3 <__alltraps>

00101f7a <vector95>:
.globl vector95
vector95:
  pushl $0
  101f7a:	6a 00                	push   $0x0
  pushl $95
  101f7c:	6a 5f                	push   $0x5f
  jmp __alltraps
  101f7e:	e9 20 07 00 00       	jmp    1026a3 <__alltraps>

00101f83 <vector96>:
.globl vector96
vector96:
  pushl $0
  101f83:	6a 00                	push   $0x0
  pushl $96
  101f85:	6a 60                	push   $0x60
  jmp __alltraps
  101f87:	e9 17 07 00 00       	jmp    1026a3 <__alltraps>

00101f8c <vector97>:
.globl vector97
vector97:
  pushl $0
  101f8c:	6a 00                	push   $0x0
  pushl $97
  101f8e:	6a 61                	push   $0x61
  jmp __alltraps
  101f90:	e9 0e 07 00 00       	jmp    1026a3 <__alltraps>

00101f95 <vector98>:
.globl vector98
vector98:
  pushl $0
  101f95:	6a 00                	push   $0x0
  pushl $98
  101f97:	6a 62                	push   $0x62
  jmp __alltraps
  101f99:	e9 05 07 00 00       	jmp    1026a3 <__alltraps>

00101f9e <vector99>:
.globl vector99
vector99:
  pushl $0
  101f9e:	6a 00                	push   $0x0
  pushl $99
  101fa0:	6a 63                	push   $0x63
  jmp __alltraps
  101fa2:	e9 fc 06 00 00       	jmp    1026a3 <__alltraps>

00101fa7 <vector100>:
.globl vector100
vector100:
  pushl $0
  101fa7:	6a 00                	push   $0x0
  pushl $100
  101fa9:	6a 64                	push   $0x64
  jmp __alltraps
  101fab:	e9 f3 06 00 00       	jmp    1026a3 <__alltraps>

00101fb0 <vector101>:
.globl vector101
vector101:
  pushl $0
  101fb0:	6a 00                	push   $0x0
  pushl $101
  101fb2:	6a 65                	push   $0x65
  jmp __alltraps
  101fb4:	e9 ea 06 00 00       	jmp    1026a3 <__alltraps>

00101fb9 <vector102>:
.globl vector102
vector102:
  pushl $0
  101fb9:	6a 00                	push   $0x0
  pushl $102
  101fbb:	6a 66                	push   $0x66
  jmp __alltraps
  101fbd:	e9 e1 06 00 00       	jmp    1026a3 <__alltraps>

00101fc2 <vector103>:
.globl vector103
vector103:
  pushl $0
  101fc2:	6a 00                	push   $0x0
  pushl $103
  101fc4:	6a 67                	push   $0x67
  jmp __alltraps
  101fc6:	e9 d8 06 00 00       	jmp    1026a3 <__alltraps>

00101fcb <vector104>:
.globl vector104
vector104:
  pushl $0
  101fcb:	6a 00                	push   $0x0
  pushl $104
  101fcd:	6a 68                	push   $0x68
  jmp __alltraps
  101fcf:	e9 cf 06 00 00       	jmp    1026a3 <__alltraps>

00101fd4 <vector105>:
.globl vector105
vector105:
  pushl $0
  101fd4:	6a 00                	push   $0x0
  pushl $105
  101fd6:	6a 69                	push   $0x69
  jmp __alltraps
  101fd8:	e9 c6 06 00 00       	jmp    1026a3 <__alltraps>

00101fdd <vector106>:
.globl vector106
vector106:
  pushl $0
  101fdd:	6a 00                	push   $0x0
  pushl $106
  101fdf:	6a 6a                	push   $0x6a
  jmp __alltraps
  101fe1:	e9 bd 06 00 00       	jmp    1026a3 <__alltraps>

00101fe6 <vector107>:
.globl vector107
vector107:
  pushl $0
  101fe6:	6a 00                	push   $0x0
  pushl $107
  101fe8:	6a 6b                	push   $0x6b
  jmp __alltraps
  101fea:	e9 b4 06 00 00       	jmp    1026a3 <__alltraps>

00101fef <vector108>:
.globl vector108
vector108:
  pushl $0
  101fef:	6a 00                	push   $0x0
  pushl $108
  101ff1:	6a 6c                	push   $0x6c
  jmp __alltraps
  101ff3:	e9 ab 06 00 00       	jmp    1026a3 <__alltraps>

00101ff8 <vector109>:
.globl vector109
vector109:
  pushl $0
  101ff8:	6a 00                	push   $0x0
  pushl $109
  101ffa:	6a 6d                	push   $0x6d
  jmp __alltraps
  101ffc:	e9 a2 06 00 00       	jmp    1026a3 <__alltraps>

00102001 <vector110>:
.globl vector110
vector110:
  pushl $0
  102001:	6a 00                	push   $0x0
  pushl $110
  102003:	6a 6e                	push   $0x6e
  jmp __alltraps
  102005:	e9 99 06 00 00       	jmp    1026a3 <__alltraps>

0010200a <vector111>:
.globl vector111
vector111:
  pushl $0
  10200a:	6a 00                	push   $0x0
  pushl $111
  10200c:	6a 6f                	push   $0x6f
  jmp __alltraps
  10200e:	e9 90 06 00 00       	jmp    1026a3 <__alltraps>

00102013 <vector112>:
.globl vector112
vector112:
  pushl $0
  102013:	6a 00                	push   $0x0
  pushl $112
  102015:	6a 70                	push   $0x70
  jmp __alltraps
  102017:	e9 87 06 00 00       	jmp    1026a3 <__alltraps>

0010201c <vector113>:
.globl vector113
vector113:
  pushl $0
  10201c:	6a 00                	push   $0x0
  pushl $113
  10201e:	6a 71                	push   $0x71
  jmp __alltraps
  102020:	e9 7e 06 00 00       	jmp    1026a3 <__alltraps>

00102025 <vector114>:
.globl vector114
vector114:
  pushl $0
  102025:	6a 00                	push   $0x0
  pushl $114
  102027:	6a 72                	push   $0x72
  jmp __alltraps
  102029:	e9 75 06 00 00       	jmp    1026a3 <__alltraps>

0010202e <vector115>:
.globl vector115
vector115:
  pushl $0
  10202e:	6a 00                	push   $0x0
  pushl $115
  102030:	6a 73                	push   $0x73
  jmp __alltraps
  102032:	e9 6c 06 00 00       	jmp    1026a3 <__alltraps>

00102037 <vector116>:
.globl vector116
vector116:
  pushl $0
  102037:	6a 00                	push   $0x0
  pushl $116
  102039:	6a 74                	push   $0x74
  jmp __alltraps
  10203b:	e9 63 06 00 00       	jmp    1026a3 <__alltraps>

00102040 <vector117>:
.globl vector117
vector117:
  pushl $0
  102040:	6a 00                	push   $0x0
  pushl $117
  102042:	6a 75                	push   $0x75
  jmp __alltraps
  102044:	e9 5a 06 00 00       	jmp    1026a3 <__alltraps>

00102049 <vector118>:
.globl vector118
vector118:
  pushl $0
  102049:	6a 00                	push   $0x0
  pushl $118
  10204b:	6a 76                	push   $0x76
  jmp __alltraps
  10204d:	e9 51 06 00 00       	jmp    1026a3 <__alltraps>

00102052 <vector119>:
.globl vector119
vector119:
  pushl $0
  102052:	6a 00                	push   $0x0
  pushl $119
  102054:	6a 77                	push   $0x77
  jmp __alltraps
  102056:	e9 48 06 00 00       	jmp    1026a3 <__alltraps>

0010205b <vector120>:
.globl vector120
vector120:
  pushl $0
  10205b:	6a 00                	push   $0x0
  pushl $120
  10205d:	6a 78                	push   $0x78
  jmp __alltraps
  10205f:	e9 3f 06 00 00       	jmp    1026a3 <__alltraps>

00102064 <vector121>:
.globl vector121
vector121:
  pushl $0
  102064:	6a 00                	push   $0x0
  pushl $121
  102066:	6a 79                	push   $0x79
  jmp __alltraps
  102068:	e9 36 06 00 00       	jmp    1026a3 <__alltraps>

0010206d <vector122>:
.globl vector122
vector122:
  pushl $0
  10206d:	6a 00                	push   $0x0
  pushl $122
  10206f:	6a 7a                	push   $0x7a
  jmp __alltraps
  102071:	e9 2d 06 00 00       	jmp    1026a3 <__alltraps>

00102076 <vector123>:
.globl vector123
vector123:
  pushl $0
  102076:	6a 00                	push   $0x0
  pushl $123
  102078:	6a 7b                	push   $0x7b
  jmp __alltraps
  10207a:	e9 24 06 00 00       	jmp    1026a3 <__alltraps>

0010207f <vector124>:
.globl vector124
vector124:
  pushl $0
  10207f:	6a 00                	push   $0x0
  pushl $124
  102081:	6a 7c                	push   $0x7c
  jmp __alltraps
  102083:	e9 1b 06 00 00       	jmp    1026a3 <__alltraps>

00102088 <vector125>:
.globl vector125
vector125:
  pushl $0
  102088:	6a 00                	push   $0x0
  pushl $125
  10208a:	6a 7d                	push   $0x7d
  jmp __alltraps
  10208c:	e9 12 06 00 00       	jmp    1026a3 <__alltraps>

00102091 <vector126>:
.globl vector126
vector126:
  pushl $0
  102091:	6a 00                	push   $0x0
  pushl $126
  102093:	6a 7e                	push   $0x7e
  jmp __alltraps
  102095:	e9 09 06 00 00       	jmp    1026a3 <__alltraps>

0010209a <vector127>:
.globl vector127
vector127:
  pushl $0
  10209a:	6a 00                	push   $0x0
  pushl $127
  10209c:	6a 7f                	push   $0x7f
  jmp __alltraps
  10209e:	e9 00 06 00 00       	jmp    1026a3 <__alltraps>

001020a3 <vector128>:
.globl vector128
vector128:
  pushl $0
  1020a3:	6a 00                	push   $0x0
  pushl $128
  1020a5:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1020aa:	e9 f4 05 00 00       	jmp    1026a3 <__alltraps>

001020af <vector129>:
.globl vector129
vector129:
  pushl $0
  1020af:	6a 00                	push   $0x0
  pushl $129
  1020b1:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1020b6:	e9 e8 05 00 00       	jmp    1026a3 <__alltraps>

001020bb <vector130>:
.globl vector130
vector130:
  pushl $0
  1020bb:	6a 00                	push   $0x0
  pushl $130
  1020bd:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1020c2:	e9 dc 05 00 00       	jmp    1026a3 <__alltraps>

001020c7 <vector131>:
.globl vector131
vector131:
  pushl $0
  1020c7:	6a 00                	push   $0x0
  pushl $131
  1020c9:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1020ce:	e9 d0 05 00 00       	jmp    1026a3 <__alltraps>

001020d3 <vector132>:
.globl vector132
vector132:
  pushl $0
  1020d3:	6a 00                	push   $0x0
  pushl $132
  1020d5:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1020da:	e9 c4 05 00 00       	jmp    1026a3 <__alltraps>

001020df <vector133>:
.globl vector133
vector133:
  pushl $0
  1020df:	6a 00                	push   $0x0
  pushl $133
  1020e1:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1020e6:	e9 b8 05 00 00       	jmp    1026a3 <__alltraps>

001020eb <vector134>:
.globl vector134
vector134:
  pushl $0
  1020eb:	6a 00                	push   $0x0
  pushl $134
  1020ed:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1020f2:	e9 ac 05 00 00       	jmp    1026a3 <__alltraps>

001020f7 <vector135>:
.globl vector135
vector135:
  pushl $0
  1020f7:	6a 00                	push   $0x0
  pushl $135
  1020f9:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1020fe:	e9 a0 05 00 00       	jmp    1026a3 <__alltraps>

00102103 <vector136>:
.globl vector136
vector136:
  pushl $0
  102103:	6a 00                	push   $0x0
  pushl $136
  102105:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10210a:	e9 94 05 00 00       	jmp    1026a3 <__alltraps>

0010210f <vector137>:
.globl vector137
vector137:
  pushl $0
  10210f:	6a 00                	push   $0x0
  pushl $137
  102111:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102116:	e9 88 05 00 00       	jmp    1026a3 <__alltraps>

0010211b <vector138>:
.globl vector138
vector138:
  pushl $0
  10211b:	6a 00                	push   $0x0
  pushl $138
  10211d:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102122:	e9 7c 05 00 00       	jmp    1026a3 <__alltraps>

00102127 <vector139>:
.globl vector139
vector139:
  pushl $0
  102127:	6a 00                	push   $0x0
  pushl $139
  102129:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  10212e:	e9 70 05 00 00       	jmp    1026a3 <__alltraps>

00102133 <vector140>:
.globl vector140
vector140:
  pushl $0
  102133:	6a 00                	push   $0x0
  pushl $140
  102135:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  10213a:	e9 64 05 00 00       	jmp    1026a3 <__alltraps>

0010213f <vector141>:
.globl vector141
vector141:
  pushl $0
  10213f:	6a 00                	push   $0x0
  pushl $141
  102141:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102146:	e9 58 05 00 00       	jmp    1026a3 <__alltraps>

0010214b <vector142>:
.globl vector142
vector142:
  pushl $0
  10214b:	6a 00                	push   $0x0
  pushl $142
  10214d:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102152:	e9 4c 05 00 00       	jmp    1026a3 <__alltraps>

00102157 <vector143>:
.globl vector143
vector143:
  pushl $0
  102157:	6a 00                	push   $0x0
  pushl $143
  102159:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  10215e:	e9 40 05 00 00       	jmp    1026a3 <__alltraps>

00102163 <vector144>:
.globl vector144
vector144:
  pushl $0
  102163:	6a 00                	push   $0x0
  pushl $144
  102165:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  10216a:	e9 34 05 00 00       	jmp    1026a3 <__alltraps>

0010216f <vector145>:
.globl vector145
vector145:
  pushl $0
  10216f:	6a 00                	push   $0x0
  pushl $145
  102171:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102176:	e9 28 05 00 00       	jmp    1026a3 <__alltraps>

0010217b <vector146>:
.globl vector146
vector146:
  pushl $0
  10217b:	6a 00                	push   $0x0
  pushl $146
  10217d:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102182:	e9 1c 05 00 00       	jmp    1026a3 <__alltraps>

00102187 <vector147>:
.globl vector147
vector147:
  pushl $0
  102187:	6a 00                	push   $0x0
  pushl $147
  102189:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10218e:	e9 10 05 00 00       	jmp    1026a3 <__alltraps>

00102193 <vector148>:
.globl vector148
vector148:
  pushl $0
  102193:	6a 00                	push   $0x0
  pushl $148
  102195:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10219a:	e9 04 05 00 00       	jmp    1026a3 <__alltraps>

0010219f <vector149>:
.globl vector149
vector149:
  pushl $0
  10219f:	6a 00                	push   $0x0
  pushl $149
  1021a1:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1021a6:	e9 f8 04 00 00       	jmp    1026a3 <__alltraps>

001021ab <vector150>:
.globl vector150
vector150:
  pushl $0
  1021ab:	6a 00                	push   $0x0
  pushl $150
  1021ad:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1021b2:	e9 ec 04 00 00       	jmp    1026a3 <__alltraps>

001021b7 <vector151>:
.globl vector151
vector151:
  pushl $0
  1021b7:	6a 00                	push   $0x0
  pushl $151
  1021b9:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1021be:	e9 e0 04 00 00       	jmp    1026a3 <__alltraps>

001021c3 <vector152>:
.globl vector152
vector152:
  pushl $0
  1021c3:	6a 00                	push   $0x0
  pushl $152
  1021c5:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1021ca:	e9 d4 04 00 00       	jmp    1026a3 <__alltraps>

001021cf <vector153>:
.globl vector153
vector153:
  pushl $0
  1021cf:	6a 00                	push   $0x0
  pushl $153
  1021d1:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1021d6:	e9 c8 04 00 00       	jmp    1026a3 <__alltraps>

001021db <vector154>:
.globl vector154
vector154:
  pushl $0
  1021db:	6a 00                	push   $0x0
  pushl $154
  1021dd:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1021e2:	e9 bc 04 00 00       	jmp    1026a3 <__alltraps>

001021e7 <vector155>:
.globl vector155
vector155:
  pushl $0
  1021e7:	6a 00                	push   $0x0
  pushl $155
  1021e9:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1021ee:	e9 b0 04 00 00       	jmp    1026a3 <__alltraps>

001021f3 <vector156>:
.globl vector156
vector156:
  pushl $0
  1021f3:	6a 00                	push   $0x0
  pushl $156
  1021f5:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1021fa:	e9 a4 04 00 00       	jmp    1026a3 <__alltraps>

001021ff <vector157>:
.globl vector157
vector157:
  pushl $0
  1021ff:	6a 00                	push   $0x0
  pushl $157
  102201:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102206:	e9 98 04 00 00       	jmp    1026a3 <__alltraps>

0010220b <vector158>:
.globl vector158
vector158:
  pushl $0
  10220b:	6a 00                	push   $0x0
  pushl $158
  10220d:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102212:	e9 8c 04 00 00       	jmp    1026a3 <__alltraps>

00102217 <vector159>:
.globl vector159
vector159:
  pushl $0
  102217:	6a 00                	push   $0x0
  pushl $159
  102219:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10221e:	e9 80 04 00 00       	jmp    1026a3 <__alltraps>

00102223 <vector160>:
.globl vector160
vector160:
  pushl $0
  102223:	6a 00                	push   $0x0
  pushl $160
  102225:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10222a:	e9 74 04 00 00       	jmp    1026a3 <__alltraps>

0010222f <vector161>:
.globl vector161
vector161:
  pushl $0
  10222f:	6a 00                	push   $0x0
  pushl $161
  102231:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102236:	e9 68 04 00 00       	jmp    1026a3 <__alltraps>

0010223b <vector162>:
.globl vector162
vector162:
  pushl $0
  10223b:	6a 00                	push   $0x0
  pushl $162
  10223d:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102242:	e9 5c 04 00 00       	jmp    1026a3 <__alltraps>

00102247 <vector163>:
.globl vector163
vector163:
  pushl $0
  102247:	6a 00                	push   $0x0
  pushl $163
  102249:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  10224e:	e9 50 04 00 00       	jmp    1026a3 <__alltraps>

00102253 <vector164>:
.globl vector164
vector164:
  pushl $0
  102253:	6a 00                	push   $0x0
  pushl $164
  102255:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  10225a:	e9 44 04 00 00       	jmp    1026a3 <__alltraps>

0010225f <vector165>:
.globl vector165
vector165:
  pushl $0
  10225f:	6a 00                	push   $0x0
  pushl $165
  102261:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102266:	e9 38 04 00 00       	jmp    1026a3 <__alltraps>

0010226b <vector166>:
.globl vector166
vector166:
  pushl $0
  10226b:	6a 00                	push   $0x0
  pushl $166
  10226d:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102272:	e9 2c 04 00 00       	jmp    1026a3 <__alltraps>

00102277 <vector167>:
.globl vector167
vector167:
  pushl $0
  102277:	6a 00                	push   $0x0
  pushl $167
  102279:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10227e:	e9 20 04 00 00       	jmp    1026a3 <__alltraps>

00102283 <vector168>:
.globl vector168
vector168:
  pushl $0
  102283:	6a 00                	push   $0x0
  pushl $168
  102285:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10228a:	e9 14 04 00 00       	jmp    1026a3 <__alltraps>

0010228f <vector169>:
.globl vector169
vector169:
  pushl $0
  10228f:	6a 00                	push   $0x0
  pushl $169
  102291:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102296:	e9 08 04 00 00       	jmp    1026a3 <__alltraps>

0010229b <vector170>:
.globl vector170
vector170:
  pushl $0
  10229b:	6a 00                	push   $0x0
  pushl $170
  10229d:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1022a2:	e9 fc 03 00 00       	jmp    1026a3 <__alltraps>

001022a7 <vector171>:
.globl vector171
vector171:
  pushl $0
  1022a7:	6a 00                	push   $0x0
  pushl $171
  1022a9:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1022ae:	e9 f0 03 00 00       	jmp    1026a3 <__alltraps>

001022b3 <vector172>:
.globl vector172
vector172:
  pushl $0
  1022b3:	6a 00                	push   $0x0
  pushl $172
  1022b5:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1022ba:	e9 e4 03 00 00       	jmp    1026a3 <__alltraps>

001022bf <vector173>:
.globl vector173
vector173:
  pushl $0
  1022bf:	6a 00                	push   $0x0
  pushl $173
  1022c1:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1022c6:	e9 d8 03 00 00       	jmp    1026a3 <__alltraps>

001022cb <vector174>:
.globl vector174
vector174:
  pushl $0
  1022cb:	6a 00                	push   $0x0
  pushl $174
  1022cd:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1022d2:	e9 cc 03 00 00       	jmp    1026a3 <__alltraps>

001022d7 <vector175>:
.globl vector175
vector175:
  pushl $0
  1022d7:	6a 00                	push   $0x0
  pushl $175
  1022d9:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1022de:	e9 c0 03 00 00       	jmp    1026a3 <__alltraps>

001022e3 <vector176>:
.globl vector176
vector176:
  pushl $0
  1022e3:	6a 00                	push   $0x0
  pushl $176
  1022e5:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1022ea:	e9 b4 03 00 00       	jmp    1026a3 <__alltraps>

001022ef <vector177>:
.globl vector177
vector177:
  pushl $0
  1022ef:	6a 00                	push   $0x0
  pushl $177
  1022f1:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1022f6:	e9 a8 03 00 00       	jmp    1026a3 <__alltraps>

001022fb <vector178>:
.globl vector178
vector178:
  pushl $0
  1022fb:	6a 00                	push   $0x0
  pushl $178
  1022fd:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102302:	e9 9c 03 00 00       	jmp    1026a3 <__alltraps>

00102307 <vector179>:
.globl vector179
vector179:
  pushl $0
  102307:	6a 00                	push   $0x0
  pushl $179
  102309:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10230e:	e9 90 03 00 00       	jmp    1026a3 <__alltraps>

00102313 <vector180>:
.globl vector180
vector180:
  pushl $0
  102313:	6a 00                	push   $0x0
  pushl $180
  102315:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10231a:	e9 84 03 00 00       	jmp    1026a3 <__alltraps>

0010231f <vector181>:
.globl vector181
vector181:
  pushl $0
  10231f:	6a 00                	push   $0x0
  pushl $181
  102321:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102326:	e9 78 03 00 00       	jmp    1026a3 <__alltraps>

0010232b <vector182>:
.globl vector182
vector182:
  pushl $0
  10232b:	6a 00                	push   $0x0
  pushl $182
  10232d:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102332:	e9 6c 03 00 00       	jmp    1026a3 <__alltraps>

00102337 <vector183>:
.globl vector183
vector183:
  pushl $0
  102337:	6a 00                	push   $0x0
  pushl $183
  102339:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  10233e:	e9 60 03 00 00       	jmp    1026a3 <__alltraps>

00102343 <vector184>:
.globl vector184
vector184:
  pushl $0
  102343:	6a 00                	push   $0x0
  pushl $184
  102345:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  10234a:	e9 54 03 00 00       	jmp    1026a3 <__alltraps>

0010234f <vector185>:
.globl vector185
vector185:
  pushl $0
  10234f:	6a 00                	push   $0x0
  pushl $185
  102351:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102356:	e9 48 03 00 00       	jmp    1026a3 <__alltraps>

0010235b <vector186>:
.globl vector186
vector186:
  pushl $0
  10235b:	6a 00                	push   $0x0
  pushl $186
  10235d:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102362:	e9 3c 03 00 00       	jmp    1026a3 <__alltraps>

00102367 <vector187>:
.globl vector187
vector187:
  pushl $0
  102367:	6a 00                	push   $0x0
  pushl $187
  102369:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  10236e:	e9 30 03 00 00       	jmp    1026a3 <__alltraps>

00102373 <vector188>:
.globl vector188
vector188:
  pushl $0
  102373:	6a 00                	push   $0x0
  pushl $188
  102375:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10237a:	e9 24 03 00 00       	jmp    1026a3 <__alltraps>

0010237f <vector189>:
.globl vector189
vector189:
  pushl $0
  10237f:	6a 00                	push   $0x0
  pushl $189
  102381:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102386:	e9 18 03 00 00       	jmp    1026a3 <__alltraps>

0010238b <vector190>:
.globl vector190
vector190:
  pushl $0
  10238b:	6a 00                	push   $0x0
  pushl $190
  10238d:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102392:	e9 0c 03 00 00       	jmp    1026a3 <__alltraps>

00102397 <vector191>:
.globl vector191
vector191:
  pushl $0
  102397:	6a 00                	push   $0x0
  pushl $191
  102399:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10239e:	e9 00 03 00 00       	jmp    1026a3 <__alltraps>

001023a3 <vector192>:
.globl vector192
vector192:
  pushl $0
  1023a3:	6a 00                	push   $0x0
  pushl $192
  1023a5:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1023aa:	e9 f4 02 00 00       	jmp    1026a3 <__alltraps>

001023af <vector193>:
.globl vector193
vector193:
  pushl $0
  1023af:	6a 00                	push   $0x0
  pushl $193
  1023b1:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1023b6:	e9 e8 02 00 00       	jmp    1026a3 <__alltraps>

001023bb <vector194>:
.globl vector194
vector194:
  pushl $0
  1023bb:	6a 00                	push   $0x0
  pushl $194
  1023bd:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1023c2:	e9 dc 02 00 00       	jmp    1026a3 <__alltraps>

001023c7 <vector195>:
.globl vector195
vector195:
  pushl $0
  1023c7:	6a 00                	push   $0x0
  pushl $195
  1023c9:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1023ce:	e9 d0 02 00 00       	jmp    1026a3 <__alltraps>

001023d3 <vector196>:
.globl vector196
vector196:
  pushl $0
  1023d3:	6a 00                	push   $0x0
  pushl $196
  1023d5:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1023da:	e9 c4 02 00 00       	jmp    1026a3 <__alltraps>

001023df <vector197>:
.globl vector197
vector197:
  pushl $0
  1023df:	6a 00                	push   $0x0
  pushl $197
  1023e1:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1023e6:	e9 b8 02 00 00       	jmp    1026a3 <__alltraps>

001023eb <vector198>:
.globl vector198
vector198:
  pushl $0
  1023eb:	6a 00                	push   $0x0
  pushl $198
  1023ed:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1023f2:	e9 ac 02 00 00       	jmp    1026a3 <__alltraps>

001023f7 <vector199>:
.globl vector199
vector199:
  pushl $0
  1023f7:	6a 00                	push   $0x0
  pushl $199
  1023f9:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1023fe:	e9 a0 02 00 00       	jmp    1026a3 <__alltraps>

00102403 <vector200>:
.globl vector200
vector200:
  pushl $0
  102403:	6a 00                	push   $0x0
  pushl $200
  102405:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10240a:	e9 94 02 00 00       	jmp    1026a3 <__alltraps>

0010240f <vector201>:
.globl vector201
vector201:
  pushl $0
  10240f:	6a 00                	push   $0x0
  pushl $201
  102411:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102416:	e9 88 02 00 00       	jmp    1026a3 <__alltraps>

0010241b <vector202>:
.globl vector202
vector202:
  pushl $0
  10241b:	6a 00                	push   $0x0
  pushl $202
  10241d:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102422:	e9 7c 02 00 00       	jmp    1026a3 <__alltraps>

00102427 <vector203>:
.globl vector203
vector203:
  pushl $0
  102427:	6a 00                	push   $0x0
  pushl $203
  102429:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  10242e:	e9 70 02 00 00       	jmp    1026a3 <__alltraps>

00102433 <vector204>:
.globl vector204
vector204:
  pushl $0
  102433:	6a 00                	push   $0x0
  pushl $204
  102435:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  10243a:	e9 64 02 00 00       	jmp    1026a3 <__alltraps>

0010243f <vector205>:
.globl vector205
vector205:
  pushl $0
  10243f:	6a 00                	push   $0x0
  pushl $205
  102441:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102446:	e9 58 02 00 00       	jmp    1026a3 <__alltraps>

0010244b <vector206>:
.globl vector206
vector206:
  pushl $0
  10244b:	6a 00                	push   $0x0
  pushl $206
  10244d:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102452:	e9 4c 02 00 00       	jmp    1026a3 <__alltraps>

00102457 <vector207>:
.globl vector207
vector207:
  pushl $0
  102457:	6a 00                	push   $0x0
  pushl $207
  102459:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  10245e:	e9 40 02 00 00       	jmp    1026a3 <__alltraps>

00102463 <vector208>:
.globl vector208
vector208:
  pushl $0
  102463:	6a 00                	push   $0x0
  pushl $208
  102465:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  10246a:	e9 34 02 00 00       	jmp    1026a3 <__alltraps>

0010246f <vector209>:
.globl vector209
vector209:
  pushl $0
  10246f:	6a 00                	push   $0x0
  pushl $209
  102471:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102476:	e9 28 02 00 00       	jmp    1026a3 <__alltraps>

0010247b <vector210>:
.globl vector210
vector210:
  pushl $0
  10247b:	6a 00                	push   $0x0
  pushl $210
  10247d:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102482:	e9 1c 02 00 00       	jmp    1026a3 <__alltraps>

00102487 <vector211>:
.globl vector211
vector211:
  pushl $0
  102487:	6a 00                	push   $0x0
  pushl $211
  102489:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10248e:	e9 10 02 00 00       	jmp    1026a3 <__alltraps>

00102493 <vector212>:
.globl vector212
vector212:
  pushl $0
  102493:	6a 00                	push   $0x0
  pushl $212
  102495:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10249a:	e9 04 02 00 00       	jmp    1026a3 <__alltraps>

0010249f <vector213>:
.globl vector213
vector213:
  pushl $0
  10249f:	6a 00                	push   $0x0
  pushl $213
  1024a1:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1024a6:	e9 f8 01 00 00       	jmp    1026a3 <__alltraps>

001024ab <vector214>:
.globl vector214
vector214:
  pushl $0
  1024ab:	6a 00                	push   $0x0
  pushl $214
  1024ad:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1024b2:	e9 ec 01 00 00       	jmp    1026a3 <__alltraps>

001024b7 <vector215>:
.globl vector215
vector215:
  pushl $0
  1024b7:	6a 00                	push   $0x0
  pushl $215
  1024b9:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1024be:	e9 e0 01 00 00       	jmp    1026a3 <__alltraps>

001024c3 <vector216>:
.globl vector216
vector216:
  pushl $0
  1024c3:	6a 00                	push   $0x0
  pushl $216
  1024c5:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1024ca:	e9 d4 01 00 00       	jmp    1026a3 <__alltraps>

001024cf <vector217>:
.globl vector217
vector217:
  pushl $0
  1024cf:	6a 00                	push   $0x0
  pushl $217
  1024d1:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1024d6:	e9 c8 01 00 00       	jmp    1026a3 <__alltraps>

001024db <vector218>:
.globl vector218
vector218:
  pushl $0
  1024db:	6a 00                	push   $0x0
  pushl $218
  1024dd:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1024e2:	e9 bc 01 00 00       	jmp    1026a3 <__alltraps>

001024e7 <vector219>:
.globl vector219
vector219:
  pushl $0
  1024e7:	6a 00                	push   $0x0
  pushl $219
  1024e9:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1024ee:	e9 b0 01 00 00       	jmp    1026a3 <__alltraps>

001024f3 <vector220>:
.globl vector220
vector220:
  pushl $0
  1024f3:	6a 00                	push   $0x0
  pushl $220
  1024f5:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1024fa:	e9 a4 01 00 00       	jmp    1026a3 <__alltraps>

001024ff <vector221>:
.globl vector221
vector221:
  pushl $0
  1024ff:	6a 00                	push   $0x0
  pushl $221
  102501:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102506:	e9 98 01 00 00       	jmp    1026a3 <__alltraps>

0010250b <vector222>:
.globl vector222
vector222:
  pushl $0
  10250b:	6a 00                	push   $0x0
  pushl $222
  10250d:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102512:	e9 8c 01 00 00       	jmp    1026a3 <__alltraps>

00102517 <vector223>:
.globl vector223
vector223:
  pushl $0
  102517:	6a 00                	push   $0x0
  pushl $223
  102519:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  10251e:	e9 80 01 00 00       	jmp    1026a3 <__alltraps>

00102523 <vector224>:
.globl vector224
vector224:
  pushl $0
  102523:	6a 00                	push   $0x0
  pushl $224
  102525:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10252a:	e9 74 01 00 00       	jmp    1026a3 <__alltraps>

0010252f <vector225>:
.globl vector225
vector225:
  pushl $0
  10252f:	6a 00                	push   $0x0
  pushl $225
  102531:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102536:	e9 68 01 00 00       	jmp    1026a3 <__alltraps>

0010253b <vector226>:
.globl vector226
vector226:
  pushl $0
  10253b:	6a 00                	push   $0x0
  pushl $226
  10253d:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102542:	e9 5c 01 00 00       	jmp    1026a3 <__alltraps>

00102547 <vector227>:
.globl vector227
vector227:
  pushl $0
  102547:	6a 00                	push   $0x0
  pushl $227
  102549:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  10254e:	e9 50 01 00 00       	jmp    1026a3 <__alltraps>

00102553 <vector228>:
.globl vector228
vector228:
  pushl $0
  102553:	6a 00                	push   $0x0
  pushl $228
  102555:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  10255a:	e9 44 01 00 00       	jmp    1026a3 <__alltraps>

0010255f <vector229>:
.globl vector229
vector229:
  pushl $0
  10255f:	6a 00                	push   $0x0
  pushl $229
  102561:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102566:	e9 38 01 00 00       	jmp    1026a3 <__alltraps>

0010256b <vector230>:
.globl vector230
vector230:
  pushl $0
  10256b:	6a 00                	push   $0x0
  pushl $230
  10256d:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102572:	e9 2c 01 00 00       	jmp    1026a3 <__alltraps>

00102577 <vector231>:
.globl vector231
vector231:
  pushl $0
  102577:	6a 00                	push   $0x0
  pushl $231
  102579:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  10257e:	e9 20 01 00 00       	jmp    1026a3 <__alltraps>

00102583 <vector232>:
.globl vector232
vector232:
  pushl $0
  102583:	6a 00                	push   $0x0
  pushl $232
  102585:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10258a:	e9 14 01 00 00       	jmp    1026a3 <__alltraps>

0010258f <vector233>:
.globl vector233
vector233:
  pushl $0
  10258f:	6a 00                	push   $0x0
  pushl $233
  102591:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102596:	e9 08 01 00 00       	jmp    1026a3 <__alltraps>

0010259b <vector234>:
.globl vector234
vector234:
  pushl $0
  10259b:	6a 00                	push   $0x0
  pushl $234
  10259d:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1025a2:	e9 fc 00 00 00       	jmp    1026a3 <__alltraps>

001025a7 <vector235>:
.globl vector235
vector235:
  pushl $0
  1025a7:	6a 00                	push   $0x0
  pushl $235
  1025a9:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1025ae:	e9 f0 00 00 00       	jmp    1026a3 <__alltraps>

001025b3 <vector236>:
.globl vector236
vector236:
  pushl $0
  1025b3:	6a 00                	push   $0x0
  pushl $236
  1025b5:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1025ba:	e9 e4 00 00 00       	jmp    1026a3 <__alltraps>

001025bf <vector237>:
.globl vector237
vector237:
  pushl $0
  1025bf:	6a 00                	push   $0x0
  pushl $237
  1025c1:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1025c6:	e9 d8 00 00 00       	jmp    1026a3 <__alltraps>

001025cb <vector238>:
.globl vector238
vector238:
  pushl $0
  1025cb:	6a 00                	push   $0x0
  pushl $238
  1025cd:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1025d2:	e9 cc 00 00 00       	jmp    1026a3 <__alltraps>

001025d7 <vector239>:
.globl vector239
vector239:
  pushl $0
  1025d7:	6a 00                	push   $0x0
  pushl $239
  1025d9:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1025de:	e9 c0 00 00 00       	jmp    1026a3 <__alltraps>

001025e3 <vector240>:
.globl vector240
vector240:
  pushl $0
  1025e3:	6a 00                	push   $0x0
  pushl $240
  1025e5:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1025ea:	e9 b4 00 00 00       	jmp    1026a3 <__alltraps>

001025ef <vector241>:
.globl vector241
vector241:
  pushl $0
  1025ef:	6a 00                	push   $0x0
  pushl $241
  1025f1:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1025f6:	e9 a8 00 00 00       	jmp    1026a3 <__alltraps>

001025fb <vector242>:
.globl vector242
vector242:
  pushl $0
  1025fb:	6a 00                	push   $0x0
  pushl $242
  1025fd:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102602:	e9 9c 00 00 00       	jmp    1026a3 <__alltraps>

00102607 <vector243>:
.globl vector243
vector243:
  pushl $0
  102607:	6a 00                	push   $0x0
  pushl $243
  102609:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10260e:	e9 90 00 00 00       	jmp    1026a3 <__alltraps>

00102613 <vector244>:
.globl vector244
vector244:
  pushl $0
  102613:	6a 00                	push   $0x0
  pushl $244
  102615:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10261a:	e9 84 00 00 00       	jmp    1026a3 <__alltraps>

0010261f <vector245>:
.globl vector245
vector245:
  pushl $0
  10261f:	6a 00                	push   $0x0
  pushl $245
  102621:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102626:	e9 78 00 00 00       	jmp    1026a3 <__alltraps>

0010262b <vector246>:
.globl vector246
vector246:
  pushl $0
  10262b:	6a 00                	push   $0x0
  pushl $246
  10262d:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102632:	e9 6c 00 00 00       	jmp    1026a3 <__alltraps>

00102637 <vector247>:
.globl vector247
vector247:
  pushl $0
  102637:	6a 00                	push   $0x0
  pushl $247
  102639:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  10263e:	e9 60 00 00 00       	jmp    1026a3 <__alltraps>

00102643 <vector248>:
.globl vector248
vector248:
  pushl $0
  102643:	6a 00                	push   $0x0
  pushl $248
  102645:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  10264a:	e9 54 00 00 00       	jmp    1026a3 <__alltraps>

0010264f <vector249>:
.globl vector249
vector249:
  pushl $0
  10264f:	6a 00                	push   $0x0
  pushl $249
  102651:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102656:	e9 48 00 00 00       	jmp    1026a3 <__alltraps>

0010265b <vector250>:
.globl vector250
vector250:
  pushl $0
  10265b:	6a 00                	push   $0x0
  pushl $250
  10265d:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102662:	e9 3c 00 00 00       	jmp    1026a3 <__alltraps>

00102667 <vector251>:
.globl vector251
vector251:
  pushl $0
  102667:	6a 00                	push   $0x0
  pushl $251
  102669:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  10266e:	e9 30 00 00 00       	jmp    1026a3 <__alltraps>

00102673 <vector252>:
.globl vector252
vector252:
  pushl $0
  102673:	6a 00                	push   $0x0
  pushl $252
  102675:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10267a:	e9 24 00 00 00       	jmp    1026a3 <__alltraps>

0010267f <vector253>:
.globl vector253
vector253:
  pushl $0
  10267f:	6a 00                	push   $0x0
  pushl $253
  102681:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102686:	e9 18 00 00 00       	jmp    1026a3 <__alltraps>

0010268b <vector254>:
.globl vector254
vector254:
  pushl $0
  10268b:	6a 00                	push   $0x0
  pushl $254
  10268d:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102692:	e9 0c 00 00 00       	jmp    1026a3 <__alltraps>

00102697 <vector255>:
.globl vector255
vector255:
  pushl $0
  102697:	6a 00                	push   $0x0
  pushl $255
  102699:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10269e:	e9 00 00 00 00       	jmp    1026a3 <__alltraps>

001026a3 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  1026a3:	1e                   	push   %ds
    pushl %es
  1026a4:	06                   	push   %es
    pushl %fs
  1026a5:	0f a0                	push   %fs
    pushl %gs
  1026a7:	0f a8                	push   %gs
    pushal
  1026a9:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  1026aa:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  1026af:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  1026b1:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  1026b3:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  1026b4:	e8 63 f5 ff ff       	call   101c1c <trap>

    # pop the pushed stack pointer
    popl %esp
  1026b9:	5c                   	pop    %esp

001026ba <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  1026ba:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  1026bb:	0f a9                	pop    %gs
    popl %fs
  1026bd:	0f a1                	pop    %fs
    popl %es
  1026bf:	07                   	pop    %es
    popl %ds
  1026c0:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  1026c1:	83 c4 08             	add    $0x8,%esp
    iret
  1026c4:	cf                   	iret   

001026c5 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1026c5:	55                   	push   %ebp
  1026c6:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1026c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1026cb:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1026ce:	b8 23 00 00 00       	mov    $0x23,%eax
  1026d3:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1026d5:	b8 23 00 00 00       	mov    $0x23,%eax
  1026da:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1026dc:	b8 10 00 00 00       	mov    $0x10,%eax
  1026e1:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1026e3:	b8 10 00 00 00       	mov    $0x10,%eax
  1026e8:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1026ea:	b8 10 00 00 00       	mov    $0x10,%eax
  1026ef:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1026f1:	ea f8 26 10 00 08 00 	ljmp   $0x8,$0x1026f8
}
  1026f8:	90                   	nop
  1026f9:	5d                   	pop    %ebp
  1026fa:	c3                   	ret    

001026fb <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1026fb:	55                   	push   %ebp
  1026fc:	89 e5                	mov    %esp,%ebp
  1026fe:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102701:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  102706:	05 00 04 00 00       	add    $0x400,%eax
  10270b:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102710:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  102717:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102719:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102720:	68 00 
  102722:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102727:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  10272d:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102732:	c1 e8 10             	shr    $0x10,%eax
  102735:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  10273a:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102741:	83 e0 f0             	and    $0xfffffff0,%eax
  102744:	83 c8 09             	or     $0x9,%eax
  102747:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10274c:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102753:	83 c8 10             	or     $0x10,%eax
  102756:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10275b:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102762:	83 e0 9f             	and    $0xffffff9f,%eax
  102765:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10276a:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102771:	83 c8 80             	or     $0xffffff80,%eax
  102774:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102779:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102780:	83 e0 f0             	and    $0xfffffff0,%eax
  102783:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102788:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10278f:	83 e0 ef             	and    $0xffffffef,%eax
  102792:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102797:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10279e:	83 e0 df             	and    $0xffffffdf,%eax
  1027a1:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1027a6:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1027ad:	83 c8 40             	or     $0x40,%eax
  1027b0:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1027b5:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1027bc:	83 e0 7f             	and    $0x7f,%eax
  1027bf:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1027c4:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1027c9:	c1 e8 18             	shr    $0x18,%eax
  1027cc:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  1027d1:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1027d8:	83 e0 ef             	and    $0xffffffef,%eax
  1027db:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  1027e0:	68 10 ea 10 00       	push   $0x10ea10
  1027e5:	e8 db fe ff ff       	call   1026c5 <lgdt>
  1027ea:	83 c4 04             	add    $0x4,%esp
  1027ed:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  1027f3:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1027f7:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  1027fa:	90                   	nop
  1027fb:	c9                   	leave  
  1027fc:	c3                   	ret    

001027fd <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1027fd:	55                   	push   %ebp
  1027fe:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102800:	e8 f6 fe ff ff       	call   1026fb <gdt_init>
}
  102805:	90                   	nop
  102806:	5d                   	pop    %ebp
  102807:	c3                   	ret    

00102808 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102808:	55                   	push   %ebp
  102809:	89 e5                	mov    %esp,%ebp
  10280b:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10280e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102815:	eb 04                	jmp    10281b <strlen+0x13>
        cnt ++;
  102817:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (*s ++ != '\0') {
  10281b:	8b 45 08             	mov    0x8(%ebp),%eax
  10281e:	8d 50 01             	lea    0x1(%eax),%edx
  102821:	89 55 08             	mov    %edx,0x8(%ebp)
  102824:	0f b6 00             	movzbl (%eax),%eax
  102827:	84 c0                	test   %al,%al
  102829:	75 ec                	jne    102817 <strlen+0xf>
    }
    return cnt;
  10282b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10282e:	c9                   	leave  
  10282f:	c3                   	ret    

00102830 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102830:	55                   	push   %ebp
  102831:	89 e5                	mov    %esp,%ebp
  102833:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102836:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  10283d:	eb 04                	jmp    102843 <strnlen+0x13>
        cnt ++;
  10283f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102843:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102846:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102849:	73 10                	jae    10285b <strnlen+0x2b>
  10284b:	8b 45 08             	mov    0x8(%ebp),%eax
  10284e:	8d 50 01             	lea    0x1(%eax),%edx
  102851:	89 55 08             	mov    %edx,0x8(%ebp)
  102854:	0f b6 00             	movzbl (%eax),%eax
  102857:	84 c0                	test   %al,%al
  102859:	75 e4                	jne    10283f <strnlen+0xf>
    }
    return cnt;
  10285b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10285e:	c9                   	leave  
  10285f:	c3                   	ret    

00102860 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102860:	55                   	push   %ebp
  102861:	89 e5                	mov    %esp,%ebp
  102863:	57                   	push   %edi
  102864:	56                   	push   %esi
  102865:	83 ec 20             	sub    $0x20,%esp
  102868:	8b 45 08             	mov    0x8(%ebp),%eax
  10286b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10286e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102871:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102874:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102877:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10287a:	89 d1                	mov    %edx,%ecx
  10287c:	89 c2                	mov    %eax,%edx
  10287e:	89 ce                	mov    %ecx,%esi
  102880:	89 d7                	mov    %edx,%edi
  102882:	ac                   	lods   %ds:(%esi),%al
  102883:	aa                   	stos   %al,%es:(%edi)
  102884:	84 c0                	test   %al,%al
  102886:	75 fa                	jne    102882 <strcpy+0x22>
  102888:	89 fa                	mov    %edi,%edx
  10288a:	89 f1                	mov    %esi,%ecx
  10288c:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10288f:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102892:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102895:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102898:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102899:	83 c4 20             	add    $0x20,%esp
  10289c:	5e                   	pop    %esi
  10289d:	5f                   	pop    %edi
  10289e:	5d                   	pop    %ebp
  10289f:	c3                   	ret    

001028a0 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  1028a0:	55                   	push   %ebp
  1028a1:	89 e5                	mov    %esp,%ebp
  1028a3:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  1028a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1028a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  1028ac:	eb 21                	jmp    1028cf <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  1028ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028b1:	0f b6 10             	movzbl (%eax),%edx
  1028b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028b7:	88 10                	mov    %dl,(%eax)
  1028b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028bc:	0f b6 00             	movzbl (%eax),%eax
  1028bf:	84 c0                	test   %al,%al
  1028c1:	74 04                	je     1028c7 <strncpy+0x27>
            src ++;
  1028c3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  1028c7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1028cb:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    while (len > 0) {
  1028cf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1028d3:	75 d9                	jne    1028ae <strncpy+0xe>
    }
    return dst;
  1028d5:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1028d8:	c9                   	leave  
  1028d9:	c3                   	ret    

001028da <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  1028da:	55                   	push   %ebp
  1028db:	89 e5                	mov    %esp,%ebp
  1028dd:	57                   	push   %edi
  1028de:	56                   	push   %esi
  1028df:	83 ec 20             	sub    $0x20,%esp
  1028e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1028e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1028e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  1028ee:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1028f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028f4:	89 d1                	mov    %edx,%ecx
  1028f6:	89 c2                	mov    %eax,%edx
  1028f8:	89 ce                	mov    %ecx,%esi
  1028fa:	89 d7                	mov    %edx,%edi
  1028fc:	ac                   	lods   %ds:(%esi),%al
  1028fd:	ae                   	scas   %es:(%edi),%al
  1028fe:	75 08                	jne    102908 <strcmp+0x2e>
  102900:	84 c0                	test   %al,%al
  102902:	75 f8                	jne    1028fc <strcmp+0x22>
  102904:	31 c0                	xor    %eax,%eax
  102906:	eb 04                	jmp    10290c <strcmp+0x32>
  102908:	19 c0                	sbb    %eax,%eax
  10290a:	0c 01                	or     $0x1,%al
  10290c:	89 fa                	mov    %edi,%edx
  10290e:	89 f1                	mov    %esi,%ecx
  102910:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102913:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102916:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102919:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  10291c:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  10291d:	83 c4 20             	add    $0x20,%esp
  102920:	5e                   	pop    %esi
  102921:	5f                   	pop    %edi
  102922:	5d                   	pop    %ebp
  102923:	c3                   	ret    

00102924 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102924:	55                   	push   %ebp
  102925:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102927:	eb 0c                	jmp    102935 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102929:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10292d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102931:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102935:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102939:	74 1a                	je     102955 <strncmp+0x31>
  10293b:	8b 45 08             	mov    0x8(%ebp),%eax
  10293e:	0f b6 00             	movzbl (%eax),%eax
  102941:	84 c0                	test   %al,%al
  102943:	74 10                	je     102955 <strncmp+0x31>
  102945:	8b 45 08             	mov    0x8(%ebp),%eax
  102948:	0f b6 10             	movzbl (%eax),%edx
  10294b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10294e:	0f b6 00             	movzbl (%eax),%eax
  102951:	38 c2                	cmp    %al,%dl
  102953:	74 d4                	je     102929 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102955:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102959:	74 18                	je     102973 <strncmp+0x4f>
  10295b:	8b 45 08             	mov    0x8(%ebp),%eax
  10295e:	0f b6 00             	movzbl (%eax),%eax
  102961:	0f b6 d0             	movzbl %al,%edx
  102964:	8b 45 0c             	mov    0xc(%ebp),%eax
  102967:	0f b6 00             	movzbl (%eax),%eax
  10296a:	0f b6 c0             	movzbl %al,%eax
  10296d:	29 c2                	sub    %eax,%edx
  10296f:	89 d0                	mov    %edx,%eax
  102971:	eb 05                	jmp    102978 <strncmp+0x54>
  102973:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102978:	5d                   	pop    %ebp
  102979:	c3                   	ret    

0010297a <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  10297a:	55                   	push   %ebp
  10297b:	89 e5                	mov    %esp,%ebp
  10297d:	83 ec 04             	sub    $0x4,%esp
  102980:	8b 45 0c             	mov    0xc(%ebp),%eax
  102983:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102986:	eb 14                	jmp    10299c <strchr+0x22>
        if (*s == c) {
  102988:	8b 45 08             	mov    0x8(%ebp),%eax
  10298b:	0f b6 00             	movzbl (%eax),%eax
  10298e:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102991:	75 05                	jne    102998 <strchr+0x1e>
            return (char *)s;
  102993:	8b 45 08             	mov    0x8(%ebp),%eax
  102996:	eb 13                	jmp    1029ab <strchr+0x31>
        }
        s ++;
  102998:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  10299c:	8b 45 08             	mov    0x8(%ebp),%eax
  10299f:	0f b6 00             	movzbl (%eax),%eax
  1029a2:	84 c0                	test   %al,%al
  1029a4:	75 e2                	jne    102988 <strchr+0xe>
    }
    return NULL;
  1029a6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1029ab:	c9                   	leave  
  1029ac:	c3                   	ret    

001029ad <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1029ad:	55                   	push   %ebp
  1029ae:	89 e5                	mov    %esp,%ebp
  1029b0:	83 ec 04             	sub    $0x4,%esp
  1029b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029b6:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1029b9:	eb 0f                	jmp    1029ca <strfind+0x1d>
        if (*s == c) {
  1029bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1029be:	0f b6 00             	movzbl (%eax),%eax
  1029c1:	38 45 fc             	cmp    %al,-0x4(%ebp)
  1029c4:	74 10                	je     1029d6 <strfind+0x29>
            break;
        }
        s ++;
  1029c6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  1029ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1029cd:	0f b6 00             	movzbl (%eax),%eax
  1029d0:	84 c0                	test   %al,%al
  1029d2:	75 e7                	jne    1029bb <strfind+0xe>
  1029d4:	eb 01                	jmp    1029d7 <strfind+0x2a>
            break;
  1029d6:	90                   	nop
    }
    return (char *)s;
  1029d7:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1029da:	c9                   	leave  
  1029db:	c3                   	ret    

001029dc <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  1029dc:	55                   	push   %ebp
  1029dd:	89 e5                	mov    %esp,%ebp
  1029df:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  1029e2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  1029e9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1029f0:	eb 04                	jmp    1029f6 <strtol+0x1a>
        s ++;
  1029f2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  1029f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1029f9:	0f b6 00             	movzbl (%eax),%eax
  1029fc:	3c 20                	cmp    $0x20,%al
  1029fe:	74 f2                	je     1029f2 <strtol+0x16>
  102a00:	8b 45 08             	mov    0x8(%ebp),%eax
  102a03:	0f b6 00             	movzbl (%eax),%eax
  102a06:	3c 09                	cmp    $0x9,%al
  102a08:	74 e8                	je     1029f2 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  102a0a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a0d:	0f b6 00             	movzbl (%eax),%eax
  102a10:	3c 2b                	cmp    $0x2b,%al
  102a12:	75 06                	jne    102a1a <strtol+0x3e>
        s ++;
  102a14:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a18:	eb 15                	jmp    102a2f <strtol+0x53>
    }
    else if (*s == '-') {
  102a1a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a1d:	0f b6 00             	movzbl (%eax),%eax
  102a20:	3c 2d                	cmp    $0x2d,%al
  102a22:	75 0b                	jne    102a2f <strtol+0x53>
        s ++, neg = 1;
  102a24:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a28:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102a2f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a33:	74 06                	je     102a3b <strtol+0x5f>
  102a35:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102a39:	75 24                	jne    102a5f <strtol+0x83>
  102a3b:	8b 45 08             	mov    0x8(%ebp),%eax
  102a3e:	0f b6 00             	movzbl (%eax),%eax
  102a41:	3c 30                	cmp    $0x30,%al
  102a43:	75 1a                	jne    102a5f <strtol+0x83>
  102a45:	8b 45 08             	mov    0x8(%ebp),%eax
  102a48:	83 c0 01             	add    $0x1,%eax
  102a4b:	0f b6 00             	movzbl (%eax),%eax
  102a4e:	3c 78                	cmp    $0x78,%al
  102a50:	75 0d                	jne    102a5f <strtol+0x83>
        s += 2, base = 16;
  102a52:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102a56:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102a5d:	eb 2a                	jmp    102a89 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102a5f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a63:	75 17                	jne    102a7c <strtol+0xa0>
  102a65:	8b 45 08             	mov    0x8(%ebp),%eax
  102a68:	0f b6 00             	movzbl (%eax),%eax
  102a6b:	3c 30                	cmp    $0x30,%al
  102a6d:	75 0d                	jne    102a7c <strtol+0xa0>
        s ++, base = 8;
  102a6f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a73:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102a7a:	eb 0d                	jmp    102a89 <strtol+0xad>
    }
    else if (base == 0) {
  102a7c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a80:	75 07                	jne    102a89 <strtol+0xad>
        base = 10;
  102a82:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102a89:	8b 45 08             	mov    0x8(%ebp),%eax
  102a8c:	0f b6 00             	movzbl (%eax),%eax
  102a8f:	3c 2f                	cmp    $0x2f,%al
  102a91:	7e 1b                	jle    102aae <strtol+0xd2>
  102a93:	8b 45 08             	mov    0x8(%ebp),%eax
  102a96:	0f b6 00             	movzbl (%eax),%eax
  102a99:	3c 39                	cmp    $0x39,%al
  102a9b:	7f 11                	jg     102aae <strtol+0xd2>
            dig = *s - '0';
  102a9d:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa0:	0f b6 00             	movzbl (%eax),%eax
  102aa3:	0f be c0             	movsbl %al,%eax
  102aa6:	83 e8 30             	sub    $0x30,%eax
  102aa9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102aac:	eb 48                	jmp    102af6 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102aae:	8b 45 08             	mov    0x8(%ebp),%eax
  102ab1:	0f b6 00             	movzbl (%eax),%eax
  102ab4:	3c 60                	cmp    $0x60,%al
  102ab6:	7e 1b                	jle    102ad3 <strtol+0xf7>
  102ab8:	8b 45 08             	mov    0x8(%ebp),%eax
  102abb:	0f b6 00             	movzbl (%eax),%eax
  102abe:	3c 7a                	cmp    $0x7a,%al
  102ac0:	7f 11                	jg     102ad3 <strtol+0xf7>
            dig = *s - 'a' + 10;
  102ac2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac5:	0f b6 00             	movzbl (%eax),%eax
  102ac8:	0f be c0             	movsbl %al,%eax
  102acb:	83 e8 57             	sub    $0x57,%eax
  102ace:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ad1:	eb 23                	jmp    102af6 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102ad3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad6:	0f b6 00             	movzbl (%eax),%eax
  102ad9:	3c 40                	cmp    $0x40,%al
  102adb:	7e 3c                	jle    102b19 <strtol+0x13d>
  102add:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae0:	0f b6 00             	movzbl (%eax),%eax
  102ae3:	3c 5a                	cmp    $0x5a,%al
  102ae5:	7f 32                	jg     102b19 <strtol+0x13d>
            dig = *s - 'A' + 10;
  102ae7:	8b 45 08             	mov    0x8(%ebp),%eax
  102aea:	0f b6 00             	movzbl (%eax),%eax
  102aed:	0f be c0             	movsbl %al,%eax
  102af0:	83 e8 37             	sub    $0x37,%eax
  102af3:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102af6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102af9:	3b 45 10             	cmp    0x10(%ebp),%eax
  102afc:	7d 1a                	jge    102b18 <strtol+0x13c>
            break;
        }
        s ++, val = (val * base) + dig;
  102afe:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102b02:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b05:	0f af 45 10          	imul   0x10(%ebp),%eax
  102b09:	89 c2                	mov    %eax,%edx
  102b0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b0e:	01 d0                	add    %edx,%eax
  102b10:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102b13:	e9 71 ff ff ff       	jmp    102a89 <strtol+0xad>
            break;
  102b18:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102b19:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102b1d:	74 08                	je     102b27 <strtol+0x14b>
        *endptr = (char *) s;
  102b1f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b22:	8b 55 08             	mov    0x8(%ebp),%edx
  102b25:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102b27:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102b2b:	74 07                	je     102b34 <strtol+0x158>
  102b2d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b30:	f7 d8                	neg    %eax
  102b32:	eb 03                	jmp    102b37 <strtol+0x15b>
  102b34:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102b37:	c9                   	leave  
  102b38:	c3                   	ret    

00102b39 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102b39:	55                   	push   %ebp
  102b3a:	89 e5                	mov    %esp,%ebp
  102b3c:	57                   	push   %edi
  102b3d:	83 ec 24             	sub    $0x24,%esp
  102b40:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b43:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102b46:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102b4a:	8b 55 08             	mov    0x8(%ebp),%edx
  102b4d:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102b50:	88 45 f7             	mov    %al,-0x9(%ebp)
  102b53:	8b 45 10             	mov    0x10(%ebp),%eax
  102b56:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102b59:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102b5c:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102b60:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102b63:	89 d7                	mov    %edx,%edi
  102b65:	f3 aa                	rep stos %al,%es:(%edi)
  102b67:	89 fa                	mov    %edi,%edx
  102b69:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b6c:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102b6f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b72:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102b73:	83 c4 24             	add    $0x24,%esp
  102b76:	5f                   	pop    %edi
  102b77:	5d                   	pop    %ebp
  102b78:	c3                   	ret    

00102b79 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102b79:	55                   	push   %ebp
  102b7a:	89 e5                	mov    %esp,%ebp
  102b7c:	57                   	push   %edi
  102b7d:	56                   	push   %esi
  102b7e:	53                   	push   %ebx
  102b7f:	83 ec 30             	sub    $0x30,%esp
  102b82:	8b 45 08             	mov    0x8(%ebp),%eax
  102b85:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b88:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b8b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b8e:	8b 45 10             	mov    0x10(%ebp),%eax
  102b91:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102b94:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b97:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102b9a:	73 42                	jae    102bde <memmove+0x65>
  102b9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b9f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102ba2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ba5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102ba8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102bab:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102bae:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102bb1:	c1 e8 02             	shr    $0x2,%eax
  102bb4:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102bb6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102bb9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102bbc:	89 d7                	mov    %edx,%edi
  102bbe:	89 c6                	mov    %eax,%esi
  102bc0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102bc2:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102bc5:	83 e1 03             	and    $0x3,%ecx
  102bc8:	74 02                	je     102bcc <memmove+0x53>
  102bca:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102bcc:	89 f0                	mov    %esi,%eax
  102bce:	89 fa                	mov    %edi,%edx
  102bd0:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102bd3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102bd6:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102bd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102bdc:	eb 36                	jmp    102c14 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102bde:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102be1:	8d 50 ff             	lea    -0x1(%eax),%edx
  102be4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102be7:	01 c2                	add    %eax,%edx
  102be9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102bec:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102bef:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bf2:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102bf5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102bf8:	89 c1                	mov    %eax,%ecx
  102bfa:	89 d8                	mov    %ebx,%eax
  102bfc:	89 d6                	mov    %edx,%esi
  102bfe:	89 c7                	mov    %eax,%edi
  102c00:	fd                   	std    
  102c01:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102c03:	fc                   	cld    
  102c04:	89 f8                	mov    %edi,%eax
  102c06:	89 f2                	mov    %esi,%edx
  102c08:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102c0b:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102c0e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102c11:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102c14:	83 c4 30             	add    $0x30,%esp
  102c17:	5b                   	pop    %ebx
  102c18:	5e                   	pop    %esi
  102c19:	5f                   	pop    %edi
  102c1a:	5d                   	pop    %ebp
  102c1b:	c3                   	ret    

00102c1c <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102c1c:	55                   	push   %ebp
  102c1d:	89 e5                	mov    %esp,%ebp
  102c1f:	57                   	push   %edi
  102c20:	56                   	push   %esi
  102c21:	83 ec 20             	sub    $0x20,%esp
  102c24:	8b 45 08             	mov    0x8(%ebp),%eax
  102c27:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c2a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c30:	8b 45 10             	mov    0x10(%ebp),%eax
  102c33:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102c36:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c39:	c1 e8 02             	shr    $0x2,%eax
  102c3c:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102c3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c41:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c44:	89 d7                	mov    %edx,%edi
  102c46:	89 c6                	mov    %eax,%esi
  102c48:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102c4a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102c4d:	83 e1 03             	and    $0x3,%ecx
  102c50:	74 02                	je     102c54 <memcpy+0x38>
  102c52:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102c54:	89 f0                	mov    %esi,%eax
  102c56:	89 fa                	mov    %edi,%edx
  102c58:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102c5b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102c5e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102c61:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102c64:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102c65:	83 c4 20             	add    $0x20,%esp
  102c68:	5e                   	pop    %esi
  102c69:	5f                   	pop    %edi
  102c6a:	5d                   	pop    %ebp
  102c6b:	c3                   	ret    

00102c6c <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102c6c:	55                   	push   %ebp
  102c6d:	89 e5                	mov    %esp,%ebp
  102c6f:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102c72:	8b 45 08             	mov    0x8(%ebp),%eax
  102c75:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102c78:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c7b:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102c7e:	eb 30                	jmp    102cb0 <memcmp+0x44>
        if (*s1 != *s2) {
  102c80:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c83:	0f b6 10             	movzbl (%eax),%edx
  102c86:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c89:	0f b6 00             	movzbl (%eax),%eax
  102c8c:	38 c2                	cmp    %al,%dl
  102c8e:	74 18                	je     102ca8 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102c90:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c93:	0f b6 00             	movzbl (%eax),%eax
  102c96:	0f b6 d0             	movzbl %al,%edx
  102c99:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c9c:	0f b6 00             	movzbl (%eax),%eax
  102c9f:	0f b6 c0             	movzbl %al,%eax
  102ca2:	29 c2                	sub    %eax,%edx
  102ca4:	89 d0                	mov    %edx,%eax
  102ca6:	eb 1a                	jmp    102cc2 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102ca8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102cac:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    while (n -- > 0) {
  102cb0:	8b 45 10             	mov    0x10(%ebp),%eax
  102cb3:	8d 50 ff             	lea    -0x1(%eax),%edx
  102cb6:	89 55 10             	mov    %edx,0x10(%ebp)
  102cb9:	85 c0                	test   %eax,%eax
  102cbb:	75 c3                	jne    102c80 <memcmp+0x14>
    }
    return 0;
  102cbd:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102cc2:	c9                   	leave  
  102cc3:	c3                   	ret    

00102cc4 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102cc4:	55                   	push   %ebp
  102cc5:	89 e5                	mov    %esp,%ebp
  102cc7:	83 ec 38             	sub    $0x38,%esp
  102cca:	8b 45 10             	mov    0x10(%ebp),%eax
  102ccd:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102cd0:	8b 45 14             	mov    0x14(%ebp),%eax
  102cd3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102cd6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102cd9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102cdc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102cdf:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102ce2:	8b 45 18             	mov    0x18(%ebp),%eax
  102ce5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102ce8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ceb:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102cee:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102cf1:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102cf4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cfa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102cfe:	74 1c                	je     102d1c <printnum+0x58>
  102d00:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d03:	ba 00 00 00 00       	mov    $0x0,%edx
  102d08:	f7 75 e4             	divl   -0x1c(%ebp)
  102d0b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102d0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d11:	ba 00 00 00 00       	mov    $0x0,%edx
  102d16:	f7 75 e4             	divl   -0x1c(%ebp)
  102d19:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d1c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d1f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d22:	f7 75 e4             	divl   -0x1c(%ebp)
  102d25:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102d28:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102d2b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d2e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102d31:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d34:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102d37:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102d3a:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102d3d:	8b 45 18             	mov    0x18(%ebp),%eax
  102d40:	ba 00 00 00 00       	mov    $0x0,%edx
  102d45:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  102d48:	72 41                	jb     102d8b <printnum+0xc7>
  102d4a:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  102d4d:	77 05                	ja     102d54 <printnum+0x90>
  102d4f:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102d52:	72 37                	jb     102d8b <printnum+0xc7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102d54:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102d57:	83 e8 01             	sub    $0x1,%eax
  102d5a:	83 ec 04             	sub    $0x4,%esp
  102d5d:	ff 75 20             	pushl  0x20(%ebp)
  102d60:	50                   	push   %eax
  102d61:	ff 75 18             	pushl  0x18(%ebp)
  102d64:	ff 75 ec             	pushl  -0x14(%ebp)
  102d67:	ff 75 e8             	pushl  -0x18(%ebp)
  102d6a:	ff 75 0c             	pushl  0xc(%ebp)
  102d6d:	ff 75 08             	pushl  0x8(%ebp)
  102d70:	e8 4f ff ff ff       	call   102cc4 <printnum>
  102d75:	83 c4 20             	add    $0x20,%esp
  102d78:	eb 1b                	jmp    102d95 <printnum+0xd1>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102d7a:	83 ec 08             	sub    $0x8,%esp
  102d7d:	ff 75 0c             	pushl  0xc(%ebp)
  102d80:	ff 75 20             	pushl  0x20(%ebp)
  102d83:	8b 45 08             	mov    0x8(%ebp),%eax
  102d86:	ff d0                	call   *%eax
  102d88:	83 c4 10             	add    $0x10,%esp
        while (-- width > 0)
  102d8b:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102d8f:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102d93:	7f e5                	jg     102d7a <printnum+0xb6>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102d95:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102d98:	05 30 3a 10 00       	add    $0x103a30,%eax
  102d9d:	0f b6 00             	movzbl (%eax),%eax
  102da0:	0f be c0             	movsbl %al,%eax
  102da3:	83 ec 08             	sub    $0x8,%esp
  102da6:	ff 75 0c             	pushl  0xc(%ebp)
  102da9:	50                   	push   %eax
  102daa:	8b 45 08             	mov    0x8(%ebp),%eax
  102dad:	ff d0                	call   *%eax
  102daf:	83 c4 10             	add    $0x10,%esp
}
  102db2:	90                   	nop
  102db3:	c9                   	leave  
  102db4:	c3                   	ret    

00102db5 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102db5:	55                   	push   %ebp
  102db6:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102db8:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102dbc:	7e 14                	jle    102dd2 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102dbe:	8b 45 08             	mov    0x8(%ebp),%eax
  102dc1:	8b 00                	mov    (%eax),%eax
  102dc3:	8d 48 08             	lea    0x8(%eax),%ecx
  102dc6:	8b 55 08             	mov    0x8(%ebp),%edx
  102dc9:	89 0a                	mov    %ecx,(%edx)
  102dcb:	8b 50 04             	mov    0x4(%eax),%edx
  102dce:	8b 00                	mov    (%eax),%eax
  102dd0:	eb 30                	jmp    102e02 <getuint+0x4d>
    }
    else if (lflag) {
  102dd2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102dd6:	74 16                	je     102dee <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102dd8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ddb:	8b 00                	mov    (%eax),%eax
  102ddd:	8d 48 04             	lea    0x4(%eax),%ecx
  102de0:	8b 55 08             	mov    0x8(%ebp),%edx
  102de3:	89 0a                	mov    %ecx,(%edx)
  102de5:	8b 00                	mov    (%eax),%eax
  102de7:	ba 00 00 00 00       	mov    $0x0,%edx
  102dec:	eb 14                	jmp    102e02 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102dee:	8b 45 08             	mov    0x8(%ebp),%eax
  102df1:	8b 00                	mov    (%eax),%eax
  102df3:	8d 48 04             	lea    0x4(%eax),%ecx
  102df6:	8b 55 08             	mov    0x8(%ebp),%edx
  102df9:	89 0a                	mov    %ecx,(%edx)
  102dfb:	8b 00                	mov    (%eax),%eax
  102dfd:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102e02:	5d                   	pop    %ebp
  102e03:	c3                   	ret    

00102e04 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102e04:	55                   	push   %ebp
  102e05:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102e07:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102e0b:	7e 14                	jle    102e21 <getint+0x1d>
        return va_arg(*ap, long long);
  102e0d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e10:	8b 00                	mov    (%eax),%eax
  102e12:	8d 48 08             	lea    0x8(%eax),%ecx
  102e15:	8b 55 08             	mov    0x8(%ebp),%edx
  102e18:	89 0a                	mov    %ecx,(%edx)
  102e1a:	8b 50 04             	mov    0x4(%eax),%edx
  102e1d:	8b 00                	mov    (%eax),%eax
  102e1f:	eb 28                	jmp    102e49 <getint+0x45>
    }
    else if (lflag) {
  102e21:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102e25:	74 12                	je     102e39 <getint+0x35>
        return va_arg(*ap, long);
  102e27:	8b 45 08             	mov    0x8(%ebp),%eax
  102e2a:	8b 00                	mov    (%eax),%eax
  102e2c:	8d 48 04             	lea    0x4(%eax),%ecx
  102e2f:	8b 55 08             	mov    0x8(%ebp),%edx
  102e32:	89 0a                	mov    %ecx,(%edx)
  102e34:	8b 00                	mov    (%eax),%eax
  102e36:	99                   	cltd   
  102e37:	eb 10                	jmp    102e49 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102e39:	8b 45 08             	mov    0x8(%ebp),%eax
  102e3c:	8b 00                	mov    (%eax),%eax
  102e3e:	8d 48 04             	lea    0x4(%eax),%ecx
  102e41:	8b 55 08             	mov    0x8(%ebp),%edx
  102e44:	89 0a                	mov    %ecx,(%edx)
  102e46:	8b 00                	mov    (%eax),%eax
  102e48:	99                   	cltd   
    }
}
  102e49:	5d                   	pop    %ebp
  102e4a:	c3                   	ret    

00102e4b <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102e4b:	55                   	push   %ebp
  102e4c:	89 e5                	mov    %esp,%ebp
  102e4e:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  102e51:	8d 45 14             	lea    0x14(%ebp),%eax
  102e54:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102e57:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e5a:	50                   	push   %eax
  102e5b:	ff 75 10             	pushl  0x10(%ebp)
  102e5e:	ff 75 0c             	pushl  0xc(%ebp)
  102e61:	ff 75 08             	pushl  0x8(%ebp)
  102e64:	e8 06 00 00 00       	call   102e6f <vprintfmt>
  102e69:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  102e6c:	90                   	nop
  102e6d:	c9                   	leave  
  102e6e:	c3                   	ret    

00102e6f <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102e6f:	55                   	push   %ebp
  102e70:	89 e5                	mov    %esp,%ebp
  102e72:	56                   	push   %esi
  102e73:	53                   	push   %ebx
  102e74:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e77:	eb 17                	jmp    102e90 <vprintfmt+0x21>
            if (ch == '\0') {
  102e79:	85 db                	test   %ebx,%ebx
  102e7b:	0f 84 8e 03 00 00    	je     10320f <vprintfmt+0x3a0>
                return;
            }
            putch(ch, putdat);
  102e81:	83 ec 08             	sub    $0x8,%esp
  102e84:	ff 75 0c             	pushl  0xc(%ebp)
  102e87:	53                   	push   %ebx
  102e88:	8b 45 08             	mov    0x8(%ebp),%eax
  102e8b:	ff d0                	call   *%eax
  102e8d:	83 c4 10             	add    $0x10,%esp
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e90:	8b 45 10             	mov    0x10(%ebp),%eax
  102e93:	8d 50 01             	lea    0x1(%eax),%edx
  102e96:	89 55 10             	mov    %edx,0x10(%ebp)
  102e99:	0f b6 00             	movzbl (%eax),%eax
  102e9c:	0f b6 d8             	movzbl %al,%ebx
  102e9f:	83 fb 25             	cmp    $0x25,%ebx
  102ea2:	75 d5                	jne    102e79 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102ea4:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102ea8:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102eaf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102eb2:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102eb5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102ebc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102ebf:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102ec2:	8b 45 10             	mov    0x10(%ebp),%eax
  102ec5:	8d 50 01             	lea    0x1(%eax),%edx
  102ec8:	89 55 10             	mov    %edx,0x10(%ebp)
  102ecb:	0f b6 00             	movzbl (%eax),%eax
  102ece:	0f b6 d8             	movzbl %al,%ebx
  102ed1:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102ed4:	83 f8 55             	cmp    $0x55,%eax
  102ed7:	0f 87 05 03 00 00    	ja     1031e2 <vprintfmt+0x373>
  102edd:	8b 04 85 54 3a 10 00 	mov    0x103a54(,%eax,4),%eax
  102ee4:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102ee6:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102eea:	eb d6                	jmp    102ec2 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102eec:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102ef0:	eb d0                	jmp    102ec2 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102ef2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102ef9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102efc:	89 d0                	mov    %edx,%eax
  102efe:	c1 e0 02             	shl    $0x2,%eax
  102f01:	01 d0                	add    %edx,%eax
  102f03:	01 c0                	add    %eax,%eax
  102f05:	01 d8                	add    %ebx,%eax
  102f07:	83 e8 30             	sub    $0x30,%eax
  102f0a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102f0d:	8b 45 10             	mov    0x10(%ebp),%eax
  102f10:	0f b6 00             	movzbl (%eax),%eax
  102f13:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102f16:	83 fb 2f             	cmp    $0x2f,%ebx
  102f19:	7e 39                	jle    102f54 <vprintfmt+0xe5>
  102f1b:	83 fb 39             	cmp    $0x39,%ebx
  102f1e:	7f 34                	jg     102f54 <vprintfmt+0xe5>
            for (precision = 0; ; ++ fmt) {
  102f20:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102f24:	eb d3                	jmp    102ef9 <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102f26:	8b 45 14             	mov    0x14(%ebp),%eax
  102f29:	8d 50 04             	lea    0x4(%eax),%edx
  102f2c:	89 55 14             	mov    %edx,0x14(%ebp)
  102f2f:	8b 00                	mov    (%eax),%eax
  102f31:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102f34:	eb 1f                	jmp    102f55 <vprintfmt+0xe6>

        case '.':
            if (width < 0)
  102f36:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f3a:	79 86                	jns    102ec2 <vprintfmt+0x53>
                width = 0;
  102f3c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102f43:	e9 7a ff ff ff       	jmp    102ec2 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102f48:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102f4f:	e9 6e ff ff ff       	jmp    102ec2 <vprintfmt+0x53>
            goto process_precision;
  102f54:	90                   	nop

        process_precision:
            if (width < 0)
  102f55:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f59:	0f 89 63 ff ff ff    	jns    102ec2 <vprintfmt+0x53>
                width = precision, precision = -1;
  102f5f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102f62:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f65:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102f6c:	e9 51 ff ff ff       	jmp    102ec2 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102f71:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102f75:	e9 48 ff ff ff       	jmp    102ec2 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102f7a:	8b 45 14             	mov    0x14(%ebp),%eax
  102f7d:	8d 50 04             	lea    0x4(%eax),%edx
  102f80:	89 55 14             	mov    %edx,0x14(%ebp)
  102f83:	8b 00                	mov    (%eax),%eax
  102f85:	83 ec 08             	sub    $0x8,%esp
  102f88:	ff 75 0c             	pushl  0xc(%ebp)
  102f8b:	50                   	push   %eax
  102f8c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f8f:	ff d0                	call   *%eax
  102f91:	83 c4 10             	add    $0x10,%esp
            break;
  102f94:	e9 71 02 00 00       	jmp    10320a <vprintfmt+0x39b>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102f99:	8b 45 14             	mov    0x14(%ebp),%eax
  102f9c:	8d 50 04             	lea    0x4(%eax),%edx
  102f9f:	89 55 14             	mov    %edx,0x14(%ebp)
  102fa2:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102fa4:	85 db                	test   %ebx,%ebx
  102fa6:	79 02                	jns    102faa <vprintfmt+0x13b>
                err = -err;
  102fa8:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102faa:	83 fb 06             	cmp    $0x6,%ebx
  102fad:	7f 0b                	jg     102fba <vprintfmt+0x14b>
  102faf:	8b 34 9d 14 3a 10 00 	mov    0x103a14(,%ebx,4),%esi
  102fb6:	85 f6                	test   %esi,%esi
  102fb8:	75 19                	jne    102fd3 <vprintfmt+0x164>
                printfmt(putch, putdat, "error %d", err);
  102fba:	53                   	push   %ebx
  102fbb:	68 41 3a 10 00       	push   $0x103a41
  102fc0:	ff 75 0c             	pushl  0xc(%ebp)
  102fc3:	ff 75 08             	pushl  0x8(%ebp)
  102fc6:	e8 80 fe ff ff       	call   102e4b <printfmt>
  102fcb:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102fce:	e9 37 02 00 00       	jmp    10320a <vprintfmt+0x39b>
                printfmt(putch, putdat, "%s", p);
  102fd3:	56                   	push   %esi
  102fd4:	68 4a 3a 10 00       	push   $0x103a4a
  102fd9:	ff 75 0c             	pushl  0xc(%ebp)
  102fdc:	ff 75 08             	pushl  0x8(%ebp)
  102fdf:	e8 67 fe ff ff       	call   102e4b <printfmt>
  102fe4:	83 c4 10             	add    $0x10,%esp
            break;
  102fe7:	e9 1e 02 00 00       	jmp    10320a <vprintfmt+0x39b>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102fec:	8b 45 14             	mov    0x14(%ebp),%eax
  102fef:	8d 50 04             	lea    0x4(%eax),%edx
  102ff2:	89 55 14             	mov    %edx,0x14(%ebp)
  102ff5:	8b 30                	mov    (%eax),%esi
  102ff7:	85 f6                	test   %esi,%esi
  102ff9:	75 05                	jne    103000 <vprintfmt+0x191>
                p = "(null)";
  102ffb:	be 4d 3a 10 00       	mov    $0x103a4d,%esi
            }
            if (width > 0 && padc != '-') {
  103000:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103004:	7e 76                	jle    10307c <vprintfmt+0x20d>
  103006:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  10300a:	74 70                	je     10307c <vprintfmt+0x20d>
                for (width -= strnlen(p, precision); width > 0; width --) {
  10300c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10300f:	83 ec 08             	sub    $0x8,%esp
  103012:	50                   	push   %eax
  103013:	56                   	push   %esi
  103014:	e8 17 f8 ff ff       	call   102830 <strnlen>
  103019:	83 c4 10             	add    $0x10,%esp
  10301c:	89 c2                	mov    %eax,%edx
  10301e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103021:	29 d0                	sub    %edx,%eax
  103023:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103026:	eb 17                	jmp    10303f <vprintfmt+0x1d0>
                    putch(padc, putdat);
  103028:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  10302c:	83 ec 08             	sub    $0x8,%esp
  10302f:	ff 75 0c             	pushl  0xc(%ebp)
  103032:	50                   	push   %eax
  103033:	8b 45 08             	mov    0x8(%ebp),%eax
  103036:	ff d0                	call   *%eax
  103038:	83 c4 10             	add    $0x10,%esp
                for (width -= strnlen(p, precision); width > 0; width --) {
  10303b:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  10303f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103043:	7f e3                	jg     103028 <vprintfmt+0x1b9>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103045:	eb 35                	jmp    10307c <vprintfmt+0x20d>
                if (altflag && (ch < ' ' || ch > '~')) {
  103047:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  10304b:	74 1c                	je     103069 <vprintfmt+0x1fa>
  10304d:	83 fb 1f             	cmp    $0x1f,%ebx
  103050:	7e 05                	jle    103057 <vprintfmt+0x1e8>
  103052:	83 fb 7e             	cmp    $0x7e,%ebx
  103055:	7e 12                	jle    103069 <vprintfmt+0x1fa>
                    putch('?', putdat);
  103057:	83 ec 08             	sub    $0x8,%esp
  10305a:	ff 75 0c             	pushl  0xc(%ebp)
  10305d:	6a 3f                	push   $0x3f
  10305f:	8b 45 08             	mov    0x8(%ebp),%eax
  103062:	ff d0                	call   *%eax
  103064:	83 c4 10             	add    $0x10,%esp
  103067:	eb 0f                	jmp    103078 <vprintfmt+0x209>
                }
                else {
                    putch(ch, putdat);
  103069:	83 ec 08             	sub    $0x8,%esp
  10306c:	ff 75 0c             	pushl  0xc(%ebp)
  10306f:	53                   	push   %ebx
  103070:	8b 45 08             	mov    0x8(%ebp),%eax
  103073:	ff d0                	call   *%eax
  103075:	83 c4 10             	add    $0x10,%esp
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103078:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  10307c:	89 f0                	mov    %esi,%eax
  10307e:	8d 70 01             	lea    0x1(%eax),%esi
  103081:	0f b6 00             	movzbl (%eax),%eax
  103084:	0f be d8             	movsbl %al,%ebx
  103087:	85 db                	test   %ebx,%ebx
  103089:	74 26                	je     1030b1 <vprintfmt+0x242>
  10308b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10308f:	78 b6                	js     103047 <vprintfmt+0x1d8>
  103091:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  103095:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103099:	79 ac                	jns    103047 <vprintfmt+0x1d8>
                }
            }
            for (; width > 0; width --) {
  10309b:	eb 14                	jmp    1030b1 <vprintfmt+0x242>
                putch(' ', putdat);
  10309d:	83 ec 08             	sub    $0x8,%esp
  1030a0:	ff 75 0c             	pushl  0xc(%ebp)
  1030a3:	6a 20                	push   $0x20
  1030a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a8:	ff d0                	call   *%eax
  1030aa:	83 c4 10             	add    $0x10,%esp
            for (; width > 0; width --) {
  1030ad:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1030b1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1030b5:	7f e6                	jg     10309d <vprintfmt+0x22e>
            }
            break;
  1030b7:	e9 4e 01 00 00       	jmp    10320a <vprintfmt+0x39b>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  1030bc:	83 ec 08             	sub    $0x8,%esp
  1030bf:	ff 75 e0             	pushl  -0x20(%ebp)
  1030c2:	8d 45 14             	lea    0x14(%ebp),%eax
  1030c5:	50                   	push   %eax
  1030c6:	e8 39 fd ff ff       	call   102e04 <getint>
  1030cb:	83 c4 10             	add    $0x10,%esp
  1030ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030d1:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1030d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030da:	85 d2                	test   %edx,%edx
  1030dc:	79 23                	jns    103101 <vprintfmt+0x292>
                putch('-', putdat);
  1030de:	83 ec 08             	sub    $0x8,%esp
  1030e1:	ff 75 0c             	pushl  0xc(%ebp)
  1030e4:	6a 2d                	push   $0x2d
  1030e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e9:	ff d0                	call   *%eax
  1030eb:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  1030ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030f4:	f7 d8                	neg    %eax
  1030f6:	83 d2 00             	adc    $0x0,%edx
  1030f9:	f7 da                	neg    %edx
  1030fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030fe:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103101:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103108:	e9 9f 00 00 00       	jmp    1031ac <vprintfmt+0x33d>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  10310d:	83 ec 08             	sub    $0x8,%esp
  103110:	ff 75 e0             	pushl  -0x20(%ebp)
  103113:	8d 45 14             	lea    0x14(%ebp),%eax
  103116:	50                   	push   %eax
  103117:	e8 99 fc ff ff       	call   102db5 <getuint>
  10311c:	83 c4 10             	add    $0x10,%esp
  10311f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103122:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103125:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10312c:	eb 7e                	jmp    1031ac <vprintfmt+0x33d>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  10312e:	83 ec 08             	sub    $0x8,%esp
  103131:	ff 75 e0             	pushl  -0x20(%ebp)
  103134:	8d 45 14             	lea    0x14(%ebp),%eax
  103137:	50                   	push   %eax
  103138:	e8 78 fc ff ff       	call   102db5 <getuint>
  10313d:	83 c4 10             	add    $0x10,%esp
  103140:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103143:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103146:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  10314d:	eb 5d                	jmp    1031ac <vprintfmt+0x33d>

        // pointer
        case 'p':
            putch('0', putdat);
  10314f:	83 ec 08             	sub    $0x8,%esp
  103152:	ff 75 0c             	pushl  0xc(%ebp)
  103155:	6a 30                	push   $0x30
  103157:	8b 45 08             	mov    0x8(%ebp),%eax
  10315a:	ff d0                	call   *%eax
  10315c:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  10315f:	83 ec 08             	sub    $0x8,%esp
  103162:	ff 75 0c             	pushl  0xc(%ebp)
  103165:	6a 78                	push   $0x78
  103167:	8b 45 08             	mov    0x8(%ebp),%eax
  10316a:	ff d0                	call   *%eax
  10316c:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  10316f:	8b 45 14             	mov    0x14(%ebp),%eax
  103172:	8d 50 04             	lea    0x4(%eax),%edx
  103175:	89 55 14             	mov    %edx,0x14(%ebp)
  103178:	8b 00                	mov    (%eax),%eax
  10317a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10317d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103184:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  10318b:	eb 1f                	jmp    1031ac <vprintfmt+0x33d>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  10318d:	83 ec 08             	sub    $0x8,%esp
  103190:	ff 75 e0             	pushl  -0x20(%ebp)
  103193:	8d 45 14             	lea    0x14(%ebp),%eax
  103196:	50                   	push   %eax
  103197:	e8 19 fc ff ff       	call   102db5 <getuint>
  10319c:	83 c4 10             	add    $0x10,%esp
  10319f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031a2:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1031a5:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1031ac:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1031b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031b3:	83 ec 04             	sub    $0x4,%esp
  1031b6:	52                   	push   %edx
  1031b7:	ff 75 e8             	pushl  -0x18(%ebp)
  1031ba:	50                   	push   %eax
  1031bb:	ff 75 f4             	pushl  -0xc(%ebp)
  1031be:	ff 75 f0             	pushl  -0x10(%ebp)
  1031c1:	ff 75 0c             	pushl  0xc(%ebp)
  1031c4:	ff 75 08             	pushl  0x8(%ebp)
  1031c7:	e8 f8 fa ff ff       	call   102cc4 <printnum>
  1031cc:	83 c4 20             	add    $0x20,%esp
            break;
  1031cf:	eb 39                	jmp    10320a <vprintfmt+0x39b>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1031d1:	83 ec 08             	sub    $0x8,%esp
  1031d4:	ff 75 0c             	pushl  0xc(%ebp)
  1031d7:	53                   	push   %ebx
  1031d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1031db:	ff d0                	call   *%eax
  1031dd:	83 c4 10             	add    $0x10,%esp
            break;
  1031e0:	eb 28                	jmp    10320a <vprintfmt+0x39b>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1031e2:	83 ec 08             	sub    $0x8,%esp
  1031e5:	ff 75 0c             	pushl  0xc(%ebp)
  1031e8:	6a 25                	push   $0x25
  1031ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ed:	ff d0                	call   *%eax
  1031ef:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  1031f2:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1031f6:	eb 04                	jmp    1031fc <vprintfmt+0x38d>
  1031f8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1031fc:	8b 45 10             	mov    0x10(%ebp),%eax
  1031ff:	83 e8 01             	sub    $0x1,%eax
  103202:	0f b6 00             	movzbl (%eax),%eax
  103205:	3c 25                	cmp    $0x25,%al
  103207:	75 ef                	jne    1031f8 <vprintfmt+0x389>
                /* do nothing */;
            break;
  103209:	90                   	nop
    while (1) {
  10320a:	e9 68 fc ff ff       	jmp    102e77 <vprintfmt+0x8>
                return;
  10320f:	90                   	nop
        }
    }
}
  103210:	8d 65 f8             	lea    -0x8(%ebp),%esp
  103213:	5b                   	pop    %ebx
  103214:	5e                   	pop    %esi
  103215:	5d                   	pop    %ebp
  103216:	c3                   	ret    

00103217 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103217:	55                   	push   %ebp
  103218:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  10321a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10321d:	8b 40 08             	mov    0x8(%eax),%eax
  103220:	8d 50 01             	lea    0x1(%eax),%edx
  103223:	8b 45 0c             	mov    0xc(%ebp),%eax
  103226:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103229:	8b 45 0c             	mov    0xc(%ebp),%eax
  10322c:	8b 10                	mov    (%eax),%edx
  10322e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103231:	8b 40 04             	mov    0x4(%eax),%eax
  103234:	39 c2                	cmp    %eax,%edx
  103236:	73 12                	jae    10324a <sprintputch+0x33>
        *b->buf ++ = ch;
  103238:	8b 45 0c             	mov    0xc(%ebp),%eax
  10323b:	8b 00                	mov    (%eax),%eax
  10323d:	8d 48 01             	lea    0x1(%eax),%ecx
  103240:	8b 55 0c             	mov    0xc(%ebp),%edx
  103243:	89 0a                	mov    %ecx,(%edx)
  103245:	8b 55 08             	mov    0x8(%ebp),%edx
  103248:	88 10                	mov    %dl,(%eax)
    }
}
  10324a:	90                   	nop
  10324b:	5d                   	pop    %ebp
  10324c:	c3                   	ret    

0010324d <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  10324d:	55                   	push   %ebp
  10324e:	89 e5                	mov    %esp,%ebp
  103250:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103253:	8d 45 14             	lea    0x14(%ebp),%eax
  103256:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103259:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10325c:	50                   	push   %eax
  10325d:	ff 75 10             	pushl  0x10(%ebp)
  103260:	ff 75 0c             	pushl  0xc(%ebp)
  103263:	ff 75 08             	pushl  0x8(%ebp)
  103266:	e8 0b 00 00 00       	call   103276 <vsnprintf>
  10326b:	83 c4 10             	add    $0x10,%esp
  10326e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103271:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103274:	c9                   	leave  
  103275:	c3                   	ret    

00103276 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103276:	55                   	push   %ebp
  103277:	89 e5                	mov    %esp,%ebp
  103279:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  10327c:	8b 45 08             	mov    0x8(%ebp),%eax
  10327f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103282:	8b 45 0c             	mov    0xc(%ebp),%eax
  103285:	8d 50 ff             	lea    -0x1(%eax),%edx
  103288:	8b 45 08             	mov    0x8(%ebp),%eax
  10328b:	01 d0                	add    %edx,%eax
  10328d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103290:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103297:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10329b:	74 0a                	je     1032a7 <vsnprintf+0x31>
  10329d:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1032a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032a3:	39 c2                	cmp    %eax,%edx
  1032a5:	76 07                	jbe    1032ae <vsnprintf+0x38>
        return -E_INVAL;
  1032a7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1032ac:	eb 20                	jmp    1032ce <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1032ae:	ff 75 14             	pushl  0x14(%ebp)
  1032b1:	ff 75 10             	pushl  0x10(%ebp)
  1032b4:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1032b7:	50                   	push   %eax
  1032b8:	68 17 32 10 00       	push   $0x103217
  1032bd:	e8 ad fb ff ff       	call   102e6f <vprintfmt>
  1032c2:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  1032c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1032c8:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1032cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1032ce:	c9                   	leave  
  1032cf:	c3                   	ret    
