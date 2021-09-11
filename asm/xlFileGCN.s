# xlFileGCN.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel xlFileEvent
/* 0008C8 80005E68 7C0802A6 */  mflr    r0
/* 0008CC 80005E6C 2C040003 */  cmpwi   r4, 3
/* 0008D0 80005E70 90010004 */  stw     r0, 4(r1)
/* 0008D4 80005E74 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0008D8 80005E78 93E1001C */  stw     r31, 0x1c(r1)
/* 0008DC 80005E7C 3BE30000 */  addi    r31, r3, 0
/* 0008E0 80005E80 41820058 */  beq     lbl_80005ED8
/* 0008E4 80005E84 40800018 */  bge     lbl_80005E9C
/* 0008E8 80005E88 2C040002 */  cmpwi   r4, 2
/* 0008EC 80005E8C 4080001C */  bge     lbl_80005EA8
/* 0008F0 80005E90 2C040000 */  cmpwi   r4, 0
/* 0008F4 80005E94 4080006C */  bge     lbl_80005F00
/* 0008F8 80005E98 48000060 */  b       lbl_80005EF8
lbl_80005E9C:
/* 0008FC 80005E9C 2C040005 */  cmpwi   r4, 5
/* 000900 80005EA0 40800058 */  bge     lbl_80005EF8
/* 000904 80005EA4 4800005C */  b       lbl_80005F00
lbl_80005EA8:
/* 000908 80005EA8 38000000 */  li      r0, 0
/* 00090C 80005EAC 901F0010 */  stw     r0, 0x10(r31)
/* 000910 80005EB0 3C803000 */  lis     r4, 0x3000
/* 000914 80005EB4 387F0008 */  addi    r3, r31, 8
/* 000918 80005EB8 901F0014 */  stw     r0, 0x14(r31)
/* 00091C 80005EBC 38841024 */  addi    r4, r4, 0x1024
/* 000920 80005EC0 901F0004 */  stw     r0, 4(r31)
/* 000924 80005EC4 480012F1 */  bl      xlHeapTake
/* 000928 80005EC8 2C030000 */  cmpwi   r3, 0
/* 00092C 80005ECC 40820034 */  bne     lbl_80005F00
/* 000930 80005ED0 38600000 */  li      r3, 0
/* 000934 80005ED4 48000030 */  b       lbl_80005F04
lbl_80005ED8:
/* 000938 80005ED8 387F001C */  addi    r3, r31, 0x1c
/* 00093C 80005EDC 480ACC21 */  bl      DVDClose
/* 000940 80005EE0 387F0008 */  addi    r3, r31, 8
/* 000944 80005EE4 480011B5 */  bl      xlHeapFree
/* 000948 80005EE8 2C030000 */  cmpwi   r3, 0
/* 00094C 80005EEC 40820014 */  bne     lbl_80005F00
/* 000950 80005EF0 38600000 */  li      r3, 0
/* 000954 80005EF4 48000010 */  b       lbl_80005F04
lbl_80005EF8:
/* 000958 80005EF8 38600000 */  li      r3, 0
/* 00095C 80005EFC 48000008 */  b       lbl_80005F04
lbl_80005F00:
/* 000960 80005F00 38600001 */  li      r3, 1
lbl_80005F04:
/* 000964 80005F04 80010024 */  lwz     r0, 0x24(r1)
/* 000968 80005F08 83E1001C */  lwz     r31, 0x1c(r1)
/* 00096C 80005F0C 38210020 */  addi    r1, r1, 0x20
/* 000970 80005F10 7C0803A6 */  mtlr    r0
/* 000974 80005F14 4E800020 */  blr     

glabel xlFileSetPosition
/* 000978 80005F18 2C040000 */  cmpwi   r4, 0
/* 00097C 80005F1C 4180001C */  blt     lbl_80005F38
/* 000980 80005F20 80030010 */  lwz     r0, 0x10(r3)
/* 000984 80005F24 7C040000 */  cmpw    r4, r0
/* 000988 80005F28 40800010 */  bge     lbl_80005F38
/* 00098C 80005F2C 90830014 */  stw     r4, 0x14(r3)
/* 000990 80005F30 38600001 */  li      r3, 1
/* 000994 80005F34 4E800020 */  blr     
lbl_80005F38:
/* 000998 80005F38 38600000 */  li      r3, 0
/* 00099C 80005F3C 4E800020 */  blr     

