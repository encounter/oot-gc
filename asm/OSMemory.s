# OSMemory.c
.include "macros.inc"

.section .text, "ax"

.balign 4

OnReset:
/* 09A1E4 8009F784 7C0802A6 */  mflr    r0
/* 09A1E8 8009F788 2C030000 */  cmpwi   r3, 0
/* 09A1EC 8009F78C 90010004 */  stw     r0, 4(r1)
/* 09A1F0 8009F790 9421FFF8 */  stwu    r1, -8(r1)
/* 09A1F4 8009F794 41820018 */  beq     lbl_8009F7AC
/* 09A1F8 8009F798 3C60CC00 */  lis     r3, 0xcc00
/* 09A1FC 8009F79C 380000FF */  li      r0, 0xff
/* 09A200 8009F7A0 B0034010 */  sth     r0, 0x4010(r3)
/* 09A204 8009F7A4 3C60F000 */  lis     r3, 0xf000
/* 09A208 8009F7A8 4BFFF91D */  bl      __OSMaskInterrupts
lbl_8009F7AC:
/* 09A20C 8009F7AC 38600001 */  li      r3, 1
/* 09A210 8009F7B0 8001000C */  lwz     r0, 0xc(r1)
/* 09A214 8009F7B4 38210008 */  addi    r1, r1, 8
/* 09A218 8009F7B8 7C0803A6 */  mtlr    r0
/* 09A21C 8009F7BC 4E800020 */  blr     

MEMIntrruptHandler:
/* 09A220 8009F7C0 7C0802A6 */  mflr    r0
/* 09A224 8009F7C4 3C60CC00 */  lis     r3, 0xcc00
/* 09A228 8009F7C8 90010004 */  stw     r0, 4(r1)
/* 09A22C 8009F7CC 39034000 */  addi    r8, r3, 0x4000
/* 09A230 8009F7D0 38000000 */  li      r0, 0
/* 09A234 8009F7D4 9421FFF8 */  stwu    r1, -8(r1)
/* 09A238 8009F7D8 A0E34024 */  lhz     r7, 0x4024(r3)
/* 09A23C 8009F7DC 3C608013 */  lis     r3, __OSErrorTable@ha
/* 09A240 8009F7E0 A0C80022 */  lhz     r6, 0x22(r8)
/* 09A244 8009F7E4 38630F70 */  addi    r3, r3, __OSErrorTable@l
/* 09A248 8009F7E8 A0A8001E */  lhz     r5, 0x1e(r8)
/* 09A24C 8009F7EC 50E6819E */  rlwimi  r6, r7, 0x10, 6, 0xf
/* 09A250 8009F7F0 B0080020 */  sth     r0, 0x20(r8)
/* 09A254 8009F7F4 8183003C */  lwz     r12, 0x3c(r3)
/* 09A258 8009F7F8 280C0000 */  cmplwi  r12, 0
/* 09A25C 8009F7FC 41820018 */  beq     lbl_8009F814
/* 09A260 8009F800 7D8803A6 */  mtlr    r12
/* 09A264 8009F804 3860000F */  li      r3, 0xf
/* 09A268 8009F808 4CC63182 */  crclr   6
/* 09A26C 8009F80C 4E800021 */  blrl    
/* 09A270 8009F810 4800000C */  b       lbl_8009F81C
lbl_8009F814:
/* 09A274 8009F814 3860000F */  li      r3, 0xf
/* 09A278 8009F818 4BFFF1A5 */  bl      __OSUnhandledException
lbl_8009F81C:
/* 09A27C 8009F81C 8001000C */  lwz     r0, 0xc(r1)
/* 09A280 8009F820 38210008 */  addi    r1, r1, 8
/* 09A284 8009F824 7C0803A6 */  mtlr    r0
/* 09A288 8009F828 4E800020 */  blr     

