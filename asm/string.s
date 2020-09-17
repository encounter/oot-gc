# string.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel strchr
/* 0CB230 800D07D0 3863FFFF */  addi    r3, r3, -1
/* 0CB234 800D07D4 5480063E */  clrlwi  r0, r4, 0x18
/* 0CB238 800D07D8 4800000C */  b       lbl_800D07E4
lbl_800D07DC:
/* 0CB23C 800D07DC 7C040040 */  cmplw   r4, r0
/* 0CB240 800D07E0 4D820020 */  beqlr   
lbl_800D07E4:
/* 0CB244 800D07E4 8C830001 */  lbzu    r4, 1(r3)
/* 0CB248 800D07E8 28040000 */  cmplwi  r4, 0
/* 0CB24C 800D07EC 4082FFF0 */  bne     lbl_800D07DC
/* 0CB250 800D07F0 28000000 */  cmplwi  r0, 0
/* 0CB254 800D07F4 4D820020 */  beqlr   
/* 0CB258 800D07F8 38600000 */  li      r3, 0
/* 0CB25C 800D07FC 4E800020 */  blr     

glabel strncmp
/* 0CB260 800D0800 3863FFFF */  addi    r3, r3, -1
/* 0CB264 800D0804 3884FFFF */  addi    r4, r4, -1
/* 0CB268 800D0808 38C50001 */  addi    r6, r5, 1
/* 0CB26C 800D080C 48000024 */  b       lbl_800D0830
lbl_800D0810:
/* 0CB270 800D0810 8C030001 */  lbzu    r0, 1(r3)
/* 0CB274 800D0814 8CA40001 */  lbzu    r5, 1(r4)
/* 0CB278 800D0818 7C002840 */  cmplw   r0, r5
/* 0CB27C 800D081C 4182000C */  beq     lbl_800D0828
/* 0CB280 800D0820 7C650050 */  subf    r3, r5, r0
/* 0CB284 800D0824 4E800020 */  blr     
lbl_800D0828:
/* 0CB288 800D0828 28000000 */  cmplwi  r0, 0
/* 0CB28C 800D082C 4182000C */  beq     lbl_800D0838
lbl_800D0830:
/* 0CB290 800D0830 34C6FFFF */  addic.  r6, r6, -1
/* 0CB294 800D0834 4082FFDC */  bne     lbl_800D0810
lbl_800D0838:
/* 0CB298 800D0838 38600000 */  li      r3, 0
/* 0CB29C 800D083C 4E800020 */  blr     

