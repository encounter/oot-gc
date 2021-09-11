# ansi_fp.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __num2dec
/* 0C8B50 800CE0F0 7C0802A6 */  mflr    r0
/* 0C8B54 800CE0F4 90010004 */  stw     r0, 4(r1)
/* 0C8B58 800CE0F8 9421FF98 */  stwu    r1, -0x68(r1)
/* 0C8B5C 800CE0FC DBE10060 */  stfd    f31, 0x60(r1)
/* 0C8B60 800CE100 FFE00890 */  fmr     f31, f1
/* 0C8B64 800CE104 93E1005C */  stw     r31, 0x5c(r1)
/* 0C8B68 800CE108 93C10058 */  stw     r30, 0x58(r1)
/* 0C8B6C 800CE10C 3BC40000 */  addi    r30, r4, 0
/* 0C8B70 800CE110 93A10054 */  stw     r29, 0x54(r1)
/* 0C8B74 800CE114 7C7D1B78 */  mr      r29, r3
/* 0C8B78 800CE118 A8030002 */  lha     r0, 2(r3)
/* 0C8B7C 800CE11C 2C000010 */  cmpwi   r0, 0x10
/* 0C8B80 800CE120 7C1F0378 */  mr      r31, r0
/* 0C8B84 800CE124 40810008 */  ble     lbl_800CE12C
/* 0C8B88 800CE128 3BE00010 */  li      r31, 0x10
lbl_800CE12C:
/* 0C8B8C 800CE12C 38600000 */  li      r3, 0
/* 0C8B90 800CE130 987E0000 */  stb     r3, 0(r30)
/* 0C8B94 800CE134 38000001 */  li      r0, 1
/* 0C8B98 800CE138 B07E0002 */  sth     r3, 2(r30)
/* 0C8B9C 800CE13C 981E0004 */  stb     r0, 4(r30)
/* 0C8BA0 800CE140 C8028540 */  lfd     f0, D_80136240-_SDA2_BASE_(r2)
/* 0C8BA4 800CE144 FC00F800 */  fcmpu   cr0, f0, f31
/* 0C8BA8 800CE148 40820010 */  bne     lbl_800CE158
/* 0C8BAC 800CE14C 38000030 */  li      r0, 0x30
/* 0C8BB0 800CE150 981E0005 */  stb     r0, 5(r30)
/* 0C8BB4 800CE154 48000330 */  b       lbl_800CE484
lbl_800CE158:
/* 0C8BB8 800CE158 DBE10028 */  stfd    f31, 0x28(r1)
/* 0C8BBC 800CE15C 3C007FF0 */  lis     r0, 0x7ff0
/* 0C8BC0 800CE160 80810028 */  lwz     r4, 0x28(r1)
/* 0C8BC4 800CE164 54830056 */  rlwinm  r3, r4, 0, 1, 0xb
/* 0C8BC8 800CE168 7C030000 */  cmpw    r3, r0
/* 0C8BCC 800CE16C 41820014 */  beq     lbl_800CE180
/* 0C8BD0 800CE170 40800058 */  bge     lbl_800CE1C8
/* 0C8BD4 800CE174 2C030000 */  cmpwi   r3, 0
/* 0C8BD8 800CE178 4182002C */  beq     lbl_800CE1A4
/* 0C8BDC 800CE17C 4800004C */  b       lbl_800CE1C8
lbl_800CE180:
/* 0C8BE0 800CE180 5480033F */  clrlwi. r0, r4, 0xc
/* 0C8BE4 800CE184 40820010 */  bne     lbl_800CE194
/* 0C8BE8 800CE188 8001002C */  lwz     r0, 0x2c(r1)
/* 0C8BEC 800CE18C 2C000000 */  cmpwi   r0, 0
/* 0C8BF0 800CE190 4182000C */  beq     lbl_800CE19C
lbl_800CE194:
/* 0C8BF4 800CE194 38000001 */  li      r0, 1
/* 0C8BF8 800CE198 48000034 */  b       lbl_800CE1CC
lbl_800CE19C:
/* 0C8BFC 800CE19C 38000002 */  li      r0, 2
/* 0C8C00 800CE1A0 4800002C */  b       lbl_800CE1CC
lbl_800CE1A4:
/* 0C8C04 800CE1A4 5480033F */  clrlwi. r0, r4, 0xc
/* 0C8C08 800CE1A8 40820010 */  bne     lbl_800CE1B8
/* 0C8C0C 800CE1AC 8001002C */  lwz     r0, 0x2c(r1)
/* 0C8C10 800CE1B0 2C000000 */  cmpwi   r0, 0
/* 0C8C14 800CE1B4 4182000C */  beq     lbl_800CE1C0
lbl_800CE1B8:
/* 0C8C18 800CE1B8 38000005 */  li      r0, 5
/* 0C8C1C 800CE1BC 48000010 */  b       lbl_800CE1CC
lbl_800CE1C0:
/* 0C8C20 800CE1C0 38000003 */  li      r0, 3
/* 0C8C24 800CE1C4 48000008 */  b       lbl_800CE1CC
lbl_800CE1C8:
/* 0C8C28 800CE1C8 38000004 */  li      r0, 4
lbl_800CE1CC:
/* 0C8C2C 800CE1CC 2C000002 */  cmpwi   r0, 2
/* 0C8C30 800CE1D0 41810094 */  bgt     lbl_800CE264
/* 0C8C34 800CE1D4 DBE10020 */  stfd    f31, 0x20(r1)
/* 0C8C38 800CE1D8 3C007FF0 */  lis     r0, 0x7ff0
/* 0C8C3C 800CE1DC 80810020 */  lwz     r4, 0x20(r1)
/* 0C8C40 800CE1E0 54830056 */  rlwinm  r3, r4, 0, 1, 0xb
/* 0C8C44 800CE1E4 7C030000 */  cmpw    r3, r0
/* 0C8C48 800CE1E8 41820014 */  beq     lbl_800CE1FC
/* 0C8C4C 800CE1EC 40800058 */  bge     lbl_800CE244
/* 0C8C50 800CE1F0 2C030000 */  cmpwi   r3, 0
/* 0C8C54 800CE1F4 4182002C */  beq     lbl_800CE220
/* 0C8C58 800CE1F8 4800004C */  b       lbl_800CE244
lbl_800CE1FC:
/* 0C8C5C 800CE1FC 5480033F */  clrlwi. r0, r4, 0xc
/* 0C8C60 800CE200 40820010 */  bne     lbl_800CE210
/* 0C8C64 800CE204 80010024 */  lwz     r0, 0x24(r1)
/* 0C8C68 800CE208 2C000000 */  cmpwi   r0, 0
/* 0C8C6C 800CE20C 4182000C */  beq     lbl_800CE218
lbl_800CE210:
/* 0C8C70 800CE210 38000001 */  li      r0, 1
/* 0C8C74 800CE214 48000034 */  b       lbl_800CE248
lbl_800CE218:
/* 0C8C78 800CE218 38000002 */  li      r0, 2
/* 0C8C7C 800CE21C 4800002C */  b       lbl_800CE248
lbl_800CE220:
/* 0C8C80 800CE220 5480033F */  clrlwi. r0, r4, 0xc
/* 0C8C84 800CE224 40820010 */  bne     lbl_800CE234
/* 0C8C88 800CE228 80010024 */  lwz     r0, 0x24(r1)
/* 0C8C8C 800CE22C 2C000000 */  cmpwi   r0, 0
/* 0C8C90 800CE230 4182000C */  beq     lbl_800CE23C
lbl_800CE234:
/* 0C8C94 800CE234 38000005 */  li      r0, 5
/* 0C8C98 800CE238 48000010 */  b       lbl_800CE248
lbl_800CE23C:
/* 0C8C9C 800CE23C 38000003 */  li      r0, 3
/* 0C8CA0 800CE240 48000008 */  b       lbl_800CE248
lbl_800CE244:
/* 0C8CA4 800CE244 38000004 */  li      r0, 4
lbl_800CE248:
/* 0C8CA8 800CE248 2C000001 */  cmpwi   r0, 1
/* 0C8CAC 800CE24C 4082000C */  bne     lbl_800CE258
/* 0C8CB0 800CE250 3800004E */  li      r0, 0x4e
/* 0C8CB4 800CE254 48000008 */  b       lbl_800CE25C
lbl_800CE258:
/* 0C8CB8 800CE258 38000049 */  li      r0, 0x49
lbl_800CE25C:
/* 0C8CBC 800CE25C 981E0005 */  stb     r0, 5(r30)
/* 0C8CC0 800CE260 48000224 */  b       lbl_800CE484
lbl_800CE264:
/* 0C8CC4 800CE264 38000000 */  li      r0, 0
/* 0C8CC8 800CE268 981E0004 */  stb     r0, 4(r30)
/* 0C8CCC 800CE26C C8028540 */  lfd     f0, D_80136240-_SDA2_BASE_(r2)
/* 0C8CD0 800CE270 FC1F0040 */  fcmpo   cr0, f31, f0
/* 0C8CD4 800CE274 40800010 */  bge     lbl_800CE284
/* 0C8CD8 800CE278 38000001 */  li      r0, 1
/* 0C8CDC 800CE27C FFE0F850 */  fneg    f31, f31
/* 0C8CE0 800CE280 981E0000 */  stb     r0, 0(r30)
lbl_800CE284:
/* 0C8CE4 800CE284 FC20F890 */  fmr     f1, f31
/* 0C8CE8 800CE288 38610030 */  addi    r3, r1, 0x30
/* 0C8CEC 800CE28C 480039BD */  bl      frexp
/* 0C8CF0 800CE290 3C600005 */  lis     r3, 5
/* 0C8CF4 800CE294 80810030 */  lwz     r4, 0x30(r1)
/* 0C8CF8 800CE298 380397E5 */  addi    r0, r3, -26651
/* 0C8CFC 800CE29C 7C0401D6 */  mullw   r0, r4, r0
/* 0C8D00 800CE2A0 3C60431C */  lis     r3, 0x431c
/* 0C8D04 800CE2A4 3863DE83 */  addi    r3, r3, -8573
/* 0C8D08 800CE2A8 7C030096 */  mulhw   r0, r3, r0
/* 0C8D0C 800CE2AC 7C009670 */  srawi   r0, r0, 0x12
/* 0C8D10 800CE2B0 54030FFE */  srwi    r3, r0, 0x1f
/* 0C8D14 800CE2B4 7C801A15 */  add.    r4, r0, r3
/* 0C8D18 800CE2B8 3C60800D */  lis     r3, bit_values@ha
/* 0C8D1C 800CE2BC 38033328 */  addi    r0, r3, bit_values@l
/* 0C8D20 800CE2C0 38640000 */  addi    r3, r4, 0
/* 0C8D24 800CE2C4 7C050378 */  mr      r5, r0
/* 0C8D28 800CE2C8 40800030 */  bge     lbl_800CE2F8
/* 0C8D2C 800CE2CC 7C8400D0 */  neg     r4, r4
/* 0C8D30 800CE2D0 4800001C */  b       lbl_800CE2EC
lbl_800CE2D4:
/* 0C8D34 800CE2D4 548007FF */  clrlwi. r0, r4, 0x1f
/* 0C8D38 800CE2D8 4182000C */  beq     lbl_800CE2E4
/* 0C8D3C 800CE2DC C8050000 */  lfd     f0, 0(r5)
/* 0C8D40 800CE2E0 FFFF0032 */  fmul    f31, f31, f0
lbl_800CE2E4:
/* 0C8D44 800CE2E4 7C840E70 */  srawi   r4, r4, 1
/* 0C8D48 800CE2E8 38A50008 */  addi    r5, r5, 8
lbl_800CE2EC:
/* 0C8D4C 800CE2EC 2C040000 */  cmpwi   r4, 0
/* 0C8D50 800CE2F0 4082FFE4 */  bne     lbl_800CE2D4
/* 0C8D54 800CE2F4 48000034 */  b       lbl_800CE328
lbl_800CE2F8:
/* 0C8D58 800CE2F8 40810030 */  ble     lbl_800CE328
/* 0C8D5C 800CE2FC C8228548 */  lfd     f1, D_80136248-_SDA2_BASE_(r2)
/* 0C8D60 800CE300 4800001C */  b       lbl_800CE31C
lbl_800CE304:
/* 0C8D64 800CE304 548007FF */  clrlwi. r0, r4, 0x1f
/* 0C8D68 800CE308 4182000C */  beq     lbl_800CE314
/* 0C8D6C 800CE30C C8050000 */  lfd     f0, 0(r5)
/* 0C8D70 800CE310 FC210032 */  fmul    f1, f1, f0
lbl_800CE314:
/* 0C8D74 800CE314 7C840E70 */  srawi   r4, r4, 1
/* 0C8D78 800CE318 38A50008 */  addi    r5, r5, 8
lbl_800CE31C:
/* 0C8D7C 800CE31C 2C040000 */  cmpwi   r4, 0
/* 0C8D80 800CE320 4082FFE4 */  bne     lbl_800CE304
/* 0C8D84 800CE324 FFFF0824 */  fdiv    f31, f31, f1
lbl_800CE328:
/* 0C8D88 800CE328 C8228558 */  lfd     f1, D_80136258-_SDA2_BASE_(r2)
/* 0C8D8C 800CE32C C8028548 */  lfd     f0, D_80136248-_SDA2_BASE_(r2)
/* 0C8D90 800CE330 4800000C */  b       lbl_800CE33C
lbl_800CE334:
/* 0C8D94 800CE334 FFFF0072 */  fmul    f31, f31, f1
/* 0C8D98 800CE338 38630001 */  addi    r3, r3, 1
lbl_800CE33C:
/* 0C8D9C 800CE33C FC1F0040 */  fcmpo   cr0, f31, f0
/* 0C8DA0 800CE340 4C411382 */  cror    2, 1, 2
/* 0C8DA4 800CE344 4182FFF0 */  beq     lbl_800CE334
/* 0C8DA8 800CE348 C8228560 */  lfd     f1, D_80136260-_SDA2_BASE_(r2)
/* 0C8DAC 800CE34C C8028558 */  lfd     f0, D_80136258-_SDA2_BASE_(r2)
/* 0C8DB0 800CE350 4800000C */  b       lbl_800CE35C
lbl_800CE354:
/* 0C8DB4 800CE354 FFFF0072 */  fmul    f31, f31, f1
/* 0C8DB8 800CE358 3863FFFF */  addi    r3, r3, -1
lbl_800CE35C:
/* 0C8DBC 800CE35C FC1F0040 */  fcmpo   cr0, f31, f0
/* 0C8DC0 800CE360 4180FFF4 */  blt     lbl_800CE354
/* 0C8DC4 800CE364 3CA06666 */  lis     r5, 0x6666
/* 0C8DC8 800CE368 C8228550 */  lfd     f1, D_80136250-_SDA2_BASE_(r2)
/* 0C8DCC 800CE36C 3CC0800D */  lis     r6, digit_values@ha
/* 0C8DD0 800CE370 389E0005 */  addi    r4, r30, 5
/* 0C8DD4 800CE374 38E56667 */  addi    r7, r5, 0x6667
/* 0C8DD8 800CE378 39463370 */  addi    r10, r6, digit_values@l
/* 0C8DDC 800CE37C 3D204330 */  lis     r9, 0x4330
/* 0C8DE0 800CE380 480000AC */  b       lbl_800CE42C
lbl_800CE384:
/* 0C8DE4 800CE384 2C1F0008 */  cmpwi   r31, 8
/* 0C8DE8 800CE388 399F0000 */  addi    r12, r31, 0
/* 0C8DEC 800CE38C 40810008 */  ble     lbl_800CE394
/* 0C8DF0 800CE390 39800008 */  li      r12, 8
lbl_800CE394:
/* 0C8DF4 800CE394 88DE0004 */  lbz     r6, 4(r30)
/* 0C8DF8 800CE398 55801838 */  slwi    r0, r12, 3
/* 0C8DFC 800CE39C 7CAA0214 */  add     r5, r10, r0
/* 0C8E00 800CE3A0 7C066214 */  add     r0, r6, r12
/* 0C8E04 800CE3A4 981E0004 */  stb     r0, 4(r30)
/* 0C8E08 800CE3A8 7FECF850 */  subf    r31, r12, r31
/* 0C8E0C 800CE3AC 7C6C1850 */  subf    r3, r12, r3
/* 0C8E10 800CE3B0 C805FFF8 */  lfd     f0, -8(r5)
/* 0C8E14 800CE3B4 7C846214 */  add     r4, r4, r12
/* 0C8E18 800CE3B8 396C0001 */  addi    r11, r12, 1
/* 0C8E1C 800CE3BC FFFF0032 */  fmul    f31, f31, f0
/* 0C8E20 800CE3C0 FC00F81E */  fctiwz  f0, f31
/* 0C8E24 800CE3C4 D8010040 */  stfd    f0, 0x40(r1)
/* 0C8E28 800CE3C8 80010044 */  lwz     r0, 0x44(r1)
/* 0C8E2C 800CE3CC D8010048 */  stfd    f0, 0x48(r1)
/* 0C8E30 800CE3D0 6C008000 */  xoris   r0, r0, 0x8000
/* 0C8E34 800CE3D4 9001003C */  stw     r0, 0x3c(r1)
/* 0C8E38 800CE3D8 80C1004C */  lwz     r6, 0x4c(r1)
/* 0C8E3C 800CE3DC 91210038 */  stw     r9, 0x38(r1)
/* 0C8E40 800CE3E0 C8010038 */  lfd     f0, 0x38(r1)
/* 0C8E44 800CE3E4 FC000828 */  fsub    f0, f0, f1
/* 0C8E48 800CE3E8 FFFF0028 */  fsub    f31, f31, f0
/* 0C8E4C 800CE3EC 48000034 */  b       lbl_800CE420
lbl_800CE3F0:
/* 0C8E50 800CE3F0 7D073096 */  mulhw   r8, r7, r6
/* 0C8E54 800CE3F4 7D001670 */  srawi   r0, r8, 2
/* 0C8E58 800CE3F8 54050FFE */  srwi    r5, r0, 0x1f
/* 0C8E5C 800CE3FC 7C002A14 */  add     r0, r0, r5
/* 0C8E60 800CE400 1C00000A */  mulli   r0, r0, 0xa
/* 0C8E64 800CE404 7CC03050 */  subf    r6, r0, r6
/* 0C8E68 800CE408 7D001670 */  srawi   r0, r8, 2
/* 0C8E6C 800CE40C 38C60030 */  addi    r6, r6, 0x30
/* 0C8E70 800CE410 98C4FFFF */  stb     r6, -1(r4)
/* 0C8E74 800CE414 54050FFE */  srwi    r5, r0, 0x1f
/* 0C8E78 800CE418 7CC02A14 */  add     r6, r0, r5
/* 0C8E7C 800CE41C 3884FFFF */  addi    r4, r4, -1
lbl_800CE420:
/* 0C8E80 800CE420 356BFFFF */  addic.  r11, r11, -1
/* 0C8E84 800CE424 4082FFCC */  bne     lbl_800CE3F0
/* 0C8E88 800CE428 7C846214 */  add     r4, r4, r12
lbl_800CE42C:
/* 0C8E8C 800CE42C 2C1F0000 */  cmpwi   r31, 0
/* 0C8E90 800CE430 4082FF54 */  bne     lbl_800CE384
/* 0C8E94 800CE434 A8BD0002 */  lha     r5, 2(r29)
/* 0C8E98 800CE438 2C050024 */  cmpwi   r5, 0x24
/* 0C8E9C 800CE43C 40810008 */  ble     lbl_800CE444
/* 0C8EA0 800CE440 38A00024 */  li      r5, 0x24
lbl_800CE444:
/* 0C8EA4 800CE444 881E0004 */  lbz     r0, 4(r30)
/* 0C8EA8 800CE448 7CA02851 */  subf.   r5, r0, r5
/* 0C8EAC 800CE44C 40810030 */  ble     lbl_800CE47C
/* 0C8EB0 800CE450 38C50001 */  addi    r6, r5, 1
/* 0C8EB4 800CE454 38000030 */  li      r0, 0x30
/* 0C8EB8 800CE458 4800000C */  b       lbl_800CE464
lbl_800CE45C:
/* 0C8EBC 800CE45C 98040000 */  stb     r0, 0(r4)
/* 0C8EC0 800CE460 38840001 */  addi    r4, r4, 1
lbl_800CE464:
/* 0C8EC4 800CE464 34C6FFFF */  addic.  r6, r6, -1
/* 0C8EC8 800CE468 4082FFF4 */  bne     lbl_800CE45C
/* 0C8ECC 800CE46C 881E0004 */  lbz     r0, 4(r30)
/* 0C8ED0 800CE470 7C651850 */  subf    r3, r5, r3
/* 0C8ED4 800CE474 7C002A14 */  add     r0, r0, r5
/* 0C8ED8 800CE478 981E0004 */  stb     r0, 4(r30)
lbl_800CE47C:
/* 0C8EDC 800CE47C 7C600734 */  extsh   r0, r3
/* 0C8EE0 800CE480 B01E0002 */  sth     r0, 2(r30)
lbl_800CE484:
/* 0C8EE4 800CE484 8001006C */  lwz     r0, 0x6c(r1)
/* 0C8EE8 800CE488 CBE10060 */  lfd     f31, 0x60(r1)
/* 0C8EEC 800CE48C 83E1005C */  lwz     r31, 0x5c(r1)
/* 0C8EF0 800CE490 7C0803A6 */  mtlr    r0
/* 0C8EF4 800CE494 83C10058 */  lwz     r30, 0x58(r1)
/* 0C8EF8 800CE498 83A10054 */  lwz     r29, 0x54(r1)
/* 0C8EFC 800CE49C 38210068 */  addi    r1, r1, 0x68
/* 0C8F00 800CE4A0 4E800020 */  blr     

