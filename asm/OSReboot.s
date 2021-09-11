# OSReboot.c
.include "macros.inc"

.section .text, "ax"

.balign 4

Run:
/* 09A52C 8009FACC 7C0004AC */  sync    0
/* 09A530 8009FAD0 4C00012C */  isync   
/* 09A534 8009FAD4 7C6803A6 */  mtlr    r3
/* 09A538 8009FAD8 4E800020 */  blr     

Callback:
/* 09A53C 8009FADC 38000001 */  li      r0, 1
/* 09A540 8009FAE0 900D8B50 */  stw     r0, Prepared-_SDA_BASE_(r13)
/* 09A544 8009FAE4 4E800020 */  blr     

glabel __OSReboot
/* 09A548 8009FAE8 7C0802A6 */  mflr    r0
/* 09A54C 8009FAEC 90010004 */  stw     r0, 4(r1)
/* 09A550 8009FAF0 9421FC80 */  stwu    r1, -0x380(r1)
/* 09A554 8009FAF4 BF410368 */  stmw    r26, 0x368(r1)
/* 09A558 8009FAF8 3C608013 */  lis     r3, Header@ha
/* 09A55C 8009FAFC 3BC30FC0 */  addi    r30, r3, Header@l
/* 09A560 8009FB00 4BFFF1FD */  bl      OSDisableInterrupts
/* 09A564 8009FB04 80AD8B48 */  lwz     r5, SaveStart-_SDA_BASE_(r13)
/* 09A568 8009FB08 3C808130 */  lis     r4, 0x8130
/* 09A56C 8009FB0C 800D8B4C */  lwz     r0, SaveEnd-_SDA_BASE_(r13)
/* 09A570 8009FB10 3B600000 */  li      r27, 0
/* 09A574 8009FB14 3FE08180 */  lis     r31, 0x8180
/* 09A578 8009FB18 38C00001 */  li      r6, 1
/* 09A57C 8009FB1C 937FFFFC */  stw     r27, -4(r31)
/* 09A580 8009FB20 3F408000 */  lis     r26, 0x8000
/* 09A584 8009FB24 937FFFF8 */  stw     r27, -8(r31)
/* 09A588 8009FB28 386100A0 */  addi    r3, r1, 0xa0
/* 09A58C 8009FB2C 98DA30E2 */  stb     r6, 0x30e2(r26)
/* 09A590 8009FB30 90A4DFF0 */  stw     r5, -0x2010(r4)
/* 09A594 8009FB34 9004DFEC */  stw     r0, -0x2014(r4)
/* 09A598 8009FB38 4BFFE66D */  bl      OSClearContext
/* 09A59C 8009FB3C 386100A0 */  addi    r3, r1, 0xa0
/* 09A5A0 8009FB40 4BFFE49D */  bl      OSSetCurrentContext
/* 09A5A4 8009FB44 48013431 */  bl      DVDInit
/* 09A5A8 8009FB48 38600001 */  li      r3, 1
/* 09A5AC 8009FB4C 48015559 */  bl      DVDSetAutoInvalidation
/* 09A5B0 8009FB50 48015565 */  bl      DVDResume
/* 09A5B4 8009FB54 3C60800A */  lis     r3, Callback@ha
/* 09A5B8 8009FB58 936D8B50 */  stw     r27, Prepared-_SDA_BASE_(r13)
/* 09A5BC 8009FB5C 3863FADC */  addi    r3, r3, Callback@l
/* 09A5C0 8009FB60 480159F1 */  bl      __DVDPrepareResetAsync
/* 09A5C4 8009FB64 3860FFE0 */  li      r3, -32
/* 09A5C8 8009FB68 4BFFF55D */  bl      __OSMaskInterrupts
/* 09A5CC 8009FB6C 38600400 */  li      r3, 0x400
/* 09A5D0 8009FB70 4BFFF5DD */  bl      __OSUnmaskInterrupts
/* 09A5D4 8009FB74 4BFFF19D */  bl      OSEnableInterrupts
/* 09A5D8 8009FB78 48002731 */  bl      OSGetTime
/* 09A5DC 8009FB7C 7C9D2378 */  mr      r29, r4
/* 09A5E0 8009FB80 7C7C1B78 */  mr      r28, r3
/* 09A5E4 8009FB84 48000004 */  b       lbl_8009FB88
lbl_8009FB88:
/* 09A5E8 8009FB88 801A00F8 */  lwz     r0, 0xf8(r26)
/* 09A5EC 8009FB8C 6F7A8000 */  xoris   r26, r27, 0x8000
/* 09A5F0 8009FB90 541BF0BE */  srwi    r27, r0, 2
/* 09A5F4 8009FB94 48000004 */  b       lbl_8009FB98
lbl_8009FB98:
/* 09A5F8 8009FB98 48000040 */  b       lbl_8009FBD8
lbl_8009FB9C:
/* 09A5FC 8009FB9C 480158BD */  bl      DVDCheckDisk
/* 09A600 8009FBA0 2C030000 */  cmpwi   r3, 0
/* 09A604 8009FBA4 4182002C */  beq     lbl_8009FBD0
/* 09A608 8009FBA8 48002701 */  bl      OSGetTime
/* 09A60C 8009FBAC 7C9D2010 */  subfc   r4, r29, r4
/* 09A610 8009FBB0 7C1C1910 */  subfe   r0, r28, r3
/* 09A614 8009FBB4 6C038000 */  xoris   r3, r0, 0x8000
/* 09A618 8009FBB8 7C04D810 */  subfc   r0, r4, r27
/* 09A61C 8009FBBC 7C63D110 */  subfe   r3, r3, r26
/* 09A620 8009FBC0 7C7AD110 */  subfe   r3, r26, r26
/* 09A624 8009FBC4 7C6300D0 */  neg     r3, r3
/* 09A628 8009FBC8 2C030000 */  cmpwi   r3, 0
/* 09A62C 8009FBCC 4182000C */  beq     lbl_8009FBD8
lbl_8009FBD0:
/* 09A630 8009FBD0 807FFFFC */  lwz     r3, -4(r31)
/* 09A634 8009FBD4 48000349 */  bl      __OSDoHotReset
lbl_8009FBD8:
/* 09A638 8009FBD8 800D8B50 */  lwz     r0, Prepared-_SDA_BASE_(r13)
/* 09A63C 8009FBDC 2C000001 */  cmpwi   r0, 1
/* 09A640 8009FBE0 4082FFBC */  bne     lbl_8009FB9C
/* 09A644 8009FBE4 800D8ADC */  lwz     r0, __OSIsGcam-_SDA_BASE_(r13)
/* 09A648 8009FBE8 2C000000 */  cmpwi   r0, 0
/* 09A64C 8009FBEC 408200C8 */  bne     lbl_8009FCB4
/* 09A650 8009FBF0 48015861 */  bl      DVDGetCurrentDiskID
/* 09A654 8009FBF4 88030008 */  lbz     r0, 8(r3)
/* 09A658 8009FBF8 28000000 */  cmplwi  r0, 0
/* 09A65C 8009FBFC 4182000C */  beq     lbl_8009FC08
/* 09A660 8009FC00 38000001 */  li      r0, 1
/* 09A664 8009FC04 48000008 */  b       lbl_8009FC0C
lbl_8009FC08:
/* 09A668 8009FC08 38000000 */  li      r0, 0
lbl_8009FC0C:
/* 09A66C 8009FC0C 2C000000 */  cmpwi   r0, 0
/* 09A670 8009FC10 418200A4 */  beq     lbl_8009FCB4
/* 09A674 8009FC14 38600000 */  li      r3, 0
/* 09A678 8009FC18 48018765 */  bl      AISetStreamVolLeft
/* 09A67C 8009FC1C 38600000 */  li      r3, 0
/* 09A680 8009FC20 48018789 */  bl      AISetStreamVolRight
/* 09A684 8009FC24 38610070 */  addi    r3, r1, 0x70
/* 09A688 8009FC28 38800000 */  li      r4, 0
/* 09A68C 8009FC2C 480151B1 */  bl      DVDCancelStreamAsync
/* 09A690 8009FC30 48002679 */  bl      OSGetTime
/* 09A694 8009FC34 7C9F2378 */  mr      r31, r4
/* 09A698 8009FC38 7C7D1B78 */  mr      r29, r3
/* 09A69C 8009FC3C 48000004 */  b       lbl_8009FC40
lbl_8009FC40:
/* 09A6A0 8009FC40 3C608000 */  lis     r3, 0x8000
/* 09A6A4 8009FC44 806300F8 */  lwz     r3, 0xf8(r3)
/* 09A6A8 8009FC48 38000000 */  li      r0, 0
/* 09A6AC 8009FC4C 6C1B8000 */  xoris   r27, r0, 0x8000
/* 09A6B0 8009FC50 547CF0BE */  srwi    r28, r3, 2
/* 09A6B4 8009FC54 3F408180 */  lis     r26, 0x8180
/* 09A6B8 8009FC58 48000004 */  b       lbl_8009FC5C
lbl_8009FC5C:
/* 09A6BC 8009FC5C 48000040 */  b       lbl_8009FC9C
lbl_8009FC60:
/* 09A6C0 8009FC60 480157F9 */  bl      DVDCheckDisk
/* 09A6C4 8009FC64 2C030000 */  cmpwi   r3, 0
/* 09A6C8 8009FC68 4182002C */  beq     lbl_8009FC94
/* 09A6CC 8009FC6C 4800263D */  bl      OSGetTime
/* 09A6D0 8009FC70 7C9F2010 */  subfc   r4, r31, r4
/* 09A6D4 8009FC74 7C1D1910 */  subfe   r0, r29, r3
/* 09A6D8 8009FC78 6C038000 */  xoris   r3, r0, 0x8000
/* 09A6DC 8009FC7C 7C04E010 */  subfc   r0, r4, r28
/* 09A6E0 8009FC80 7C63D910 */  subfe   r3, r3, r27
/* 09A6E4 8009FC84 7C7BD910 */  subfe   r3, r27, r27
/* 09A6E8 8009FC88 7C6300D0 */  neg     r3, r3
/* 09A6EC 8009FC8C 2C030000 */  cmpwi   r3, 0
/* 09A6F0 8009FC90 4182000C */  beq     lbl_8009FC9C
lbl_8009FC94:
/* 09A6F4 8009FC94 807AFFFC */  lwz     r3, -4(r26)
/* 09A6F8 8009FC98 48000285 */  bl      __OSDoHotReset
lbl_8009FC9C:
/* 09A6FC 8009FC9C 38610070 */  addi    r3, r1, 0x70
/* 09A700 8009FCA0 4801530D */  bl      DVDGetCommandBlockStatus
/* 09A704 8009FCA4 2C030000 */  cmpwi   r3, 0
/* 09A708 8009FCA8 4082FFB8 */  bne     lbl_8009FC60
/* 09A70C 8009FCAC 38600000 */  li      r3, 0
/* 09A710 8009FCB0 4801840D */  bl      AISetStreamPlayState
lbl_8009FCB4:
/* 09A714 8009FCB4 7FC4F378 */  mr      r4, r30
/* 09A718 8009FCB8 38610040 */  addi    r3, r1, 0x40
/* 09A71C 8009FCBC 38A00020 */  li      r5, 0x20
/* 09A720 8009FCC0 38C02440 */  li      r6, 0x2440
/* 09A724 8009FCC4 38E00000 */  li      r7, 0
/* 09A728 8009FCC8 39000000 */  li      r8, 0
/* 09A72C 8009FCCC 48014E91 */  bl      DVDReadAbsAsyncPrio
/* 09A730 8009FCD0 480025D9 */  bl      OSGetTime
/* 09A734 8009FCD4 7C9A2378 */  mr      r26, r4
/* 09A738 8009FCD8 7C7F1B78 */  mr      r31, r3
/* 09A73C 8009FCDC 48000004 */  b       lbl_8009FCE0
lbl_8009FCE0:
/* 09A740 8009FCE0 3C608000 */  lis     r3, 0x8000
/* 09A744 8009FCE4 806300F8 */  lwz     r3, 0xf8(r3)
/* 09A748 8009FCE8 38000000 */  li      r0, 0
/* 09A74C 8009FCEC 6C1C8000 */  xoris   r28, r0, 0x8000
/* 09A750 8009FCF0 547DF0BE */  srwi    r29, r3, 2
/* 09A754 8009FCF4 3F608180 */  lis     r27, 0x8180
/* 09A758 8009FCF8 48000004 */  b       lbl_8009FCFC
lbl_8009FCFC:
/* 09A75C 8009FCFC 48000040 */  b       lbl_8009FD3C
lbl_8009FD00:
/* 09A760 8009FD00 48015759 */  bl      DVDCheckDisk
/* 09A764 8009FD04 2C030000 */  cmpwi   r3, 0
/* 09A768 8009FD08 4182002C */  beq     lbl_8009FD34
/* 09A76C 8009FD0C 4800259D */  bl      OSGetTime
/* 09A770 8009FD10 7C9A2010 */  subfc   r4, r26, r4
/* 09A774 8009FD14 7C1F1910 */  subfe   r0, r31, r3
/* 09A778 8009FD18 6C038000 */  xoris   r3, r0, 0x8000
/* 09A77C 8009FD1C 7C04E810 */  subfc   r0, r4, r29
/* 09A780 8009FD20 7C63E110 */  subfe   r3, r3, r28
/* 09A784 8009FD24 7C7CE110 */  subfe   r3, r28, r28
/* 09A788 8009FD28 7C6300D0 */  neg     r3, r3
/* 09A78C 8009FD2C 2C030000 */  cmpwi   r3, 0
/* 09A790 8009FD30 4182000C */  beq     lbl_8009FD3C
lbl_8009FD34:
/* 09A794 8009FD34 807BFFFC */  lwz     r3, -4(r27)
/* 09A798 8009FD38 480001E5 */  bl      __OSDoHotReset
lbl_8009FD3C:
/* 09A79C 8009FD3C 38610040 */  addi    r3, r1, 0x40
/* 09A7A0 8009FD40 4801526D */  bl      DVDGetCommandBlockStatus
/* 09A7A4 8009FD44 2C030000 */  cmpwi   r3, 0
/* 09A7A8 8009FD48 4082FFB8 */  bne     lbl_8009FD00
/* 09A7AC 8009FD4C 80BE0018 */  lwz     r5, 0x18(r30)
/* 09A7B0 8009FD50 38610010 */  addi    r3, r1, 0x10
/* 09A7B4 8009FD54 80DE0014 */  lwz     r6, 0x14(r30)
/* 09A7B8 8009FD58 3C808130 */  lis     r4, 0x8130
/* 09A7BC 8009FD5C 3805001F */  addi    r0, r5, 0x1f
/* 09A7C0 8009FD60 38C60020 */  addi    r6, r6, 0x20
/* 09A7C4 8009FD64 541A0034 */  rlwinm  r26, r0, 0, 0, 0x1a
/* 09A7C8 8009FD68 7F45D378 */  mr      r5, r26
/* 09A7CC 8009FD6C 38C62440 */  addi    r6, r6, 0x2440
/* 09A7D0 8009FD70 38E00000 */  li      r7, 0
/* 09A7D4 8009FD74 39000000 */  li      r8, 0
/* 09A7D8 8009FD78 48014DE5 */  bl      DVDReadAbsAsyncPrio
/* 09A7DC 8009FD7C 4800252D */  bl      OSGetTime
/* 09A7E0 8009FD80 7C9B2378 */  mr      r27, r4
/* 09A7E4 8009FD84 7C7C1B78 */  mr      r28, r3
/* 09A7E8 8009FD88 48000004 */  b       lbl_8009FD8C
lbl_8009FD8C:
/* 09A7EC 8009FD8C 3C608000 */  lis     r3, 0x8000
/* 09A7F0 8009FD90 806300F8 */  lwz     r3, 0xf8(r3)
/* 09A7F4 8009FD94 38000000 */  li      r0, 0
/* 09A7F8 8009FD98 6C1F8000 */  xoris   r31, r0, 0x8000
/* 09A7FC 8009FD9C 547DF0BE */  srwi    r29, r3, 2
/* 09A800 8009FDA0 3FC08180 */  lis     r30, 0x8180
/* 09A804 8009FDA4 48000004 */  b       lbl_8009FDA8
lbl_8009FDA8:
/* 09A808 8009FDA8 48000040 */  b       lbl_8009FDE8
lbl_8009FDAC:
/* 09A80C 8009FDAC 480156AD */  bl      DVDCheckDisk
/* 09A810 8009FDB0 2C030000 */  cmpwi   r3, 0
/* 09A814 8009FDB4 4182002C */  beq     lbl_8009FDE0
/* 09A818 8009FDB8 480024F1 */  bl      OSGetTime
/* 09A81C 8009FDBC 7C9B2010 */  subfc   r4, r27, r4
/* 09A820 8009FDC0 7C1C1910 */  subfe   r0, r28, r3
/* 09A824 8009FDC4 6C038000 */  xoris   r3, r0, 0x8000
/* 09A828 8009FDC8 7C04E810 */  subfc   r0, r4, r29
/* 09A82C 8009FDCC 7C63F910 */  subfe   r3, r3, r31
/* 09A830 8009FDD0 7C7FF910 */  subfe   r3, r31, r31
/* 09A834 8009FDD4 7C6300D0 */  neg     r3, r3
/* 09A838 8009FDD8 2C030000 */  cmpwi   r3, 0
/* 09A83C 8009FDDC 4182000C */  beq     lbl_8009FDE8
lbl_8009FDE0:
/* 09A840 8009FDE0 807EFFFC */  lwz     r3, -4(r30)
/* 09A844 8009FDE4 48000139 */  bl      __OSDoHotReset
lbl_8009FDE8:
/* 09A848 8009FDE8 38610010 */  addi    r3, r1, 0x10
/* 09A84C 8009FDEC 480151C1 */  bl      DVDGetCommandBlockStatus
/* 09A850 8009FDF0 2C030000 */  cmpwi   r3, 0
/* 09A854 8009FDF4 4082FFB8 */  bne     lbl_8009FDAC
/* 09A858 8009FDF8 3C608130 */  lis     r3, 0x8130
/* 09A85C 8009FDFC 7F44D378 */  mr      r4, r26
/* 09A860 8009FE00 4BFFDA35 */  bl      ICInvalidateRange
/* 09A864 8009FE04 4BFFEEF9 */  bl      OSDisableInterrupts
/* 09A868 8009FE08 4BFFDA61 */  bl      ICFlashInvalidate
/* 09A86C 8009FE0C 3C608130 */  lis     r3, 0x8130
/* 09A870 8009FE10 4BFFFCBD */  bl      Run
/* 09A874 8009FE14 BB410368 */  lmw     r26, 0x368(r1)
/* 09A878 8009FE18 80010384 */  lwz     r0, 0x384(r1)
/* 09A87C 8009FE1C 38210380 */  addi    r1, r1, 0x380
/* 09A880 8009FE20 7C0803A6 */  mtlr    r0
/* 09A884 8009FE24 4E800020 */  blr     

.section .bss, "wa"

.balign 32

/* 0012E040 80130FC0 0020 */
Header:
    .skip 32

.section .sbss, "wa"

.balign 8

/* 000F1AA8 80135828 0004 */
SaveStart:
    .skip 4

/* 000F1AAC 8013582C 0004 */
SaveEnd:
    .skip 4

/* 000F1AB0 80135830 0004 */
Prepared:
    .skip 4
