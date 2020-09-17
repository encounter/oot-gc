# mips.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel mipsEvent
/* 087CA8 8008D248 7C0802A6 */  mflr    r0
/* 087CAC 8008D24C 2C040003 */  cmpwi   r4, 3
/* 087CB0 8008D250 90010004 */  stw     r0, 4(r1)
/* 087CB4 8008D254 9421FFE0 */  stwu    r1, -0x20(r1)
/* 087CB8 8008D258 93E1001C */  stw     r31, 0x1c(r1)
/* 087CBC 8008D25C 3BE50000 */  addi    r31, r5, 0
/* 087CC0 8008D260 93C10018 */  stw     r30, 0x18(r1)
/* 087CC4 8008D264 3BC30000 */  addi    r30, r3, 0
/* 087CC8 8008D268 418200D4 */  beq     lbl_8008D33C
/* 087CCC 8008D26C 40800018 */  bge     lbl_8008D284
/* 087CD0 8008D270 2C040002 */  cmpwi   r4, 2
/* 087CD4 8008D274 40800028 */  bge     lbl_8008D29C
/* 087CD8 8008D278 2C040000 */  cmpwi   r4, 0
/* 087CDC 8008D27C 408000C0 */  bge     lbl_8008D33C
/* 087CE0 8008D280 480000B4 */  b       lbl_8008D334
lbl_8008D284:
/* 087CE4 8008D284 2C041003 */  cmpwi   r4, 0x1003
/* 087CE8 8008D288 418200B4 */  beq     lbl_8008D33C
/* 087CEC 8008D28C 408000A8 */  bge     lbl_8008D334
/* 087CF0 8008D290 2C041002 */  cmpwi   r4, 0x1002
/* 087CF4 8008D294 40800020 */  bge     lbl_8008D2B4
/* 087CF8 8008D298 4800009C */  b       lbl_8008D334
lbl_8008D29C:
/* 087CFC 8008D29C 38000000 */  li      r0, 0
/* 087D00 8008D2A0 901E0004 */  stw     r0, 4(r30)
/* 087D04 8008D2A4 901E0000 */  stw     r0, 0(r30)
/* 087D08 8008D2A8 901E000C */  stw     r0, 0xc(r30)
/* 087D0C 8008D2AC 93FE0008 */  stw     r31, 8(r30)
/* 087D10 8008D2B0 4800008C */  b       lbl_8008D33C
lbl_8008D2B4:
/* 087D14 8008D2B4 807E0008 */  lwz     r3, 8(r30)
/* 087D18 8008D2B8 3CA08009 */  lis     r5, mipsPut8@ha
/* 087D1C 8008D2BC 3CC08009 */  lis     r6, mipsPut16@ha
/* 087D20 8008D2C0 3CE08009 */  lis     r7, mipsPut32@ha
/* 087D24 8008D2C4 80630024 */  lwz     r3, 0x24(r3)
/* 087D28 8008D2C8 3C808009 */  lis     r4, mipsPut64@ha
/* 087D2C 8008D2CC 3904D3D8 */  addi    r8, r4, mipsPut64@l
/* 087D30 8008D2D0 38A5D5F0 */  addi    r5, r5, mipsPut8@l
/* 087D34 8008D2D4 38C6D5E8 */  addi    r6, r6, mipsPut16@l
/* 087D38 8008D2D8 38E7D3E0 */  addi    r7, r7, mipsPut32@l
/* 087D3C 8008D2DC 389F0000 */  addi    r4, r31, 0
/* 087D40 8008D2E0 4BFA7D59 */  bl      cpuSetDevicePut
/* 087D44 8008D2E4 2C030000 */  cmpwi   r3, 0
/* 087D48 8008D2E8 4082000C */  bne     lbl_8008D2F4
/* 087D4C 8008D2EC 38600000 */  li      r3, 0
/* 087D50 8008D2F0 48000050 */  b       lbl_8008D340
lbl_8008D2F4:
/* 087D54 8008D2F4 807E0008 */  lwz     r3, 8(r30)
/* 087D58 8008D2F8 3CA08009 */  lis     r5, mipsGet8@ha
/* 087D5C 8008D2FC 3CC08009 */  lis     r6, mipsGet16@ha
/* 087D60 8008D300 3CE08009 */  lis     r7, mipsGet32@ha
/* 087D64 8008D304 80630024 */  lwz     r3, 0x24(r3)
/* 087D68 8008D308 3C808009 */  lis     r4, mipsGet64@ha
/* 087D6C 8008D30C 3904D358 */  addi    r8, r4, mipsGet64@l
/* 087D70 8008D310 38A5D3D0 */  addi    r5, r5, mipsGet8@l
/* 087D74 8008D314 38C6D3C8 */  addi    r6, r6, mipsGet16@l
/* 087D78 8008D318 38E7D360 */  addi    r7, r7, mipsGet32@l
/* 087D7C 8008D31C 389F0000 */  addi    r4, r31, 0
/* 087D80 8008D320 4BFA7D31 */  bl      cpuSetDeviceGet
/* 087D84 8008D324 2C030000 */  cmpwi   r3, 0
/* 087D88 8008D328 40820014 */  bne     lbl_8008D33C
/* 087D8C 8008D32C 38600000 */  li      r3, 0
/* 087D90 8008D330 48000010 */  b       lbl_8008D340
lbl_8008D334:
/* 087D94 8008D334 38600000 */  li      r3, 0
/* 087D98 8008D338 48000008 */  b       lbl_8008D340
lbl_8008D33C:
/* 087D9C 8008D33C 38600001 */  li      r3, 1
lbl_8008D340:
/* 087DA0 8008D340 80010024 */  lwz     r0, 0x24(r1)
/* 087DA4 8008D344 83E1001C */  lwz     r31, 0x1c(r1)
/* 087DA8 8008D348 83C10018 */  lwz     r30, 0x18(r1)
/* 087DAC 8008D34C 7C0803A6 */  mtlr    r0
/* 087DB0 8008D350 38210020 */  addi    r1, r1, 0x20
/* 087DB4 8008D354 4E800020 */  blr     

