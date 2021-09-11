# GXPixel.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel GXSetFog
/* 0A89A0 800ADF40 7C0802A6 */  mflr    r0
/* 0A89A4 800ADF44 90010004 */  stw     r0, 4(r1)
/* 0A89A8 800ADF48 9421FFA0 */  stwu    r1, -0x60(r1)
/* 0A89AC 800ADF4C DBE10058 */  stfd    f31, 0x58(r1)
/* 0A89B0 800ADF50 BEE10034 */  stmw    r23, 0x34(r1)
/* 0A89B4 800ADF54 3BC00000 */  li      r30, 0
/* 0A89B8 800ADF58 547FEFFF */  rlwinm. r31, r3, 0x1d, 0x1f, 0x1f
/* 0A89BC 800ADF5C 3B040000 */  addi    r24, r4, 0
/* 0A89C0 800ADF60 3BBE0000 */  addi    r29, r30, 0
/* 0A89C4 800ADF64 5479077E */  clrlwi  r25, r3, 0x1d
/* 0A89C8 800ADF68 3B800000 */  li      r28, 0
/* 0A89CC 800ADF6C 3B600000 */  li      r27, 0
/* 0A89D0 800ADF70 3B400000 */  li      r26, 0
/* 0A89D4 800ADF74 4182004C */  beq     lbl_800ADFC0
/* 0A89D8 800ADF78 FC041800 */  fcmpu   cr0, f4, f3
/* 0A89DC 800ADF7C 4182000C */  beq     lbl_800ADF88
/* 0A89E0 800ADF80 FC020800 */  fcmpu   cr0, f2, f1
/* 0A89E4 800ADF84 40820014 */  bne     lbl_800ADF98
lbl_800ADF88:
/* 0A89E8 800ADF88 C0028460 */  lfs     f0, D_80136160-_SDA2_BASE_(r2)
/* 0A89EC 800ADF8C D0010024 */  stfs    f0, 0x24(r1)
/* 0A89F0 800ADF90 D0010020 */  stfs    f0, 0x20(r1)
/* 0A89F4 800ADF94 48000118 */  b       lbl_800AE0AC
lbl_800ADF98:
/* 0A89F8 800ADF98 ECA20828 */  fsubs   f5, f2, f1
/* 0A89FC 800ADF9C C0C28464 */  lfs     f6, D_80136164-_SDA2_BASE_(r2)
/* 0A8A00 800ADFA0 EC441828 */  fsubs   f2, f4, f3
/* 0A8A04 800ADFA4 EC011828 */  fsubs   f0, f1, f3
/* 0A8A08 800ADFA8 EC662824 */  fdivs   f3, f6, f5
/* 0A8A0C 800ADFAC EC2300B2 */  fmuls   f1, f3, f2
/* 0A8A10 800ADFB0 EC030032 */  fmuls   f0, f3, f0
/* 0A8A14 800ADFB4 D0210024 */  stfs    f1, 0x24(r1)
/* 0A8A18 800ADFB8 D0010020 */  stfs    f0, 0x20(r1)
/* 0A8A1C 800ADFBC 480000F0 */  b       lbl_800AE0AC
lbl_800ADFC0:
/* 0A8A20 800ADFC0 FC041800 */  fcmpu   cr0, f4, f3
/* 0A8A24 800ADFC4 4182000C */  beq     lbl_800ADFD0
/* 0A8A28 800ADFC8 FC020800 */  fcmpu   cr0, f2, f1
/* 0A8A2C 800ADFCC 40820014 */  bne     lbl_800ADFE0
lbl_800ADFD0:
/* 0A8A30 800ADFD0 C0628460 */  lfs     f3, D_80136160-_SDA2_BASE_(r2)
/* 0A8A34 800ADFD4 C0828468 */  lfs     f4, D_80136168-_SDA2_BASE_(r2)
/* 0A8A38 800ADFD8 FFE01890 */  fmr     f31, f3
/* 0A8A3C 800ADFDC 48000020 */  b       lbl_800ADFFC
lbl_800ADFE0:
/* 0A8A40 800ADFE0 EC041828 */  fsubs   f0, f4, f3
/* 0A8A44 800ADFE4 ECA20828 */  fsubs   f5, f2, f1
/* 0A8A48 800ADFE8 EC4400F2 */  fmuls   f2, f4, f3
/* 0A8A4C 800ADFEC EC840024 */  fdivs   f4, f4, f0
/* 0A8A50 800ADFF0 EC000172 */  fmuls   f0, f0, f5
/* 0A8A54 800ADFF4 EFE12824 */  fdivs   f31, f1, f5
/* 0A8A58 800ADFF8 EC620024 */  fdivs   f3, f2, f0
lbl_800ADFFC:
/* 0A8A5C 800ADFFC C0228468 */  lfs     f1, D_80136168-_SDA2_BASE_(r2)
/* 0A8A60 800AE000 38600000 */  li      r3, 0
/* 0A8A64 800AE004 C8028470 */  lfd     f0, D_80136170-_SDA2_BASE_(r2)
/* 0A8A68 800AE008 4800000C */  b       lbl_800AE014
lbl_800AE00C:
/* 0A8A6C 800AE00C EC840072 */  fmuls   f4, f4, f1
/* 0A8A70 800AE010 38630001 */  addi    r3, r3, 1
lbl_800AE014:
/* 0A8A74 800AE014 FC040040 */  fcmpo   cr0, f4, f0
/* 0A8A78 800AE018 4181FFF4 */  bgt     lbl_800AE00C
/* 0A8A7C 800AE01C C8028480 */  lfd     f0, D_80136180-_SDA2_BASE_(r2)
/* 0A8A80 800AE020 C0428478 */  lfs     f2, D_80136178-_SDA2_BASE_(r2)
/* 0A8A84 800AE024 C0228460 */  lfs     f1, D_80136160-_SDA2_BASE_(r2)
/* 0A8A88 800AE028 4800000C */  b       lbl_800AE034
lbl_800AE02C:
/* 0A8A8C 800AE02C EC8400B2 */  fmuls   f4, f4, f2
/* 0A8A90 800AE030 3863FFFF */  addi    r3, r3, -1
lbl_800AE034:
/* 0A8A94 800AE034 FC040840 */  fcmpo   cr0, f4, f1
/* 0A8A98 800AE038 4081000C */  ble     lbl_800AE044
/* 0A8A9C 800AE03C FC040040 */  fcmpo   cr0, f4, f0
/* 0A8AA0 800AE040 4180FFEC */  blt     lbl_800AE02C
lbl_800AE044:
/* 0A8AA4 800AE044 3AE30001 */  addi    r23, r3, 1
/* 0A8AA8 800AE048 C0028488 */  lfs     f0, D_80136188-_SDA2_BASE_(r2)
/* 0A8AAC 800AE04C 38000001 */  li      r0, 1
/* 0A8AB0 800AE050 C8428490 */  lfd     f2, D_80136190-_SDA2_BASE_(r2)
/* 0A8AB4 800AE054 7C00B830 */  slw     r0, r0, r23
/* 0A8AB8 800AE058 EC200132 */  fmuls   f1, f0, f4
/* 0A8ABC 800AE05C 6C008000 */  xoris   r0, r0, 0x8000
/* 0A8AC0 800AE060 9001002C */  stw     r0, 0x2c(r1)
/* 0A8AC4 800AE064 3C004330 */  lis     r0, 0x4330
/* 0A8AC8 800AE068 90010028 */  stw     r0, 0x28(r1)
/* 0A8ACC 800AE06C C8010028 */  lfd     f0, 0x28(r1)
/* 0A8AD0 800AE070 EC001028 */  fsubs   f0, f0, f2
/* 0A8AD4 800AE074 EC030024 */  fdivs   f0, f3, f0
/* 0A8AD8 800AE078 D0010024 */  stfs    f0, 0x24(r1)
/* 0A8ADC 800AE07C 4801F859 */  bl      __cvt_fp2unsigned
/* 0A8AE0 800AE080 507E023E */  rlwimi  r30, r3, 0, 8, 0x1f
/* 0A8AE4 800AE084 D3E10020 */  stfs    f31, 0x20(r1)
/* 0A8AE8 800AE088 52FD06FE */  rlwimi  r29, r23, 0, 0x1b, 0x1f
/* 0A8AEC 800AE08C 380000EF */  li      r0, 0xef
/* 0A8AF0 800AE090 387E0000 */  addi    r3, r30, 0
/* 0A8AF4 800AE094 5003C00E */  rlwimi  r3, r0, 0x18, 0, 7
/* 0A8AF8 800AE098 380000F0 */  li      r0, 0xf0
/* 0A8AFC 800AE09C 389D0000 */  addi    r4, r29, 0
/* 0A8B00 800AE0A0 5004C00E */  rlwimi  r4, r0, 0x18, 0, 7
/* 0A8B04 800AE0A4 3BC30000 */  addi    r30, r3, 0
/* 0A8B08 800AE0A8 3BA40000 */  addi    r29, r4, 0
lbl_800AE0AC:
/* 0A8B0C 800AE0AC 81010024 */  lwz     r8, 0x24(r1)
/* 0A8B10 800AE0B0 38000061 */  li      r0, 0x61
/* 0A8B14 800AE0B4 88F80002 */  lbz     r7, 2(r24)
/* 0A8B18 800AE0B8 3C80CC01 */  lis     r4, 0xcc01
/* 0A8B1C 800AE0BC 511BA57E */  rlwimi  r27, r8, 0x14, 0x15, 0x1f
/* 0A8B20 800AE0C0 393B0000 */  addi    r9, r27, 0
/* 0A8B24 800AE0C4 88D80001 */  lbz     r6, 1(r24)
/* 0A8B28 800AE0C8 88B80000 */  lbz     r5, 0(r24)
/* 0A8B2C 800AE0CC 5109A368 */  rlwimi  r9, r8, 0x14, 0xd, 0x14
/* 0A8B30 800AE0D0 5109A318 */  rlwimi  r9, r8, 0x14, 0xc, 0xc
/* 0A8B34 800AE0D4 81410020 */  lwz     r10, 0x20(r1)
/* 0A8B38 800AE0D8 390000EE */  li      r8, 0xee
/* 0A8B3C 800AE0DC 98048000 */  stb     r0, -0x8000(r4)
/* 0A8B40 800AE0E0 5109C00E */  rlwimi  r9, r8, 0x18, 0, 7
/* 0A8B44 800AE0E4 50FC063E */  rlwimi  r28, r7, 0, 0x18, 0x1f
/* 0A8B48 800AE0E8 80628400 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0A8B4C 800AE0EC 91248000 */  stw     r9, -0x8000(r4)
/* 0A8B50 800AE0F0 515AA57E */  rlwimi  r26, r10, 0x14, 0x15, 0x1f
/* 0A8B54 800AE0F4 98048000 */  stb     r0, -0x8000(r4)
/* 0A8B58 800AE0F8 38FC0000 */  addi    r7, r28, 0
/* 0A8B5C 800AE0FC 50C7442E */  rlwimi  r7, r6, 8, 0x10, 0x17
/* 0A8B60 800AE100 93C48000 */  stw     r30, -0x8000(r4)
/* 0A8B64 800AE104 50A7821E */  rlwimi  r7, r5, 0x10, 8, 0xf
/* 0A8B68 800AE108 7F49D378 */  mr      r9, r26
/* 0A8B6C 800AE10C 98048000 */  stb     r0, -0x8000(r4)
/* 0A8B70 800AE110 38A000F1 */  li      r5, 0xf1
/* 0A8B74 800AE114 5149A368 */  rlwimi  r9, r10, 0x14, 0xd, 0x14
/* 0A8B78 800AE118 93A48000 */  stw     r29, -0x8000(r4)
/* 0A8B7C 800AE11C 5149A318 */  rlwimi  r9, r10, 0x14, 0xc, 0xc
/* 0A8B80 800AE120 53E9A2D6 */  rlwimi  r9, r31, 0x14, 0xb, 0xb
/* 0A8B84 800AE124 5329AA14 */  rlwimi  r9, r25, 0x15, 8, 0xa
/* 0A8B88 800AE128 98048000 */  stb     r0, -0x8000(r4)
/* 0A8B8C 800AE12C 50A9C00E */  rlwimi  r9, r5, 0x18, 0, 7
/* 0A8B90 800AE130 91248000 */  stw     r9, -0x8000(r4)
/* 0A8B94 800AE134 38A000F2 */  li      r5, 0xf2
/* 0A8B98 800AE138 50A7C00E */  rlwimi  r7, r5, 0x18, 0, 7
/* 0A8B9C 800AE13C 98048000 */  stb     r0, -0x8000(r4)
/* 0A8BA0 800AE140 38000000 */  li      r0, 0
/* 0A8BA4 800AE144 90E48000 */  stw     r7, -0x8000(r4)
/* 0A8BA8 800AE148 B0030002 */  sth     r0, 2(r3)
/* 0A8BAC 800AE14C BAE10034 */  lmw     r23, 0x34(r1)
/* 0A8BB0 800AE150 80010064 */  lwz     r0, 0x64(r1)
/* 0A8BB4 800AE154 CBE10058 */  lfd     f31, 0x58(r1)
/* 0A8BB8 800AE158 38210060 */  addi    r1, r1, 0x60
/* 0A8BBC 800AE15C 7C0803A6 */  mtlr    r0
/* 0A8BC0 800AE160 4E800020 */  blr     