glabel xlFileGet
/* 0009A0 80005F40 7C0802A6 */  mflr    r0
/* 0009A4 80005F44 90010004 */  stw     r0, 4(r1)
/* 0009A8 80005F48 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0009AC 80005F4C BF61001C */  stmw    r27, 0x1c(r1)
/* 0009B0 80005F50 7C7B1B78 */  mr      r27, r3
/* 0009B4 80005F54 7CBD2B78 */  mr      r29, r5
/* 0009B8 80005F58 3B840000 */  addi    r28, r4, 0
/* 0009BC 80005F5C 80630014 */  lwz     r3, 0x14(r3)
/* 0009C0 80005F60 80BB0010 */  lwz     r5, 0x10(r27)
/* 0009C4 80005F64 7C03EA14 */  add     r0, r3, r29
/* 0009C8 80005F68 7C002800 */  cmpw    r0, r5
/* 0009CC 80005F6C 40810008 */  ble     lbl_80005F74
/* 0009D0 80005F70 7FA32850 */  subf    r29, r3, r5
lbl_80005F74:
/* 0009D4 80005F74 2C1D0000 */  cmpwi   r29, 0
/* 0009D8 80005F78 408200AC */  bne     lbl_80006024
/* 0009DC 80005F7C 3800FFFF */  li      r0, -1
/* 0009E0 80005F80 981C0000 */  stb     r0, 0(r28)
/* 0009E4 80005F84 38600000 */  li      r3, 0
/* 0009E8 80005F88 480000A8 */  b       lbl_80006030
/* 0009EC 80005F8C 48000098 */  b       lbl_80006024
lbl_80005F90:
/* 0009F0 80005F90 3BDD0000 */  addi    r30, r29, 0
/* 0009F4 80005F94 2C1E1000 */  cmpwi   r30, 0x1000
/* 0009F8 80005F98 40810008 */  ble     lbl_80005FA0
/* 0009FC 80005F9C 3BC01000 */  li      r30, 0x1000
lbl_80005FA0:
/* 000A00 80005FA0 807B0014 */  lwz     r3, 0x14(r27)
/* 000A04 80005FA4 818D88C4 */  lwz     r12, gpfRead-_SDA_BASE_(r13)
/* 000A08 80005FA8 547F07BE */  clrlwi  r31, r3, 0x1e
/* 000A0C 80005FAC 381F001F */  addi    r0, r31, 0x1f
/* 000A10 80005FB0 7C1E0214 */  add     r0, r30, r0
/* 000A14 80005FB4 280C0000 */  cmplwi  r12, 0
/* 000A18 80005FB8 5466003A */  rlwinm  r6, r3, 0, 0, 0x1d
/* 000A1C 80005FBC 54050034 */  rlwinm  r5, r0, 0, 0, 0x1a
/* 000A20 80005FC0 4182001C */  beq     lbl_80005FDC
/* 000A24 80005FC4 807B0004 */  lwz     r3, 4(r27)
/* 000A28 80005FC8 7D8803A6 */  mtlr    r12
/* 000A2C 80005FCC 809B0008 */  lwz     r4, 8(r27)
/* 000A30 80005FD0 38E00000 */  li      r7, 0
/* 000A34 80005FD4 4E800021 */  blrl    
/* 000A38 80005FD8 48000014 */  b       lbl_80005FEC
lbl_80005FDC:
/* 000A3C 80005FDC 807B0004 */  lwz     r3, 4(r27)
/* 000A40 80005FE0 38E00002 */  li      r7, 2
/* 000A44 80005FE4 809B0008 */  lwz     r4, 8(r27)
/* 000A48 80005FE8 480ACE4D */  bl      DVDReadPrio
lbl_80005FEC:
/* 000A4C 80005FEC 801B0008 */  lwz     r0, 8(r27)
/* 000A50 80005FF0 387C0000 */  addi    r3, r28, 0
/* 000A54 80005FF4 38BE0000 */  addi    r5, r30, 0
/* 000A58 80005FF8 7C80FA14 */  add     r4, r0, r31
/* 000A5C 80005FFC 48000AF5 */  bl      xlHeapCopy
/* 000A60 80006000 2C030000 */  cmpwi   r3, 0
/* 000A64 80006004 4082000C */  bne     lbl_80006010
/* 000A68 80006008 38600000 */  li      r3, 0
/* 000A6C 8000600C 48000024 */  b       lbl_80006030
lbl_80006010:
/* 000A70 80006010 801B0014 */  lwz     r0, 0x14(r27)
/* 000A74 80006014 7F9CF214 */  add     r28, r28, r30
/* 000A78 80006018 7FBEE850 */  subf    r29, r30, r29
/* 000A7C 8000601C 7C00F214 */  add     r0, r0, r30
/* 000A80 80006020 901B0014 */  stw     r0, 0x14(r27)
lbl_80006024:
/* 000A84 80006024 2C1D0000 */  cmpwi   r29, 0
/* 000A88 80006028 4082FF68 */  bne     lbl_80005F90
/* 000A8C 8000602C 38600001 */  li      r3, 1
lbl_80006030:
/* 000A90 80006030 BB61001C */  lmw     r27, 0x1c(r1)
/* 000A94 80006034 80010034 */  lwz     r0, 0x34(r1)
/* 000A98 80006038 38210030 */  addi    r1, r1, 0x30
/* 000A9C 8000603C 7C0803A6 */  mtlr    r0
/* 000AA0 80006040 4E800020 */  blr     

