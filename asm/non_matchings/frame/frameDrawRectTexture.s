glabel frameDrawRectTexture
/* 020F74 80026514 7C0802A6 */  mflr    r0
/* 020F78 80026518 90010004 */  stw     r0, 4(r1)
/* 020F7C 8002651C 9421FF78 */  stwu    r1, -0x88(r1)
/* 020F80 80026520 DBE10080 */  stfd    f31, 0x80(r1)
/* 020F84 80026524 DBC10078 */  stfd    f30, 0x78(r1)
/* 020F88 80026528 DBA10070 */  stfd    f29, 0x70(r1)
/* 020F8C 8002652C DB810068 */  stfd    f28, 0x68(r1)
/* 020F90 80026530 DB610060 */  stfd    f27, 0x60(r1)
/* 020F94 80026534 DB410058 */  stfd    f26, 0x58(r1)
/* 020F98 80026538 DB210050 */  stfd    f25, 0x50(r1)
/* 020F9C 8002653C DB010048 */  stfd    f24, 0x48(r1)
/* 020FA0 80026540 DAE10040 */  stfd    f23, 0x40(r1)
/* 020FA4 80026544 93E1003C */  stw     r31, 0x3c(r1)
/* 020FA8 80026548 93C10038 */  stw     r30, 0x38(r1)
/* 020FAC 8002654C 7C7E1B78 */  mr      r30, r3
/* 020FB0 80026550 7C9F2378 */  mr      r31, r4
/* 020FB4 80026554 806D8920 */  lwz     r3, gpSystem@sda21(r13)
/* 020FB8 80026558 80030020 */  lwz     r0, 0x20(r3)
/* 020FBC 8002655C 2C00000B */  cmpwi   r0, 0xb
/* 020FC0 80026560 408200A8 */  bne     lbl_80026608
/* 020FC4 80026564 801F0008 */  lwz     r0, 8(r31)
/* 020FC8 80026568 2C000000 */  cmpwi   r0, 0
/* 020FCC 8002656C 40820070 */  bne     lbl_800265DC
/* 020FD0 80026570 801F000C */  lwz     r0, 0xc(r31)
/* 020FD4 80026574 2C000000 */  cmpwi   r0, 0
/* 020FD8 80026578 40820064 */  bne     lbl_800265DC
/* 020FDC 8002657C 801F0010 */  lwz     r0, 0x10(r31)
/* 020FE0 80026580 2C00051C */  cmpwi   r0, 0x51c
/* 020FE4 80026584 40820058 */  bne     lbl_800265DC
/* 020FE8 80026588 801F0014 */  lwz     r0, 0x14(r31)
/* 020FEC 8002658C 2C000014 */  cmpwi   r0, 0x14
/* 020FF0 80026590 4082004C */  bne     lbl_800265DC
/* 020FF4 80026594 807E00EC */  lwz     r3, 0xec(r30)
/* 020FF8 80026598 3C03FFC5 */  addis   r0, r3, 0xffc5
/* 020FFC 8002659C 28005000 */  cmplwi  r0, 0x5000
/* 021000 800265A0 4182003C */  beq     lbl_800265DC
/* 021004 800265A4 3C03FFC3 */  addis   r0, r3, 0xffc3
/* 021008 800265A8 2800A800 */  cmplwi  r0, 0xa800
/* 02100C 800265AC 41820030 */  beq     lbl_800265DC
/* 021010 800265B0 801E0070 */  lwz     r0, 0x70(r30)
/* 021014 800265B4 2C000000 */  cmpwi   r0, 0
/* 021018 800265B8 40820024 */  bne     lbl_800265DC
/* 02101C 800265BC 3C7E0004 */  addis   r3, r30, 4
/* 021020 800265C0 8083D13C */  lwz     r4, -0x2ec4(r3)
/* 021024 800265C4 7FC3F378 */  mr      r3, r30
/* 021028 800265C8 4BFFF0D5 */  bl      ZeldaDrawFrameNoBlend
/* 02102C 800265CC 38000001 */  li      r0, 1
/* 021030 800265D0 901E0070 */  stw     r0, 0x70(r30)
/* 021034 800265D4 38000000 */  li      r0, 0
/* 021038 800265D8 900D89E4 */  stw     r0, nCounter@sda21(r13)
lbl_800265DC:
/* 02103C 800265DC 801E0070 */  lwz     r0, 0x70(r30)
/* 021040 800265E0 2C000001 */  cmpwi   r0, 1
/* 021044 800265E4 40820024 */  bne     lbl_80026608
/* 021048 800265E8 806D89E4 */  lwz     r3, nCounter@sda21(r13)
/* 02104C 800265EC 38030001 */  addi    r0, r3, 1
/* 021050 800265F0 900D89E4 */  stw     r0, nCounter@sda21(r13)
/* 021054 800265F4 800D89E4 */  lwz     r0, nCounter@sda21(r13)
/* 021058 800265F8 2C000028 */  cmpwi   r0, 0x28
/* 02105C 800265FC 4080000C */  bge     lbl_80026608
/* 021060 80026600 38600001 */  li      r3, 1
/* 021064 80026604 480003AC */  b       lbl_800269B0
lbl_80026608:
/* 021068 80026608 880D89C8 */  lbz     r0, sSpecialZeldaHackON@sda21(r13)
/* 02106C 8002660C 28000000 */  cmplwi  r0, 0
/* 021070 80026610 4182000C */  beq     lbl_8002661C
/* 021074 80026614 38600001 */  li      r3, 1
/* 021078 80026618 48000398 */  b       lbl_800269B0
lbl_8002661C:
/* 02107C 8002661C 801E00A4 */  lwz     r0, 0xa4(r30)
/* 021080 80026620 54030296 */  rlwinm  r3, r0, 0, 0xa, 0xb
/* 021084 80026624 3C03FFD0 */  addis   r0, r3, 0xffd0
/* 021088 80026628 28000000 */  cmplwi  r0, 0
/* 02108C 8002662C 41820010 */  beq     lbl_8002663C
/* 021090 80026630 3C03FFE0 */  addis   r0, r3, 0xffe0
/* 021094 80026634 28000000 */  cmplwi  r0, 0
/* 021098 80026638 4082000C */  bne     lbl_80026644
lbl_8002663C:
/* 02109C 8002663C 39600001 */  li      r11, 1
/* 0210A0 80026640 48000008 */  b       lbl_80026648
lbl_80026644:
/* 0210A4 80026644 39600000 */  li      r11, 0
lbl_80026648:
/* 0210A8 80026648 2C0B0000 */  cmpwi   r11, 0
/* 0210AC 8002664C 41820014 */  beq     lbl_80026660
/* 0210B0 80026650 C03F0020 */  lfs     f1, 0x20(r31)
/* 0210B4 80026654 C0028104 */  lfs     f0, D_80135E04@sda21(r2)
/* 0210B8 80026658 EC610032 */  fmuls   f3, f1, f0
/* 0210BC 8002665C 48000008 */  b       lbl_80026664
lbl_80026660:
/* 0210C0 80026660 C07F0020 */  lfs     f3, 0x20(r31)
lbl_80026664:
/* 0210C4 80026664 813F0008 */  lwz     r9, 8(r31)
/* 0210C8 80026668 3CE04330 */  lis     r7, 0x4330
/* 0210CC 8002666C 807F0010 */  lwz     r3, 0x10(r31)
/* 0210D0 80026670 38090003 */  addi    r0, r9, 3
/* 0210D4 80026674 815F000C */  lwz     r10, 0xc(r31)
/* 0210D8 80026678 7C081670 */  srawi   r8, r0, 2
/* 0210DC 8002667C 809F0014 */  lwz     r4, 0x14(r31)
/* 0210E0 80026680 38030003 */  addi    r0, r3, 3
/* 0210E4 80026684 806D8920 */  lwz     r3, gpSystem@sda21(r13)
/* 0210E8 80026688 7C061670 */  srawi   r6, r0, 2
/* 0210EC 8002668C C8428110 */  lfd     f2, D_80135E10@sda21(r2)
/* 0210F0 80026690 38AA0003 */  addi    r5, r10, 3
/* 0210F4 80026694 80030020 */  lwz     r0, 0x20(r3)
/* 0210F8 80026698 7CA51670 */  srawi   r5, r5, 2
/* 0210FC 8002669C C0BF0024 */  lfs     f5, 0x24(r31)
/* 021100 800266A0 38640003 */  addi    r3, r4, 3
/* 021104 800266A4 7C631670 */  srawi   r3, r3, 2
/* 021108 800266A8 6D048000 */  xoris   r4, r8, 0x8000
/* 02110C 800266AC 6CC68000 */  xoris   r6, r6, 0x8000
/* 021110 800266B0 90810034 */  stw     r4, 0x34(r1)
/* 021114 800266B4 6CA48000 */  xoris   r4, r5, 0x8000
/* 021118 800266B8 6C638000 */  xoris   r3, r3, 0x8000
/* 02111C 800266BC 90C1002C */  stw     r6, 0x2c(r1)
/* 021120 800266C0 2C000004 */  cmpwi   r0, 4
/* 021124 800266C4 90810024 */  stw     r4, 0x24(r1)
/* 021128 800266C8 9061001C */  stw     r3, 0x1c(r1)
/* 02112C 800266CC 90E10030 */  stw     r7, 0x30(r1)
/* 021130 800266D0 90E10028 */  stw     r7, 0x28(r1)
/* 021134 800266D4 C8210030 */  lfd     f1, 0x30(r1)
/* 021138 800266D8 90E10020 */  stw     r7, 0x20(r1)
/* 02113C 800266DC C8010028 */  lfd     f0, 0x28(r1)
/* 021140 800266E0 EFC11028 */  fsubs   f30, f1, f2
/* 021144 800266E4 90E10018 */  stw     r7, 0x18(r1)
/* 021148 800266E8 C8210020 */  lfd     f1, 0x20(r1)
/* 02114C 800266EC EF801028 */  fsubs   f28, f0, f2
/* 021150 800266F0 C8010018 */  lfd     f0, 0x18(r1)
/* 021154 800266F4 EFA11028 */  fsubs   f29, f1, f2
/* 021158 800266F8 EF601028 */  fsubs   f27, f0, f2
/* 02115C 800266FC 40820058 */  bne     lbl_80026754
/* 021160 80026700 2C090330 */  cmpwi   r9, 0x330
/* 021164 80026704 40820050 */  bne     lbl_80026754
/* 021168 80026708 2C0A0230 */  cmpwi   r10, 0x230
/* 02116C 8002670C 40820048 */  bne     lbl_80026754
/* 021170 80026710 806D89E0 */  lwz     r3, gnCountMapHack@sda21(r13)
/* 021174 80026714 2C030000 */  cmpwi   r3, 0
/* 021178 80026718 40800020 */  bge     lbl_80026738
/* 02117C 8002671C 38030001 */  addi    r0, r3, 1
/* 021180 80026720 2C000000 */  cmpwi   r0, 0
/* 021184 80026724 900D89E0 */  stw     r0, gnCountMapHack@sda21(r13)
/* 021188 80026728 40820010 */  bne     lbl_80026738
/* 02118C 8002672C 38000001 */  li      r0, 1
/* 021190 80026730 900D89E0 */  stw     r0, gnCountMapHack@sda21(r13)
/* 021194 80026734 48000020 */  b       lbl_80026754
lbl_80026738:
/* 021198 80026738 806D89E0 */  lwz     r3, gnCountMapHack@sda21(r13)
/* 02119C 8002673C 2C030000 */  cmpwi   r3, 0
/* 0211A0 80026740 40810014 */  ble     lbl_80026754
/* 0211A4 80026744 3803FFFF */  addi    r0, r3, -1
/* 0211A8 80026748 900D89E0 */  stw     r0, gnCountMapHack@sda21(r13)
/* 0211AC 8002674C 38600001 */  li      r3, 1
/* 0211B0 80026750 48000260 */  b       lbl_800269B0
lbl_80026754:
/* 0211B4 80026754 801F0000 */  lwz     r0, 0(r31)
/* 0211B8 80026758 2C000000 */  cmpwi   r0, 0
/* 0211BC 8002675C 41820028 */  beq     lbl_80026784
/* 0211C0 80026760 EC3BE828 */  fsubs   f1, f27, f29
/* 0211C4 80026764 C05F0018 */  lfs     f2, 0x18(r31)
/* 0211C8 80026768 C09F001C */  lfs     f4, 0x1c(r31)
/* 0211CC 8002676C EC1CF028 */  fsubs   f0, f28, f30
/* 0211D0 80026770 FF401090 */  fmr     f26, f2
/* 0211D4 80026774 FF202090 */  fmr     f25, f4
/* 0211D8 80026778 EF03107A */  fmadds  f24, f3, f1, f2
/* 0211DC 8002677C EEE5203A */  fmadds  f23, f5, f0, f4
/* 0211E0 80026780 48000024 */  b       lbl_800267A4
lbl_80026784:
/* 0211E4 80026784 EC3CF028 */  fsubs   f1, f28, f30
/* 0211E8 80026788 C05F0018 */  lfs     f2, 0x18(r31)
/* 0211EC 8002678C C09F001C */  lfs     f4, 0x1c(r31)
/* 0211F0 80026790 EC1BE828 */  fsubs   f0, f27, f29
/* 0211F4 80026794 FF401090 */  fmr     f26, f2
/* 0211F8 80026798 FF202090 */  fmr     f25, f4
/* 0211FC 8002679C EF03107A */  fmadds  f24, f3, f1, f2
/* 021200 800267A0 EEE5203A */  fmadds  f23, f5, f0, f4
lbl_800267A4:
/* 021204 800267A4 2C0B0000 */  cmpwi   r11, 0
/* 021208 800267A8 41820018 */  beq     lbl_800267C0
/* 02120C 800267AC C0028138 */  lfs     f0, D_80135E38@sda21(r2)
/* 021210 800267B0 EF9C002A */  fadds   f28, f28, f0
/* 021214 800267B4 EF18002A */  fadds   f24, f24, f0
/* 021218 800267B8 EF7B002A */  fadds   f27, f27, f0
/* 02121C 800267BC EEF7002A */  fadds   f23, f23, f0
lbl_800267C0:
/* 021220 800267C0 801E005C */  lwz     r0, 0x5c(r30)
/* 021224 800267C4 C3E28100 */  lfs     f31, D_80135E00@sda21(r2)
/* 021228 800267C8 2C000000 */  cmpwi   r0, 0
/* 02122C 800267CC 41820008 */  beq     lbl_800267D4
/* 021230 800267D0 C3E281B0 */  lfs     f31, D_80135EB0@sda21(r2)
lbl_800267D4:
/* 021234 800267D4 3FDE0004 */  addis   r30, r30, 4
/* 021238 800267D8 801ED138 */  lwz     r0, -0x2ec8(r30)
/* 02123C 800267DC 2800000F */  cmplwi  r0, 0xf
/* 021240 800267E0 4182007C */  beq     lbl_8002685C
/* 021244 800267E4 48083A05 */  bl      GXClearVtxDesc
/* 021248 800267E8 38600009 */  li      r3, 9
/* 02124C 800267EC 38800001 */  li      r4, 1
/* 021250 800267F0 480835AD */  bl      GXSetVtxDesc
/* 021254 800267F4 3860000B */  li      r3, 0xb
/* 021258 800267F8 38800001 */  li      r4, 1
/* 02125C 800267FC 480835A1 */  bl      GXSetVtxDesc
/* 021260 80026800 3860000D */  li      r3, 0xd
/* 021264 80026804 38800001 */  li      r4, 1
/* 021268 80026808 48083595 */  bl      GXSetVtxDesc
/* 02126C 8002680C 38600000 */  li      r3, 0
/* 021270 80026810 38800009 */  li      r4, 9
/* 021274 80026814 38A00001 */  li      r5, 1
/* 021278 80026818 38C00004 */  li      r6, 4
/* 02127C 8002681C 38E00000 */  li      r7, 0
/* 021280 80026820 48083A01 */  bl      GXSetVtxAttrFmt
/* 021284 80026824 38600000 */  li      r3, 0
/* 021288 80026828 3880000B */  li      r4, 0xb
/* 02128C 8002682C 38A00001 */  li      r5, 1
/* 021290 80026830 38C00005 */  li      r6, 5
/* 021294 80026834 38E00000 */  li      r7, 0
/* 021298 80026838 480839E9 */  bl      GXSetVtxAttrFmt
/* 02129C 8002683C 38600000 */  li      r3, 0
/* 0212A0 80026840 3880000D */  li      r4, 0xd
/* 0212A4 80026844 38A00001 */  li      r5, 1
/* 0212A8 80026848 38C00004 */  li      r6, 4
/* 0212AC 8002684C 38E00000 */  li      r7, 0
/* 0212B0 80026850 480839D1 */  bl      GXSetVtxAttrFmt
/* 0212B4 80026854 3800000F */  li      r0, 0xf
/* 0212B8 80026858 901ED138 */  stw     r0, -0x2ec8(r30)
lbl_8002685C:
/* 0212BC 8002685C 38600080 */  li      r3, 0x80
/* 0212C0 80026860 38800000 */  li      r4, 0
/* 0212C4 80026864 38A00004 */  li      r5, 4
/* 0212C8 80026868 48084BF9 */  bl      GXBegin
/* 0212CC 8002686C 801F0000 */  lwz     r0, 0(r31)
/* 0212D0 80026870 2C000000 */  cmpwi   r0, 0
/* 0212D4 80026874 418200A0 */  beq     lbl_80026914
/* 0212D8 80026878 3C60CC01 */  lis     r3, 0xcc01
/* 0212DC 8002687C D3C38000 */  stfs    f30, -0x8000(r3)
/* 0212E0 80026880 38000000 */  li      r0, 0
/* 0212E4 80026884 D3A38000 */  stfs    f29, -0x8000(r3)
/* 0212E8 80026888 D3E38000 */  stfs    f31, -0x8000(r3)
/* 0212EC 8002688C 98038000 */  stb     r0, -0x8000(r3)
/* 0212F0 80026890 98038000 */  stb     r0, -0x8000(r3)
/* 0212F4 80026894 98038000 */  stb     r0, -0x8000(r3)
/* 0212F8 80026898 98038000 */  stb     r0, -0x8000(r3)
/* 0212FC 8002689C D3438000 */  stfs    f26, -0x8000(r3)
/* 021300 800268A0 D3238000 */  stfs    f25, -0x8000(r3)
/* 021304 800268A4 D3C38000 */  stfs    f30, -0x8000(r3)
/* 021308 800268A8 D3638000 */  stfs    f27, -0x8000(r3)
/* 02130C 800268AC D3E38000 */  stfs    f31, -0x8000(r3)
/* 021310 800268B0 98038000 */  stb     r0, -0x8000(r3)
/* 021314 800268B4 98038000 */  stb     r0, -0x8000(r3)
/* 021318 800268B8 98038000 */  stb     r0, -0x8000(r3)
/* 02131C 800268BC 98038000 */  stb     r0, -0x8000(r3)
/* 021320 800268C0 D3038000 */  stfs    f24, -0x8000(r3)
/* 021324 800268C4 D3238000 */  stfs    f25, -0x8000(r3)
/* 021328 800268C8 D3838000 */  stfs    f28, -0x8000(r3)
/* 02132C 800268CC D3638000 */  stfs    f27, -0x8000(r3)
/* 021330 800268D0 D3E38000 */  stfs    f31, -0x8000(r3)
/* 021334 800268D4 98038000 */  stb     r0, -0x8000(r3)
/* 021338 800268D8 98038000 */  stb     r0, -0x8000(r3)
/* 02133C 800268DC 98038000 */  stb     r0, -0x8000(r3)
/* 021340 800268E0 98038000 */  stb     r0, -0x8000(r3)
/* 021344 800268E4 D3038000 */  stfs    f24, -0x8000(r3)
/* 021348 800268E8 D2E38000 */  stfs    f23, -0x8000(r3)
/* 02134C 800268EC D3838000 */  stfs    f28, -0x8000(r3)
/* 021350 800268F0 D3A38000 */  stfs    f29, -0x8000(r3)
/* 021354 800268F4 D3E38000 */  stfs    f31, -0x8000(r3)
/* 021358 800268F8 98038000 */  stb     r0, -0x8000(r3)
/* 02135C 800268FC 98038000 */  stb     r0, -0x8000(r3)
/* 021360 80026900 98038000 */  stb     r0, -0x8000(r3)
/* 021364 80026904 98038000 */  stb     r0, -0x8000(r3)
/* 021368 80026908 D3438000 */  stfs    f26, -0x8000(r3)
/* 02136C 8002690C D2E38000 */  stfs    f23, -0x8000(r3)
/* 021370 80026910 4800009C */  b       lbl_800269AC
lbl_80026914:
/* 021374 80026914 3C60CC01 */  lis     r3, 0xcc01
/* 021378 80026918 D3C38000 */  stfs    f30, -0x8000(r3)
/* 02137C 8002691C 38000000 */  li      r0, 0
/* 021380 80026920 D3A38000 */  stfs    f29, -0x8000(r3)
/* 021384 80026924 D3E38000 */  stfs    f31, -0x8000(r3)
/* 021388 80026928 98038000 */  stb     r0, -0x8000(r3)
/* 02138C 8002692C 98038000 */  stb     r0, -0x8000(r3)
/* 021390 80026930 98038000 */  stb     r0, -0x8000(r3)
/* 021394 80026934 98038000 */  stb     r0, -0x8000(r3)
/* 021398 80026938 D3438000 */  stfs    f26, -0x8000(r3)
/* 02139C 8002693C D3238000 */  stfs    f25, -0x8000(r3)
/* 0213A0 80026940 D3838000 */  stfs    f28, -0x8000(r3)
/* 0213A4 80026944 D3A38000 */  stfs    f29, -0x8000(r3)
/* 0213A8 80026948 D3E38000 */  stfs    f31, -0x8000(r3)
/* 0213AC 8002694C 98038000 */  stb     r0, -0x8000(r3)
/* 0213B0 80026950 98038000 */  stb     r0, -0x8000(r3)
/* 0213B4 80026954 98038000 */  stb     r0, -0x8000(r3)
/* 0213B8 80026958 98038000 */  stb     r0, -0x8000(r3)
/* 0213BC 8002695C D3038000 */  stfs    f24, -0x8000(r3)
/* 0213C0 80026960 D3238000 */  stfs    f25, -0x8000(r3)
/* 0213C4 80026964 D3838000 */  stfs    f28, -0x8000(r3)
/* 0213C8 80026968 D3638000 */  stfs    f27, -0x8000(r3)
/* 0213CC 8002696C D3E38000 */  stfs    f31, -0x8000(r3)
/* 0213D0 80026970 98038000 */  stb     r0, -0x8000(r3)
/* 0213D4 80026974 98038000 */  stb     r0, -0x8000(r3)
/* 0213D8 80026978 98038000 */  stb     r0, -0x8000(r3)
/* 0213DC 8002697C 98038000 */  stb     r0, -0x8000(r3)
/* 0213E0 80026980 D3038000 */  stfs    f24, -0x8000(r3)
/* 0213E4 80026984 D2E38000 */  stfs    f23, -0x8000(r3)
/* 0213E8 80026988 D3C38000 */  stfs    f30, -0x8000(r3)
/* 0213EC 8002698C D3638000 */  stfs    f27, -0x8000(r3)
/* 0213F0 80026990 D3E38000 */  stfs    f31, -0x8000(r3)
/* 0213F4 80026994 98038000 */  stb     r0, -0x8000(r3)
/* 0213F8 80026998 98038000 */  stb     r0, -0x8000(r3)
/* 0213FC 8002699C 98038000 */  stb     r0, -0x8000(r3)
/* 021400 800269A0 98038000 */  stb     r0, -0x8000(r3)
/* 021404 800269A4 D3438000 */  stfs    f26, -0x8000(r3)
/* 021408 800269A8 D2E38000 */  stfs    f23, -0x8000(r3)
lbl_800269AC:
/* 02140C 800269AC 38600001 */  li      r3, 1
lbl_800269B0:
/* 021410 800269B0 8001008C */  lwz     r0, 0x8c(r1)
/* 021414 800269B4 CBE10080 */  lfd     f31, 0x80(r1)
/* 021418 800269B8 CBC10078 */  lfd     f30, 0x78(r1)
/* 02141C 800269BC 7C0803A6 */  mtlr    r0
/* 021420 800269C0 CBA10070 */  lfd     f29, 0x70(r1)
/* 021424 800269C4 CB810068 */  lfd     f28, 0x68(r1)
/* 021428 800269C8 CB610060 */  lfd     f27, 0x60(r1)
/* 02142C 800269CC CB410058 */  lfd     f26, 0x58(r1)
/* 021430 800269D0 CB210050 */  lfd     f25, 0x50(r1)
/* 021434 800269D4 CB010048 */  lfd     f24, 0x48(r1)
/* 021438 800269D8 CAE10040 */  lfd     f23, 0x40(r1)
/* 02143C 800269DC 83E1003C */  lwz     r31, 0x3c(r1)
/* 021440 800269E0 83C10038 */  lwz     r30, 0x38(r1)
/* 021444 800269E4 38210088 */  addi    r1, r1, 0x88
/* 021448 800269E8 4E800020 */  blr     