glabel GXInitFogAdjTable
/* 0A8BC4 800AE164 7C0802A6 */  mflr    r0
/* 0A8BC8 800AE168 90010004 */  stw     r0, 4(r1)
/* 0A8BCC 800AE16C 9421FF80 */  stwu    r1, -0x80(r1)
/* 0A8BD0 800AE170 DBE10078 */  stfd    f31, 0x78(r1)
/* 0A8BD4 800AE174 DBC10070 */  stfd    f30, 0x70(r1)
/* 0A8BD8 800AE178 DBA10068 */  stfd    f29, 0x68(r1)
/* 0A8BDC 800AE17C DB810060 */  stfd    f28, 0x60(r1)
/* 0A8BE0 800AE180 DB610058 */  stfd    f27, 0x58(r1)
/* 0A8BE4 800AE184 DB410050 */  stfd    f26, 0x50(r1)
/* 0A8BE8 800AE188 DB210048 */  stfd    f25, 0x48(r1)
/* 0A8BEC 800AE18C DB010040 */  stfd    f24, 0x40(r1)
/* 0A8BF0 800AE190 DAE10038 */  stfd    f23, 0x38(r1)
/* 0A8BF4 800AE194 93E10034 */  stw     r31, 0x34(r1)
/* 0A8BF8 800AE198 93C10030 */  stw     r30, 0x30(r1)
/* 0A8BFC 800AE19C 93A1002C */  stw     r29, 0x2c(r1)
/* 0A8C00 800AE1A0 C8228498 */  lfd     f1, D_80136198-_SDA2_BASE_(r2)
/* 0A8C04 800AE1A4 C005003C */  lfs     f0, 0x3c(r5)
/* 0A8C08 800AE1A8 FC010000 */  fcmpu   cr0, f1, f0
/* 0A8C0C 800AE1AC 40820028 */  bne     lbl_800AE1D4
/* 0A8C10 800AE1B0 C0250028 */  lfs     f1, 0x28(r5)
/* 0A8C14 800AE1B4 C0028464 */  lfs     f0, D_80136164-_SDA2_BASE_(r2)
/* 0A8C18 800AE1B8 C045002C */  lfs     f2, 0x2c(r5)
/* 0A8C1C 800AE1BC EC210028 */  fsubs   f1, f1, f0
/* 0A8C20 800AE1C0 C0050000 */  lfs     f0, 0(r5)
/* 0A8C24 800AE1C4 EC220824 */  fdivs   f1, f2, f1
/* 0A8C28 800AE1C8 EF010024 */  fdivs   f24, f1, f0
/* 0A8C2C 800AE1CC FC000890 */  fmr     f0, f1
/* 0A8C30 800AE1D0 4800001C */  b       lbl_800AE1EC
lbl_800AE1D4:
/* 0A8C34 800AE1D4 C0428464 */  lfs     f2, D_80136164-_SDA2_BASE_(r2)
/* 0A8C38 800AE1D8 C0250000 */  lfs     f1, 0(r5)
/* 0A8C3C 800AE1DC C00284A0 */  lfs     f0, D_801361A0-_SDA2_BASE_(r2)
/* 0A8C40 800AE1E0 EC220824 */  fdivs   f1, f2, f1
/* 0A8C44 800AE1E4 FF000890 */  fmr     f24, f1
/* 0A8C48 800AE1E8 EC000072 */  fmuls   f0, f0, f1
lbl_800AE1EC:
/* 0A8C4C 800AE1EC 5480043E */  clrlwi  r0, r4, 0x10
/* 0A8C50 800AE1F0 CB6284B8 */  lfd     f27, D_801361B8-_SDA2_BASE_(r2)
/* 0A8C54 800AE1F4 90010024 */  stw     r0, 0x24(r1)
/* 0A8C58 800AE1F8 3FE04330 */  lis     r31, 0x4330
/* 0A8C5C 800AE1FC C0228478 */  lfs     f1, D_80136178-_SDA2_BASE_(r2)
/* 0A8C60 800AE200 EF400032 */  fmuls   f26, f0, f0
/* 0A8C64 800AE204 93E10020 */  stw     r31, 0x20(r1)
/* 0A8C68 800AE208 C3828464 */  lfs     f28, D_80136164-_SDA2_BASE_(r2)
/* 0A8C6C 800AE20C 7C7E1B78 */  mr      r30, r3
/* 0A8C70 800AE210 C8010020 */  lfd     f0, 0x20(r1)
/* 0A8C74 800AE214 C3A28460 */  lfs     f29, D_80136160-_SDA2_BASE_(r2)
/* 0A8C78 800AE218 3BA00000 */  li      r29, 0
/* 0A8C7C 800AE21C EC00D828 */  fsubs   f0, f0, f27
/* 0A8C80 800AE220 CBC28480 */  lfd     f30, D_80136180-_SDA2_BASE_(r2)
/* 0A8C84 800AE224 CBE284A8 */  lfd     f31, D_801361A8-_SDA2_BASE_(r2)
/* 0A8C88 800AE228 C2E284B0 */  lfs     f23, D_801361B0-_SDA2_BASE_(r2)
/* 0A8C8C 800AE22C EF210024 */  fdivs   f25, f1, f0
lbl_800AE230:
/* 0A8C90 800AE230 381D0001 */  addi    r0, r29, 1
/* 0A8C94 800AE234 54002834 */  slwi    r0, r0, 5
/* 0A8C98 800AE238 90010024 */  stw     r0, 0x24(r1)
/* 0A8C9C 800AE23C 93E10020 */  stw     r31, 0x20(r1)
/* 0A8CA0 800AE240 C8010020 */  lfd     f0, 0x20(r1)
/* 0A8CA4 800AE244 EC00D828 */  fsubs   f0, f0, f27
/* 0A8CA8 800AE248 EC000672 */  fmuls   f0, f0, f25
/* 0A8CAC 800AE24C EC000632 */  fmuls   f0, f0, f24
/* 0A8CB0 800AE250 EC000032 */  fmuls   f0, f0, f0
/* 0A8CB4 800AE254 EC00D024 */  fdivs   f0, f0, f26
/* 0A8CB8 800AE258 EC5C002A */  fadds   f2, f28, f0
/* 0A8CBC 800AE25C FC02E840 */  fcmpo   cr0, f2, f29
/* 0A8CC0 800AE260 40810054 */  ble     lbl_800AE2B4
/* 0A8CC4 800AE264 FC201034 */  frsqrte f1, f2
/* 0A8CC8 800AE268 FC010072 */  fmul    f0, f1, f1
/* 0A8CCC 800AE26C FC3E0072 */  fmul    f1, f30, f1
/* 0A8CD0 800AE270 FC020032 */  fmul    f0, f2, f0
/* 0A8CD4 800AE274 FC1F0028 */  fsub    f0, f31, f0
/* 0A8CD8 800AE278 FC210032 */  fmul    f1, f1, f0
/* 0A8CDC 800AE27C FC010072 */  fmul    f0, f1, f1
/* 0A8CE0 800AE280 FC3E0072 */  fmul    f1, f30, f1
/* 0A8CE4 800AE284 FC020032 */  fmul    f0, f2, f0
/* 0A8CE8 800AE288 FC1F0028 */  fsub    f0, f31, f0
/* 0A8CEC 800AE28C FC210032 */  fmul    f1, f1, f0
/* 0A8CF0 800AE290 FC010072 */  fmul    f0, f1, f1
/* 0A8CF4 800AE294 FC3E0072 */  fmul    f1, f30, f1
/* 0A8CF8 800AE298 FC020032 */  fmul    f0, f2, f0
/* 0A8CFC 800AE29C FC1F0028 */  fsub    f0, f31, f0
/* 0A8D00 800AE2A0 FC010032 */  fmul    f0, f1, f0
/* 0A8D04 800AE2A4 FC020032 */  fmul    f0, f2, f0
/* 0A8D08 800AE2A8 FC000018 */  frsp    f0, f0
/* 0A8D0C 800AE2AC D0010014 */  stfs    f0, 0x14(r1)
/* 0A8D10 800AE2B0 C0410014 */  lfs     f2, 0x14(r1)
lbl_800AE2B4:
/* 0A8D14 800AE2B4 EC3700B2 */  fmuls   f1, f23, f2
/* 0A8D18 800AE2B8 4801F61D */  bl      __cvt_fp2unsigned
/* 0A8D1C 800AE2BC 3BBD0001 */  addi    r29, r29, 1
/* 0A8D20 800AE2C0 5460053E */  clrlwi  r0, r3, 0x14
/* 0A8D24 800AE2C4 B01E0000 */  sth     r0, 0(r30)
/* 0A8D28 800AE2C8 281D000A */  cmplwi  r29, 0xa
/* 0A8D2C 800AE2CC 3BDE0002 */  addi    r30, r30, 2
/* 0A8D30 800AE2D0 4180FF60 */  blt     lbl_800AE230
/* 0A8D34 800AE2D4 80010084 */  lwz     r0, 0x84(r1)
/* 0A8D38 800AE2D8 CBE10078 */  lfd     f31, 0x78(r1)
/* 0A8D3C 800AE2DC CBC10070 */  lfd     f30, 0x70(r1)
/* 0A8D40 800AE2E0 CBA10068 */  lfd     f29, 0x68(r1)
/* 0A8D44 800AE2E4 CB810060 */  lfd     f28, 0x60(r1)
/* 0A8D48 800AE2E8 CB610058 */  lfd     f27, 0x58(r1)
/* 0A8D4C 800AE2EC CB410050 */  lfd     f26, 0x50(r1)
/* 0A8D50 800AE2F0 CB210048 */  lfd     f25, 0x48(r1)
/* 0A8D54 800AE2F4 CB010040 */  lfd     f24, 0x40(r1)
/* 0A8D58 800AE2F8 CAE10038 */  lfd     f23, 0x38(r1)
/* 0A8D5C 800AE2FC 83E10034 */  lwz     r31, 0x34(r1)
/* 0A8D60 800AE300 83C10030 */  lwz     r30, 0x30(r1)
/* 0A8D64 800AE304 83A1002C */  lwz     r29, 0x2c(r1)
/* 0A8D68 800AE308 38210080 */  addi    r1, r1, 0x80
/* 0A8D6C 800AE30C 7C0803A6 */  mtlr    r0
/* 0A8D70 800AE310 4E800020 */  blr     

