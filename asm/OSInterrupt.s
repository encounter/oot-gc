# OSInterrupt.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel OSDisableInterrupts
/* 09975C 8009ECFC 7C6000A6 */  mfmsr   r3
/* 099760 8009ED00 5464045E */  rlwinm  r4, r3, 0, 0x11, 0xf
/* 099764 8009ED04 7C800124 */  mtmsr   r4
glabel __RAS_OSDisableInterrupts_end
/* 099768 8009ED08 54638FFE */  rlwinm  r3, r3, 0x11, 0x1f, 0x1f
/* 09976C 8009ED0C 4E800020 */  blr     

glabel OSEnableInterrupts
/* 099770 8009ED10 7C6000A6 */  mfmsr   r3
/* 099774 8009ED14 60648000 */  ori     r4, r3, 0x8000
/* 099778 8009ED18 7C800124 */  mtmsr   r4
/* 09977C 8009ED1C 54638FFE */  rlwinm  r3, r3, 0x11, 0x1f, 0x1f
/* 099780 8009ED20 4E800020 */  blr     

glabel OSRestoreInterrupts
/* 099784 8009ED24 2C030000 */  cmpwi   r3, 0
/* 099788 8009ED28 7C8000A6 */  mfmsr   r4
/* 09978C 8009ED2C 4182000C */  beq     lbl_8009ED38
/* 099790 8009ED30 60858000 */  ori     r5, r4, 0x8000
/* 099794 8009ED34 48000008 */  b       lbl_8009ED3C
lbl_8009ED38:
/* 099798 8009ED38 5485045E */  rlwinm  r5, r4, 0, 0x11, 0xf
lbl_8009ED3C:
/* 09979C 8009ED3C 7CA00124 */  mtmsr   r5
/* 0997A0 8009ED40 54838FFE */  rlwinm  r3, r4, 0x11, 0x1f, 0x1f
/* 0997A4 8009ED44 4E800020 */  blr     

glabel __OSSetInterruptHandler
/* 0997A8 8009ED48 7C600734 */  extsh   r0, r3
/* 0997AC 8009ED4C 806D8B30 */  lwz     r3, InterruptHandlerTable-_SDA_BASE_(r13)
/* 0997B0 8009ED50 5400103A */  slwi    r0, r0, 2
/* 0997B4 8009ED54 7CA30214 */  add     r5, r3, r0
/* 0997B8 8009ED58 80650000 */  lwz     r3, 0(r5)
/* 0997BC 8009ED5C 90850000 */  stw     r4, 0(r5)
/* 0997C0 8009ED60 4E800020 */  blr     

glabel __OSGetInterruptHandler
/* 0997C4 8009ED64 7C600734 */  extsh   r0, r3
/* 0997C8 8009ED68 806D8B30 */  lwz     r3, InterruptHandlerTable-_SDA_BASE_(r13)
/* 0997CC 8009ED6C 5400103A */  slwi    r0, r0, 2
/* 0997D0 8009ED70 7C63002E */  lwzx    r3, r3, r0
/* 0997D4 8009ED74 4E800020 */  blr     

glabel __OSInterruptInit
/* 0997D8 8009ED78 7C0802A6 */  mflr    r0
/* 0997DC 8009ED7C 90010004 */  stw     r0, 4(r1)
/* 0997E0 8009ED80 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0997E4 8009ED84 93E1000C */  stw     r31, 0xc(r1)
/* 0997E8 8009ED88 3FE08000 */  lis     r31, 0x8000
/* 0997EC 8009ED8C 381F3040 */  addi    r0, r31, 0x3040
/* 0997F0 8009ED90 900D8B30 */  stw     r0, InterruptHandlerTable-_SDA_BASE_(r13)
/* 0997F4 8009ED94 38800000 */  li      r4, 0
/* 0997F8 8009ED98 38A00080 */  li      r5, 0x80
/* 0997FC 8009ED9C 806D8B30 */  lwz     r3, InterruptHandlerTable-_SDA_BASE_(r13)
/* 099800 8009EDA0 4BF66631 */  bl      memset
/* 099804 8009EDA4 38000000 */  li      r0, 0
/* 099808 8009EDA8 901F00C4 */  stw     r0, 0xc4(r31)
/* 09980C 8009EDAC 3C60CC00 */  lis     r3, 0xcc00
/* 099810 8009EDB0 38833000 */  addi    r4, r3, 0x3000
/* 099814 8009EDB4 901F00C8 */  stw     r0, 0xc8(r31)
/* 099818 8009EDB8 380000F0 */  li      r0, 0xf0
/* 09981C 8009EDBC 3860FFE0 */  li      r3, -32
/* 099820 8009EDC0 90040004 */  stw     r0, 4(r4)
/* 099824 8009EDC4 48000301 */  bl      __OSMaskInterrupts
/* 099828 8009EDC8 3C60800A */  lis     r3, ExternalInterruptHandler@ha
/* 09982C 8009EDCC 3883F518 */  addi    r4, r3, ExternalInterruptHandler@l
/* 099830 8009EDD0 38600004 */  li      r3, 4
/* 099834 8009EDD4 4BFFD731 */  bl      __OSSetExceptionHandler
/* 099838 8009EDD8 80010014 */  lwz     r0, 0x14(r1)
/* 09983C 8009EDDC 83E1000C */  lwz     r31, 0xc(r1)
/* 099840 8009EDE0 38210010 */  addi    r1, r1, 0x10
/* 099844 8009EDE4 7C0803A6 */  mtlr    r0
/* 099848 8009EDE8 4E800020 */  blr     