glabel strcmp
/* 0CB2A0 800D0840 88C30000 */  lbz     r6, 0(r3)
/* 0CB2A4 800D0844 88A40000 */  lbz     r5, 0(r4)
/* 0CB2A8 800D0848 7C053051 */  subf.   r0, r5, r6
/* 0CB2AC 800D084C 4182000C */  beq     lbl_800D0858
/* 0CB2B0 800D0850 7C653050 */  subf    r3, r5, r6
/* 0CB2B4 800D0854 4E800020 */  blr     
lbl_800D0858:
/* 0CB2B8 800D0858 548007BE */  clrlwi  r0, r4, 0x1e
/* 0CB2BC 800D085C 546507BE */  clrlwi  r5, r3, 0x1e
/* 0CB2C0 800D0860 7C002840 */  cmplw   r0, r5
/* 0CB2C4 800D0864 408200C8 */  bne     lbl_800D092C
/* 0CB2C8 800D0868 28050000 */  cmplwi  r5, 0
/* 0CB2CC 800D086C 41820058 */  beq     lbl_800D08C4
/* 0CB2D0 800D0870 28060000 */  cmplwi  r6, 0
/* 0CB2D4 800D0874 4082000C */  bne     lbl_800D0880
/* 0CB2D8 800D0878 38600000 */  li      r3, 0
/* 0CB2DC 800D087C 4E800020 */  blr     
lbl_800D0880:
/* 0CB2E0 800D0880 20050003 */  subfic  r0, r5, 3
/* 0CB2E4 800D0884 28000000 */  cmplwi  r0, 0
/* 0CB2E8 800D0888 7C0903A6 */  mtctr   r0
/* 0CB2EC 800D088C 41820030 */  beq     lbl_800D08BC
lbl_800D0890:
/* 0CB2F0 800D0890 8CA30001 */  lbzu    r5, 1(r3)
/* 0CB2F4 800D0894 8C040001 */  lbzu    r0, 1(r4)
/* 0CB2F8 800D0898 7C002851 */  subf.   r0, r0, r5
/* 0CB2FC 800D089C 4182000C */  beq     lbl_800D08A8
/* 0CB300 800D08A0 7C030378 */  mr      r3, r0
/* 0CB304 800D08A4 4E800020 */  blr     
lbl_800D08A8:
/* 0CB308 800D08A8 28050000 */  cmplwi  r5, 0
/* 0CB30C 800D08AC 4082000C */  bne     lbl_800D08B8
/* 0CB310 800D08B0 38600000 */  li      r3, 0
/* 0CB314 800D08B4 4E800020 */  blr     
lbl_800D08B8:
/* 0CB318 800D08B8 4200FFD8 */  bdnz    lbl_800D0890
lbl_800D08BC:
/* 0CB31C 800D08BC 38630001 */  addi    r3, r3, 1
/* 0CB320 800D08C0 38840001 */  addi    r4, r4, 1
lbl_800D08C4:
/* 0CB324 800D08C4 80E30000 */  lwz     r7, 0(r3)
/* 0CB328 800D08C8 80CD8894 */  lwz     r6, K2-_SDA_BASE_(r13)
/* 0CB32C 800D08CC 80AD8890 */  lwz     r5, K1-_SDA_BASE_(r13)
/* 0CB330 800D08D0 7C073214 */  add     r0, r7, r6
/* 0CB334 800D08D4 81040000 */  lwz     r8, 0(r4)
/* 0CB338 800D08D8 7C002839 */  and.    r0, r0, r5
/* 0CB33C 800D08DC 40820038 */  bne     lbl_800D0914
/* 0CB340 800D08E0 48000018 */  b       lbl_800D08F8
lbl_800D08E4:
/* 0CB344 800D08E4 84E30004 */  lwzu    r7, 4(r3)
/* 0CB348 800D08E8 85040004 */  lwzu    r8, 4(r4)
/* 0CB34C 800D08EC 7C073214 */  add     r0, r7, r6
/* 0CB350 800D08F0 7C002839 */  and.    r0, r0, r5
/* 0CB354 800D08F4 40820020 */  bne     lbl_800D0914
lbl_800D08F8:
/* 0CB358 800D08F8 7C074040 */  cmplw   r7, r8
/* 0CB35C 800D08FC 4182FFE8 */  beq     lbl_800D08E4
/* 0CB360 800D0900 4081000C */  ble     lbl_800D090C
/* 0CB364 800D0904 38600001 */  li      r3, 1
/* 0CB368 800D0908 4E800020 */  blr     
lbl_800D090C:
/* 0CB36C 800D090C 3860FFFF */  li      r3, -1
/* 0CB370 800D0910 4E800020 */  blr     
lbl_800D0914:
/* 0CB374 800D0914 88C30000 */  lbz     r6, 0(r3)
/* 0CB378 800D0918 88A40000 */  lbz     r5, 0(r4)
/* 0CB37C 800D091C 7C053051 */  subf.   r0, r5, r6
/* 0CB380 800D0920 4182000C */  beq     lbl_800D092C
/* 0CB384 800D0924 7C653050 */  subf    r3, r5, r6
/* 0CB388 800D0928 4E800020 */  blr     
lbl_800D092C:
/* 0CB38C 800D092C 28060000 */  cmplwi  r6, 0
/* 0CB390 800D0930 4082000C */  bne     lbl_800D093C
/* 0CB394 800D0934 38600000 */  li      r3, 0
/* 0CB398 800D0938 4E800020 */  blr     
lbl_800D093C:
/* 0CB39C 800D093C 8CA30001 */  lbzu    r5, 1(r3)
/* 0CB3A0 800D0940 8C040001 */  lbzu    r0, 1(r4)
/* 0CB3A4 800D0944 7C002851 */  subf.   r0, r0, r5
/* 0CB3A8 800D0948 4182000C */  beq     lbl_800D0954
/* 0CB3AC 800D094C 7C030378 */  mr      r3, r0
/* 0CB3B0 800D0950 4E800020 */  blr     
lbl_800D0954:
/* 0CB3B4 800D0954 28050000 */  cmplwi  r5, 0
/* 0CB3B8 800D0958 4082FFE4 */  bne     lbl_800D093C
/* 0CB3BC 800D095C 38600000 */  li      r3, 0
/* 0CB3C0 800D0960 4E800020 */  blr     