glabel GXSetFogRangeAdj
/* 0A8D74 800AE314 5460063F */  clrlwi. r0, r3, 0x18
/* 0A8D78 800AE318 418200E4 */  beq     lbl_800AE3FC
/* 0A8D7C 800AE31C 38C00000 */  li      r6, 0
/* 0A8D80 800AE320 54C0083C */  slwi    r0, r6, 1
/* 0A8D84 800AE324 7D250214 */  add     r9, r5, r0
/* 0A8D88 800AE328 A1090000 */  lhz     r8, 0(r9)
/* 0A8D8C 800AE32C 54CAF87E */  srwi    r10, r6, 1
/* 0A8D90 800AE330 A0E90002 */  lhz     r7, 2(r9)
/* 0A8D94 800AE334 38000061 */  li      r0, 0x61
/* 0A8D98 800AE338 3CA0CC01 */  lis     r5, 0xcc01
/* 0A8D9C 800AE33C 39600000 */  li      r11, 0
/* 0A8DA0 800AE340 98058000 */  stb     r0, -0x8000(r5)
/* 0A8DA4 800AE344 510B053E */  rlwimi  r11, r8, 0, 0x14, 0x1f
/* 0A8DA8 800AE348 390B0000 */  addi    r8, r11, 0
/* 0A8DAC 800AE34C 38CA00E9 */  addi    r6, r10, 0xe9
/* 0A8DB0 800AE350 50E86226 */  rlwimi  r8, r7, 0xc, 8, 0x13
/* 0A8DB4 800AE354 50C8C00E */  rlwimi  r8, r6, 0x18, 0, 7
/* 0A8DB8 800AE358 91058000 */  stw     r8, -0x8000(r5)
/* 0A8DBC 800AE35C 38CA00EA */  addi    r6, r10, 0xea
/* 0A8DC0 800AE360 39600000 */  li      r11, 0
/* 0A8DC4 800AE364 A1090004 */  lhz     r8, 4(r9)
/* 0A8DC8 800AE368 A0E90006 */  lhz     r7, 6(r9)
/* 0A8DCC 800AE36C 510B053E */  rlwimi  r11, r8, 0, 0x14, 0x1f
/* 0A8DD0 800AE370 390B0000 */  addi    r8, r11, 0
/* 0A8DD4 800AE374 98058000 */  stb     r0, -0x8000(r5)
/* 0A8DD8 800AE378 50E86226 */  rlwimi  r8, r7, 0xc, 8, 0x13
/* 0A8DDC 800AE37C 50C8C00E */  rlwimi  r8, r6, 0x18, 0, 7
/* 0A8DE0 800AE380 91058000 */  stw     r8, -0x8000(r5)
/* 0A8DE4 800AE384 38CA00EB */  addi    r6, r10, 0xeb
/* 0A8DE8 800AE388 39600000 */  li      r11, 0
/* 0A8DEC 800AE38C A1090008 */  lhz     r8, 8(r9)
/* 0A8DF0 800AE390 A0E9000A */  lhz     r7, 0xa(r9)
/* 0A8DF4 800AE394 510B053E */  rlwimi  r11, r8, 0, 0x14, 0x1f
/* 0A8DF8 800AE398 390B0000 */  addi    r8, r11, 0
/* 0A8DFC 800AE39C 98058000 */  stb     r0, -0x8000(r5)
/* 0A8E00 800AE3A0 50E86226 */  rlwimi  r8, r7, 0xc, 8, 0x13
/* 0A8E04 800AE3A4 50C8C00E */  rlwimi  r8, r6, 0x18, 0, 7
/* 0A8E08 800AE3A8 91058000 */  stw     r8, -0x8000(r5)
/* 0A8E0C 800AE3AC 38CA00EC */  addi    r6, r10, 0xec
/* 0A8E10 800AE3B0 39600000 */  li      r11, 0
/* 0A8E14 800AE3B4 A109000C */  lhz     r8, 0xc(r9)
/* 0A8E18 800AE3B8 A0E9000E */  lhz     r7, 0xe(r9)
/* 0A8E1C 800AE3BC 510B053E */  rlwimi  r11, r8, 0, 0x14, 0x1f
/* 0A8E20 800AE3C0 390B0000 */  addi    r8, r11, 0
/* 0A8E24 800AE3C4 98058000 */  stb     r0, -0x8000(r5)
/* 0A8E28 800AE3C8 50E86226 */  rlwimi  r8, r7, 0xc, 8, 0x13
/* 0A8E2C 800AE3CC 50C8C00E */  rlwimi  r8, r6, 0x18, 0, 7
/* 0A8E30 800AE3D0 91058000 */  stw     r8, -0x8000(r5)
/* 0A8E34 800AE3D4 38CA00ED */  addi    r6, r10, 0xed
/* 0A8E38 800AE3D8 39600000 */  li      r11, 0
/* 0A8E3C 800AE3DC A1090010 */  lhz     r8, 0x10(r9)
/* 0A8E40 800AE3E0 A0E90012 */  lhz     r7, 0x12(r9)
/* 0A8E44 800AE3E4 510B053E */  rlwimi  r11, r8, 0, 0x14, 0x1f
/* 0A8E48 800AE3E8 390B0000 */  addi    r8, r11, 0
/* 0A8E4C 800AE3EC 98058000 */  stb     r0, -0x8000(r5)
/* 0A8E50 800AE3F0 50E86226 */  rlwimi  r8, r7, 0xc, 8, 0x13
/* 0A8E54 800AE3F4 50C8C00E */  rlwimi  r8, r6, 0x18, 0, 7
/* 0A8E58 800AE3F8 91058000 */  stw     r8, -0x8000(r5)
lbl_800AE3FC:
/* 0A8E5C 800AE3FC 5485043E */  clrlwi  r5, r4, 0x10
/* 0A8E60 800AE400 80828400 */  lwz     r4, __GXData-_SDA2_BASE_(r2)
/* 0A8E64 800AE404 38050156 */  addi    r0, r5, 0x156
/* 0A8E68 800AE408 38A00000 */  li      r5, 0
/* 0A8E6C 800AE40C 500505BE */  rlwimi  r5, r0, 0, 0x16, 0x1f
/* 0A8E70 800AE410 5065556A */  rlwimi  r5, r3, 0xa, 0x15, 0x15
/* 0A8E74 800AE414 38000061 */  li      r0, 0x61
/* 0A8E78 800AE418 3C60CC01 */  lis     r3, 0xcc01
/* 0A8E7C 800AE41C 98038000 */  stb     r0, -0x8000(r3)
/* 0A8E80 800AE420 380000E8 */  li      r0, 0xe8
/* 0A8E84 800AE424 5005C00E */  rlwimi  r5, r0, 0x18, 0, 7
/* 0A8E88 800AE428 90A38000 */  stw     r5, -0x8000(r3)
/* 0A8E8C 800AE42C 38000000 */  li      r0, 0
/* 0A8E90 800AE430 B0040002 */  sth     r0, 2(r4)
/* 0A8E94 800AE434 4E800020 */  blr     

