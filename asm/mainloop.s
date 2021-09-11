# mainloop.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKHandleRequestEvent
/* 0C3AA0 800C9040 7C0802A6 */  mflr    r0
/* 0C3AA4 800C9044 90010004 */  stw     r0, 4(r1)
/* 0C3AA8 800C9048 9421FFF8 */  stwu    r1, -8(r1)
/* 0C3AAC 800C904C 80630008 */  lwz     r3, 8(r3)
/* 0C3AB0 800C9050 4800068D */  bl      TRKGetBuffer
/* 0C3AB4 800C9054 48000F95 */  bl      TRKDispatchMessage
/* 0C3AB8 800C9058 38210008 */  addi    r1, r1, 8
/* 0C3ABC 800C905C 80010004 */  lwz     r0, 4(r1)
/* 0C3AC0 800C9060 7C0803A6 */  mtlr    r0
/* 0C3AC4 800C9064 4E800020 */  blr     

glabel TRKHandleSupportEvent
/* 0C3AC8 800C9068 7C0802A6 */  mflr    r0
/* 0C3ACC 800C906C 90010004 */  stw     r0, 4(r1)
/* 0C3AD0 800C9070 9421FFF8 */  stwu    r1, -8(r1)
/* 0C3AD4 800C9074 48003951 */  bl      TRKTargetSupportRequest
/* 0C3AD8 800C9078 38210008 */  addi    r1, r1, 8
/* 0C3ADC 800C907C 80010004 */  lwz     r0, 4(r1)
/* 0C3AE0 800C9080 7C0803A6 */  mtlr    r0
/* 0C3AE4 800C9084 4E800020 */  blr     

glabel TRKIdle
/* 0C3AE8 800C9088 7C0802A6 */  mflr    r0
/* 0C3AEC 800C908C 90010004 */  stw     r0, 4(r1)
/* 0C3AF0 800C9090 9421FFF8 */  stwu    r1, -8(r1)
/* 0C3AF4 800C9094 48003A5D */  bl      TRKTargetStopped
/* 0C3AF8 800C9098 2C030000 */  cmpwi   r3, 0
/* 0C3AFC 800C909C 40820008 */  bne     lbl_800C90A4
/* 0C3B00 800C90A0 480046C5 */  bl      TRKTargetContinue
lbl_800C90A4:
/* 0C3B04 800C90A4 38210008 */  addi    r1, r1, 8
/* 0C3B08 800C90A8 80010004 */  lwz     r0, 4(r1)
/* 0C3B0C 800C90AC 7C0803A6 */  mtlr    r0
/* 0C3B10 800C90B0 4E800020 */  blr     