glabel strncpy
/* 0CB3C4 800D0964 3884FFFF */  addi    r4, r4, -1
/* 0CB3C8 800D0968 38C3FFFF */  addi    r6, r3, -1
/* 0CB3CC 800D096C 38A50001 */  addi    r5, r5, 1
/* 0CB3D0 800D0970 4800002C */  b       lbl_800D099C
lbl_800D0974:
/* 0CB3D4 800D0974 8C040001 */  lbzu    r0, 1(r4)
/* 0CB3D8 800D0978 28000000 */  cmplwi  r0, 0
/* 0CB3DC 800D097C 9C060001 */  stbu    r0, 1(r6)
/* 0CB3E0 800D0980 4082001C */  bne     lbl_800D099C
/* 0CB3E4 800D0984 38000000 */  li      r0, 0
/* 0CB3E8 800D0988 48000008 */  b       lbl_800D0990
lbl_800D098C:
/* 0CB3EC 800D098C 9C060001 */  stbu    r0, 1(r6)
lbl_800D0990:
/* 0CB3F0 800D0990 34A5FFFF */  addic.  r5, r5, -1
/* 0CB3F4 800D0994 4082FFF8 */  bne     lbl_800D098C
/* 0CB3F8 800D0998 4E800020 */  blr     
lbl_800D099C:
/* 0CB3FC 800D099C 34A5FFFF */  addic.  r5, r5, -1
/* 0CB400 800D09A0 4082FFD4 */  bne     lbl_800D0974
/* 0CB404 800D09A4 4E800020 */  blr     