glabel GXSetBlendMode
/* 0A8E98 800AE438 81028400 */  lwz     r8, __GXData-_SDA2_BASE_(r2)
/* 0A8E9C 800AE43C 20030003 */  subfic  r0, r3, 3
/* 0A8EA0 800AE440 7C070034 */  cntlzw  r7, r0
/* 0A8EA4 800AE444 20030002 */  subfic  r0, r3, 2
/* 0A8EA8 800AE448 812801D0 */  lwz     r9, 0x1d0(r8)
/* 0A8EAC 800AE44C 50E93528 */  rlwimi  r9, r7, 6, 0x14, 0x14
/* 0A8EB0 800AE450 38E90000 */  addi    r7, r9, 0
/* 0A8EB4 800AE454 506707FE */  rlwimi  r7, r3, 0, 0x1f, 0x1f
/* 0A8EB8 800AE458 7C000034 */  cntlzw  r0, r0
/* 0A8EBC 800AE45C 5007E7BC */  rlwimi  r7, r0, 0x1c, 0x1e, 0x1e
/* 0A8EC0 800AE460 50C76426 */  rlwimi  r7, r6, 0xc, 0x10, 0x13
/* 0A8EC4 800AE464 5087456E */  rlwimi  r7, r4, 8, 0x15, 0x17
/* 0A8EC8 800AE468 38000061 */  li      r0, 0x61
/* 0A8ECC 800AE46C 3C60CC01 */  lis     r3, 0xcc01
/* 0A8ED0 800AE470 98038000 */  stb     r0, -0x8000(r3)
/* 0A8ED4 800AE474 50A72E34 */  rlwimi  r7, r5, 5, 0x18, 0x1a
/* 0A8ED8 800AE478 38000000 */  li      r0, 0
/* 0A8EDC 800AE47C 90E38000 */  stw     r7, -0x8000(r3)
/* 0A8EE0 800AE480 90E801D0 */  stw     r7, 0x1d0(r8)
/* 0A8EE4 800AE484 B0080002 */  sth     r0, 2(r8)
/* 0A8EE8 800AE488 4E800020 */  blr     