SetInterruptMask:
/* 09984C 8009EDEC 7C600034 */  cntlzw  r0, r3
/* 099850 8009EDF0 2C00000C */  cmpwi   r0, 0xc
/* 099854 8009EDF4 40800024 */  bge     lbl_8009EE18
/* 099858 8009EDF8 2C000008 */  cmpwi   r0, 8
/* 09985C 8009EDFC 418200FC */  beq     lbl_8009EEF8
/* 099860 8009EE00 40800128 */  bge     lbl_8009EF28
/* 099864 8009EE04 2C000005 */  cmpwi   r0, 5
/* 099868 8009EE08 4080009C */  bge     lbl_8009EEA4
/* 09986C 8009EE0C 2C000000 */  cmpwi   r0, 0
/* 099870 8009EE10 40800028 */  bge     lbl_8009EE38
/* 099874 8009EE14 480002AC */  b       lbl_8009F0C0
lbl_8009EE18:
/* 099878 8009EE18 2C000011 */  cmpwi   r0, 0x11
/* 09987C 8009EE1C 40800010 */  bge     lbl_8009EE2C
/* 099880 8009EE20 2C00000F */  cmpwi   r0, 0xf
/* 099884 8009EE24 408001A8 */  bge     lbl_8009EFCC
/* 099888 8009EE28 48000150 */  b       lbl_8009EF78
lbl_8009EE2C:
/* 09988C 8009EE2C 2C00001B */  cmpwi   r0, 0x1b
/* 099890 8009EE30 40800290 */  bge     lbl_8009F0C0
/* 099894 8009EE34 480001D8 */  b       lbl_8009F00C
lbl_8009EE38:
/* 099898 8009EE38 54800000 */  rlwinm  r0, r4, 0, 0, 0
/* 09989C 8009EE3C 28000000 */  cmplwi  r0, 0
/* 0998A0 8009EE40 38A00000 */  li      r5, 0
/* 0998A4 8009EE44 40820008 */  bne     lbl_8009EE4C
/* 0998A8 8009EE48 60A50001 */  ori     r5, r5, 1
lbl_8009EE4C:
/* 0998AC 8009EE4C 54800042 */  rlwinm  r0, r4, 0, 1, 1
/* 0998B0 8009EE50 28000000 */  cmplwi  r0, 0
/* 0998B4 8009EE54 40820008 */  bne     lbl_8009EE5C
/* 0998B8 8009EE58 60A50002 */  ori     r5, r5, 2
lbl_8009EE5C:
/* 0998BC 8009EE5C 54800084 */  rlwinm  r0, r4, 0, 2, 2
/* 0998C0 8009EE60 28000000 */  cmplwi  r0, 0
/* 0998C4 8009EE64 40820008 */  bne     lbl_8009EE6C
/* 0998C8 8009EE68 60A50004 */  ori     r5, r5, 4
lbl_8009EE6C:
/* 0998CC 8009EE6C 548000C6 */  rlwinm  r0, r4, 0, 3, 3
/* 0998D0 8009EE70 28000000 */  cmplwi  r0, 0
/* 0998D4 8009EE74 40820008 */  bne     lbl_8009EE7C
/* 0998D8 8009EE78 60A50008 */  ori     r5, r5, 8
lbl_8009EE7C:
/* 0998DC 8009EE7C 54800108 */  rlwinm  r0, r4, 0, 4, 4
/* 0998E0 8009EE80 28000000 */  cmplwi  r0, 0
/* 0998E4 8009EE84 40820008 */  bne     lbl_8009EE8C
/* 0998E8 8009EE88 60A50010 */  ori     r5, r5, 0x10
lbl_8009EE8C:
/* 0998EC 8009EE8C 3C80CC00 */  lis     r4, 0xcc00
/* 0998F0 8009EE90 54A0043E */  clrlwi  r0, r5, 0x10
/* 0998F4 8009EE94 38844000 */  addi    r4, r4, 0x4000
/* 0998F8 8009EE98 B004001C */  sth     r0, 0x1c(r4)
/* 0998FC 8009EE9C 5463017E */  clrlwi  r3, r3, 5
/* 099900 8009EEA0 48000220 */  b       lbl_8009F0C0
lbl_8009EEA4:
/* 099904 8009EEA4 3CA0CC00 */  lis     r5, 0xcc00
/* 099908 8009EEA8 38A55000 */  addi    r5, r5, 0x5000
/* 09990C 8009EEAC 38A5000A */  addi    r5, r5, 0xa
/* 099910 8009EEB0 5480014A */  rlwinm  r0, r4, 0, 5, 5
/* 099914 8009EEB4 A0C50000 */  lhz     r6, 0(r5)
/* 099918 8009EEB8 28000000 */  cmplwi  r0, 0
/* 09991C 8009EEBC 54C6076C */  rlwinm  r6, r6, 0, 0x1d, 0x16
/* 099920 8009EEC0 40820008 */  bne     lbl_8009EEC8
/* 099924 8009EEC4 60C60010 */  ori     r6, r6, 0x10
lbl_8009EEC8:
/* 099928 8009EEC8 5480018C */  rlwinm  r0, r4, 0, 6, 6
/* 09992C 8009EECC 28000000 */  cmplwi  r0, 0
/* 099930 8009EED0 40820008 */  bne     lbl_8009EED8
/* 099934 8009EED4 60C60040 */  ori     r6, r6, 0x40
lbl_8009EED8:
/* 099938 8009EED8 548001CE */  rlwinm  r0, r4, 0, 7, 7
/* 09993C 8009EEDC 28000000 */  cmplwi  r0, 0
/* 099940 8009EEE0 40820008 */  bne     lbl_8009EEE8
/* 099944 8009EEE4 60C60100 */  ori     r6, r6, 0x100
lbl_8009EEE8:
/* 099948 8009EEE8 54C0043E */  clrlwi  r0, r6, 0x10
/* 09994C 8009EEEC B0050000 */  sth     r0, 0(r5)
/* 099950 8009EEF0 54630208 */  rlwinm  r3, r3, 0, 8, 4
/* 099954 8009EEF4 480001CC */  b       lbl_8009F0C0
lbl_8009EEF8:
/* 099958 8009EEF8 54800210 */  rlwinm  r0, r4, 0, 8, 8
/* 09995C 8009EEFC 3C80CC00 */  lis     r4, 0xcc00
/* 099960 8009EF00 28000000 */  cmplwi  r0, 0
/* 099964 8009EF04 80A46C00 */  lwz     r5, 0x6c00(r4)
/* 099968 8009EF08 3800FFD3 */  li      r0, -45
/* 09996C 8009EF0C 7CA50038 */  and     r5, r5, r0
/* 099970 8009EF10 40820008 */  bne     lbl_8009EF18
/* 099974 8009EF14 60A50004 */  ori     r5, r5, 4
lbl_8009EF18:
/* 099978 8009EF18 3C80CC00 */  lis     r4, 0xcc00
/* 09997C 8009EF1C 90A46C00 */  stw     r5, 0x6c00(r4)
/* 099980 8009EF20 5463024E */  rlwinm  r3, r3, 0, 9, 7
/* 099984 8009EF24 4800019C */  b       lbl_8009F0C0
lbl_8009EF28:
/* 099988 8009EF28 54800252 */  rlwinm  r0, r4, 0, 9, 9
/* 09998C 8009EF2C 3CA0CC00 */  lis     r5, 0xcc00
/* 099990 8009EF30 28000000 */  cmplwi  r0, 0
/* 099994 8009EF34 80A56800 */  lwz     r5, 0x6800(r5)
/* 099998 8009EF38 3800D3F0 */  li      r0, -11280
/* 09999C 8009EF3C 7CA50038 */  and     r5, r5, r0
/* 0999A0 8009EF40 40820008 */  bne     lbl_8009EF48
/* 0999A4 8009EF44 60A50001 */  ori     r5, r5, 1
lbl_8009EF48:
/* 0999A8 8009EF48 54800294 */  rlwinm  r0, r4, 0, 0xa, 0xa
/* 0999AC 8009EF4C 28000000 */  cmplwi  r0, 0
/* 0999B0 8009EF50 40820008 */  bne     lbl_8009EF58
/* 0999B4 8009EF54 60A50004 */  ori     r5, r5, 4
lbl_8009EF58:
/* 0999B8 8009EF58 548002D6 */  rlwinm  r0, r4, 0, 0xb, 0xb
/* 0999BC 8009EF5C 28000000 */  cmplwi  r0, 0
/* 0999C0 8009EF60 40820008 */  bne     lbl_8009EF68
/* 0999C4 8009EF64 60A50400 */  ori     r5, r5, 0x400
lbl_8009EF68:
/* 0999C8 8009EF68 3C80CC00 */  lis     r4, 0xcc00
/* 0999CC 8009EF6C 90A46800 */  stw     r5, 0x6800(r4)
/* 0999D0 8009EF70 54630310 */  rlwinm  r3, r3, 0, 0xc, 8
/* 0999D4 8009EF74 4800014C */  b       lbl_8009F0C0
lbl_8009EF78:
/* 0999D8 8009EF78 3CA0CC00 */  lis     r5, 0xcc00
/* 0999DC 8009EF7C 38C56800 */  addi    r6, r5, 0x6800
/* 0999E0 8009EF80 38C60014 */  addi    r6, r6, 0x14
/* 0999E4 8009EF84 54800318 */  rlwinm  r0, r4, 0, 0xc, 0xc
/* 0999E8 8009EF88 80E60000 */  lwz     r7, 0(r6)
/* 0999EC 8009EF8C 38A0F3F0 */  li      r5, -3088
/* 0999F0 8009EF90 28000000 */  cmplwi  r0, 0
/* 0999F4 8009EF94 7CE72838 */  and     r7, r7, r5
/* 0999F8 8009EF98 40820008 */  bne     lbl_8009EFA0
/* 0999FC 8009EF9C 60E70001 */  ori     r7, r7, 1
lbl_8009EFA0:
/* 099A00 8009EFA0 5480035A */  rlwinm  r0, r4, 0, 0xd, 0xd
/* 099A04 8009EFA4 28000000 */  cmplwi  r0, 0
/* 099A08 8009EFA8 40820008 */  bne     lbl_8009EFB0
/* 099A0C 8009EFAC 60E70004 */  ori     r7, r7, 4
lbl_8009EFB0:
/* 099A10 8009EFB0 5480039C */  rlwinm  r0, r4, 0, 0xe, 0xe
/* 099A14 8009EFB4 28000000 */  cmplwi  r0, 0
/* 099A18 8009EFB8 40820008 */  bne     lbl_8009EFC0
/* 099A1C 8009EFBC 60E70400 */  ori     r7, r7, 0x400
lbl_8009EFC0:
/* 099A20 8009EFC0 90E60000 */  stw     r7, 0(r6)
/* 099A24 8009EFC4 546303D6 */  rlwinm  r3, r3, 0, 0xf, 0xb
/* 099A28 8009EFC8 480000F8 */  b       lbl_8009F0C0
lbl_8009EFCC:
/* 099A2C 8009EFCC 3CA0CC00 */  lis     r5, 0xcc00
/* 099A30 8009EFD0 38A56800 */  addi    r5, r5, 0x6800
/* 099A34 8009EFD4 38A50028 */  addi    r5, r5, 0x28
/* 099A38 8009EFD8 548003DE */  rlwinm  r0, r4, 0, 0xf, 0xf
/* 099A3C 8009EFDC 80C50000 */  lwz     r6, 0(r5)
/* 099A40 8009EFE0 28000000 */  cmplwi  r0, 0
/* 099A44 8009EFE4 54C60036 */  rlwinm  r6, r6, 0, 0, 0x1b
/* 099A48 8009EFE8 40820008 */  bne     lbl_8009EFF0
/* 099A4C 8009EFEC 60C60001 */  ori     r6, r6, 1
lbl_8009EFF0:
/* 099A50 8009EFF0 54800420 */  rlwinm  r0, r4, 0, 0x10, 0x10
/* 099A54 8009EFF4 28000000 */  cmplwi  r0, 0
/* 099A58 8009EFF8 40820008 */  bne     lbl_8009F000
/* 099A5C 8009EFFC 60C60004 */  ori     r6, r6, 4
lbl_8009F000:
/* 099A60 8009F000 90C50000 */  stw     r6, 0(r5)
/* 099A64 8009F004 5463045C */  rlwinm  r3, r3, 0, 0x11, 0xe
/* 099A68 8009F008 480000B8 */  b       lbl_8009F0C0
lbl_8009F00C:
/* 099A6C 8009F00C 54800462 */  rlwinm  r0, r4, 0, 0x11, 0x11
/* 099A70 8009F010 28000000 */  cmplwi  r0, 0
/* 099A74 8009F014 38A000F0 */  li      r5, 0xf0
/* 099A78 8009F018 40820008 */  bne     lbl_8009F020
/* 099A7C 8009F01C 60A50800 */  ori     r5, r5, 0x800
lbl_8009F020:
/* 099A80 8009F020 54800528 */  rlwinm  r0, r4, 0, 0x14, 0x14
/* 099A84 8009F024 28000000 */  cmplwi  r0, 0
/* 099A88 8009F028 40820008 */  bne     lbl_8009F030
/* 099A8C 8009F02C 60A50008 */  ori     r5, r5, 8
lbl_8009F030:
/* 099A90 8009F030 5480056A */  rlwinm  r0, r4, 0, 0x15, 0x15
/* 099A94 8009F034 28000000 */  cmplwi  r0, 0
/* 099A98 8009F038 40820008 */  bne     lbl_8009F040
/* 099A9C 8009F03C 60A50004 */  ori     r5, r5, 4
lbl_8009F040:
/* 099AA0 8009F040 548005AC */  rlwinm  r0, r4, 0, 0x16, 0x16
/* 099AA4 8009F044 28000000 */  cmplwi  r0, 0
/* 099AA8 8009F048 40820008 */  bne     lbl_8009F050
/* 099AAC 8009F04C 60A50002 */  ori     r5, r5, 2
lbl_8009F050:
/* 099AB0 8009F050 548005EE */  rlwinm  r0, r4, 0, 0x17, 0x17
/* 099AB4 8009F054 28000000 */  cmplwi  r0, 0
/* 099AB8 8009F058 40820008 */  bne     lbl_8009F060
/* 099ABC 8009F05C 60A50001 */  ori     r5, r5, 1
lbl_8009F060:
/* 099AC0 8009F060 54800630 */  rlwinm  r0, r4, 0, 0x18, 0x18
/* 099AC4 8009F064 28000000 */  cmplwi  r0, 0
/* 099AC8 8009F068 40820008 */  bne     lbl_8009F070
/* 099ACC 8009F06C 60A50100 */  ori     r5, r5, 0x100
lbl_8009F070:
/* 099AD0 8009F070 54800672 */  rlwinm  r0, r4, 0, 0x19, 0x19
/* 099AD4 8009F074 28000000 */  cmplwi  r0, 0
/* 099AD8 8009F078 40820008 */  bne     lbl_8009F080
/* 099ADC 8009F07C 60A51000 */  ori     r5, r5, 0x1000
lbl_8009F080:
/* 099AE0 8009F080 548004A4 */  rlwinm  r0, r4, 0, 0x12, 0x12
/* 099AE4 8009F084 28000000 */  cmplwi  r0, 0
/* 099AE8 8009F088 40820008 */  bne     lbl_8009F090
/* 099AEC 8009F08C 60A50200 */  ori     r5, r5, 0x200
lbl_8009F090:
/* 099AF0 8009F090 548004E6 */  rlwinm  r0, r4, 0, 0x13, 0x13
/* 099AF4 8009F094 28000000 */  cmplwi  r0, 0
/* 099AF8 8009F098 40820008 */  bne     lbl_8009F0A0
/* 099AFC 8009F09C 60A50400 */  ori     r5, r5, 0x400
lbl_8009F0A0:
/* 099B00 8009F0A0 548006B4 */  rlwinm  r0, r4, 0, 0x1a, 0x1a
/* 099B04 8009F0A4 28000000 */  cmplwi  r0, 0
/* 099B08 8009F0A8 40820008 */  bne     lbl_8009F0B0
/* 099B0C 8009F0AC 60A52000 */  ori     r5, r5, 0x2000
lbl_8009F0B0:
/* 099B10 8009F0B0 3C80CC00 */  lis     r4, 0xcc00
/* 099B14 8009F0B4 38843000 */  addi    r4, r4, 0x3000
/* 099B18 8009F0B8 90A40004 */  stw     r5, 4(r4)
/* 099B1C 8009F0BC 546306E0 */  rlwinm  r3, r3, 0, 0x1b, 0x10
lbl_8009F0C0:
/* 099B20 8009F0C0 4E800020 */  blr     