Config24MB:
/* 09A28C 8009F82C 38E00000 */  li      r7, 0
/* 09A290 8009F830 3C800000 */  lis     r4, 0
/* 09A294 8009F834 38840002 */  addi    r4, r4, 2
/* 09A298 8009F838 3C608000 */  lis     r3, 0x8000
/* 09A29C 8009F83C 386301FF */  addi    r3, r3, 0x1ff
/* 09A2A0 8009F840 3CC00100 */  lis     r6, 0x100
/* 09A2A4 8009F844 38C60002 */  addi    r6, r6, 2
/* 09A2A8 8009F848 3CA08100 */  lis     r5, 0x8100
/* 09A2AC 8009F84C 38A500FF */  addi    r5, r5, 0xff
/* 09A2B0 8009F850 4C00012C */  isync   
/* 09A2B4 8009F854 7CF883A6 */  mtdbatu 0, r7
/* 09A2B8 8009F858 7C9983A6 */  mtdbatl 0, r4
/* 09A2BC 8009F85C 7C7883A6 */  mtdbatu 0, r3
/* 09A2C0 8009F860 4C00012C */  isync   
/* 09A2C4 8009F864 7CF083A6 */  mtibatu 0, r7
/* 09A2C8 8009F868 7C9183A6 */  mtibatl 0, r4
/* 09A2CC 8009F86C 7C7083A6 */  mtibatu 0, r3
/* 09A2D0 8009F870 4C00012C */  isync   
/* 09A2D4 8009F874 7CFC83A6 */  mtdbatu 2, r7
/* 09A2D8 8009F878 7CDD83A6 */  mtdbatl 2, r6
/* 09A2DC 8009F87C 7CBC83A6 */  mtdbatu 2, r5
/* 09A2E0 8009F880 4C00012C */  isync   
/* 09A2E4 8009F884 7CF483A6 */  mtibatu 2, r7
/* 09A2E8 8009F888 7CD583A6 */  mtibatl 2, r6
/* 09A2EC 8009F88C 7CB483A6 */  mtibatu 2, r5
/* 09A2F0 8009F890 4C00012C */  isync   
/* 09A2F4 8009F894 7C6000A6 */  mfmsr   r3
/* 09A2F8 8009F898 60630030 */  ori     r3, r3, 0x30
/* 09A2FC 8009F89C 7C7B03A6 */  mtspr   0x1b, r3
/* 09A300 8009F8A0 7C6802A6 */  mflr    r3
/* 09A304 8009F8A4 7C7A03A6 */  mtspr   0x1a, r3
/* 09A308 8009F8A8 4C000064 */  rfi     

Config48MB:
/* 09A30C 8009F8AC 38E00000 */  li      r7, 0
/* 09A310 8009F8B0 3C800000 */  lis     r4, 0
/* 09A314 8009F8B4 38840002 */  addi    r4, r4, 2
/* 09A318 8009F8B8 3C608000 */  lis     r3, 0x8000
/* 09A31C 8009F8BC 386303FF */  addi    r3, r3, 0x3ff
/* 09A320 8009F8C0 3CC00200 */  lis     r6, 0x200
/* 09A324 8009F8C4 38C60002 */  addi    r6, r6, 2
/* 09A328 8009F8C8 3CA08200 */  lis     r5, 0x8200
/* 09A32C 8009F8CC 38A501FF */  addi    r5, r5, 0x1ff
/* 09A330 8009F8D0 4C00012C */  isync   
/* 09A334 8009F8D4 7CF883A6 */  mtdbatu 0, r7
/* 09A338 8009F8D8 7C9983A6 */  mtdbatl 0, r4
/* 09A33C 8009F8DC 7C7883A6 */  mtdbatu 0, r3
/* 09A340 8009F8E0 4C00012C */  isync   
/* 09A344 8009F8E4 7CF083A6 */  mtibatu 0, r7
/* 09A348 8009F8E8 7C9183A6 */  mtibatl 0, r4
/* 09A34C 8009F8EC 7C7083A6 */  mtibatu 0, r3
/* 09A350 8009F8F0 4C00012C */  isync   
/* 09A354 8009F8F4 7CFC83A6 */  mtdbatu 2, r7
/* 09A358 8009F8F8 7CDD83A6 */  mtdbatl 2, r6
/* 09A35C 8009F8FC 7CBC83A6 */  mtdbatu 2, r5
/* 09A360 8009F900 4C00012C */  isync   
/* 09A364 8009F904 7CF483A6 */  mtibatu 2, r7
/* 09A368 8009F908 7CD583A6 */  mtibatl 2, r6
/* 09A36C 8009F90C 7CB483A6 */  mtibatu 2, r5
/* 09A370 8009F910 4C00012C */  isync   
/* 09A374 8009F914 7C6000A6 */  mfmsr   r3
/* 09A378 8009F918 60630030 */  ori     r3, r3, 0x30
/* 09A37C 8009F91C 7C7B03A6 */  mtspr   0x1b, r3
/* 09A380 8009F920 7C6802A6 */  mflr    r3
/* 09A384 8009F924 7C7A03A6 */  mtspr   0x1a, r3
/* 09A388 8009F928 4C000064 */  rfi     