glabel GXSetColorUpdate
/* 0A8EEC 800AE48C 80A28400 */  lwz     r5, __GXData-_SDA2_BASE_(r2)
/* 0A8EF0 800AE490 38000061 */  li      r0, 0x61
/* 0A8EF4 800AE494 3C80CC01 */  lis     r4, 0xcc01
/* 0A8EF8 800AE498 80C501D0 */  lwz     r6, 0x1d0(r5)
/* 0A8EFC 800AE49C 50661F38 */  rlwimi  r6, r3, 3, 0x1c, 0x1c
/* 0A8F00 800AE4A0 98048000 */  stb     r0, -0x8000(r4)
/* 0A8F04 800AE4A4 38000000 */  li      r0, 0
/* 0A8F08 800AE4A8 90C48000 */  stw     r6, -0x8000(r4)
/* 0A8F0C 800AE4AC 90C501D0 */  stw     r6, 0x1d0(r5)
/* 0A8F10 800AE4B0 B0050002 */  sth     r0, 2(r5)
/* 0A8F14 800AE4B4 4E800020 */  blr     

glabel GXSetAlphaUpdate
/* 0A8F18 800AE4B8 80A28400 */  lwz     r5, __GXData-_SDA2_BASE_(r2)
/* 0A8F1C 800AE4BC 38000061 */  li      r0, 0x61
/* 0A8F20 800AE4C0 3C80CC01 */  lis     r4, 0xcc01
/* 0A8F24 800AE4C4 80C501D0 */  lwz     r6, 0x1d0(r5)
/* 0A8F28 800AE4C8 506626F6 */  rlwimi  r6, r3, 4, 0x1b, 0x1b
/* 0A8F2C 800AE4CC 98048000 */  stb     r0, -0x8000(r4)
/* 0A8F30 800AE4D0 38000000 */  li      r0, 0
/* 0A8F34 800AE4D4 90C48000 */  stw     r6, -0x8000(r4)
/* 0A8F38 800AE4D8 90C501D0 */  stw     r6, 0x1d0(r5)
/* 0A8F3C 800AE4DC B0050002 */  sth     r0, 2(r5)
/* 0A8F40 800AE4E0 4E800020 */  blr     