glabel __OSMaskInterrupts
/* 099B24 8009F0C4 7C0802A6 */  mflr    r0
/* 099B28 8009F0C8 90010004 */  stw     r0, 4(r1)
/* 099B2C 8009F0CC 9421FFE0 */  stwu    r1, -0x20(r1)
/* 099B30 8009F0D0 93E1001C */  stw     r31, 0x1c(r1)
/* 099B34 8009F0D4 93C10018 */  stw     r30, 0x18(r1)
/* 099B38 8009F0D8 93A10014 */  stw     r29, 0x14(r1)
/* 099B3C 8009F0DC 7C7F1B78 */  mr      r31, r3
/* 099B40 8009F0E0 4BFFFC1D */  bl      OSDisableInterrupts
/* 099B44 8009F0E4 3C808000 */  lis     r4, 0x8000
/* 099B48 8009F0E8 83A400C4 */  lwz     r29, 0xc4(r4)
/* 099B4C 8009F0EC 7C7E1B78 */  mr      r30, r3
/* 099B50 8009F0F0 80A400C8 */  lwz     r5, 0xc8(r4)
/* 099B54 8009F0F4 7FA02B78 */  or      r0, r29, r5
/* 099B58 8009F0F8 7FE30078 */  andc    r3, r31, r0
/* 099B5C 8009F0FC 7FFFEB78 */  or      r31, r31, r29
/* 099B60 8009F100 93E400C4 */  stw     r31, 0xc4(r4)
/* 099B64 8009F104 7FFF2B78 */  or      r31, r31, r5
/* 099B68 8009F108 48000004 */  b       lbl_8009F10C
lbl_8009F10C:
/* 099B6C 8009F10C 48000004 */  b       lbl_8009F110
lbl_8009F110:
/* 099B70 8009F110 4800000C */  b       lbl_8009F11C
lbl_8009F114:
/* 099B74 8009F114 7FE4FB78 */  mr      r4, r31
/* 099B78 8009F118 4BFFFCD5 */  bl      SetInterruptMask
lbl_8009F11C:
/* 099B7C 8009F11C 28030000 */  cmplwi  r3, 0
/* 099B80 8009F120 4082FFF4 */  bne     lbl_8009F114
/* 099B84 8009F124 7FC3F378 */  mr      r3, r30
/* 099B88 8009F128 4BFFFBFD */  bl      OSRestoreInterrupts
/* 099B8C 8009F12C 7FA3EB78 */  mr      r3, r29
/* 099B90 8009F130 80010024 */  lwz     r0, 0x24(r1)
/* 099B94 8009F134 83E1001C */  lwz     r31, 0x1c(r1)
/* 099B98 8009F138 83C10018 */  lwz     r30, 0x18(r1)
/* 099B9C 8009F13C 83A10014 */  lwz     r29, 0x14(r1)
/* 099BA0 8009F140 38210020 */  addi    r1, r1, 0x20
/* 099BA4 8009F144 7C0803A6 */  mtlr    r0
/* 099BA8 8009F148 4E800020 */  blr     

