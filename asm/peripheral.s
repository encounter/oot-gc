# peripheral.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel peripheralEvent
/* 0921FC 8009779C 7C0802A6 */  mflr    r0
/* 092200 800977A0 2C040003 */  cmpwi   r4, 3
/* 092204 800977A4 90010004 */  stw     r0, 4(r1)
/* 092208 800977A8 9421FFE0 */  stwu    r1, -0x20(r1)
/* 09220C 800977AC 93E1001C */  stw     r31, 0x1c(r1)
/* 092210 800977B0 3BE50000 */  addi    r31, r5, 0
/* 092214 800977B4 93C10018 */  stw     r30, 0x18(r1)
/* 092218 800977B8 3BC30000 */  addi    r30, r3, 0
/* 09221C 800977BC 418200CC */  beq     lbl_80097888
/* 092220 800977C0 40800018 */  bge     lbl_800977D8
/* 092224 800977C4 2C040002 */  cmpwi   r4, 2
/* 092228 800977C8 40800028 */  bge     lbl_800977F0
/* 09222C 800977CC 2C040000 */  cmpwi   r4, 0
/* 092230 800977D0 408000B8 */  bge     lbl_80097888
/* 092234 800977D4 480000AC */  b       lbl_80097880
lbl_800977D8:
/* 092238 800977D8 2C041003 */  cmpwi   r4, 0x1003
/* 09223C 800977DC 418200AC */  beq     lbl_80097888
/* 092240 800977E0 408000A0 */  bge     lbl_80097880
/* 092244 800977E4 2C041002 */  cmpwi   r4, 0x1002
/* 092248 800977E8 40800018 */  bge     lbl_80097800
/* 09224C 800977EC 48000094 */  b       lbl_80097880
lbl_800977F0:
/* 092250 800977F0 38000000 */  li      r0, 0
/* 092254 800977F4 901E0004 */  stw     r0, 4(r30)
/* 092258 800977F8 93FE0000 */  stw     r31, 0(r30)
/* 09225C 800977FC 4800008C */  b       lbl_80097888
lbl_80097800:
/* 092260 80097800 807E0000 */  lwz     r3, 0(r30)
/* 092264 80097804 3CA08009 */  lis     r5, peripheralPut8@ha
/* 092268 80097808 3CC08009 */  lis     r6, peripheralPut16@ha
/* 09226C 8009780C 3CE08009 */  lis     r7, peripheralPut32@ha
/* 092270 80097810 80630024 */  lwz     r3, 0x24(r3)
/* 092274 80097814 3C808009 */  lis     r4, peripheralPut64@ha
/* 092278 80097818 390479BC */  addi    r8, r4, peripheralPut64@l
/* 09227C 8009781C 38A57D50 */  addi    r5, r5, peripheralPut8@l
/* 092280 80097820 38C67D48 */  addi    r6, r6, peripheralPut16@l
/* 092284 80097824 38E779C4 */  addi    r7, r7, peripheralPut32@l
/* 092288 80097828 389F0000 */  addi    r4, r31, 0
/* 09228C 8009782C 4BF9D80D */  bl      cpuSetDevicePut
/* 092290 80097830 2C030000 */  cmpwi   r3, 0
/* 092294 80097834 4082000C */  bne     lbl_80097840
/* 092298 80097838 38600000 */  li      r3, 0
/* 09229C 8009783C 48000050 */  b       lbl_8009788C
lbl_80097840:
/* 0922A0 80097840 807E0000 */  lwz     r3, 0(r30)
/* 0922A4 80097844 3CA08009 */  lis     r5, peripheralGet8@ha
/* 0922A8 80097848 3CC08009 */  lis     r6, peripheralGet16@ha
/* 0922AC 8009784C 3CE08009 */  lis     r7, peripheralGet32@ha
/* 0922B0 80097850 80630024 */  lwz     r3, 0x24(r3)
/* 0922B4 80097854 3C808009 */  lis     r4, peripheralGet64@ha
/* 0922B8 80097858 390478A4 */  addi    r8, r4, peripheralGet64@l
/* 0922BC 8009785C 38A579B4 */  addi    r5, r5, peripheralGet8@l
/* 0922C0 80097860 38C679AC */  addi    r6, r6, peripheralGet16@l
/* 0922C4 80097864 38E778AC */  addi    r7, r7, peripheralGet32@l
/* 0922C8 80097868 389F0000 */  addi    r4, r31, 0
/* 0922CC 8009786C 4BF9D7E5 */  bl      cpuSetDeviceGet
/* 0922D0 80097870 2C030000 */  cmpwi   r3, 0
/* 0922D4 80097874 40820014 */  bne     lbl_80097888
/* 0922D8 80097878 38600000 */  li      r3, 0
/* 0922DC 8009787C 48000010 */  b       lbl_8009788C
lbl_80097880:
/* 0922E0 80097880 38600000 */  li      r3, 0
/* 0922E4 80097884 48000008 */  b       lbl_8009788C
lbl_80097888:
/* 0922E8 80097888 38600001 */  li      r3, 1
lbl_8009788C:
/* 0922EC 8009788C 80010024 */  lwz     r0, 0x24(r1)
/* 0922F0 80097890 83E1001C */  lwz     r31, 0x1c(r1)
/* 0922F4 80097894 83C10018 */  lwz     r30, 0x18(r1)
/* 0922F8 80097898 7C0803A6 */  mtlr    r0
/* 0922FC 8009789C 38210020 */  addi    r1, r1, 0x20
/* 092300 800978A0 4E800020 */  blr     