RealMode:
/* 09A38C 8009F92C 546300BE */  clrlwi  r3, r3, 2
/* 09A390 8009F930 7C7A03A6 */  mtspr   0x1a, r3
/* 09A394 8009F934 7C6000A6 */  mfmsr   r3
/* 09A398 8009F938 54630732 */  rlwinm  r3, r3, 0, 0x1c, 0x19
/* 09A39C 8009F93C 7C7B03A6 */  mtspr   0x1b, r3
/* 09A3A0 8009F940 4C000064 */  rfi     

glabel __OSInitMemoryProtection
/* 09A3A4 8009F944 7C0802A6 */  mflr    r0
/* 09A3A8 8009F948 90010004 */  stw     r0, 4(r1)
/* 09A3AC 8009F94C 9421FFB0 */  stwu    r1, -0x50(r1)
/* 09A3B0 8009F950 BF61003C */  stmw    r27, 0x3c(r1)
/* 09A3B4 8009F954 3F608000 */  lis     r27, 0x8000
/* 09A3B8 8009F958 83FB00F0 */  lwz     r31, 0xf0(r27)
/* 09A3BC 8009F95C 4BFFF3A1 */  bl      OSDisableInterrupts
/* 09A3C0 8009F960 3C80CC00 */  lis     r4, 0xcc00
/* 09A3C4 8009F964 3B844000 */  addi    r28, r4, 0x4000
/* 09A3C8 8009F968 38000000 */  li      r0, 0
/* 09A3CC 8009F96C B01C0020 */  sth     r0, 0x20(r28)
/* 09A3D0 8009F970 380000FF */  li      r0, 0xff
/* 09A3D4 8009F974 7C7E1B78 */  mr      r30, r3
/* 09A3D8 8009F978 B01C0010 */  sth     r0, 0x10(r28)
/* 09A3DC 8009F97C 3C60F000 */  lis     r3, 0xf000
/* 09A3E0 8009F980 4BFFF745 */  bl      __OSMaskInterrupts
/* 09A3E4 8009F984 3C60800A */  lis     r3, MEMIntrruptHandler@ha
/* 09A3E8 8009F988 3BA3F7C0 */  addi    r29, r3, MEMIntrruptHandler@l
/* 09A3EC 8009F98C 7FA4EB78 */  mr      r4, r29
/* 09A3F0 8009F990 38600000 */  li      r3, 0
/* 09A3F4 8009F994 4BFFF3B5 */  bl      __OSSetInterruptHandler
/* 09A3F8 8009F998 7FA4EB78 */  mr      r4, r29
/* 09A3FC 8009F99C 38600001 */  li      r3, 1
/* 09A400 8009F9A0 4BFFF3A9 */  bl      __OSSetInterruptHandler
/* 09A404 8009F9A4 7FA4EB78 */  mr      r4, r29
/* 09A408 8009F9A8 38600002 */  li      r3, 2
/* 09A40C 8009F9AC 4BFFF39D */  bl      __OSSetInterruptHandler
/* 09A410 8009F9B0 7FA4EB78 */  mr      r4, r29
/* 09A414 8009F9B4 38600003 */  li      r3, 3
/* 09A418 8009F9B8 4BFFF391 */  bl      __OSSetInterruptHandler
/* 09A41C 8009F9BC 7FA4EB78 */  mr      r4, r29
/* 09A420 8009F9C0 38600004 */  li      r3, 4
/* 09A424 8009F9C4 4BFFF385 */  bl      __OSSetInterruptHandler
/* 09A428 8009F9C8 3C60800F */  lis     r3, ResetFunctionInfo@ha
/* 09A42C 8009F9CC 386313A0 */  addi    r3, r3, ResetFunctionInfo@l
/* 09A430 8009F9D0 48000459 */  bl      OSRegisterResetFunction
/* 09A434 8009F9D4 807B00F0 */  lwz     r3, 0xf0(r27)
/* 09A438 8009F9D8 801B0028 */  lwz     r0, 0x28(r27)
/* 09A43C 8009F9DC 7C030040 */  cmplw   r3, r0
/* 09A440 8009F9E0 40800024 */  bge     lbl_8009FA04
/* 09A444 8009F9E4 3C03FE80 */  addis   r0, r3, 0xfe80
/* 09A448 8009F9E8 28000000 */  cmplwi  r0, 0
/* 09A44C 8009F9EC 40820018 */  bne     lbl_8009FA04
/* 09A450 8009F9F0 3C608180 */  lis     r3, 0x8180
/* 09A454 8009F9F4 3C800180 */  lis     r4, 0x180
/* 09A458 8009F9F8 4BFFDD59 */  bl      DCInvalidateRange
/* 09A45C 8009F9FC 38000002 */  li      r0, 2
/* 09A460 8009FA00 B01C0028 */  sth     r0, 0x28(r28)
lbl_8009FA04:
/* 09A464 8009FA04 3C000180 */  lis     r0, 0x180
/* 09A468 8009FA08 7C1F0040 */  cmplw   r31, r0
/* 09A46C 8009FA0C 41810014 */  bgt     lbl_8009FA20
/* 09A470 8009FA10 3C60800A */  lis     r3, Config24MB@ha
/* 09A474 8009FA14 3863F82C */  addi    r3, r3, Config24MB@l
/* 09A478 8009FA18 4BFFFF15 */  bl      RealMode
/* 09A47C 8009FA1C 4800001C */  b       lbl_8009FA38
lbl_8009FA20:
/* 09A480 8009FA20 3C000300 */  lis     r0, 0x300
/* 09A484 8009FA24 7C1F0040 */  cmplw   r31, r0
/* 09A488 8009FA28 41810010 */  bgt     lbl_8009FA38
/* 09A48C 8009FA2C 3C60800A */  lis     r3, Config48MB@ha
/* 09A490 8009FA30 3863F8AC */  addi    r3, r3, Config48MB@l
/* 09A494 8009FA34 4BFFFEF9 */  bl      RealMode
lbl_8009FA38:
/* 09A498 8009FA38 3C600800 */  lis     r3, 0x800
/* 09A49C 8009FA3C 4BFFF711 */  bl      __OSUnmaskInterrupts
/* 09A4A0 8009FA40 7FC3F378 */  mr      r3, r30
/* 09A4A4 8009FA44 4BFFF2E1 */  bl      OSRestoreInterrupts
/* 09A4A8 8009FA48 BB61003C */  lmw     r27, 0x3c(r1)
/* 09A4AC 8009FA4C 80010054 */  lwz     r0, 0x54(r1)
/* 09A4B0 8009FA50 38210050 */  addi    r1, r1, 0x50
/* 09A4B4 8009FA54 7C0803A6 */  mtlr    r0
/* 09A4B8 8009FA58 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000EE420 800F13A0 0010 */
ResetFunctionInfo:
    .long OnReset, 0x0000007F, 0x00000000, 0x00000000