glabel __OSUnmaskInterrupts
/* 099BAC 8009F14C 7C0802A6 */  mflr    r0
/* 099BB0 8009F150 90010004 */  stw     r0, 4(r1)
/* 099BB4 8009F154 9421FFE0 */  stwu    r1, -0x20(r1)
/* 099BB8 8009F158 93E1001C */  stw     r31, 0x1c(r1)
/* 099BBC 8009F15C 93C10018 */  stw     r30, 0x18(r1)
/* 099BC0 8009F160 93A10014 */  stw     r29, 0x14(r1)
/* 099BC4 8009F164 7C7F1B78 */  mr      r31, r3
/* 099BC8 8009F168 4BFFFB95 */  bl      OSDisableInterrupts
/* 099BCC 8009F16C 3C808000 */  lis     r4, 0x8000
/* 099BD0 8009F170 83A400C4 */  lwz     r29, 0xc4(r4)
/* 099BD4 8009F174 7C7E1B78 */  mr      r30, r3
/* 099BD8 8009F178 80A400C8 */  lwz     r5, 0xc8(r4)
/* 099BDC 8009F17C 7FA02B78 */  or      r0, r29, r5
/* 099BE0 8009F180 7FE30038 */  and     r3, r31, r0
/* 099BE4 8009F184 7FBFF878 */  andc    r31, r29, r31
/* 099BE8 8009F188 93E400C4 */  stw     r31, 0xc4(r4)
/* 099BEC 8009F18C 7FFF2B78 */  or      r31, r31, r5
/* 099BF0 8009F190 48000004 */  b       lbl_8009F194
lbl_8009F194:
/* 099BF4 8009F194 48000004 */  b       lbl_8009F198
lbl_8009F198:
/* 099BF8 8009F198 4800000C */  b       lbl_8009F1A4
lbl_8009F19C:
/* 099BFC 8009F19C 7FE4FB78 */  mr      r4, r31
/* 099C00 8009F1A0 4BFFFC4D */  bl      SetInterruptMask
lbl_8009F1A4:
/* 099C04 8009F1A4 28030000 */  cmplwi  r3, 0
/* 099C08 8009F1A8 4082FFF4 */  bne     lbl_8009F19C
/* 099C0C 8009F1AC 7FC3F378 */  mr      r3, r30
/* 099C10 8009F1B0 4BFFFB75 */  bl      OSRestoreInterrupts
/* 099C14 8009F1B4 7FA3EB78 */  mr      r3, r29
/* 099C18 8009F1B8 80010024 */  lwz     r0, 0x24(r1)
/* 099C1C 8009F1BC 83E1001C */  lwz     r31, 0x1c(r1)
/* 099C20 8009F1C0 83C10018 */  lwz     r30, 0x18(r1)
/* 099C24 8009F1C4 83A10014 */  lwz     r29, 0x14(r1)
/* 099C28 8009F1C8 38210020 */  addi    r1, r1, 0x20
/* 099C2C 8009F1CC 7C0803A6 */  mtlr    r0
/* 099C30 8009F1D0 4E800020 */  blr     