glabel mipsGet64
/* 087DB8 8008D358 38600000 */  li      r3, 0
/* 087DBC 8008D35C 4E800020 */  blr     

glabel mipsGet32
/* 087DC0 8008D360 5480073E */  clrlwi  r0, r4, 0x1c
/* 087DC4 8008D364 2800000C */  cmplwi  r0, 0xc
/* 087DC8 8008D368 41810050 */  bgt     lbl_8008D3B8
/* 087DCC 8008D36C 3C80800F */  lis     r4, jtbl_800EE6E0@ha
/* 087DD0 8008D370 3884E6E0 */  addi    r4, r4, jtbl_800EE6E0@l
/* 087DD4 8008D374 5400103A */  slwi    r0, r0, 2
/* 087DD8 8008D378 7C04002E */  lwzx    r0, r4, r0
/* 087DDC 8008D37C 7C0903A6 */  mtctr   r0
/* 087DE0 8008D380 4E800420 */  bctr    
glabel lbl_8008D384
/* 087DE4 8008D384 80030004 */  lwz     r0, 4(r3)
/* 087DE8 8008D388 90050000 */  stw     r0, 0(r5)
/* 087DEC 8008D38C 48000034 */  b       lbl_8008D3C0
glabel lbl_8008D390
/* 087DF0 8008D390 3C600202 */  lis     r3, 0x202
/* 087DF4 8008D394 38030102 */  addi    r0, r3, 0x102
/* 087DF8 8008D398 90050000 */  stw     r0, 0(r5)
/* 087DFC 8008D39C 48000024 */  b       lbl_8008D3C0
glabel lbl_8008D3A0
/* 087E00 8008D3A0 8003000C */  lwz     r0, 0xc(r3)
/* 087E04 8008D3A4 90050000 */  stw     r0, 0(r5)
/* 087E08 8008D3A8 48000018 */  b       lbl_8008D3C0
glabel lbl_8008D3AC
/* 087E0C 8008D3AC 80030000 */  lwz     r0, 0(r3)
/* 087E10 8008D3B0 90050000 */  stw     r0, 0(r5)
/* 087E14 8008D3B4 4800000C */  b       lbl_8008D3C0
glabel lbl_8008D3B8
/* 087E18 8008D3B8 38600000 */  li      r3, 0
/* 087E1C 8008D3BC 4E800020 */  blr     
lbl_8008D3C0:
/* 087E20 8008D3C0 38600001 */  li      r3, 1
/* 087E24 8008D3C4 4E800020 */  blr     