glabel xlFileClose
/* 000AA4 80006044 7C0802A6 */  mflr    r0
/* 000AA8 80006048 90010004 */  stw     r0, 4(r1)
/* 000AAC 8000604C 9421FFF8 */  stwu    r1, -8(r1)
/* 000AB0 80006050 48001D3D */  bl      xlObjectFree
/* 000AB4 80006054 2C030000 */  cmpwi   r3, 0
/* 000AB8 80006058 4082000C */  bne     lbl_80006064
/* 000ABC 8000605C 38600000 */  li      r3, 0
/* 000AC0 80006060 48000008 */  b       lbl_80006068
lbl_80006064:
/* 000AC4 80006064 38600001 */  li      r3, 1
lbl_80006068:
/* 000AC8 80006068 8001000C */  lwz     r0, 0xc(r1)
/* 000ACC 8000606C 38210008 */  addi    r1, r1, 8
/* 000AD0 80006070 7C0803A6 */  mtlr    r0
/* 000AD4 80006074 4E800020 */  blr     

glabel xlFileOpen
/* 000AD8 80006078 7C0802A6 */  mflr    r0
/* 000ADC 8000607C 3CC0800E */  lis     r6, gTypeFile@ha
/* 000AE0 80006080 90010004 */  stw     r0, 4(r1)
/* 000AE4 80006084 3806B7E0 */  addi    r0, r6, gTypeFile@l
/* 000AE8 80006088 9421FFD8 */  stwu    r1, -0x28(r1)
/* 000AEC 8000608C 93E10024 */  stw     r31, 0x24(r1)
/* 000AF0 80006090 3BE50000 */  addi    r31, r5, 0
/* 000AF4 80006094 7C050378 */  mr      r5, r0
/* 000AF8 80006098 93C10020 */  stw     r30, 0x20(r1)
/* 000AFC 8000609C 3BC40000 */  addi    r30, r4, 0
/* 000B00 800060A0 38800000 */  li      r4, 0
/* 000B04 800060A4 93A1001C */  stw     r29, 0x1c(r1)
/* 000B08 800060A8 3BA30000 */  addi    r29, r3, 0
/* 000B0C 800060AC 48001D79 */  bl      xlObjectMake
/* 000B10 800060B0 2C030000 */  cmpwi   r3, 0
/* 000B14 800060B4 4082000C */  bne     lbl_800060C0
/* 000B18 800060B8 38600000 */  li      r3, 0
/* 000B1C 800060BC 48000074 */  b       lbl_80006130
lbl_800060C0:
/* 000B20 800060C0 818D88C0 */  lwz     r12, gpfOpen-_SDA_BASE_(r13)
/* 000B24 800060C4 280C0000 */  cmplwi  r12, 0
/* 000B28 800060C8 4182001C */  beq     lbl_800060E4
/* 000B2C 800060CC 809D0000 */  lwz     r4, 0(r29)
/* 000B30 800060D0 7D8803A6 */  mtlr    r12
/* 000B34 800060D4 387F0000 */  addi    r3, r31, 0
/* 000B38 800060D8 3884001C */  addi    r4, r4, 0x1c
/* 000B3C 800060DC 4E800021 */  blrl    
/* 000B40 800060E0 48000014 */  b       lbl_800060F4
lbl_800060E4:
/* 000B44 800060E4 809D0000 */  lwz     r4, 0(r29)
/* 000B48 800060E8 387F0000 */  addi    r3, r31, 0
/* 000B4C 800060EC 3884001C */  addi    r4, r4, 0x1c
/* 000B50 800060F0 480AC945 */  bl      DVDOpen
lbl_800060F4:
/* 000B54 800060F4 2C030000 */  cmpwi   r3, 0
/* 000B58 800060F8 4182002C */  beq     lbl_80006124
/* 000B5C 800060FC 809D0000 */  lwz     r4, 0(r29)
/* 000B60 80006100 38600001 */  li      r3, 1
/* 000B64 80006104 93C40018 */  stw     r30, 0x18(r4)
/* 000B68 80006108 809D0000 */  lwz     r4, 0(r29)
/* 000B6C 8000610C 80040050 */  lwz     r0, 0x50(r4)
/* 000B70 80006110 90040010 */  stw     r0, 0x10(r4)
/* 000B74 80006114 809D0000 */  lwz     r4, 0(r29)
/* 000B78 80006118 3804001C */  addi    r0, r4, 0x1c
/* 000B7C 8000611C 90040004 */  stw     r0, 4(r4)
/* 000B80 80006120 48000010 */  b       lbl_80006130
lbl_80006124:
/* 000B84 80006124 7FA3EB78 */  mr      r3, r29
/* 000B88 80006128 48001C65 */  bl      xlObjectFree
/* 000B8C 8000612C 38600000 */  li      r3, 0
lbl_80006130:
/* 000B90 80006130 8001002C */  lwz     r0, 0x2c(r1)
/* 000B94 80006134 83E10024 */  lwz     r31, 0x24(r1)
/* 000B98 80006138 83C10020 */  lwz     r30, 0x20(r1)
/* 000B9C 8000613C 7C0803A6 */  mtlr    r0
/* 000BA0 80006140 83A1001C */  lwz     r29, 0x1c(r1)
/* 000BA4 80006144 38210028 */  addi    r1, r1, 0x28
/* 000BA8 80006148 4E800020 */  blr     