glabel __OSDispatchInterrupt
/* 099C34 8009F1D4 7C0802A6 */  mflr    r0
/* 099C38 8009F1D8 90010004 */  stw     r0, 4(r1)
/* 099C3C 8009F1DC 9421FFD8 */  stwu    r1, -0x28(r1)
/* 099C40 8009F1E0 93E10024 */  stw     r31, 0x24(r1)
/* 099C44 8009F1E4 93C10020 */  stw     r30, 0x20(r1)
/* 099C48 8009F1E8 93A1001C */  stw     r29, 0x1c(r1)
/* 099C4C 8009F1EC 7C9E2378 */  mr      r30, r4
/* 099C50 8009F1F0 3C60CC00 */  lis     r3, 0xcc00
/* 099C54 8009F1F4 83E33000 */  lwz     r31, 0x3000(r3)
/* 099C58 8009F1F8 57FF041C */  rlwinm  r31, r31, 0, 0x10, 0xe
/* 099C5C 8009F1FC 281F0000 */  cmplwi  r31, 0
/* 099C60 8009F200 41820018 */  beq     lbl_8009F218
/* 099C64 8009F204 38633000 */  addi    r3, r3, 0x3000
/* 099C68 8009F208 80030004 */  lwz     r0, 4(r3)
/* 099C6C 8009F20C 7FE00038 */  and     r0, r31, r0
/* 099C70 8009F210 28000000 */  cmplwi  r0, 0
/* 099C74 8009F214 4082000C */  bne     lbl_8009F220
lbl_8009F218:
/* 099C78 8009F218 7FC3F378 */  mr      r3, r30
/* 099C7C 8009F21C 4BFFEEA9 */  bl      OSLoadContext
lbl_8009F220:
/* 099C80 8009F220 57E00630 */  rlwinm  r0, r31, 0, 0x18, 0x18
/* 099C84 8009F224 28000000 */  cmplwi  r0, 0
/* 099C88 8009F228 38000000 */  li      r0, 0
/* 099C8C 8009F22C 41820060 */  beq     lbl_8009F28C
/* 099C90 8009F230 3C60CC00 */  lis     r3, 0xcc00
/* 099C94 8009F234 38634000 */  addi    r3, r3, 0x4000
/* 099C98 8009F238 A083001E */  lhz     r4, 0x1e(r3)
/* 099C9C 8009F23C 548307FE */  clrlwi  r3, r4, 0x1f
/* 099CA0 8009F240 28030000 */  cmplwi  r3, 0
/* 099CA4 8009F244 41820008 */  beq     lbl_8009F24C
/* 099CA8 8009F248 64008000 */  oris    r0, r0, 0x8000
lbl_8009F24C:
/* 099CAC 8009F24C 548307BC */  rlwinm  r3, r4, 0, 0x1e, 0x1e
/* 099CB0 8009F250 28030000 */  cmplwi  r3, 0
/* 099CB4 8009F254 41820008 */  beq     lbl_8009F25C
/* 099CB8 8009F258 64004000 */  oris    r0, r0, 0x4000
lbl_8009F25C:
/* 099CBC 8009F25C 5483077A */  rlwinm  r3, r4, 0, 0x1d, 0x1d
/* 099CC0 8009F260 28030000 */  cmplwi  r3, 0
/* 099CC4 8009F264 41820008 */  beq     lbl_8009F26C
/* 099CC8 8009F268 64002000 */  oris    r0, r0, 0x2000
lbl_8009F26C:
/* 099CCC 8009F26C 54830738 */  rlwinm  r3, r4, 0, 0x1c, 0x1c
/* 099CD0 8009F270 28030000 */  cmplwi  r3, 0
/* 099CD4 8009F274 41820008 */  beq     lbl_8009F27C
/* 099CD8 8009F278 64001000 */  oris    r0, r0, 0x1000
lbl_8009F27C:
/* 099CDC 8009F27C 548306F6 */  rlwinm  r3, r4, 0, 0x1b, 0x1b
/* 099CE0 8009F280 28030000 */  cmplwi  r3, 0
/* 099CE4 8009F284 41820008 */  beq     lbl_8009F28C
/* 099CE8 8009F288 64000800 */  oris    r0, r0, 0x800
lbl_8009F28C:
/* 099CEC 8009F28C 57E30672 */  rlwinm  r3, r31, 0, 0x19, 0x19
/* 099CF0 8009F290 28030000 */  cmplwi  r3, 0
/* 099CF4 8009F294 41820040 */  beq     lbl_8009F2D4
/* 099CF8 8009F298 3C60CC00 */  lis     r3, 0xcc00
/* 099CFC 8009F29C 38635000 */  addi    r3, r3, 0x5000
/* 099D00 8009F2A0 A083000A */  lhz     r4, 0xa(r3)
/* 099D04 8009F2A4 54830738 */  rlwinm  r3, r4, 0, 0x1c, 0x1c
/* 099D08 8009F2A8 28030000 */  cmplwi  r3, 0
/* 099D0C 8009F2AC 41820008 */  beq     lbl_8009F2B4
/* 099D10 8009F2B0 64000400 */  oris    r0, r0, 0x400
lbl_8009F2B4:
/* 099D14 8009F2B4 548306B4 */  rlwinm  r3, r4, 0, 0x1a, 0x1a
/* 099D18 8009F2B8 28030000 */  cmplwi  r3, 0
/* 099D1C 8009F2BC 41820008 */  beq     lbl_8009F2C4
/* 099D20 8009F2C0 64000200 */  oris    r0, r0, 0x200
lbl_8009F2C4:
/* 099D24 8009F2C4 54830630 */  rlwinm  r3, r4, 0, 0x18, 0x18
/* 099D28 8009F2C8 28030000 */  cmplwi  r3, 0
/* 099D2C 8009F2CC 41820008 */  beq     lbl_8009F2D4
/* 099D30 8009F2D0 64000100 */  oris    r0, r0, 0x100
lbl_8009F2D4:
/* 099D34 8009F2D4 57E306B4 */  rlwinm  r3, r31, 0, 0x1a, 0x1a
/* 099D38 8009F2D8 28030000 */  cmplwi  r3, 0
/* 099D3C 8009F2DC 4182001C */  beq     lbl_8009F2F8
/* 099D40 8009F2E0 3C60CC00 */  lis     r3, 0xcc00
/* 099D44 8009F2E4 80636C00 */  lwz     r3, 0x6c00(r3)
/* 099D48 8009F2E8 54630738 */  rlwinm  r3, r3, 0, 0x1c, 0x1c
/* 099D4C 8009F2EC 28030000 */  cmplwi  r3, 0
/* 099D50 8009F2F0 41820008 */  beq     lbl_8009F2F8
/* 099D54 8009F2F4 64000080 */  oris    r0, r0, 0x80
lbl_8009F2F8:
/* 099D58 8009F2F8 57E306F6 */  rlwinm  r3, r31, 0, 0x1b, 0x1b
/* 099D5C 8009F2FC 28030000 */  cmplwi  r3, 0
/* 099D60 8009F300 418200A4 */  beq     lbl_8009F3A4
/* 099D64 8009F304 3C60CC00 */  lis     r3, 0xcc00
/* 099D68 8009F308 80836800 */  lwz     r4, 0x6800(r3)
/* 099D6C 8009F30C 548307BC */  rlwinm  r3, r4, 0, 0x1e, 0x1e
/* 099D70 8009F310 28030000 */  cmplwi  r3, 0
/* 099D74 8009F314 41820008 */  beq     lbl_8009F31C
/* 099D78 8009F318 64000040 */  oris    r0, r0, 0x40
lbl_8009F31C:
/* 099D7C 8009F31C 54830738 */  rlwinm  r3, r4, 0, 0x1c, 0x1c
/* 099D80 8009F320 28030000 */  cmplwi  r3, 0
/* 099D84 8009F324 41820008 */  beq     lbl_8009F32C
/* 099D88 8009F328 64000020 */  oris    r0, r0, 0x20
lbl_8009F32C:
/* 099D8C 8009F32C 54830528 */  rlwinm  r3, r4, 0, 0x14, 0x14
/* 099D90 8009F330 28030000 */  cmplwi  r3, 0
/* 099D94 8009F334 41820008 */  beq     lbl_8009F33C
/* 099D98 8009F338 64000010 */  oris    r0, r0, 0x10
lbl_8009F33C:
/* 099D9C 8009F33C 3C60CC00 */  lis     r3, 0xcc00
/* 099DA0 8009F340 38636800 */  addi    r3, r3, 0x6800
/* 099DA4 8009F344 80830014 */  lwz     r4, 0x14(r3)
/* 099DA8 8009F348 548307BC */  rlwinm  r3, r4, 0, 0x1e, 0x1e
/* 099DAC 8009F34C 28030000 */  cmplwi  r3, 0
/* 099DB0 8009F350 41820008 */  beq     lbl_8009F358
/* 099DB4 8009F354 64000008 */  oris    r0, r0, 8
lbl_8009F358:
/* 099DB8 8009F358 54830738 */  rlwinm  r3, r4, 0, 0x1c, 0x1c
/* 099DBC 8009F35C 28030000 */  cmplwi  r3, 0
/* 099DC0 8009F360 41820008 */  beq     lbl_8009F368
/* 099DC4 8009F364 64000004 */  oris    r0, r0, 4
lbl_8009F368:
/* 099DC8 8009F368 54830528 */  rlwinm  r3, r4, 0, 0x14, 0x14
/* 099DCC 8009F36C 28030000 */  cmplwi  r3, 0
/* 099DD0 8009F370 41820008 */  beq     lbl_8009F378
/* 099DD4 8009F374 64000002 */  oris    r0, r0, 2
lbl_8009F378:
/* 099DD8 8009F378 3C60CC00 */  lis     r3, 0xcc00
/* 099DDC 8009F37C 38636800 */  addi    r3, r3, 0x6800
/* 099DE0 8009F380 80830028 */  lwz     r4, 0x28(r3)
/* 099DE4 8009F384 548307BC */  rlwinm  r3, r4, 0, 0x1e, 0x1e
/* 099DE8 8009F388 28030000 */  cmplwi  r3, 0
/* 099DEC 8009F38C 41820008 */  beq     lbl_8009F394
/* 099DF0 8009F390 64000001 */  oris    r0, r0, 1
lbl_8009F394:
/* 099DF4 8009F394 54830738 */  rlwinm  r3, r4, 0, 0x1c, 0x1c
/* 099DF8 8009F398 28030000 */  cmplwi  r3, 0
/* 099DFC 8009F39C 41820008 */  beq     lbl_8009F3A4
/* 099E00 8009F3A0 60008000 */  ori     r0, r0, 0x8000
lbl_8009F3A4:
/* 099E04 8009F3A4 57E304A4 */  rlwinm  r3, r31, 0, 0x12, 0x12
/* 099E08 8009F3A8 28030000 */  cmplwi  r3, 0
/* 099E0C 8009F3AC 41820008 */  beq     lbl_8009F3B4
/* 099E10 8009F3B0 60000020 */  ori     r0, r0, 0x20
lbl_8009F3B4:
/* 099E14 8009F3B4 57E304E6 */  rlwinm  r3, r31, 0, 0x13, 0x13
/* 099E18 8009F3B8 28030000 */  cmplwi  r3, 0
/* 099E1C 8009F3BC 41820008 */  beq     lbl_8009F3C4
/* 099E20 8009F3C0 60000040 */  ori     r0, r0, 0x40
lbl_8009F3C4:
/* 099E24 8009F3C4 57E3056A */  rlwinm  r3, r31, 0, 0x15, 0x15
/* 099E28 8009F3C8 28030000 */  cmplwi  r3, 0
/* 099E2C 8009F3CC 41820008 */  beq     lbl_8009F3D4
/* 099E30 8009F3D0 60001000 */  ori     r0, r0, 0x1000
lbl_8009F3D4:
/* 099E34 8009F3D4 57E305AC */  rlwinm  r3, r31, 0, 0x16, 0x16
/* 099E38 8009F3D8 28030000 */  cmplwi  r3, 0
/* 099E3C 8009F3DC 41820008 */  beq     lbl_8009F3E4
/* 099E40 8009F3E0 60002000 */  ori     r0, r0, 0x2000
lbl_8009F3E4:
/* 099E44 8009F3E4 57E305EE */  rlwinm  r3, r31, 0, 0x17, 0x17
/* 099E48 8009F3E8 28030000 */  cmplwi  r3, 0
/* 099E4C 8009F3EC 41820008 */  beq     lbl_8009F3F4
/* 099E50 8009F3F0 60000080 */  ori     r0, r0, 0x80
lbl_8009F3F4:
/* 099E54 8009F3F4 57E30738 */  rlwinm  r3, r31, 0, 0x1c, 0x1c
/* 099E58 8009F3F8 28030000 */  cmplwi  r3, 0
/* 099E5C 8009F3FC 41820008 */  beq     lbl_8009F404
/* 099E60 8009F400 60000800 */  ori     r0, r0, 0x800
lbl_8009F404:
/* 099E64 8009F404 57E3077A */  rlwinm  r3, r31, 0, 0x1d, 0x1d
/* 099E68 8009F408 28030000 */  cmplwi  r3, 0
/* 099E6C 8009F40C 41820008 */  beq     lbl_8009F414
/* 099E70 8009F410 60000400 */  ori     r0, r0, 0x400
lbl_8009F414:
/* 099E74 8009F414 57E307BC */  rlwinm  r3, r31, 0, 0x1e, 0x1e
/* 099E78 8009F418 28030000 */  cmplwi  r3, 0
/* 099E7C 8009F41C 41820008 */  beq     lbl_8009F424
/* 099E80 8009F420 60000200 */  ori     r0, r0, 0x200
lbl_8009F424:
/* 099E84 8009F424 57E30528 */  rlwinm  r3, r31, 0, 0x14, 0x14
/* 099E88 8009F428 28030000 */  cmplwi  r3, 0
/* 099E8C 8009F42C 41820008 */  beq     lbl_8009F434
/* 099E90 8009F430 60004000 */  ori     r0, r0, 0x4000
lbl_8009F434:
/* 099E94 8009F434 57E307FE */  clrlwi  r3, r31, 0x1f
/* 099E98 8009F438 28030000 */  cmplwi  r3, 0
/* 099E9C 8009F43C 41820008 */  beq     lbl_8009F444
/* 099EA0 8009F440 60000100 */  ori     r0, r0, 0x100
lbl_8009F444:
/* 099EA4 8009F444 3C608000 */  lis     r3, 0x8000
/* 099EA8 8009F448 808300C4 */  lwz     r4, 0xc4(r3)
/* 099EAC 8009F44C 806300C8 */  lwz     r3, 0xc8(r3)
/* 099EB0 8009F450 7C831B78 */  or      r3, r4, r3
/* 099EB4 8009F454 7C041878 */  andc    r4, r0, r3
/* 099EB8 8009F458 28040000 */  cmplwi  r4, 0
/* 099EBC 8009F45C 41820098 */  beq     lbl_8009F4F4
/* 099EC0 8009F460 3C60800F */  lis     r3, InterruptPrioTable@ha
/* 099EC4 8009F464 38031370 */  addi    r0, r3, InterruptPrioTable@l
/* 099EC8 8009F468 7C030378 */  mr      r3, r0
/* 099ECC 8009F46C 48000004 */  b       lbl_8009F470
lbl_8009F470:
/* 099ED0 8009F470 48000004 */  b       lbl_8009F474
lbl_8009F474:
/* 099ED4 8009F474 80030000 */  lwz     r0, 0(r3)
/* 099ED8 8009F478 7C800038 */  and     r0, r4, r0
/* 099EDC 8009F47C 28000000 */  cmplwi  r0, 0
/* 099EE0 8009F480 41820010 */  beq     lbl_8009F490
/* 099EE4 8009F484 7C000034 */  cntlzw  r0, r0
/* 099EE8 8009F488 7C1D0734 */  extsh   r29, r0
/* 099EEC 8009F48C 4800000C */  b       lbl_8009F498
lbl_8009F490:
/* 099EF0 8009F490 38630004 */  addi    r3, r3, 4
/* 099EF4 8009F494 4BFFFFE0 */  b       lbl_8009F474
lbl_8009F498:
/* 099EF8 8009F498 806D8B30 */  lwz     r3, InterruptHandlerTable-_SDA_BASE_(r13)
/* 099EFC 8009F49C 57A0103A */  slwi    r0, r29, 2
/* 099F00 8009F4A0 7FE3002E */  lwzx    r31, r3, r0
/* 099F04 8009F4A4 281F0000 */  cmplwi  r31, 0
/* 099F08 8009F4A8 4182004C */  beq     lbl_8009F4F4
/* 099F0C 8009F4AC 2C1D0004 */  cmpwi   r29, 4
/* 099F10 8009F4B0 4081001C */  ble     lbl_8009F4CC
/* 099F14 8009F4B4 B3AD8B38 */  sth     r29, __OSLastInterrupt-_SDA_BASE_(r13)
/* 099F18 8009F4B8 48002DF1 */  bl      OSGetTime
/* 099F1C 8009F4BC 908D8B44 */  stw     r4, (__OSLastInterruptTime + 4)-_SDA_BASE_(r13)
/* 099F20 8009F4C0 906D8B40 */  stw     r3, __OSLastInterruptTime-_SDA_BASE_(r13)
/* 099F24 8009F4C4 801E0198 */  lwz     r0, 0x198(r30)
/* 099F28 8009F4C8 900D8B34 */  stw     r0, __OSLastInterruptSrr0-_SDA_BASE_(r13)
lbl_8009F4CC:
/* 099F2C 8009F4CC 48001D85 */  bl      OSDisableScheduler
/* 099F30 8009F4D0 7FA3EB78 */  mr      r3, r29
/* 099F34 8009F4D4 7FC4F378 */  mr      r4, r30
/* 099F38 8009F4D8 7FECFB78 */  mr      r12, r31
/* 099F3C 8009F4DC 7D8803A6 */  mtlr    r12
/* 099F40 8009F4E0 4E800021 */  blrl    
/* 099F44 8009F4E4 48001DAD */  bl      OSEnableScheduler
/* 099F48 8009F4E8 48002275 */  bl      __OSReschedule
/* 099F4C 8009F4EC 7FC3F378 */  mr      r3, r30
/* 099F50 8009F4F0 4BFFEBD5 */  bl      OSLoadContext
lbl_8009F4F4:
/* 099F54 8009F4F4 7FC3F378 */  mr      r3, r30
/* 099F58 8009F4F8 4BFFEBCD */  bl      OSLoadContext
/* 099F5C 8009F4FC 8001002C */  lwz     r0, 0x2c(r1)
/* 099F60 8009F500 83E10024 */  lwz     r31, 0x24(r1)
/* 099F64 8009F504 83C10020 */  lwz     r30, 0x20(r1)
/* 099F68 8009F508 83A1001C */  lwz     r29, 0x1c(r1)
/* 099F6C 8009F50C 38210028 */  addi    r1, r1, 0x28
/* 099F70 8009F510 7C0803A6 */  mtlr    r0
/* 099F74 8009F514 4E800020 */  blr     