glabel TRKNubMainLoop
/* 0C3B14 800C90B4 7C0802A6 */  mflr    r0
/* 0C3B18 800C90B8 3C608013 */  lis     r3, gTRKInputPendingPtr@ha
/* 0C3B1C 800C90BC 90010004 */  stw     r0, 4(r1)
/* 0C3B20 800C90C0 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0C3B24 800C90C4 93E1001C */  stw     r31, 0x1c(r1)
/* 0C3B28 800C90C8 3BE34544 */  addi    r31, r3, gTRKInputPendingPtr@l
/* 0C3B2C 800C90CC 93C10018 */  stw     r30, 0x18(r1)
/* 0C3B30 800C90D0 3BC00000 */  li      r30, 0
/* 0C3B34 800C90D4 93A10014 */  stw     r29, 0x14(r1)
/* 0C3B38 800C90D8 3BA00000 */  li      r29, 0
/* 0C3B3C 800C90DC 480000A8 */  b       lbl_800C9184
lbl_800C90E0:
/* 0C3B40 800C90E0 38610008 */  addi    r3, r1, 8
/* 0C3B44 800C90E4 48000145 */  bl      TRKGetNextEvent
/* 0C3B48 800C90E8 2C030000 */  cmpwi   r3, 0
/* 0C3B4C 800C90EC 4182006C */  beq     lbl_800C9158
/* 0C3B50 800C90F0 88010008 */  lbz     r0, 8(r1)
/* 0C3B54 800C90F4 3BA00000 */  li      r29, 0
/* 0C3B58 800C90F8 2C000002 */  cmpwi   r0, 2
/* 0C3B5C 800C90FC 41820028 */  beq     lbl_800C9124
/* 0C3B60 800C9100 40800014 */  bge     lbl_800C9114
/* 0C3B64 800C9104 2C000000 */  cmpwi   r0, 0
/* 0C3B68 800C9108 41820044 */  beq     lbl_800C914C
/* 0C3B6C 800C910C 40800024 */  bge     lbl_800C9130
/* 0C3B70 800C9110 4800003C */  b       lbl_800C914C
lbl_800C9114:
/* 0C3B74 800C9114 2C000005 */  cmpwi   r0, 5
/* 0C3B78 800C9118 4182002C */  beq     lbl_800C9144
/* 0C3B7C 800C911C 40800030 */  bge     lbl_800C914C
/* 0C3B80 800C9120 48000018 */  b       lbl_800C9138
lbl_800C9124:
/* 0C3B84 800C9124 38610008 */  addi    r3, r1, 8
/* 0C3B88 800C9128 4BFFFF19 */  bl      TRKHandleRequestEvent
/* 0C3B8C 800C912C 48000020 */  b       lbl_800C914C
lbl_800C9130:
/* 0C3B90 800C9130 3BC00001 */  li      r30, 1
/* 0C3B94 800C9134 48000018 */  b       lbl_800C914C
lbl_800C9138:
/* 0C3B98 800C9138 38610008 */  addi    r3, r1, 8
/* 0C3B9C 800C913C 480034D9 */  bl      TRKTargetInterrupt
/* 0C3BA0 800C9140 4800000C */  b       lbl_800C914C
lbl_800C9144:
/* 0C3BA4 800C9144 38610008 */  addi    r3, r1, 8
/* 0C3BA8 800C9148 4BFFFF21 */  bl      TRKHandleSupportEvent
lbl_800C914C:
/* 0C3BAC 800C914C 38610008 */  addi    r3, r1, 8
/* 0C3BB0 800C9150 48000291 */  bl      TRKDestructEvent
/* 0C3BB4 800C9154 48000030 */  b       lbl_800C9184
lbl_800C9158:
/* 0C3BB8 800C9158 2C1D0000 */  cmpwi   r29, 0
/* 0C3BBC 800C915C 41820014 */  beq     lbl_800C9170
/* 0C3BC0 800C9160 807F0000 */  lwz     r3, 0(r31)
/* 0C3BC4 800C9164 88030000 */  lbz     r0, 0(r3)
/* 0C3BC8 800C9168 28000000 */  cmplwi  r0, 0
/* 0C3BCC 800C916C 41820010 */  beq     lbl_800C917C
lbl_800C9170:
/* 0C3BD0 800C9170 3BA00001 */  li      r29, 1
/* 0C3BD4 800C9174 48000D65 */  bl      TRKGetInput
/* 0C3BD8 800C9178 4800000C */  b       lbl_800C9184
lbl_800C917C:
/* 0C3BDC 800C917C 4BFFFF0D */  bl      TRKIdle
/* 0C3BE0 800C9180 3BA00000 */  li      r29, 0
lbl_800C9184:
/* 0C3BE4 800C9184 2C1E0000 */  cmpwi   r30, 0
/* 0C3BE8 800C9188 4182FF58 */  beq     lbl_800C90E0
/* 0C3BEC 800C918C 83E1001C */  lwz     r31, 0x1c(r1)
/* 0C3BF0 800C9190 83C10018 */  lwz     r30, 0x18(r1)
/* 0C3BF4 800C9194 83A10014 */  lwz     r29, 0x14(r1)
/* 0C3BF8 800C9198 38210020 */  addi    r1, r1, 0x20
/* 0C3BFC 800C919C 80010004 */  lwz     r0, 4(r1)
/* 0C3C00 800C91A0 7C0803A6 */  mtlr    r0
/* 0C3C04 800C91A4 4E800020 */  blr     