glabel mipsGet16
/* 087E28 8008D3C8 38600000 */  li      r3, 0
/* 087E2C 8008D3CC 4E800020 */  blr     

glabel mipsGet8
/* 087E30 8008D3D0 38600000 */  li      r3, 0
/* 087E34 8008D3D4 4E800020 */  blr     

glabel mipsPut64
/* 087E38 8008D3D8 38600000 */  li      r3, 0
/* 087E3C 8008D3DC 4E800020 */  blr     

glabel mipsPut32
/* 087E40 8008D3E0 7C0802A6 */  mflr    r0
/* 087E44 8008D3E4 90010004 */  stw     r0, 4(r1)
/* 087E48 8008D3E8 5480073E */  clrlwi  r0, r4, 0x1c
/* 087E4C 8008D3EC 2800000C */  cmplwi  r0, 0xc
/* 087E50 8008D3F0 9421FFE0 */  stwu    r1, -0x20(r1)
/* 087E54 8008D3F4 93E1001C */  stw     r31, 0x1c(r1)
/* 087E58 8008D3F8 93C10018 */  stw     r30, 0x18(r1)
/* 087E5C 8008D3FC 3BC30000 */  addi    r30, r3, 0
/* 087E60 8008D400 418101C4 */  bgt     lbl_8008D5C4
/* 087E64 8008D404 3C60800F */  lis     r3, jtbl_800EE714@ha
/* 087E68 8008D408 3863E714 */  addi    r3, r3, jtbl_800EE714@l
/* 087E6C 8008D40C 5400103A */  slwi    r0, r0, 2
/* 087E70 8008D410 7C03002E */  lwzx    r0, r3, r0
/* 087E74 8008D414 7C0903A6 */  mtctr   r0
/* 087E78 8008D418 4E800420 */  bctr    
glabel lbl_8008D41C
/* 087E7C 8008D41C 80650000 */  lwz     r3, 0(r5)
/* 087E80 8008D420 809E0004 */  lwz     r4, 4(r30)
/* 087E84 8008D424 547F053E */  clrlwi  r31, r3, 0x14
/* 087E88 8008D428 54600631 */  rlwinm. r0, r3, 0, 0x18, 0x18
/* 087E8C 8008D42C 5463067E */  clrlwi  r3, r3, 0x19
/* 087E90 8008D430 50830030 */  rlwimi  r3, r4, 0, 0, 0x18
/* 087E94 8008D434 907E0004 */  stw     r3, 4(r30)
/* 087E98 8008D438 41820010 */  beq     lbl_8008D448
/* 087E9C 8008D43C 801E0004 */  lwz     r0, 4(r30)
/* 087EA0 8008D440 5400066E */  rlwinm  r0, r0, 0, 0x19, 0x17
/* 087EA4 8008D444 901E0004 */  stw     r0, 4(r30)
lbl_8008D448:
/* 087EA8 8008D448 57E005EF */  rlwinm. r0, r31, 0, 0x17, 0x17
/* 087EAC 8008D44C 41820010 */  beq     lbl_8008D45C
/* 087EB0 8008D450 801E0004 */  lwz     r0, 4(r30)
/* 087EB4 8008D454 60000080 */  ori     r0, r0, 0x80
/* 087EB8 8008D458 901E0004 */  stw     r0, 4(r30)
lbl_8008D45C:
/* 087EBC 8008D45C 57E005AD */  rlwinm. r0, r31, 0, 0x16, 0x16
/* 087EC0 8008D460 41820010 */  beq     lbl_8008D470
/* 087EC4 8008D464 801E0004 */  lwz     r0, 4(r30)
/* 087EC8 8008D468 5400062C */  rlwinm  r0, r0, 0, 0x18, 0x16
/* 087ECC 8008D46C 901E0004 */  stw     r0, 4(r30)
lbl_8008D470:
/* 087ED0 8008D470 57E0056B */  rlwinm. r0, r31, 0, 0x15, 0x15
/* 087ED4 8008D474 41820010 */  beq     lbl_8008D484
/* 087ED8 8008D478 801E0004 */  lwz     r0, 4(r30)
/* 087EDC 8008D47C 60000100 */  ori     r0, r0, 0x100
/* 087EE0 8008D480 901E0004 */  stw     r0, 4(r30)
lbl_8008D484:
/* 087EE4 8008D484 57E00529 */  rlwinm. r0, r31, 0, 0x14, 0x14
/* 087EE8 8008D488 41820014 */  beq     lbl_8008D49C
/* 087EEC 8008D48C 807E0008 */  lwz     r3, 8(r30)
/* 087EF0 8008D490 38801001 */  li      r4, 0x1001
/* 087EF4 8008D494 38A0000A */  li      r5, 0xa
/* 087EF8 8008D498 4BF7A7D5 */  bl      xlObjectEvent
lbl_8008D49C:
/* 087EFC 8008D49C 57E004E7 */  rlwinm. r0, r31, 0, 0x13, 0x13
/* 087F00 8008D4A0 41820010 */  beq     lbl_8008D4B0
/* 087F04 8008D4A4 801E0004 */  lwz     r0, 4(r30)
/* 087F08 8008D4A8 540005EA */  rlwinm  r0, r0, 0, 0x17, 0x15
/* 087F0C 8008D4AC 901E0004 */  stw     r0, 4(r30)
lbl_8008D4B0:
/* 087F10 8008D4B0 57E004A5 */  rlwinm. r0, r31, 0, 0x12, 0x12
/* 087F14 8008D4B4 41820118 */  beq     lbl_8008D5CC
/* 087F18 8008D4B8 801E0004 */  lwz     r0, 4(r30)
/* 087F1C 8008D4BC 60000200 */  ori     r0, r0, 0x200
/* 087F20 8008D4C0 901E0004 */  stw     r0, 4(r30)
/* 087F24 8008D4C4 48000108 */  b       lbl_8008D5CC
glabel lbl_8008D4C8
/* 087F28 8008D4C8 80650000 */  lwz     r3, 0(r5)
/* 087F2C 8008D4CC 546007FF */  clrlwi. r0, r3, 0x1f
/* 087F30 8008D4D0 5460053E */  clrlwi  r0, r3, 0x14
/* 087F34 8008D4D4 41820010 */  beq     lbl_8008D4E4
/* 087F38 8008D4D8 807E0000 */  lwz     r3, 0(r30)
/* 087F3C 8008D4DC 5463003C */  rlwinm  r3, r3, 0, 0, 0x1e
/* 087F40 8008D4E0 907E0000 */  stw     r3, 0(r30)
lbl_8008D4E4:
/* 087F44 8008D4E4 540307BD */  rlwinm. r3, r0, 0, 0x1e, 0x1e
/* 087F48 8008D4E8 41820010 */  beq     lbl_8008D4F8
/* 087F4C 8008D4EC 807E0000 */  lwz     r3, 0(r30)
/* 087F50 8008D4F0 60630001 */  ori     r3, r3, 1
/* 087F54 8008D4F4 907E0000 */  stw     r3, 0(r30)
lbl_8008D4F8:
/* 087F58 8008D4F8 5403077B */  rlwinm. r3, r0, 0, 0x1d, 0x1d
/* 087F5C 8008D4FC 41820010 */  beq     lbl_8008D50C
/* 087F60 8008D500 807E0000 */  lwz     r3, 0(r30)
/* 087F64 8008D504 546307FA */  rlwinm  r3, r3, 0, 0x1f, 0x1d
/* 087F68 8008D508 907E0000 */  stw     r3, 0(r30)
lbl_8008D50C:
/* 087F6C 8008D50C 54030739 */  rlwinm. r3, r0, 0, 0x1c, 0x1c
/* 087F70 8008D510 41820010 */  beq     lbl_8008D520
/* 087F74 8008D514 807E0000 */  lwz     r3, 0(r30)
/* 087F78 8008D518 60630002 */  ori     r3, r3, 2
/* 087F7C 8008D51C 907E0000 */  stw     r3, 0(r30)
lbl_8008D520:
/* 087F80 8008D520 540306F7 */  rlwinm. r3, r0, 0, 0x1b, 0x1b
/* 087F84 8008D524 41820010 */  beq     lbl_8008D534
/* 087F88 8008D528 807E0000 */  lwz     r3, 0(r30)
/* 087F8C 8008D52C 546307B8 */  rlwinm  r3, r3, 0, 0x1e, 0x1c
/* 087F90 8008D530 907E0000 */  stw     r3, 0(r30)
lbl_8008D534:
/* 087F94 8008D534 540306B5 */  rlwinm. r3, r0, 0, 0x1a, 0x1a
/* 087F98 8008D538 41820010 */  beq     lbl_8008D548
/* 087F9C 8008D53C 807E0000 */  lwz     r3, 0(r30)
/* 087FA0 8008D540 60630004 */  ori     r3, r3, 4
/* 087FA4 8008D544 907E0000 */  stw     r3, 0(r30)
lbl_8008D548:
/* 087FA8 8008D548 54030673 */  rlwinm. r3, r0, 0, 0x19, 0x19
/* 087FAC 8008D54C 41820010 */  beq     lbl_8008D55C
/* 087FB0 8008D550 807E0000 */  lwz     r3, 0(r30)
/* 087FB4 8008D554 54630776 */  rlwinm  r3, r3, 0, 0x1d, 0x1b
/* 087FB8 8008D558 907E0000 */  stw     r3, 0(r30)
lbl_8008D55C:
/* 087FBC 8008D55C 54030631 */  rlwinm. r3, r0, 0, 0x18, 0x18
/* 087FC0 8008D560 41820010 */  beq     lbl_8008D570
/* 087FC4 8008D564 807E0000 */  lwz     r3, 0(r30)
/* 087FC8 8008D568 60630008 */  ori     r3, r3, 8
/* 087FCC 8008D56C 907E0000 */  stw     r3, 0(r30)
lbl_8008D570:
/* 087FD0 8008D570 540305EF */  rlwinm. r3, r0, 0, 0x17, 0x17
/* 087FD4 8008D574 41820010 */  beq     lbl_8008D584
/* 087FD8 8008D578 807E0000 */  lwz     r3, 0(r30)
/* 087FDC 8008D57C 54630734 */  rlwinm  r3, r3, 0, 0x1c, 0x1a
/* 087FE0 8008D580 907E0000 */  stw     r3, 0(r30)
lbl_8008D584:
/* 087FE4 8008D584 540305AD */  rlwinm. r3, r0, 0, 0x16, 0x16
/* 087FE8 8008D588 41820010 */  beq     lbl_8008D598
/* 087FEC 8008D58C 807E0000 */  lwz     r3, 0(r30)
/* 087FF0 8008D590 60630010 */  ori     r3, r3, 0x10
/* 087FF4 8008D594 907E0000 */  stw     r3, 0(r30)
lbl_8008D598:
/* 087FF8 8008D598 5403056B */  rlwinm. r3, r0, 0, 0x15, 0x15
/* 087FFC 8008D59C 41820010 */  beq     lbl_8008D5AC
/* 088000 8008D5A0 807E0000 */  lwz     r3, 0(r30)
/* 088004 8008D5A4 546306F2 */  rlwinm  r3, r3, 0, 0x1b, 0x19
/* 088008 8008D5A8 907E0000 */  stw     r3, 0(r30)
lbl_8008D5AC:
/* 08800C 8008D5AC 54000529 */  rlwinm. r0, r0, 0, 0x14, 0x14
/* 088010 8008D5B0 4182001C */  beq     lbl_8008D5CC
/* 088014 8008D5B4 801E0000 */  lwz     r0, 0(r30)
/* 088018 8008D5B8 60000020 */  ori     r0, r0, 0x20
/* 08801C 8008D5BC 901E0000 */  stw     r0, 0(r30)
/* 088020 8008D5C0 4800000C */  b       lbl_8008D5CC
glabel lbl_8008D5C4
/* 088024 8008D5C4 38600000 */  li      r3, 0
/* 088028 8008D5C8 48000008 */  b       lbl_8008D5D0
glabel lbl_8008D5CC
/* 08802C 8008D5CC 38600001 */  li      r3, 1
lbl_8008D5D0:
/* 088030 8008D5D0 80010024 */  lwz     r0, 0x24(r1)
/* 088034 8008D5D4 83E1001C */  lwz     r31, 0x1c(r1)
/* 088038 8008D5D8 83C10018 */  lwz     r30, 0x18(r1)
/* 08803C 8008D5DC 7C0803A6 */  mtlr    r0
/* 088040 8008D5E0 38210020 */  addi    r1, r1, 0x20
/* 088044 8008D5E4 4E800020 */  blr     