glabel xlFileGetSize
/* 000BAC 8000614C 7C0802A6 */  mflr    r0
/* 000BB0 80006150 3CA0800E */  lis     r5, gTypeFile@ha
/* 000BB4 80006154 90010004 */  stw     r0, 4(r1)
/* 000BB8 80006158 38A5B7E0 */  addi    r5, r5, gTypeFile@l
/* 000BBC 8000615C 9421FFE0 */  stwu    r1, -0x20(r1)
/* 000BC0 80006160 93E1001C */  stw     r31, 0x1c(r1)
/* 000BC4 80006164 3BE30000 */  addi    r31, r3, 0
/* 000BC8 80006168 38610010 */  addi    r3, r1, 0x10
/* 000BCC 8000616C 93C10018 */  stw     r30, 0x18(r1)
/* 000BD0 80006170 3BC40000 */  addi    r30, r4, 0
/* 000BD4 80006174 38800000 */  li      r4, 0
/* 000BD8 80006178 48001CAD */  bl      xlObjectMake
/* 000BDC 8000617C 2C030000 */  cmpwi   r3, 0
/* 000BE0 80006180 4082000C */  bne     lbl_8000618C
/* 000BE4 80006184 38800000 */  li      r4, 0
/* 000BE8 80006188 48000074 */  b       lbl_800061FC
lbl_8000618C:
/* 000BEC 8000618C 818D88C0 */  lwz     r12, gpfOpen-_SDA_BASE_(r13)
/* 000BF0 80006190 280C0000 */  cmplwi  r12, 0
/* 000BF4 80006194 4182001C */  beq     lbl_800061B0
/* 000BF8 80006198 80810010 */  lwz     r4, 0x10(r1)
/* 000BFC 8000619C 7D8803A6 */  mtlr    r12
/* 000C00 800061A0 387E0000 */  addi    r3, r30, 0
/* 000C04 800061A4 3884001C */  addi    r4, r4, 0x1c
/* 000C08 800061A8 4E800021 */  blrl    
/* 000C0C 800061AC 48000014 */  b       lbl_800061C0
lbl_800061B0:
/* 000C10 800061B0 80810010 */  lwz     r4, 0x10(r1)
/* 000C14 800061B4 387E0000 */  addi    r3, r30, 0
/* 000C18 800061B8 3884001C */  addi    r4, r4, 0x1c
/* 000C1C 800061BC 480AC879 */  bl      DVDOpen
lbl_800061C0:
/* 000C20 800061C0 2C030000 */  cmpwi   r3, 0
/* 000C24 800061C4 4182002C */  beq     lbl_800061F0
/* 000C28 800061C8 80610010 */  lwz     r3, 0x10(r1)
/* 000C2C 800061CC 38800001 */  li      r4, 1
/* 000C30 800061D0 90830018 */  stw     r4, 0x18(r3)
/* 000C34 800061D4 80610010 */  lwz     r3, 0x10(r1)
/* 000C38 800061D8 80030050 */  lwz     r0, 0x50(r3)
/* 000C3C 800061DC 90030010 */  stw     r0, 0x10(r3)
/* 000C40 800061E0 80610010 */  lwz     r3, 0x10(r1)
/* 000C44 800061E4 3803001C */  addi    r0, r3, 0x1c
/* 000C48 800061E8 90030004 */  stw     r0, 4(r3)
/* 000C4C 800061EC 48000010 */  b       lbl_800061FC
lbl_800061F0:
/* 000C50 800061F0 38610010 */  addi    r3, r1, 0x10
/* 000C54 800061F4 48001B99 */  bl      xlObjectFree
/* 000C58 800061F8 38800000 */  li      r4, 0
lbl_800061FC:
/* 000C5C 800061FC 2C040000 */  cmpwi   r4, 0
/* 000C60 80006200 4182004C */  beq     lbl_8000624C
/* 000C64 80006204 281F0000 */  cmplwi  r31, 0
/* 000C68 80006208 41820010 */  beq     lbl_80006218
/* 000C6C 8000620C 80610010 */  lwz     r3, 0x10(r1)
/* 000C70 80006210 80030010 */  lwz     r0, 0x10(r3)
/* 000C74 80006214 901F0000 */  stw     r0, 0(r31)
lbl_80006218:
/* 000C78 80006218 38610010 */  addi    r3, r1, 0x10
/* 000C7C 8000621C 48001B71 */  bl      xlObjectFree
/* 000C80 80006220 2C030000 */  cmpwi   r3, 0
/* 000C84 80006224 4082000C */  bne     lbl_80006230
/* 000C88 80006228 38000000 */  li      r0, 0
/* 000C8C 8000622C 48000008 */  b       lbl_80006234
lbl_80006230:
/* 000C90 80006230 38000001 */  li      r0, 1
lbl_80006234:
/* 000C94 80006234 2C000000 */  cmpwi   r0, 0
/* 000C98 80006238 4082000C */  bne     lbl_80006244
/* 000C9C 8000623C 38600000 */  li      r3, 0
/* 000CA0 80006240 48000010 */  b       lbl_80006250
lbl_80006244:
/* 000CA4 80006244 38600001 */  li      r3, 1
/* 000CA8 80006248 48000008 */  b       lbl_80006250
lbl_8000624C:
/* 000CAC 8000624C 38600000 */  li      r3, 0
lbl_80006250:
/* 000CB0 80006250 80010024 */  lwz     r0, 0x24(r1)
/* 000CB4 80006254 83E1001C */  lwz     r31, 0x1c(r1)
/* 000CB8 80006258 83C10018 */  lwz     r30, 0x18(r1)
/* 000CBC 8000625C 7C0803A6 */  mtlr    r0
/* 000CC0 80006260 38210020 */  addi    r1, r1, 0x20
/* 000CC4 80006264 4E800020 */  blr     

glabel xlFileSetRead
/* 000CC8 80006268 906D88C4 */  stw     r3, gpfRead-_SDA_BASE_(r13)
/* 000CCC 8000626C 38600001 */  li      r3, 1
/* 000CD0 80006270 4E800020 */  blr     

glabel xlFileSetOpen
/* 000CD4 80006274 906D88C0 */  stw     r3, gpfOpen-_SDA_BASE_(r13)
/* 000CD8 80006278 38600001 */  li      r3, 1
/* 000CDC 8000627C 4E800020 */  blr     

.section .data, "wa"

.balign 8

/* 000D8860 800DB7E0 0010 */
glabel gTypeFile
    .long D_80134CE0, 0x00000058, 0x00000000, xlFileEvent

.section .sdata, "wa"

.balign 8

/* 000F0F60 80134CE0 0005 */
D_80134CE0:
    .asciz "FILE"
    .balign 4

.section .sbss, "wa"

.balign 8

/* 000F1820 801355A0 0004 */
gpfOpen:
    .skip 4

/* 000F1824 801355A4 0004 */
gpfRead:
    .skip 4