glabel GXSetZMode
/* 0A8F44 800AE4E4 80C28400 */  lwz     r6, __GXData-_SDA2_BASE_(r2)
/* 0A8F48 800AE4E8 38000061 */  li      r0, 0x61
/* 0A8F4C 800AE4EC 80E601D8 */  lwz     r7, 0x1d8(r6)
/* 0A8F50 800AE4F0 506707FE */  rlwimi  r7, r3, 0, 0x1f, 0x1f
/* 0A8F54 800AE4F4 3C60CC01 */  lis     r3, 0xcc01
/* 0A8F58 800AE4F8 98038000 */  stb     r0, -0x8000(r3)
/* 0A8F5C 800AE4FC 50870F3C */  rlwimi  r7, r4, 1, 0x1c, 0x1e
/* 0A8F60 800AE500 50A726F6 */  rlwimi  r7, r5, 4, 0x1b, 0x1b
/* 0A8F64 800AE504 90E38000 */  stw     r7, -0x8000(r3)
/* 0A8F68 800AE508 38000000 */  li      r0, 0
/* 0A8F6C 800AE50C 90E601D8 */  stw     r7, 0x1d8(r6)
/* 0A8F70 800AE510 B0060002 */  sth     r0, 2(r6)
/* 0A8F74 800AE514 4E800020 */  blr     

glabel GXSetZCompLoc
/* 0A8F78 800AE518 80C28400 */  lwz     r6, __GXData-_SDA2_BASE_(r2)
/* 0A8F7C 800AE51C 5460063E */  clrlwi  r0, r3, 0x18
/* 0A8F80 800AE520 38600061 */  li      r3, 0x61
/* 0A8F84 800AE524 80A601DC */  lwz     r5, 0x1dc(r6)
/* 0A8F88 800AE528 50053672 */  rlwimi  r5, r0, 6, 0x19, 0x19
/* 0A8F8C 800AE52C 3C80CC01 */  lis     r4, 0xcc01
/* 0A8F90 800AE530 90A601DC */  stw     r5, 0x1dc(r6)
/* 0A8F94 800AE534 38000000 */  li      r0, 0
/* 0A8F98 800AE538 98648000 */  stb     r3, -0x8000(r4)
/* 0A8F9C 800AE53C 806601DC */  lwz     r3, 0x1dc(r6)
/* 0A8FA0 800AE540 90648000 */  stw     r3, -0x8000(r4)
/* 0A8FA4 800AE544 B0060002 */  sth     r0, 2(r6)
/* 0A8FA8 800AE548 4E800020 */  blr     