glabel peripheralGet64
/* 092304 800978A4 38600000 */  li      r3, 0
/* 092308 800978A8 4E800020 */  blr     

glabel peripheralGet32
/* 09230C 800978AC 548006BE */  clrlwi  r0, r4, 0x1a
/* 092310 800978B0 28000030 */  cmplwi  r0, 0x30
/* 092314 800978B4 418100E8 */  bgt     lbl_8009799C
/* 092318 800978B8 3C80800F */  lis     r4, jtbl_800EFFCC@ha
/* 09231C 800978BC 3884FFCC */  addi    r4, r4, jtbl_800EFFCC@l
/* 092320 800978C0 5400103A */  slwi    r0, r0, 2
/* 092324 800978C4 7C04002E */  lwzx    r0, r4, r0
/* 092328 800978C8 7C0903A6 */  mtctr   r0
/* 09232C 800978CC 4E800420 */  bctr    
glabel lbl_800978D0
/* 092330 800978D0 80030028 */  lwz     r0, 0x28(r3)
/* 092334 800978D4 5400023E */  clrlwi  r0, r0, 8
/* 092338 800978D8 90050000 */  stw     r0, 0(r5)
/* 09233C 800978DC 480000C8 */  b       lbl_800979A4
glabel lbl_800978E0
/* 092340 800978E0 8003002C */  lwz     r0, 0x2c(r3)
/* 092344 800978E4 90050000 */  stw     r0, 0(r5)
/* 092348 800978E8 480000BC */  b       lbl_800979A4
glabel lbl_800978EC
/* 09234C 800978EC 80030008 */  lwz     r0, 8(r3)
/* 092350 800978F0 5400023E */  clrlwi  r0, r0, 8
/* 092354 800978F4 90050000 */  stw     r0, 0(r5)
/* 092358 800978F8 480000AC */  b       lbl_800979A4
glabel lbl_800978FC
/* 09235C 800978FC 8003000C */  lwz     r0, 0xc(r3)
/* 092360 80097900 5400023E */  clrlwi  r0, r0, 8
/* 092364 80097904 90050000 */  stw     r0, 0(r5)
/* 092368 80097908 4800009C */  b       lbl_800979A4
glabel lbl_8009790C
/* 09236C 8009790C 80030004 */  lwz     r0, 4(r3)
/* 092370 80097910 5400077E */  clrlwi  r0, r0, 0x1d
/* 092374 80097914 90050000 */  stw     r0, 0(r5)
/* 092378 80097918 4800008C */  b       lbl_800979A4
glabel lbl_8009791C
/* 09237C 8009791C 80030010 */  lwz     r0, 0x10(r3)
/* 092380 80097920 5400063E */  clrlwi  r0, r0, 0x18
/* 092384 80097924 90050000 */  stw     r0, 0(r5)
/* 092388 80097928 4800007C */  b       lbl_800979A4
glabel lbl_8009792C
/* 09238C 8009792C 80030030 */  lwz     r0, 0x30(r3)
/* 092390 80097930 5400063E */  clrlwi  r0, r0, 0x18
/* 092394 80097934 90050000 */  stw     r0, 0(r5)
/* 092398 80097938 4800006C */  b       lbl_800979A4
glabel lbl_8009793C
/* 09239C 8009793C 80030020 */  lwz     r0, 0x20(r3)
/* 0923A0 80097940 5400073E */  clrlwi  r0, r0, 0x1c
/* 0923A4 80097944 90050000 */  stw     r0, 0(r5)
/* 0923A8 80097948 4800005C */  b       lbl_800979A4
glabel lbl_8009794C
/* 0923AC 8009794C 80030018 */  lwz     r0, 0x18(r3)
/* 0923B0 80097950 540007FE */  clrlwi  r0, r0, 0x1f
/* 0923B4 80097954 90050000 */  stw     r0, 0(r5)
/* 0923B8 80097958 4800004C */  b       lbl_800979A4
glabel lbl_8009795C
/* 0923BC 8009795C 80030014 */  lwz     r0, 0x14(r3)
/* 0923C0 80097960 5400063E */  clrlwi  r0, r0, 0x18
/* 0923C4 80097964 90050000 */  stw     r0, 0(r5)
/* 0923C8 80097968 4800003C */  b       lbl_800979A4
glabel lbl_8009796C
/* 0923CC 8009796C 80030034 */  lwz     r0, 0x34(r3)
/* 0923D0 80097970 5400063E */  clrlwi  r0, r0, 0x18
/* 0923D4 80097974 90050000 */  stw     r0, 0(r5)
/* 0923D8 80097978 4800002C */  b       lbl_800979A4
glabel lbl_8009797C
/* 0923DC 8009797C 80030024 */  lwz     r0, 0x24(r3)
/* 0923E0 80097980 5400073E */  clrlwi  r0, r0, 0x1c
/* 0923E4 80097984 90050000 */  stw     r0, 0(r5)
/* 0923E8 80097988 4800001C */  b       lbl_800979A4
glabel lbl_8009798C
/* 0923EC 8009798C 8003001C */  lwz     r0, 0x1c(r3)
/* 0923F0 80097990 540007FE */  clrlwi  r0, r0, 0x1f
/* 0923F4 80097994 90050000 */  stw     r0, 0(r5)
/* 0923F8 80097998 4800000C */  b       lbl_800979A4
glabel lbl_8009799C
/* 0923FC 8009799C 38600000 */  li      r3, 0
/* 092400 800979A0 4E800020 */  blr     
lbl_800979A4:
/* 092404 800979A4 38600001 */  li      r3, 1
/* 092408 800979A8 4E800020 */  blr     

