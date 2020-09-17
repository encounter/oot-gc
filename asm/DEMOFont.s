# DEMOFont.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel DEMOPrintf
/* 0B1890 800B6E30 7C0802A6 */  mflr    r0
/* 0B1894 800B6E34 90010004 */  stw     r0, 4(r1)
/* 0B1898 800B6E38 9421FE70 */  stwu    r1, -0x190(r1)
/* 0B189C 800B6E3C 93E1018C */  stw     r31, 0x18c(r1)
/* 0B18A0 800B6E40 93C10188 */  stw     r30, 0x188(r1)
/* 0B18A4 800B6E44 93A10184 */  stw     r29, 0x184(r1)
/* 0B18A8 800B6E48 40860024 */  bne     cr1, lbl_800B6E6C
/* 0B18AC 800B6E4C D8210028 */  stfd    f1, 0x28(r1)
/* 0B18B0 800B6E50 D8410030 */  stfd    f2, 0x30(r1)
/* 0B18B4 800B6E54 D8610038 */  stfd    f3, 0x38(r1)
/* 0B18B8 800B6E58 D8810040 */  stfd    f4, 0x40(r1)
/* 0B18BC 800B6E5C D8A10048 */  stfd    f5, 0x48(r1)
/* 0B18C0 800B6E60 D8C10050 */  stfd    f6, 0x50(r1)
/* 0B18C4 800B6E64 D8E10058 */  stfd    f7, 0x58(r1)
/* 0B18C8 800B6E68 D9010060 */  stfd    f8, 0x60(r1)
lbl_800B6E6C:
/* 0B18CC 800B6E6C 90610008 */  stw     r3, 8(r1)
/* 0B18D0 800B6E70 3BA30000 */  addi    r29, r3, 0
/* 0B18D4 800B6E74 3C000400 */  lis     r0, 0x400
/* 0B18D8 800B6E78 9081000C */  stw     r4, 0xc(r1)
/* 0B18DC 800B6E7C 3BC40000 */  addi    r30, r4, 0
/* 0B18E0 800B6E80 3BE50000 */  addi    r31, r5, 0
/* 0B18E4 800B6E84 90A10010 */  stw     r5, 0x10(r1)
/* 0B18E8 800B6E88 38860000 */  addi    r4, r6, 0
/* 0B18EC 800B6E8C 38610074 */  addi    r3, r1, 0x74
/* 0B18F0 800B6E90 90C10014 */  stw     r6, 0x14(r1)
/* 0B18F4 800B6E94 90E10018 */  stw     r7, 0x18(r1)
/* 0B18F8 800B6E98 9101001C */  stw     r8, 0x1c(r1)
/* 0B18FC 800B6E9C 91210020 */  stw     r9, 0x20(r1)
/* 0B1900 800B6EA0 91410024 */  stw     r10, 0x24(r1)
/* 0B1904 800B6EA4 90010174 */  stw     r0, 0x174(r1)
/* 0B1908 800B6EA8 38010198 */  addi    r0, r1, 0x198
/* 0B190C 800B6EAC 90010178 */  stw     r0, 0x178(r1)
/* 0B1910 800B6EB0 38010008 */  addi    r0, r1, 8
/* 0B1914 800B6EB4 9001017C */  stw     r0, 0x17c(r1)
/* 0B1918 800B6EB8 38010174 */  addi    r0, r1, 0x174
/* 0B191C 800B6EBC 7C050378 */  mr      r5, r0
/* 0B1920 800B6EC0 48017F51 */  bl      vsprintf
/* 0B1924 800B6EC4 387D0000 */  addi    r3, r29, 0
/* 0B1928 800B6EC8 389E0000 */  addi    r4, r30, 0
/* 0B192C 800B6ECC 38BF0000 */  addi    r5, r31, 0
/* 0B1930 800B6ED0 38C10074 */  addi    r6, r1, 0x74
/* 0B1934 800B6ED4 4BFFFC4D */  bl      DEMOPuts
/* 0B1938 800B6ED8 80010194 */  lwz     r0, 0x194(r1)
/* 0B193C 800B6EDC 83E1018C */  lwz     r31, 0x18c(r1)
/* 0B1940 800B6EE0 83C10188 */  lwz     r30, 0x188(r1)
/* 0B1944 800B6EE4 83A10184 */  lwz     r29, 0x184(r1)
/* 0B1948 800B6EE8 38210190 */  addi    r1, r1, 0x190
/* 0B194C 800B6EEC 7C0803A6 */  mtlr    r0
/* 0B1950 800B6EF0 4E800020 */  blr     


.section .data, "wa"

.balign 32