glabel mipsPut16
/* 088048 8008D5E8 38600000 */  li      r3, 0
/* 08804C 8008D5EC 4E800020 */  blr     

glabel mipsPut8
/* 088050 8008D5F0 38600000 */  li      r3, 0
/* 088054 8008D5F4 4E800020 */  blr     

glabel mipsResetInterrupt
/* 088058 8008D5F8 2C040003 */  cmpwi   r4, 3
/* 08805C 8008D5FC 80A3000C */  lwz     r5, 0xc(r3)
/* 088060 8008D600 41820054 */  beq     lbl_8008D654
/* 088064 8008D604 4080001C */  bge     lbl_8008D620
/* 088068 8008D608 2C040001 */  cmpwi   r4, 1
/* 08806C 8008D60C 41820030 */  beq     lbl_8008D63C
/* 088070 8008D610 40800038 */  bge     lbl_8008D648
/* 088074 8008D614 2C040000 */  cmpwi   r4, 0
/* 088078 8008D618 40800018 */  bge     lbl_8008D630
/* 08807C 8008D61C 4800005C */  b       lbl_8008D678
lbl_8008D620:
/* 088080 8008D620 2C040005 */  cmpwi   r4, 5
/* 088084 8008D624 41820048 */  beq     lbl_8008D66C
/* 088088 8008D628 40800050 */  bge     lbl_8008D678
/* 08808C 8008D62C 48000034 */  b       lbl_8008D660
lbl_8008D630:
/* 088090 8008D630 54A0003C */  rlwinm  r0, r5, 0, 0, 0x1e
/* 088094 8008D634 9003000C */  stw     r0, 0xc(r3)
/* 088098 8008D638 48000048 */  b       lbl_8008D680
lbl_8008D63C:
/* 08809C 8008D63C 54A007FA */  rlwinm  r0, r5, 0, 0x1f, 0x1d
/* 0880A0 8008D640 9003000C */  stw     r0, 0xc(r3)
/* 0880A4 8008D644 4800003C */  b       lbl_8008D680
lbl_8008D648:
/* 0880A8 8008D648 54A007B8 */  rlwinm  r0, r5, 0, 0x1e, 0x1c
/* 0880AC 8008D64C 9003000C */  stw     r0, 0xc(r3)
/* 0880B0 8008D650 48000030 */  b       lbl_8008D680
lbl_8008D654:
/* 0880B4 8008D654 54A00776 */  rlwinm  r0, r5, 0, 0x1d, 0x1b
/* 0880B8 8008D658 9003000C */  stw     r0, 0xc(r3)
/* 0880BC 8008D65C 48000024 */  b       lbl_8008D680
lbl_8008D660:
/* 0880C0 8008D660 54A00734 */  rlwinm  r0, r5, 0, 0x1c, 0x1a
/* 0880C4 8008D664 9003000C */  stw     r0, 0xc(r3)
/* 0880C8 8008D668 48000018 */  b       lbl_8008D680
lbl_8008D66C:
/* 0880CC 8008D66C 54A006F2 */  rlwinm  r0, r5, 0, 0x1b, 0x19
/* 0880D0 8008D670 9003000C */  stw     r0, 0xc(r3)
/* 0880D4 8008D674 4800000C */  b       lbl_8008D680
lbl_8008D678:
/* 0880D8 8008D678 38600000 */  li      r3, 0
/* 0880DC 8008D67C 4E800020 */  blr     
lbl_8008D680:
/* 0880E0 8008D680 8003000C */  lwz     r0, 0xc(r3)
/* 0880E4 8008D684 7C050000 */  cmpw    r5, r0
/* 0880E8 8008D688 4182000C */  beq     lbl_8008D694
/* 0880EC 8008D68C 38600001 */  li      r3, 1
/* 0880F0 8008D690 4E800020 */  blr     
lbl_8008D694:
/* 0880F4 8008D694 38600000 */  li      r3, 0
/* 0880F8 8008D698 4E800020 */  blr     