glabel peripheralGet16
/* 09240C 800979AC 38600000 */  li      r3, 0
/* 092410 800979B0 4E800020 */  blr     

glabel peripheralGet8
/* 092414 800979B4 38600000 */  li      r3, 0
/* 092418 800979B8 4E800020 */  blr     

glabel peripheralPut64
/* 09241C 800979BC 38600000 */  li      r3, 0
/* 092420 800979C0 4E800020 */  blr     

glabel peripheralPut32
/* 092424 800979C4 7C0802A6 */  mflr    r0
/* 092428 800979C8 90010004 */  stw     r0, 4(r1)
/* 09242C 800979CC 548006BE */  clrlwi  r0, r4, 0x1a
/* 092430 800979D0 28000030 */  cmplwi  r0, 0x30
/* 092434 800979D4 9421FFE0 */  stwu    r1, -0x20(r1)
/* 092438 800979D8 93E1001C */  stw     r31, 0x1c(r1)
/* 09243C 800979DC 3BE00001 */  li      r31, 1
/* 092440 800979E0 93C10018 */  stw     r30, 0x18(r1)
/* 092444 800979E4 3BC30000 */  addi    r30, r3, 0
/* 092448 800979E8 4181033C */  bgt     lbl_80097D24
/* 09244C 800979EC 3C60800F */  lis     r3, jtbl_800F0090@ha
/* 092450 800979F0 38630090 */  addi    r3, r3, jtbl_800F0090@l
/* 092454 800979F4 5400103A */  slwi    r0, r0, 2
/* 092458 800979F8 7C03002E */  lwzx    r0, r3, r0
/* 09245C 800979FC 7C0903A6 */  mtctr   r0
/* 092460 80097A00 4E800420 */  bctr    
glabel lbl_80097A04
/* 092464 80097A04 80050000 */  lwz     r0, 0(r5)
/* 092468 80097A08 5400023E */  clrlwi  r0, r0, 8
/* 09246C 80097A0C 901E0028 */  stw     r0, 0x28(r30)
/* 092470 80097A10 4800031C */  b       lbl_80097D2C
glabel lbl_80097A14
/* 092474 80097A14 80050000 */  lwz     r0, 0(r5)
/* 092478 80097A18 901E002C */  stw     r0, 0x2c(r30)
/* 09247C 80097A1C 48000310 */  b       lbl_80097D2C
glabel lbl_80097A20
/* 092480 80097A20 80650000 */  lwz     r3, 0(r5)
/* 092484 80097A24 3C000500 */  lis     r0, 0x500
/* 092488 80097A28 5463023E */  clrlwi  r3, r3, 8
/* 09248C 80097A2C 907E0008 */  stw     r3, 8(r30)
/* 092490 80097A30 809E002C */  lwz     r4, 0x2c(r30)
/* 092494 80097A34 7C002000 */  cmpw    r0, r4
/* 092498 80097A38 41810014 */  bgt     lbl_80097A4C
/* 09249C 80097A3C 3C600600 */  lis     r3, 0x600
/* 0924A0 80097A40 3803FFFF */  addi    r0, r3, -1
/* 0924A4 80097A44 7C040000 */  cmpw    r4, r0
/* 0924A8 80097A48 408100C4 */  ble     lbl_80097B0C
lbl_80097A4C:
/* 0924AC 80097A4C 3C000600 */  lis     r0, 0x600
/* 0924B0 80097A50 7C002000 */  cmpw    r0, r4
/* 0924B4 80097A54 41810014 */  bgt     lbl_80097A68
/* 0924B8 80097A58 3C600800 */  lis     r3, 0x800
/* 0924BC 80097A5C 3803FFFF */  addi    r0, r3, -1
/* 0924C0 80097A60 7C040000 */  cmpw    r4, r0
/* 0924C4 80097A64 408100A8 */  ble     lbl_80097B0C
lbl_80097A68:
/* 0924C8 80097A68 3C000800 */  lis     r0, 0x800
/* 0924CC 80097A6C 7C002000 */  cmpw    r0, r4
/* 0924D0 80097A70 4181009C */  bgt     lbl_80097B0C
/* 0924D4 80097A74 3C601000 */  lis     r3, 0x1000
/* 0924D8 80097A78 3803FFFF */  addi    r0, r3, -1
/* 0924DC 80097A7C 7C040000 */  cmpw    r4, r0
/* 0924E0 80097A80 4181008C */  bgt     lbl_80097B0C
/* 0924E4 80097A84 807E0000 */  lwz     r3, 0(r30)
/* 0924E8 80097A88 38810014 */  addi    r4, r1, 0x14
/* 0924EC 80097A8C 4BF95CA5 */  bl      systemGetStorageDevice
/* 0924F0 80097A90 2C030000 */  cmpwi   r3, 0
/* 0924F4 80097A94 4082000C */  bne     lbl_80097AA0
/* 0924F8 80097A98 38600000 */  li      r3, 0
/* 0924FC 80097A9C 48000294 */  b       lbl_80097D30
lbl_80097AA0:
/* 092500 80097AA0 80010014 */  lwz     r0, 0x14(r1)
/* 092504 80097AA4 2C000009 */  cmpwi   r0, 9
/* 092508 80097AA8 40820030 */  bne     lbl_80097AD8
/* 09250C 80097AAC 807E0000 */  lwz     r3, 0(r30)
/* 092510 80097AB0 80BE0008 */  lwz     r5, 8(r30)
/* 092514 80097AB4 80630048 */  lwz     r3, 0x48(r3)
/* 092518 80097AB8 809E0028 */  lwz     r4, 0x28(r30)
/* 09251C 80097ABC 38C50001 */  addi    r6, r5, 1
/* 092520 80097AC0 80BE002C */  lwz     r5, 0x2c(r30)
/* 092524 80097AC4 4BFF68F5 */  bl      sramTransferSRAM
/* 092528 80097AC8 2C030000 */  cmpwi   r3, 0
/* 09252C 80097ACC 40820040 */  bne     lbl_80097B0C
/* 092530 80097AD0 38600000 */  li      r3, 0
/* 092534 80097AD4 4800025C */  b       lbl_80097D30
lbl_80097AD8:
/* 092538 80097AD8 2C000008 */  cmpwi   r0, 8
/* 09253C 80097ADC 40820030 */  bne     lbl_80097B0C
/* 092540 80097AE0 807E0000 */  lwz     r3, 0(r30)
/* 092544 80097AE4 80BE0008 */  lwz     r5, 8(r30)
/* 092548 80097AE8 80630044 */  lwz     r3, 0x44(r3)
/* 09254C 80097AEC 809E0028 */  lwz     r4, 0x28(r30)
/* 092550 80097AF0 38C50001 */  addi    r6, r5, 1
/* 092554 80097AF4 80BE002C */  lwz     r5, 0x2c(r30)
/* 092558 80097AF8 4BFF63E9 */  bl      flashTransferFLASH
/* 09255C 80097AFC 2C030000 */  cmpwi   r3, 0
/* 092560 80097B00 4082000C */  bne     lbl_80097B0C
/* 092564 80097B04 38600000 */  li      r3, 0
/* 092568 80097B08 48000228 */  b       lbl_80097D30
lbl_80097B0C:
/* 09256C 80097B0C 807E0000 */  lwz     r3, 0(r30)
/* 092570 80097B10 38801000 */  li      r4, 0x1000
/* 092574 80097B14 38A00009 */  li      r5, 9
/* 092578 80097B18 4BF70155 */  bl      xlObjectEvent
/* 09257C 80097B1C 48000210 */  b       lbl_80097D2C
glabel lbl_80097B20
/* 092580 80097B20 80650000 */  lwz     r3, 0(r5)
/* 092584 80097B24 3C000500 */  lis     r0, 0x500
/* 092588 80097B28 5463023E */  clrlwi  r3, r3, 8
/* 09258C 80097B2C 907E000C */  stw     r3, 0xc(r30)
/* 092590 80097B30 809E002C */  lwz     r4, 0x2c(r30)
/* 092594 80097B34 7C002000 */  cmpw    r0, r4
/* 092598 80097B38 41810014 */  bgt     lbl_80097B4C
/* 09259C 80097B3C 3C600600 */  lis     r3, 0x600
/* 0925A0 80097B40 3803FFFF */  addi    r0, r3, -1
/* 0925A4 80097B44 7C040000 */  cmpw    r4, r0
/* 0925A8 80097B48 40810120 */  ble     lbl_80097C68
lbl_80097B4C:
/* 0925AC 80097B4C 3C000600 */  lis     r0, 0x600
/* 0925B0 80097B50 7C002000 */  cmpw    r0, r4
/* 0925B4 80097B54 41810014 */  bgt     lbl_80097B68
/* 0925B8 80097B58 3C600800 */  lis     r3, 0x800
/* 0925BC 80097B5C 3803FFFF */  addi    r0, r3, -1
/* 0925C0 80097B60 7C040000 */  cmpw    r4, r0
/* 0925C4 80097B64 40810104 */  ble     lbl_80097C68
lbl_80097B68:
/* 0925C8 80097B68 3C000800 */  lis     r0, 0x800
/* 0925CC 80097B6C 7C002000 */  cmpw    r0, r4
/* 0925D0 80097B70 4181009C */  bgt     lbl_80097C0C
/* 0925D4 80097B74 3C601000 */  lis     r3, 0x1000
/* 0925D8 80097B78 3803FFFF */  addi    r0, r3, -1
/* 0925DC 80097B7C 7C040000 */  cmpw    r4, r0
/* 0925E0 80097B80 4181008C */  bgt     lbl_80097C0C
/* 0925E4 80097B84 807E0000 */  lwz     r3, 0(r30)
/* 0925E8 80097B88 38810014 */  addi    r4, r1, 0x14
/* 0925EC 80097B8C 4BF95BA5 */  bl      systemGetStorageDevice
/* 0925F0 80097B90 2C030000 */  cmpwi   r3, 0
/* 0925F4 80097B94 4082000C */  bne     lbl_80097BA0
/* 0925F8 80097B98 38600000 */  li      r3, 0
/* 0925FC 80097B9C 48000194 */  b       lbl_80097D30
lbl_80097BA0:
/* 092600 80097BA0 80010014 */  lwz     r0, 0x14(r1)
/* 092604 80097BA4 2C000009 */  cmpwi   r0, 9
/* 092608 80097BA8 40820030 */  bne     lbl_80097BD8
/* 09260C 80097BAC 807E0000 */  lwz     r3, 0(r30)
/* 092610 80097BB0 80BE000C */  lwz     r5, 0xc(r30)
/* 092614 80097BB4 80630048 */  lwz     r3, 0x48(r3)
/* 092618 80097BB8 809E0028 */  lwz     r4, 0x28(r30)
/* 09261C 80097BBC 38C50001 */  addi    r6, r5, 1
/* 092620 80097BC0 80BE002C */  lwz     r5, 0x2c(r30)
/* 092624 80097BC4 4BFF686D */  bl      sramCopySRAM
/* 092628 80097BC8 2C030000 */  cmpwi   r3, 0
/* 09262C 80097BCC 4082009C */  bne     lbl_80097C68
/* 092630 80097BD0 38600000 */  li      r3, 0
/* 092634 80097BD4 4800015C */  b       lbl_80097D30
lbl_80097BD8:
/* 092638 80097BD8 2C000008 */  cmpwi   r0, 8
/* 09263C 80097BDC 4082008C */  bne     lbl_80097C68
/* 092640 80097BE0 807E0000 */  lwz     r3, 0(r30)
/* 092644 80097BE4 80BE000C */  lwz     r5, 0xc(r30)
/* 092648 80097BE8 80630044 */  lwz     r3, 0x44(r3)
/* 09264C 80097BEC 809E0028 */  lwz     r4, 0x28(r30)
/* 092650 80097BF0 38C50001 */  addi    r6, r5, 1
/* 092654 80097BF4 80BE002C */  lwz     r5, 0x2c(r30)
/* 092658 80097BF8 4BFF63FD */  bl      flashCopyFLASH
/* 09265C 80097BFC 2C030000 */  cmpwi   r3, 0
/* 092660 80097C00 40820068 */  bne     lbl_80097C68
/* 092664 80097C04 38600000 */  li      r3, 0
/* 092668 80097C08 48000128 */  b       lbl_80097D30
lbl_80097C0C:
/* 09266C 80097C0C 3C001000 */  lis     r0, 0x1000
/* 092670 80097C10 7C002000 */  cmpw    r0, r4
/* 092674 80097C14 41810054 */  bgt     lbl_80097C68
/* 092678 80097C18 3C601FC0 */  lis     r3, 0x1fc0
/* 09267C 80097C1C 3803FFFF */  addi    r0, r3, -1
/* 092680 80097C20 7C040000 */  cmpw    r4, r0
/* 092684 80097C24 41810044 */  bgt     lbl_80097C68
/* 092688 80097C28 801E0004 */  lwz     r0, 4(r30)
/* 09268C 80097C2C 3C608009 */  lis     r3, peripheralDMA_Complete@ha
/* 092690 80097C30 38E37D58 */  addi    r7, r3, peripheralDMA_Complete@l
/* 092694 80097C34 60000003 */  ori     r0, r0, 3
/* 092698 80097C38 901E0004 */  stw     r0, 4(r30)
/* 09269C 80097C3C 3BE00000 */  li      r31, 0
/* 0926A0 80097C40 80BE000C */  lwz     r5, 0xc(r30)
/* 0926A4 80097C44 807E0000 */  lwz     r3, 0(r30)
/* 0926A8 80097C48 38C50001 */  addi    r6, r5, 1
/* 0926AC 80097C4C 809E0028 */  lwz     r4, 0x28(r30)
/* 0926B0 80097C50 80BE002C */  lwz     r5, 0x2c(r30)
/* 0926B4 80097C54 4BF95CB1 */  bl      systemCopyROM
/* 0926B8 80097C58 2C030000 */  cmpwi   r3, 0
/* 0926BC 80097C5C 4082000C */  bne     lbl_80097C68
/* 0926C0 80097C60 38600000 */  li      r3, 0
/* 0926C4 80097C64 480000CC */  b       lbl_80097D30
lbl_80097C68:
/* 0926C8 80097C68 2C1F0000 */  cmpwi   r31, 0
/* 0926CC 80097C6C 418200C0 */  beq     lbl_80097D2C
/* 0926D0 80097C70 807E0000 */  lwz     r3, 0(r30)
/* 0926D4 80097C74 38801000 */  li      r4, 0x1000
/* 0926D8 80097C78 38A00009 */  li      r5, 9
/* 0926DC 80097C7C 4BF6FFF1 */  bl      xlObjectEvent
/* 0926E0 80097C80 480000AC */  b       lbl_80097D2C
glabel lbl_80097C84
/* 0926E4 80097C84 80050000 */  lwz     r0, 0(r5)
/* 0926E8 80097C88 540007BD */  rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0926EC 80097C8C 418200A0 */  beq     lbl_80097D2C
/* 0926F0 80097C90 807E0000 */  lwz     r3, 0(r30)
/* 0926F4 80097C94 38801001 */  li      r4, 0x1001
/* 0926F8 80097C98 38A00009 */  li      r5, 9
/* 0926FC 80097C9C 4BF6FFD1 */  bl      xlObjectEvent
/* 092700 80097CA0 4800008C */  b       lbl_80097D2C
glabel lbl_80097CA4
/* 092704 80097CA4 80050000 */  lwz     r0, 0(r5)
/* 092708 80097CA8 5400063E */  clrlwi  r0, r0, 0x18
/* 09270C 80097CAC 901E0010 */  stw     r0, 0x10(r30)
/* 092710 80097CB0 4800007C */  b       lbl_80097D2C
glabel lbl_80097CB4
/* 092714 80097CB4 80050000 */  lwz     r0, 0(r5)
/* 092718 80097CB8 5400063E */  clrlwi  r0, r0, 0x18
/* 09271C 80097CBC 901E0030 */  stw     r0, 0x30(r30)
/* 092720 80097CC0 4800006C */  b       lbl_80097D2C
glabel lbl_80097CC4
/* 092724 80097CC4 80050000 */  lwz     r0, 0(r5)
/* 092728 80097CC8 5400073E */  clrlwi  r0, r0, 0x1c
/* 09272C 80097CCC 901E0020 */  stw     r0, 0x20(r30)
/* 092730 80097CD0 4800005C */  b       lbl_80097D2C
glabel lbl_80097CD4
/* 092734 80097CD4 80050000 */  lwz     r0, 0(r5)
/* 092738 80097CD8 540007FE */  clrlwi  r0, r0, 0x1f
/* 09273C 80097CDC 901E0018 */  stw     r0, 0x18(r30)
/* 092740 80097CE0 4800004C */  b       lbl_80097D2C
glabel lbl_80097CE4
/* 092744 80097CE4 80050000 */  lwz     r0, 0(r5)
/* 092748 80097CE8 5400063E */  clrlwi  r0, r0, 0x18
/* 09274C 80097CEC 901E0014 */  stw     r0, 0x14(r30)
/* 092750 80097CF0 4800003C */  b       lbl_80097D2C
glabel lbl_80097CF4
/* 092754 80097CF4 80050000 */  lwz     r0, 0(r5)
/* 092758 80097CF8 5400063E */  clrlwi  r0, r0, 0x18
/* 09275C 80097CFC 901E0034 */  stw     r0, 0x34(r30)
/* 092760 80097D00 4800002C */  b       lbl_80097D2C
glabel lbl_80097D04
/* 092764 80097D04 80050000 */  lwz     r0, 0(r5)
/* 092768 80097D08 5400073E */  clrlwi  r0, r0, 0x1c
/* 09276C 80097D0C 901E0024 */  stw     r0, 0x24(r30)
/* 092770 80097D10 4800001C */  b       lbl_80097D2C
glabel lbl_80097D14
/* 092774 80097D14 80050000 */  lwz     r0, 0(r5)
/* 092778 80097D18 540007FE */  clrlwi  r0, r0, 0x1f
/* 09277C 80097D1C 901E001C */  stw     r0, 0x1c(r30)
/* 092780 80097D20 4800000C */  b       lbl_80097D2C
glabel lbl_80097D24
/* 092784 80097D24 38600000 */  li      r3, 0
/* 092788 80097D28 48000008 */  b       lbl_80097D30
lbl_80097D2C:
/* 09278C 80097D2C 38600001 */  li      r3, 1
lbl_80097D30:
/* 092790 80097D30 80010024 */  lwz     r0, 0x24(r1)
/* 092794 80097D34 83E1001C */  lwz     r31, 0x1c(r1)
/* 092798 80097D38 83C10018 */  lwz     r30, 0x18(r1)
/* 09279C 80097D3C 7C0803A6 */  mtlr    r0
/* 0927A0 80097D40 38210020 */  addi    r1, r1, 0x20
/* 0927A4 80097D44 4E800020 */  blr     

