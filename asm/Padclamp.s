# Padclamp.c
.include "macros.inc"

.section .text, "ax"

.balign 4

ClampStick:
/* 0AA760 800AFD00 88030000 */  lbz     r0, 0(r3)
/* 0AA764 800AFD04 89840000 */  lbz     r12, 0(r4)
/* 0AA768 800AFD08 7C000775 */  extsb.  r0, r0
/* 0AA76C 800AFD0C 7D8C0774 */  extsb   r12, r12
/* 0AA770 800AFD10 7C0B0378 */  mr      r11, r0
/* 0AA774 800AFD14 4180000C */  blt     lbl_800AFD20
/* 0AA778 800AFD18 38000001 */  li      r0, 1
/* 0AA77C 800AFD1C 4800000C */  b       lbl_800AFD28
lbl_800AFD20:
/* 0AA780 800AFD20 3800FFFF */  li      r0, -1
/* 0AA784 800AFD24 7D6B00D0 */  neg     r11, r11
lbl_800AFD28:
/* 0AA788 800AFD28 2C0C0000 */  cmpwi   r12, 0
/* 0AA78C 800AFD2C 4180000C */  blt     lbl_800AFD38
/* 0AA790 800AFD30 39000001 */  li      r8, 1
/* 0AA794 800AFD34 4800000C */  b       lbl_800AFD40
lbl_800AFD38:
/* 0AA798 800AFD38 3900FFFF */  li      r8, -1
/* 0AA79C 800AFD3C 7D8C00D0 */  neg     r12, r12
lbl_800AFD40:
/* 0AA7A0 800AFD40 7CE70774 */  extsb   r7, r7
/* 0AA7A4 800AFD44 7C0B3800 */  cmpw    r11, r7
/* 0AA7A8 800AFD48 4181000C */  bgt     lbl_800AFD54
/* 0AA7AC 800AFD4C 39600000 */  li      r11, 0
/* 0AA7B0 800AFD50 48000008 */  b       lbl_800AFD58
lbl_800AFD54:
/* 0AA7B4 800AFD54 7D675850 */  subf    r11, r7, r11
lbl_800AFD58:
/* 0AA7B8 800AFD58 7C0C3800 */  cmpw    r12, r7
/* 0AA7BC 800AFD5C 4181000C */  bgt     lbl_800AFD68
/* 0AA7C0 800AFD60 39800000 */  li      r12, 0
/* 0AA7C4 800AFD64 48000008 */  b       lbl_800AFD6C
lbl_800AFD68:
/* 0AA7C8 800AFD68 7D876050 */  subf    r12, r7, r12
lbl_800AFD6C:
/* 0AA7CC 800AFD6C 2C0B0000 */  cmpwi   r11, 0
/* 0AA7D0 800AFD70 4082001C */  bne     lbl_800AFD8C
/* 0AA7D4 800AFD74 2C0C0000 */  cmpwi   r12, 0
/* 0AA7D8 800AFD78 40820014 */  bne     lbl_800AFD8C
/* 0AA7DC 800AFD7C 38000000 */  li      r0, 0
/* 0AA7E0 800AFD80 98040000 */  stb     r0, 0(r4)
/* 0AA7E4 800AFD84 98030000 */  stb     r0, 0(r3)
/* 0AA7E8 800AFD88 4E800020 */  blr     
lbl_800AFD8C:
/* 0AA7EC 800AFD8C 7CC60774 */  extsb   r6, r6
/* 0AA7F0 800AFD90 7D2661D6 */  mullw   r9, r6, r12
/* 0AA7F4 800AFD94 7CE659D6 */  mullw   r7, r6, r11
/* 0AA7F8 800AFD98 7C093800 */  cmpw    r9, r7
/* 0AA7FC 800AFD9C 41810044 */  bgt     lbl_800AFDE0
/* 0AA800 800AFDA0 7CA90774 */  extsb   r9, r5
/* 0AA804 800AFDA4 7CA64850 */  subf    r5, r6, r9
/* 0AA808 800AFDA8 7CAC29D6 */  mullw   r5, r12, r5
/* 0AA80C 800AFDAC 7D2649D6 */  mullw   r9, r6, r9
/* 0AA810 800AFDB0 7CE72A14 */  add     r7, r7, r5
/* 0AA814 800AFDB4 7C093800 */  cmpw    r9, r7
/* 0AA818 800AFDB8 40800064 */  bge     lbl_800AFE1C
/* 0AA81C 800AFDBC 7CCB49D6 */  mullw   r6, r11, r9
/* 0AA820 800AFDC0 7CAC49D6 */  mullw   r5, r12, r9
/* 0AA824 800AFDC4 7CC63BD6 */  divw    r6, r6, r7
/* 0AA828 800AFDC8 7CA53BD6 */  divw    r5, r5, r7
/* 0AA82C 800AFDCC 7CC60774 */  extsb   r6, r6
/* 0AA830 800AFDD0 7CA50774 */  extsb   r5, r5
/* 0AA834 800AFDD4 39660000 */  addi    r11, r6, 0
/* 0AA838 800AFDD8 39850000 */  addi    r12, r5, 0
/* 0AA83C 800AFDDC 48000040 */  b       lbl_800AFE1C
lbl_800AFDE0:
/* 0AA840 800AFDE0 7CA70774 */  extsb   r7, r5
/* 0AA844 800AFDE4 7CA63850 */  subf    r5, r6, r7
/* 0AA848 800AFDE8 7CAB29D6 */  mullw   r5, r11, r5
/* 0AA84C 800AFDEC 7D4639D6 */  mullw   r10, r6, r7
/* 0AA850 800AFDF0 7CE92A14 */  add     r7, r9, r5
/* 0AA854 800AFDF4 7C0A3800 */  cmpw    r10, r7
/* 0AA858 800AFDF8 40800024 */  bge     lbl_800AFE1C
/* 0AA85C 800AFDFC 7CCB51D6 */  mullw   r6, r11, r10
/* 0AA860 800AFE00 7CAC51D6 */  mullw   r5, r12, r10
/* 0AA864 800AFE04 7CC63BD6 */  divw    r6, r6, r7
/* 0AA868 800AFE08 7CA53BD6 */  divw    r5, r5, r7
/* 0AA86C 800AFE0C 7CC60774 */  extsb   r6, r6
/* 0AA870 800AFE10 7CA50774 */  extsb   r5, r5
/* 0AA874 800AFE14 39660000 */  addi    r11, r6, 0
/* 0AA878 800AFE18 39850000 */  addi    r12, r5, 0
lbl_800AFE1C:
/* 0AA87C 800AFE1C 7CA059D6 */  mullw   r5, r0, r11
/* 0AA880 800AFE20 7C0861D6 */  mullw   r0, r8, r12
/* 0AA884 800AFE24 98A30000 */  stb     r5, 0(r3)
/* 0AA888 800AFE28 98040000 */  stb     r0, 0(r4)
/* 0AA88C 800AFE2C 4E800020 */  blr     