glabel mipsSetInterrupt
/* 0880FC 8008D69C 2C040003 */  cmpwi   r4, 3
/* 088100 8008D6A0 80A3000C */  lwz     r5, 0xc(r3)
/* 088104 8008D6A4 41820078 */  beq     lbl_8008D71C
/* 088108 8008D6A8 4080001C */  bge     lbl_8008D6C4
/* 08810C 8008D6AC 2C040001 */  cmpwi   r4, 1
/* 088110 8008D6B0 4182003C */  beq     lbl_8008D6EC
/* 088114 8008D6B4 40800050 */  bge     lbl_8008D704
/* 088118 8008D6B8 2C040000 */  cmpwi   r4, 0
/* 08811C 8008D6BC 40800018 */  bge     lbl_8008D6D4
/* 088120 8008D6C0 480000A4 */  b       lbl_8008D764
lbl_8008D6C4:
/* 088124 8008D6C4 2C040005 */  cmpwi   r4, 5
/* 088128 8008D6C8 41820084 */  beq     lbl_8008D74C
/* 08812C 8008D6CC 40800098 */  bge     lbl_8008D764
/* 088130 8008D6D0 48000064 */  b       lbl_8008D734
lbl_8008D6D4:
/* 088134 8008D6D4 80030000 */  lwz     r0, 0(r3)
/* 088138 8008D6D8 540007FF */  clrlwi. r0, r0, 0x1f
/* 08813C 8008D6DC 41820090 */  beq     lbl_8008D76C
/* 088140 8008D6E0 60A00001 */  ori     r0, r5, 1
/* 088144 8008D6E4 9003000C */  stw     r0, 0xc(r3)
/* 088148 8008D6E8 48000084 */  b       lbl_8008D76C
lbl_8008D6EC:
/* 08814C 8008D6EC 80030000 */  lwz     r0, 0(r3)
/* 088150 8008D6F0 540007BD */  rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 088154 8008D6F4 41820078 */  beq     lbl_8008D76C
/* 088158 8008D6F8 60A00002 */  ori     r0, r5, 2
/* 08815C 8008D6FC 9003000C */  stw     r0, 0xc(r3)
/* 088160 8008D700 4800006C */  b       lbl_8008D76C
lbl_8008D704:
/* 088164 8008D704 80030000 */  lwz     r0, 0(r3)
/* 088168 8008D708 5400077B */  rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 08816C 8008D70C 41820060 */  beq     lbl_8008D76C
/* 088170 8008D710 60A00004 */  ori     r0, r5, 4
/* 088174 8008D714 9003000C */  stw     r0, 0xc(r3)
/* 088178 8008D718 48000054 */  b       lbl_8008D76C
lbl_8008D71C:
/* 08817C 8008D71C 80030000 */  lwz     r0, 0(r3)
/* 088180 8008D720 54000739 */  rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 088184 8008D724 41820048 */  beq     lbl_8008D76C
/* 088188 8008D728 60A00008 */  ori     r0, r5, 8
/* 08818C 8008D72C 9003000C */  stw     r0, 0xc(r3)
/* 088190 8008D730 4800003C */  b       lbl_8008D76C
lbl_8008D734:
/* 088194 8008D734 80030000 */  lwz     r0, 0(r3)
/* 088198 8008D738 540006F7 */  rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 08819C 8008D73C 41820030 */  beq     lbl_8008D76C
/* 0881A0 8008D740 60A00010 */  ori     r0, r5, 0x10
/* 0881A4 8008D744 9003000C */  stw     r0, 0xc(r3)
/* 0881A8 8008D748 48000024 */  b       lbl_8008D76C
lbl_8008D74C:
/* 0881AC 8008D74C 80030000 */  lwz     r0, 0(r3)
/* 0881B0 8008D750 540006B5 */  rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0881B4 8008D754 41820018 */  beq     lbl_8008D76C
/* 0881B8 8008D758 60A00020 */  ori     r0, r5, 0x20
/* 0881BC 8008D75C 9003000C */  stw     r0, 0xc(r3)
/* 0881C0 8008D760 4800000C */  b       lbl_8008D76C
lbl_8008D764:
/* 0881C4 8008D764 38600000 */  li      r3, 0
/* 0881C8 8008D768 4E800020 */  blr     
lbl_8008D76C:
/* 0881CC 8008D76C 8003000C */  lwz     r0, 0xc(r3)
/* 0881D0 8008D770 7C050000 */  cmpw    r5, r0
/* 0881D4 8008D774 4182000C */  beq     lbl_8008D780
/* 0881D8 8008D778 38600001 */  li      r3, 1
/* 0881DC 8008D77C 4E800020 */  blr     
lbl_8008D780:
/* 0881E0 8008D780 38600000 */  li      r3, 0
/* 0881E4 8008D784 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000EB750 800EE6D0 0010 */
glabel gClassMips
    .long D_801352E8, 0x00000010, 0x00000000, mipsEvent

.balign 4

/* 000EB760 800EE6E0 0034 */
jtbl_800EE6E0:
    .long lbl_8008D384
    .long lbl_8008D3B8
    .long lbl_8008D3B8
    .long lbl_8008D3B8
    .long lbl_8008D390
    .long lbl_8008D3B8
    .long lbl_8008D3B8
    .long lbl_8008D3B8
    .long lbl_8008D3A0
    .long lbl_8008D3B8
    .long lbl_8008D3B8
    .long lbl_8008D3B8
    .long lbl_8008D3AC

.balign 4

/* 000EB794 800EE714 0034 */
jtbl_800EE714:
    .long lbl_8008D41C
    .long lbl_8008D5C4
    .long lbl_8008D5C4
    .long lbl_8008D5C4
    .long lbl_8008D5CC
    .long lbl_8008D5C4
    .long lbl_8008D5C4
    .long lbl_8008D5C4
    .long lbl_8008D5CC
    .long lbl_8008D5C4
    .long lbl_8008D5C4
    .long lbl_8008D5C4
    .long lbl_8008D4C8


.section .sdata, "wa"

.balign 8

/* 000F1568 801352E8 0005 */
D_801352E8:
    .asciz "MIPS"