glabel GXSetPixelFmt
/* 0A8FAC 800AE54C 3CA0800F */  lis     r5, p2f$362@ha
/* 0A8FB0 800AE550 80E28400 */  lwz     r7, __GXData-_SDA2_BASE_(r2)
/* 0A8FB4 800AE554 5466103A */  slwi    r6, r3, 2
/* 0A8FB8 800AE558 38052138 */  addi    r0, r5, p2f$362@l
/* 0A8FBC 800AE55C 80A701DC */  lwz     r5, 0x1dc(r7)
/* 0A8FC0 800AE560 7CC03214 */  add     r6, r0, r6
/* 0A8FC4 800AE564 80060000 */  lwz     r0, 0(r6)
/* 0A8FC8 800AE568 39050000 */  addi    r8, r5, 0
/* 0A8FCC 800AE56C 5005077E */  rlwimi  r5, r0, 0, 0x1d, 0x1f
/* 0A8FD0 800AE570 90A701DC */  stw     r5, 0x1dc(r7)
/* 0A8FD4 800AE574 800701DC */  lwz     r0, 0x1dc(r7)
/* 0A8FD8 800AE578 50801EB8 */  rlwimi  r0, r4, 3, 0x1a, 0x1c
/* 0A8FDC 800AE57C 900701DC */  stw     r0, 0x1dc(r7)
/* 0A8FE0 800AE580 80A701DC */  lwz     r5, 0x1dc(r7)
/* 0A8FE4 800AE584 7C082840 */  cmplw   r8, r5
/* 0A8FE8 800AE588 41820044 */  beq     lbl_800AE5CC
/* 0A8FEC 800AE58C 38000061 */  li      r0, 0x61
/* 0A8FF0 800AE590 3C80CC01 */  lis     r4, 0xcc01
/* 0A8FF4 800AE594 98048000 */  stb     r0, -0x8000(r4)
/* 0A8FF8 800AE598 2C030002 */  cmpwi   r3, 2
/* 0A8FFC 800AE59C 90A48000 */  stw     r5, -0x8000(r4)
/* 0A9000 800AE5A0 4082000C */  bne     lbl_800AE5AC
/* 0A9004 800AE5A4 38000001 */  li      r0, 1
/* 0A9008 800AE5A8 48000008 */  b       lbl_800AE5B0
lbl_800AE5AC:
/* 0A900C 800AE5AC 38000000 */  li      r0, 0
lbl_800AE5B0:
/* 0A9010 800AE5B0 80A28400 */  lwz     r5, __GXData-_SDA2_BASE_(r2)
/* 0A9014 800AE5B4 80850204 */  lwz     r4, 0x204(r5)
/* 0A9018 800AE5B8 50044DAC */  rlwimi  r4, r0, 9, 0x16, 0x16
/* 0A901C 800AE5BC 90850204 */  stw     r4, 0x204(r5)
/* 0A9020 800AE5C0 800505AC */  lwz     r0, 0x5ac(r5)
/* 0A9024 800AE5C4 60000004 */  ori     r0, r0, 4
/* 0A9028 800AE5C8 900505AC */  stw     r0, 0x5ac(r5)
lbl_800AE5CC:
/* 0A902C 800AE5CC 80060000 */  lwz     r0, 0(r6)
/* 0A9030 800AE5D0 28000004 */  cmplwi  r0, 4
/* 0A9034 800AE5D4 4082003C */  bne     lbl_800AE610
/* 0A9038 800AE5D8 80C28400 */  lwz     r6, __GXData-_SDA2_BASE_(r2)
/* 0A903C 800AE5DC 3803FFFC */  addi    r0, r3, -4
/* 0A9040 800AE5E0 38800042 */  li      r4, 0x42
/* 0A9044 800AE5E4 806601D4 */  lwz     r3, 0x1d4(r6)
/* 0A9048 800AE5E8 50034D6C */  rlwimi  r3, r0, 9, 0x15, 0x16
/* 0A904C 800AE5EC 38000061 */  li      r0, 0x61
/* 0A9050 800AE5F0 906601D4 */  stw     r3, 0x1d4(r6)
/* 0A9054 800AE5F4 3C60CC01 */  lis     r3, 0xcc01
/* 0A9058 800AE5F8 80A601D4 */  lwz     r5, 0x1d4(r6)
/* 0A905C 800AE5FC 5085C00E */  rlwimi  r5, r4, 0x18, 0, 7
/* 0A9060 800AE600 90A601D4 */  stw     r5, 0x1d4(r6)
/* 0A9064 800AE604 98038000 */  stb     r0, -0x8000(r3)
/* 0A9068 800AE608 800601D4 */  lwz     r0, 0x1d4(r6)
/* 0A906C 800AE60C 90038000 */  stw     r0, -0x8000(r3)
lbl_800AE610:
/* 0A9070 800AE610 80628400 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0A9074 800AE614 38000000 */  li      r0, 0
/* 0A9078 800AE618 B0030002 */  sth     r0, 2(r3)
/* 0A907C 800AE61C 4E800020 */  blr     

glabel GXSetDither
/* 0A9080 800AE620 80A28400 */  lwz     r5, __GXData-_SDA2_BASE_(r2)
/* 0A9084 800AE624 38000061 */  li      r0, 0x61
/* 0A9088 800AE628 3C80CC01 */  lis     r4, 0xcc01
/* 0A908C 800AE62C 80C501D0 */  lwz     r6, 0x1d0(r5)
/* 0A9090 800AE630 5066177A */  rlwimi  r6, r3, 2, 0x1d, 0x1d
/* 0A9094 800AE634 98048000 */  stb     r0, -0x8000(r4)
/* 0A9098 800AE638 38000000 */  li      r0, 0
/* 0A909C 800AE63C 90C48000 */  stw     r6, -0x8000(r4)
/* 0A90A0 800AE640 90C501D0 */  stw     r6, 0x1d0(r5)
/* 0A90A4 800AE644 B0050002 */  sth     r0, 2(r5)
/* 0A90A8 800AE648 4E800020 */  blr     