glabel PADClamp
/* 0AA890 800AFE30 7C0802A6 */  mflr    r0
/* 0AA894 800AFE34 3C80800D */  lis     r4, ClampRegion@ha
/* 0AA898 800AFE38 90010004 */  stw     r0, 4(r1)
/* 0AA89C 800AFE3C 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0AA8A0 800AFE40 93E1001C */  stw     r31, 0x1c(r1)
/* 0AA8A4 800AFE44 93C10018 */  stw     r30, 0x18(r1)
/* 0AA8A8 800AFE48 3BC00000 */  li      r30, 0
/* 0AA8AC 800AFE4C 93A10014 */  stw     r29, 0x14(r1)
/* 0AA8B0 800AFE50 3BA30000 */  addi    r29, r3, 0
/* 0AA8B4 800AFE54 93810010 */  stw     r28, 0x10(r1)
/* 0AA8B8 800AFE58 3B843200 */  addi    r28, r4, ClampRegion@l
/* 0AA8BC 800AFE5C 3BFC0001 */  addi    r31, r28, 1
lbl_800AFE60:
/* 0AA8C0 800AFE60 881D000A */  lbz     r0, 0xa(r29)
/* 0AA8C4 800AFE64 7C000775 */  extsb.  r0, r0
/* 0AA8C8 800AFE68 408200AC */  bne     lbl_800AFF14
/* 0AA8CC 800AFE6C 88BC0003 */  lbz     r5, 3(r28)
/* 0AA8D0 800AFE70 387D0002 */  addi    r3, r29, 2
/* 0AA8D4 800AFE74 88DC0004 */  lbz     r6, 4(r28)
/* 0AA8D8 800AFE78 389D0003 */  addi    r4, r29, 3
/* 0AA8DC 800AFE7C 88FC0002 */  lbz     r7, 2(r28)
/* 0AA8E0 800AFE80 4BFFFE81 */  bl      ClampStick
/* 0AA8E4 800AFE84 88BC0006 */  lbz     r5, 6(r28)
/* 0AA8E8 800AFE88 387D0004 */  addi    r3, r29, 4
/* 0AA8EC 800AFE8C 88DC0007 */  lbz     r6, 7(r28)
/* 0AA8F0 800AFE90 389D0005 */  addi    r4, r29, 5
/* 0AA8F4 800AFE94 88FC0005 */  lbz     r7, 5(r28)
/* 0AA8F8 800AFE98 4BFFFE69 */  bl      ClampStick
/* 0AA8FC 800AFE9C 889D0006 */  lbz     r4, 6(r29)
/* 0AA900 800AFEA0 881C0000 */  lbz     r0, 0(r28)
/* 0AA904 800AFEA4 887F0000 */  lbz     r3, 0(r31)
/* 0AA908 800AFEA8 7C040040 */  cmplw   r4, r0
/* 0AA90C 800AFEAC 41810010 */  bgt     lbl_800AFEBC
/* 0AA910 800AFEB0 38000000 */  li      r0, 0
/* 0AA914 800AFEB4 981D0006 */  stb     r0, 6(r29)
/* 0AA918 800AFEB8 48000020 */  b       lbl_800AFED8
lbl_800AFEBC:
/* 0AA91C 800AFEBC 7C032040 */  cmplw   r3, r4
/* 0AA920 800AFEC0 40800008 */  bge     lbl_800AFEC8
/* 0AA924 800AFEC4 987D0006 */  stb     r3, 6(r29)
lbl_800AFEC8:
/* 0AA928 800AFEC8 887C0000 */  lbz     r3, 0(r28)
/* 0AA92C 800AFECC 881D0006 */  lbz     r0, 6(r29)
/* 0AA930 800AFED0 7C030050 */  subf    r0, r3, r0
/* 0AA934 800AFED4 981D0006 */  stb     r0, 6(r29)
lbl_800AFED8:
/* 0AA938 800AFED8 889D0007 */  lbz     r4, 7(r29)
/* 0AA93C 800AFEDC 881C0000 */  lbz     r0, 0(r28)
/* 0AA940 800AFEE0 887F0000 */  lbz     r3, 0(r31)
/* 0AA944 800AFEE4 7C040040 */  cmplw   r4, r0
/* 0AA948 800AFEE8 41810010 */  bgt     lbl_800AFEF8
/* 0AA94C 800AFEEC 38000000 */  li      r0, 0
/* 0AA950 800AFEF0 981D0007 */  stb     r0, 7(r29)
/* 0AA954 800AFEF4 48000020 */  b       lbl_800AFF14
lbl_800AFEF8:
/* 0AA958 800AFEF8 7C032040 */  cmplw   r3, r4
/* 0AA95C 800AFEFC 40800008 */  bge     lbl_800AFF04
/* 0AA960 800AFF00 987D0007 */  stb     r3, 7(r29)
lbl_800AFF04:
/* 0AA964 800AFF04 887C0000 */  lbz     r3, 0(r28)
/* 0AA968 800AFF08 881D0007 */  lbz     r0, 7(r29)
/* 0AA96C 800AFF0C 7C030050 */  subf    r0, r3, r0
/* 0AA970 800AFF10 981D0007 */  stb     r0, 7(r29)
lbl_800AFF14:
/* 0AA974 800AFF14 3BDE0001 */  addi    r30, r30, 1
/* 0AA978 800AFF18 2C1E0004 */  cmpwi   r30, 4
/* 0AA97C 800AFF1C 3BBD000C */  addi    r29, r29, 0xc
/* 0AA980 800AFF20 4180FF40 */  blt     lbl_800AFE60
/* 0AA984 800AFF24 80010024 */  lwz     r0, 0x24(r1)
/* 0AA988 800AFF28 83E1001C */  lwz     r31, 0x1c(r1)
/* 0AA98C 800AFF2C 83C10018 */  lwz     r30, 0x18(r1)
/* 0AA990 800AFF30 83A10014 */  lwz     r29, 0x14(r1)
/* 0AA994 800AFF34 83810010 */  lwz     r28, 0x10(r1)
/* 0AA998 800AFF38 38210020 */  addi    r1, r1, 0x20
/* 0AA99C 800AFF3C 7C0803A6 */  mtlr    r0
/* 0AA9A0 800AFF40 4E800020 */  blr     

.section .rodata, "a"

.balign 8

/* 000D0280 800D3200 000A */
ClampRegion:
    .short 0x1EB4, 0x0F48, 0x280F, 0x3B1F, 0x382C