glabel strcpy
/* 0CB408 800D09A8 546007BE */  clrlwi  r0, r3, 0x1e
/* 0CB40C 800D09AC 548507BE */  clrlwi  r5, r4, 0x1e
/* 0CB410 800D09B0 7C002840 */  cmplw   r0, r5
/* 0CB414 800D09B4 38E30000 */  addi    r7, r3, 0
/* 0CB418 800D09B8 40820080 */  bne     lbl_800D0A38
/* 0CB41C 800D09BC 28050000 */  cmplwi  r5, 0
/* 0CB420 800D09C0 41820040 */  beq     lbl_800D0A00
/* 0CB424 800D09C4 88040000 */  lbz     r0, 0(r4)
/* 0CB428 800D09C8 28000000 */  cmplwi  r0, 0
/* 0CB42C 800D09CC 98070000 */  stb     r0, 0(r7)
/* 0CB430 800D09D0 4D820020 */  beqlr   
/* 0CB434 800D09D4 20050003 */  subfic  r0, r5, 3
/* 0CB438 800D09D8 28000000 */  cmplwi  r0, 0
/* 0CB43C 800D09DC 7C0903A6 */  mtctr   r0
/* 0CB440 800D09E0 41820018 */  beq     lbl_800D09F8
lbl_800D09E4:
/* 0CB444 800D09E4 8C040001 */  lbzu    r0, 1(r4)
/* 0CB448 800D09E8 28000000 */  cmplwi  r0, 0
/* 0CB44C 800D09EC 9C070001 */  stbu    r0, 1(r7)
/* 0CB450 800D09F0 4D820020 */  beqlr   
/* 0CB454 800D09F4 4200FFF0 */  bdnz    lbl_800D09E4
lbl_800D09F8:
/* 0CB458 800D09F8 38E70001 */  addi    r7, r7, 1
/* 0CB45C 800D09FC 38840001 */  addi    r4, r4, 1
lbl_800D0A00:
/* 0CB460 800D0A00 80A40000 */  lwz     r5, 0(r4)
/* 0CB464 800D0A04 800D8894 */  lwz     r0, K2-_SDA_BASE_(r13)
/* 0CB468 800D0A08 80CD8890 */  lwz     r6, K1-_SDA_BASE_(r13)
/* 0CB46C 800D0A0C 39050000 */  addi    r8, r5, 0
/* 0CB470 800D0A10 7CA50214 */  add     r5, r5, r0
/* 0CB474 800D0A14 7CA53039 */  and.    r5, r5, r6
/* 0CB478 800D0A18 40820020 */  bne     lbl_800D0A38
/* 0CB47C 800D0A1C 38E7FFFC */  addi    r7, r7, -4
lbl_800D0A20:
/* 0CB480 800D0A20 95070004 */  stwu    r8, 4(r7)
/* 0CB484 800D0A24 85040004 */  lwzu    r8, 4(r4)
/* 0CB488 800D0A28 7CA80214 */  add     r5, r8, r0
/* 0CB48C 800D0A2C 7CA53039 */  and.    r5, r5, r6
/* 0CB490 800D0A30 4182FFF0 */  beq     lbl_800D0A20
/* 0CB494 800D0A34 38E70004 */  addi    r7, r7, 4
lbl_800D0A38:
/* 0CB498 800D0A38 88040000 */  lbz     r0, 0(r4)
/* 0CB49C 800D0A3C 28000000 */  cmplwi  r0, 0
/* 0CB4A0 800D0A40 98070000 */  stb     r0, 0(r7)
/* 0CB4A4 800D0A44 4D820020 */  beqlr   
lbl_800D0A48:
/* 0CB4A8 800D0A48 8C040001 */  lbzu    r0, 1(r4)
/* 0CB4AC 800D0A4C 28000000 */  cmplwi  r0, 0
/* 0CB4B0 800D0A50 9C070001 */  stbu    r0, 1(r7)
/* 0CB4B4 800D0A54 4082FFF4 */  bne     lbl_800D0A48
/* 0CB4B8 800D0A58 4E800020 */  blr     

glabel strlen
/* 0CB4BC 800D0A5C 3880FFFF */  li      r4, -1
/* 0CB4C0 800D0A60 3863FFFF */  addi    r3, r3, -1
lbl_800D0A64:
/* 0CB4C4 800D0A64 8C030001 */  lbzu    r0, 1(r3)
/* 0CB4C8 800D0A68 38840001 */  addi    r4, r4, 1
/* 0CB4CC 800D0A6C 28000000 */  cmplwi  r0, 0
/* 0CB4D0 800D0A70 4082FFF4 */  bne     lbl_800D0A64
/* 0CB4D4 800D0A74 7C832378 */  mr      r3, r4
/* 0CB4D8 800D0A78 4E800020 */  blr     


.section .sdata, "wa"

.balign 8

/* 000F17F0 80135570 0004 */
K1:
    .long 0x80808080

.balign 4

/* 000F17F4 80135574 0004 */
K2:
    .long 0xFEFEFEFF