.section .rodata, "a"

.balign 8

/* 000D03A8 800D3328 0048 */
bit_values:
    .long 0x40240000, 0x00000000, 0x40590000, 0x00000000, 0x40C38800, 0x00000000, 0x4197D784, 0x00000000
    .long 0x4341C379, 0x37E08000, 0x4693B8B5, 0xB5056E17, 0x4D384F03, 0xE93FF9F5, 0x5A827748, 0xF9301D32
    .long 0x75154FDD, 0x7F73BF3C

/* 000D03F0 800D3370 0040 */
digit_values:
    .long 0x40240000, 0x00000000, 0x40590000, 0x00000000, 0x408F4000, 0x00000000, 0x40C38800, 0x00000000
    .long 0x40F86A00, 0x00000000, 0x412E8480, 0x00000000, 0x416312D0, 0x00000000, 0x4197D784, 0x00000000

.section .sdata2, "wa"

.balign 8

/* 000F1D40 80136240 0008 */
D_80136240:
    .double 0.0

/* 000F1D48 80136248 0008 */
D_80136248:
    .double 1.0

/* 000F1D50 80136250 0008 */
D_80136250:
    .double 4503601774854144.0

/* 000F1D58 80136258 0008 */
D_80136258:
    .double 0.1

/* 000F1D60 80136260 0008 */
D_80136260:
    .double 10.0