glabel GXSetDstAlpha
/* 0A90AC 800AE64C 80C28400 */  lwz     r6, __GXData-_SDA2_BASE_(r2)
/* 0A90B0 800AE650 5485063E */  clrlwi  r5, r4, 0x18
/* 0A90B4 800AE654 38000061 */  li      r0, 0x61
/* 0A90B8 800AE658 80E601D4 */  lwz     r7, 0x1d4(r6)
/* 0A90BC 800AE65C 3C80CC01 */  lis     r4, 0xcc01
/* 0A90C0 800AE660 50A7063E */  rlwimi  r7, r5, 0, 0x18, 0x1f
/* 0A90C4 800AE664 98048000 */  stb     r0, -0x8000(r4)
/* 0A90C8 800AE668 5460063E */  clrlwi  r0, r3, 0x18
/* 0A90CC 800AE66C 38670000 */  addi    r3, r7, 0
/* 0A90D0 800AE670 500345EE */  rlwimi  r3, r0, 8, 0x17, 0x17
/* 0A90D4 800AE674 90648000 */  stw     r3, -0x8000(r4)
/* 0A90D8 800AE678 38000000 */  li      r0, 0
/* 0A90DC 800AE67C 906601D4 */  stw     r3, 0x1d4(r6)
/* 0A90E0 800AE680 B0060002 */  sth     r0, 2(r6)
/* 0A90E4 800AE684 4E800020 */  blr     

glabel GXSetFieldMask
/* 0A90E8 800AE688 5480063E */  clrlwi  r0, r4, 0x18
/* 0A90EC 800AE68C 80828400 */  lwz     r4, __GXData-_SDA2_BASE_(r2)
/* 0A90F0 800AE690 38A00000 */  li      r5, 0
/* 0A90F4 800AE694 500507FE */  rlwimi  r5, r0, 0, 0x1f, 0x1f
/* 0A90F8 800AE698 50650FBC */  rlwimi  r5, r3, 1, 0x1e, 0x1e
/* 0A90FC 800AE69C 38000061 */  li      r0, 0x61
/* 0A9100 800AE6A0 3C60CC01 */  lis     r3, 0xcc01
/* 0A9104 800AE6A4 98038000 */  stb     r0, -0x8000(r3)
/* 0A9108 800AE6A8 38000044 */  li      r0, 0x44
/* 0A910C 800AE6AC 5005C00E */  rlwimi  r5, r0, 0x18, 0, 7
/* 0A9110 800AE6B0 90A38000 */  stw     r5, -0x8000(r3)
/* 0A9114 800AE6B4 38000000 */  li      r0, 0
/* 0A9118 800AE6B8 B0040002 */  sth     r0, 2(r4)
/* 0A911C 800AE6BC 4E800020 */  blr     

glabel GXSetFieldMode
/* 0A9120 800AE6C0 7C0802A6 */  mflr    r0
/* 0A9124 800AE6C4 90010004 */  stw     r0, 4(r1)
/* 0A9128 800AE6C8 5480063E */  clrlwi  r0, r4, 0x18
/* 0A912C 800AE6CC 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0A9130 800AE6D0 93E1001C */  stw     r31, 0x1c(r1)
/* 0A9134 800AE6D4 3FE0CC01 */  lis     r31, 0xcc01
/* 0A9138 800AE6D8 93C10018 */  stw     r30, 0x18(r1)
/* 0A913C 800AE6DC 3BC00061 */  li      r30, 0x61
/* 0A9140 800AE6E0 93A10014 */  stw     r29, 0x14(r1)
/* 0A9144 800AE6E4 7C7D1B78 */  mr      r29, r3
/* 0A9148 800AE6E8 80A28400 */  lwz     r5, __GXData-_SDA2_BASE_(r2)
/* 0A914C 800AE6EC 8085007C */  lwz     r4, 0x7c(r5)
/* 0A9150 800AE6F0 5004B252 */  rlwimi  r4, r0, 0x16, 9, 9
/* 0A9154 800AE6F4 9085007C */  stw     r4, 0x7c(r5)
/* 0A9158 800AE6F8 9BDF8000 */  stb     r30, -0x8000(r31)
/* 0A915C 800AE6FC 8005007C */  lwz     r0, 0x7c(r5)
/* 0A9160 800AE700 901F8000 */  stw     r0, -0x8000(r31)
/* 0A9164 800AE704 4BFFF0B5 */  bl      __GXFlushTextureState
/* 0A9168 800AE708 57A0063E */  clrlwi  r0, r29, 0x18
/* 0A916C 800AE70C 9BDF8000 */  stb     r30, -0x8000(r31)
/* 0A9170 800AE710 64006800 */  oris    r0, r0, 0x6800
/* 0A9174 800AE714 901F8000 */  stw     r0, -0x8000(r31)
/* 0A9178 800AE718 4BFFF0A1 */  bl      __GXFlushTextureState
/* 0A917C 800AE71C 80010024 */  lwz     r0, 0x24(r1)
/* 0A9180 800AE720 83E1001C */  lwz     r31, 0x1c(r1)
/* 0A9184 800AE724 83C10018 */  lwz     r30, 0x18(r1)
/* 0A9188 800AE728 83A10014 */  lwz     r29, 0x14(r1)
/* 0A918C 800AE72C 38210020 */  addi    r1, r1, 0x20
/* 0A9190 800AE730 7C0803A6 */  mtlr    r0
/* 0A9194 800AE734 4E800020 */  blr     

.section .data, "wa"

.balign 8

/* 000EF1B8 800F2138 0020 */
p2f$362:
    .long 0x00000000, 0x00000001, 0x00000002, 0x00000003, 0x00000004, 0x00000004, 0x00000004, 0x00000005

.section .sdata2, "wa"

.balign 8

/* 000F1C60 80136160 0004 */
D_80136160:
    .float 0.0

/* 000F1C64 80136164 0004 */
D_80136164:
    .float 1.0

/* 000F1C68 80136168 0004 */
D_80136168:
    .float 0.5

.balign 8

/* 000F1C70 80136170 0008 */
D_80136170:
    .double 1.0

/* 000F1C78 80136178 0004 */
D_80136178:
    .float 2.0

.balign 8

/* 000F1C80 80136180 0008 */
D_80136180:
    .double 0.5

/* 000F1C88 80136188 0004 */
D_80136188:
    .float 8388638.0

.balign 8

/* 000F1C90 80136190 0008 */
D_80136190:
    .double 4503601774854144.0

/* 000F1C98 80136198 0008 */
D_80136198:
    .double 0.0

/* 000F1CA0 801361A0 0004 */
D_801361A0:
    .float 1.7320499420166016

.balign 8

/* 000F1CA8 801361A8 0008 */
D_801361A8:
    .double 3.0

/* 000F1CB0 801361B0 0004 */
D_801361B0:
    .float 256.0

.balign 8

/* 000F1CB8 801361B8 0008 */
D_801361B8:
    .double 4503599627370496.0