/* 000EF8A0 800F2820 0C00 */
glabel DEMOFontBitmap
    .long 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x000FF000, 0x000FF000, 0x000FF000, 0x000FF000, 0x000FF000, 0x00000000, 0x000FF000
    .long 0x00000000, 0x00F00F00, 0x00F00F00, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00F00F00, 0x00F00F00, 0x0FFFFFF0, 0x00F00F00, 0x0FFFFFF0, 0x00F00F00, 0x00F00F00
    .long 0x00000000, 0x0000F000, 0x00FFFFF0, 0x0F00F000, 0x00FFFF00, 0x0000F0F0, 0x0FFFFF00, 0x0000F000, 0x00000000, 0x0FF000F0, 0x0FF00F00, 0x0000F000, 0x000F0000, 0x00F00FF0, 0x0F000FF0, 0x00000000
    .long 0x00000000, 0x000F0000, 0x00F0F000, 0x00F0F000, 0x00FF0000, 0x0F000FF0, 0x0F0000F0, 0x00FFFF00, 0x00000000, 0x000FF000, 0x000FF000, 0x0000F000, 0x000F0000, 0x00000000, 0x00000000, 0x00000000
    .long 0x00000000, 0x0000F000, 0x000F0000, 0x00F00000, 0x00F00000, 0x00F00000, 0x000F0000, 0x0000F000, 0x00000000, 0x000F0000, 0x0000F000, 0x00000F00, 0x00000F00, 0x00000F00, 0x0000F000, 0x000F0000
    .long 0x00000000, 0x00000000, 0x00F000F0, 0x000F0F00, 0x00FFFFF0, 0x000F0F00, 0x00F000F0, 0x00000000, 0x00000000, 0x00000000, 0x0000F000, 0x0000F000, 0x00FFFFF0, 0x0000F000, 0x0000F000, 0x00000000
    .long 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x000FF000, 0x000FF000, 0x0000F000, 0x000F0000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00FFFFF0, 0x00000000, 0x00000000, 0x00000000
    .long 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x000FF000, 0x000FF000, 0x00000000, 0x000000F0, 0x00000F00, 0x0000F000, 0x000F0000, 0x00F00000, 0x0F000000, 0x00000000
    .long 0x00000000, 0x000FF000, 0x00F00F00, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x00F00F00, 0x000FF000, 0x00000000, 0x0000F000, 0x000FF000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x000FFF00
    .long 0x00000000, 0x00FFFF00, 0x0F0000F0, 0x000000F0, 0x00000F00, 0x0000F000, 0x000F0000, 0x0FFFFFF0, 0x00000000, 0x00FFFF00, 0x0F0000F0, 0x000000F0, 0x0000FF00, 0x000000F0, 0x0F0000F0, 0x00FFFF00
    .long 0x00000000, 0x00000F00, 0x0000FF00, 0x000F0F00, 0x00F00F00, 0x0FFFFFF0, 0x00000F00, 0x00000F00, 0x00000000, 0x0FFFFFF0, 0x0F000000, 0x0F000000, 0x0FFFFF00, 0x000000F0, 0x0F0000F0, 0x00FFFF00
    .long 0x00000000, 0x000FFF00, 0x00F00000, 0x0F000000, 0x0FFFFF00, 0x0F0000F0, 0x0F0000F0, 0x00FFFF00, 0x00000000, 0x0FFFFFF0, 0x0F0000F0, 0x00000F00, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000
    .long 0x00000000, 0x00FFFF00, 0x0F0000F0, 0x0F0000F0, 0x00FFFF00, 0x0F0000F0, 0x0F0000F0, 0x00FFFF00, 0x00000000, 0x00FFFF00, 0x0F0000F0, 0x0F0000F0, 0x00FFFFF0, 0x000000F0, 0x000000F0, 0x00FFFF00
    .long 0x00000000, 0x00000000, 0x000FF000, 0x000FF000, 0x00000000, 0x000FF000, 0x000FF000, 0x00000000, 0x00000000, 0x000FF000, 0x000FF000, 0x00000000, 0x000FF000, 0x000FF000, 0x0000F000, 0x000F0000
    .long 0x00000000, 0x00000F00, 0x0000F000, 0x000F0000, 0x00F00000, 0x000F0000, 0x0000F000, 0x00000F00, 0x00000000, 0x00000000, 0x00000000, 0x0FFFFFF0, 0x00000000, 0x0FFFFFF0, 0x00000000, 0x00000000
    .long 0x00000000, 0x00F00000, 0x000F0000, 0x0000F000, 0x00000F00, 0x0000F000, 0x000F0000, 0x00F00000, 0x00000000, 0x00FFFF00, 0x0F0000F0, 0x0F0000F0, 0x0000FF00, 0x000FF000, 0x00000000, 0x000FF000
    .long 0x00000000, 0x00FFFF00, 0x0F0000F0, 0x0F000FF0, 0x0F00F0F0, 0x0F00FFF0, 0x0F000000, 0x00FFFFF0, 0x00000000, 0x000FF000, 0x00F00F00, 0x0F0000F0, 0x0F0000F0, 0x0FFFFFF0, 0x0F0000F0, 0x0F0000F0
    .long 0x00000000, 0x0FFFFF00, 0x0F0000F0, 0x0F0000F0, 0x0FFFFF00, 0x0F0000F0, 0x0F0000F0, 0x0FFFFF00, 0x00000000, 0x000FFF00, 0x00F000F0, 0x0F000000, 0x0F000000, 0x0F000000, 0x00F000F0, 0x000FFF00
    .long 0x00000000, 0x0FFFF000, 0x0F000F00, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x0F000F00, 0x0FFFF000, 0x00000000, 0x0FFFFFF0, 0x0F000000, 0x0F000000, 0x0FFFFF00, 0x0F000000, 0x0F000000, 0x0FFFFFF0
    .long 0x00000000, 0x0FFFFFF0, 0x0F000000, 0x0F000000, 0x0FFFFF00, 0x0F000000, 0x0F000000, 0x0F000000, 0x00000000, 0x000FFF00, 0x00F00000, 0x0F000000, 0x0F00FFF0, 0x0F0000F0, 0x00F000F0, 0x000FFF00
    .long 0x00000000, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x0FFFFFF0, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x00000000, 0x000FFF00, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x000FFF00
    .long 0x00000000, 0x0000FFF0, 0x00000F00, 0x00000F00, 0x00000F00, 0x00000F00, 0x0F000F00, 0x00FFF000, 0x00000000, 0x0F0000F0, 0x0F000F00, 0x0F00F000, 0x0FFF0000, 0x0F00F000, 0x0F000F00, 0x0F0000F0
    .long 0x00000000, 0x0F000000, 0x0F000000, 0x0F000000, 0x0F000000, 0x0F000000, 0x0F000000, 0x0FFFFFF0, 0x00000000, 0x0F00000F, 0x0FF000FF, 0x0F0F0F0F, 0x0F00F00F, 0x0F00F00F, 0x0F00000F, 0x0F00000F
    .long 0x00000000, 0x0F0000F0, 0x0FF000F0, 0x0F0F00F0, 0x0F00F0F0, 0x0F00F0F0, 0x0F000FF0, 0x0F0000F0, 0x00000000, 0x00FFFF00, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x00FFFF00
    .long 0x00000000, 0x0FFFFF00, 0x0F0000F0, 0x0F0000F0, 0x0FFFFF00, 0x0F000000, 0x0F000000, 0x0F000000, 0x00000000, 0x00FFFF00, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x0F00F0F0, 0x0F000F00, 0x00FFF0F0
    .long 0x00000000, 0x0FFFFF00, 0x0F0000F0, 0x0F0000F0, 0x0FFFFF00, 0x0F00F000, 0x0F000F00, 0x0F0000F0, 0x00000000, 0x00FFFF00, 0x0F0000F0, 0x0F000000, 0x00FFFF00, 0x000000F0, 0x0F0000F0, 0x00FFFF00
    .long 0x00000000, 0x0FFFFFFF, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x00000000, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x00FFFF00
    .long 0x00000000, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x0F0000F0, 0x00F00F00, 0x00F00F00, 0x000FF000, 0x00000000, 0x0F00000F, 0x0F00000F, 0x0F00000F, 0x0F00F00F, 0x0F00F00F, 0x0F00F00F, 0x00FF0FF0
    .long 0x00000000, 0x0F0000F0, 0x0F0000F0, 0x00F00F00, 0x000FF000, 0x00F00F00, 0x0F0000F0, 0x0F0000F0, 0x00000000, 0x0F00000F, 0x00F000F0, 0x000F0F00, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000
    .long 0x00000000, 0x0FFFFFF0, 0x000000F0, 0x00000F00, 0x000FF000, 0x00F00000, 0x0F000000, 0x0FFFFFF0, 0x00000000, 0x000FFF00, 0x000F0000, 0x000F0000, 0x000F0000, 0x000F0000, 0x000F0000, 0x000FFF00
    .long 0x00000000, 0x0F000000, 0x00F00000, 0x000F0000, 0x0000F000, 0x00000F00, 0x000000F0, 0x00000000, 0x00000000, 0x00FFF000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x00FFF000
    .long 0x00000000, 0x000FF000, 0x00F00F00, 0x0F0000F0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0FFFFFF0
    .long 0x00000000, 0x000FF000, 0x000FF000, 0x000F0000, 0x0000F000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00FFFF00, 0x0F000F00, 0x0F000F00, 0x0F000F00, 0x00FFFFF0
    .long 0x00000000, 0x00F00000, 0x00F00000, 0x00F00000, 0x00FFFF00, 0x00F000F0, 0x00F000F0, 0x00FFFF00, 0x00000000, 0x00000000, 0x00000000, 0x00FFFF00, 0x0F000000, 0x0F000000, 0x0F000000, 0x00FFFF00
    .long 0x00000000, 0x000000F0, 0x000000F0, 0x000000F0, 0x000FFFF0, 0x00F000F0, 0x00F000F0, 0x000FFFF0, 0x00000000, 0x00000000, 0x00000000, 0x00FFFF00, 0x0F0000F0, 0x0FFFFFF0, 0x0F000000, 0x00FFFF00
    .long 0x00000000, 0x0000FF00, 0x000F0000, 0x000F0000, 0x0FFFFF00, 0x000F0000, 0x000F0000, 0x000F0000, 0x00000000, 0x00000000, 0x000FFFF0, 0x00F000F0, 0x00F000F0, 0x000FFFF0, 0x000000F0, 0x000FFF00
    .long 0x00000000, 0x00F00000, 0x00F00000, 0x00F00000, 0x00F0FF00, 0x00FF00F0, 0x00F000F0, 0x00F000F0, 0x00000000, 0x00000000, 0x0000F000, 0x00000000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000
    .long 0x00000000, 0x00000F00, 0x00000000, 0x00000F00, 0x00000F00, 0x00000F00, 0x00F00F00, 0x000FF000, 0x00000000, 0x00000000, 0x00F00000, 0x00F00000, 0x00F00F00, 0x00F0F000, 0x00FFF000, 0x00F00F00
    .long 0x00000000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x00000F00, 0x00000000, 0x00000000, 0x00000000, 0x00F0FF00, 0x0F0F00F0, 0x0F0F00F0, 0x0F0F00F0, 0x0F0F00F0
    .long 0x00000000, 0x00000000, 0x00000000, 0x00F0FF00, 0x00FF00F0, 0x00F000F0, 0x00F000F0, 0x00F000F0, 0x00000000, 0x00000000, 0x00000000, 0x000FFF00, 0x00F000F0, 0x00F000F0, 0x00F000F0, 0x000FFF00
    .long 0x00000000, 0x00000000, 0x00FFF000, 0x00F00F00, 0x00F00F00, 0x00FFF000, 0x00F00000, 0x00F00000, 0x00000000, 0x00000000, 0x000FFF00, 0x00F00F00, 0x00F00F00, 0x000FFF00, 0x00000F00, 0x00000FF0
    .long 0x00000000, 0x00000000, 0x00000000, 0x00F0FFF0, 0x00FF0000, 0x00F00000, 0x00F00000, 0x00F00000, 0x00000000, 0x00000000, 0x00000000, 0x000FFFF0, 0x00F00000, 0x000FFF00, 0x000000F0, 0x00FFFF00
    .long 0x00000000, 0x00000000, 0x0000F000, 0x00FFFFF0, 0x0000F000, 0x0000F000, 0x0000F000, 0x00000FF0, 0x00000000, 0x00000000, 0x00000000, 0x00F000F0, 0x00F000F0, 0x00F000F0, 0x00F000F0, 0x000FFFF0
    .long 0x00000000, 0x00000000, 0x00000000, 0x00F000F0, 0x00F000F0, 0x00F000F0, 0x000F0F00, 0x0000F000, 0x00000000, 0x00000000, 0x00000000, 0x0F0000F0, 0x0F00F0F0, 0x0F00F0F0, 0x0F00F0F0, 0x00FF0F00
    .long 0x00000000, 0x00000000, 0x00000000, 0x00F000F0, 0x000F0F00, 0x0000F000, 0x000F0F00, 0x00F000F0, 0x00000000, 0x00000000, 0x0F000F00, 0x0F000F00, 0x00F00F00, 0x000FFF00, 0x00000F00, 0x00FFF000
    .long 0x00000000, 0x00000000, 0x00000000, 0x00FFFFF0, 0x00000F00, 0x0000F000, 0x000F0000, 0x00FFFFF0, 0x00000000, 0x00000F00, 0x0000F000, 0x0000F000, 0x00FF0000, 0x0000F000, 0x0000F000, 0x00000F00
    .long 0x00000000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x0000F000, 0x00000000, 0x000F0000, 0x0000F000, 0x0000F000, 0x00000FF0, 0x0000F000, 0x0000F000, 0x000F0000
    .long 0x00000000, 0x00FF00FF, 0x0F00FF00, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00FF0000, 0x0FF00000, 0xFFFFFFFF, 0xFFFFF000, 0xFFFFF000, 0xFFF00000, 0x00000000