ExternalInterruptHandler:
/* 099F78 8009F518 90040000 */  stw     r0, 0(r4)
/* 099F7C 8009F51C 90240004 */  stw     r1, 4(r4)
/* 099F80 8009F520 90440008 */  stw     r2, 8(r4)
/* 099F84 8009F524 BCC40018 */  stmw    r6, 0x18(r4)
/* 099F88 8009F528 7C11E2A6 */  mfspr   r0, 0x391
/* 099F8C 8009F52C 900401A8 */  stw     r0, 0x1a8(r4)
/* 099F90 8009F530 7C12E2A6 */  mfspr   r0, 0x392
/* 099F94 8009F534 900401AC */  stw     r0, 0x1ac(r4)
/* 099F98 8009F538 7C13E2A6 */  mfspr   r0, 0x393
/* 099F9C 8009F53C 900401B0 */  stw     r0, 0x1b0(r4)
/* 099FA0 8009F540 7C14E2A6 */  mfspr   r0, 0x394
/* 099FA4 8009F544 900401B4 */  stw     r0, 0x1b4(r4)
/* 099FA8 8009F548 7C15E2A6 */  mfspr   r0, 0x395
/* 099FAC 8009F54C 900401B8 */  stw     r0, 0x1b8(r4)
/* 099FB0 8009F550 7C16E2A6 */  mfspr   r0, 0x396
/* 099FB4 8009F554 900401BC */  stw     r0, 0x1bc(r4)
/* 099FB8 8009F558 7C17E2A6 */  mfspr   r0, 0x397
/* 099FBC 8009F55C 900401C0 */  stw     r0, 0x1c0(r4)
/* 099FC0 8009F560 9421FFF8 */  stwu    r1, -8(r1)
/* 099FC4 8009F564 4BFFFC70 */  b       __OSDispatchInterrupt


.section .data, "wa"

.balign 8

/* 000EE3F0 800F1370 002C */
InterruptPrioTable:
    .long 0x00000100, 0x00000040, 0xF8000000, 0x00000200, 0x00000080, 0x00003000, 0x00000020, 0x03FF8C00
    .long 0x04000000, 0x00004000, 0xFFFFFFFF


.section .sbss, "wa"

.balign 8

/* 000F1A90 80135810 0004 */
InterruptHandlerTable:
    .skip 4

.balign 4

/* 000F1A94 80135814 0004 */
glabel __OSLastInterruptSrr0
    .skip 4

.balign 4

/* 000F1A98 80135818 0002 */
glabel __OSLastInterrupt
    .skip 2

.balign 8

/* 000F1AA0 80135820 0008 */
glabel __OSLastInterruptTime
    .skip 8