glabel peripheralPut16
/* 0927A8 80097D48 38600000 */  li      r3, 0
/* 0927AC 80097D4C 4E800020 */  blr     

glabel peripheralPut8
/* 0927B0 80097D50 38600000 */  li      r3, 0
/* 0927B4 80097D54 4E800020 */  blr     

peripheralDMA_Complete:
/* 0927B8 80097D58 7C0802A6 */  mflr    r0
/* 0927BC 80097D5C 38801000 */  li      r4, 0x1000
/* 0927C0 80097D60 90010004 */  stw     r0, 4(r1)
/* 0927C4 80097D64 38A00009 */  li      r5, 9
/* 0927C8 80097D68 9421FFF8 */  stwu    r1, -8(r1)
/* 0927CC 80097D6C 806D8920 */  lwz     r3, gpSystem-_SDA_BASE_(r13)
/* 0927D0 80097D70 8063005C */  lwz     r3, 0x5c(r3)
/* 0927D4 80097D74 80030004 */  lwz     r0, 4(r3)
/* 0927D8 80097D78 5400003A */  rlwinm  r0, r0, 0, 0, 0x1d
/* 0927DC 80097D7C 90030004 */  stw     r0, 4(r3)
/* 0927E0 80097D80 80630000 */  lwz     r3, 0(r3)
/* 0927E4 80097D84 4BF6FEE9 */  bl      xlObjectEvent
/* 0927E8 80097D88 8001000C */  lwz     r0, 0xc(r1)
/* 0927EC 80097D8C 38600001 */  li      r3, 1
/* 0927F0 80097D90 38210008 */  addi    r1, r1, 8
/* 0927F4 80097D94 7C0803A6 */  mtlr    r0
/* 0927F8 80097D98 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000ED030 800EFFB0 000B */
D_800EFFB0:
    .asciz "PERIPHERAL"

.balign 4

/* 000ED03C 800EFFBC 0010 */
glabel gClassPeripheral
    .long D_800EFFB0, 0x00000038, 0x00000000, peripheralEvent

.balign 4

/* 000ED04C 800EFFCC 00C4 */
jtbl_800EFFCC:
    .long lbl_800978D0
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_800978E0
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_800978EC
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_800978FC
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009790C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009791C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009792C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009793C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009794C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009795C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009796C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009797C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009799C
    .long lbl_8009798C

.balign 4

/* 000ED110 800F0090 00C4 */
jtbl_800F0090:
    .long lbl_80097A04
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097A14
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097A20
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097B20
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097C84
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097CA4
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097CB4
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097CC4
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097CD4
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097CE4
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097CF4
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D04
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D24
    .long lbl_80097D14


