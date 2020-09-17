# xlList.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel xlListReset
/* 000CE0 80006280 38600001 */  li      r3, 1
/* 000CE4 80006284 4E800020 */  blr     

glabel xlListSetup
/* 000CE8 80006288 3C60800F */  lis     r3, gListList@ha
/* 000CEC 8000628C 38A33FA0 */  addi    r5, r3, gListList@l
/* 000CF0 80006290 38800000 */  li      r4, 0
/* 000CF4 80006294 90850004 */  stw     r4, 4(r5)
/* 000CF8 80006298 38000010 */  li      r0, 0x10
/* 000CFC 8000629C 38600001 */  li      r3, 1
/* 000D00 800062A0 90050000 */  stw     r0, 0(r5)
/* 000D04 800062A4 9085000C */  stw     r4, 0xc(r5)
/* 000D08 800062A8 90850008 */  stw     r4, 8(r5)
/* 000D0C 800062AC 4E800020 */  blr     

glabel xlListTestItem
/* 000D10 800062B0 3CA0800F */  lis     r5, gListList@ha
/* 000D14 800062B4 38A53FA0 */  addi    r5, r5, gListList@l
/* 000D18 800062B8 7C032840 */  cmplw   r3, r5
/* 000D1C 800062BC 4082000C */  bne     lbl_800062C8
/* 000D20 800062C0 38000001 */  li      r0, 1
/* 000D24 800062C4 48000030 */  b       lbl_800062F4
lbl_800062C8:
/* 000D28 800062C8 80A50008 */  lwz     r5, 8(r5)
/* 000D2C 800062CC 4800001C */  b       lbl_800062E8
lbl_800062D0:
/* 000D30 800062D0 38050004 */  addi    r0, r5, 4
/* 000D34 800062D4 7C030040 */  cmplw   r3, r0
/* 000D38 800062D8 4082000C */  bne     lbl_800062E4
/* 000D3C 800062DC 38000001 */  li      r0, 1
/* 000D40 800062E0 48000014 */  b       lbl_800062F4
lbl_800062E4:
/* 000D44 800062E4 80A50000 */  lwz     r5, 0(r5)
lbl_800062E8:
/* 000D48 800062E8 28050000 */  cmplwi  r5, 0
/* 000D4C 800062EC 4082FFE4 */  bne     lbl_800062D0
/* 000D50 800062F0 38000000 */  li      r0, 0
lbl_800062F4:
/* 000D54 800062F4 2C000000 */  cmpwi   r0, 0
/* 000D58 800062F8 4182000C */  beq     lbl_80006304
/* 000D5C 800062FC 28040000 */  cmplwi  r4, 0
/* 000D60 80006300 4082000C */  bne     lbl_8000630C
lbl_80006304:
/* 000D64 80006304 38600000 */  li      r3, 0
/* 000D68 80006308 4E800020 */  blr     
lbl_8000630C:
/* 000D6C 8000630C 80630008 */  lwz     r3, 8(r3)
/* 000D70 80006310 4800001C */  b       lbl_8000632C
lbl_80006314:
/* 000D74 80006314 38030004 */  addi    r0, r3, 4
/* 000D78 80006318 7C040040 */  cmplw   r4, r0
/* 000D7C 8000631C 4082000C */  bne     lbl_80006328
/* 000D80 80006320 38600001 */  li      r3, 1
/* 000D84 80006324 4E800020 */  blr     
lbl_80006328:
/* 000D88 80006328 80630000 */  lwz     r3, 0(r3)
lbl_8000632C:
/* 000D8C 8000632C 28030000 */  cmplwi  r3, 0
/* 000D90 80006330 4082FFE4 */  bne     lbl_80006314
/* 000D94 80006334 38600000 */  li      r3, 0
/* 000D98 80006338 4E800020 */  blr     

glabel xlListFreeItem
/* 000D9C 8000633C 7C0802A6 */  mflr    r0
/* 000DA0 80006340 90010004 */  stw     r0, 4(r1)
/* 000DA4 80006344 9421FFE0 */  stwu    r1, -0x20(r1)
/* 000DA8 80006348 93E1001C */  stw     r31, 0x1c(r1)
/* 000DAC 8000634C 7C7F1B78 */  mr      r31, r3
/* 000DB0 80006350 80030008 */  lwz     r0, 8(r3)
/* 000DB4 80006354 28000000 */  cmplwi  r0, 0
/* 000DB8 80006358 4082000C */  bne     lbl_80006364
/* 000DBC 8000635C 38600000 */  li      r3, 0
/* 000DC0 80006360 48000074 */  b       lbl_800063D4
lbl_80006364:
/* 000DC4 80006364 38DF0008 */  addi    r6, r31, 8
/* 000DC8 80006368 48000060 */  b       lbl_800063C8
lbl_8000636C:
/* 000DCC 8000636C 80060000 */  lwz     r0, 0(r6)
/* 000DD0 80006370 90010010 */  stw     r0, 0x10(r1)
/* 000DD4 80006374 80A10010 */  lwz     r5, 0x10(r1)
/* 000DD8 80006378 80640000 */  lwz     r3, 0(r4)
/* 000DDC 8000637C 38050004 */  addi    r0, r5, 4
/* 000DE0 80006380 7C030040 */  cmplw   r3, r0
/* 000DE4 80006384 40820040 */  bne     lbl_800063C4
/* 000DE8 80006388 80A50000 */  lwz     r5, 0(r5)
/* 000DEC 8000638C 38000000 */  li      r0, 0
/* 000DF0 80006390 38610010 */  addi    r3, r1, 0x10
/* 000DF4 80006394 90A60000 */  stw     r5, 0(r6)
/* 000DF8 80006398 90040000 */  stw     r0, 0(r4)
/* 000DFC 8000639C 48000CFD */  bl      xlHeapFree
/* 000E00 800063A0 2C030000 */  cmpwi   r3, 0
/* 000E04 800063A4 4082000C */  bne     lbl_800063B0
/* 000E08 800063A8 38600000 */  li      r3, 0
/* 000E0C 800063AC 48000028 */  b       lbl_800063D4
lbl_800063B0:
/* 000E10 800063B0 809F0004 */  lwz     r4, 4(r31)
/* 000E14 800063B4 38600001 */  li      r3, 1
/* 000E18 800063B8 3804FFFF */  addi    r0, r4, -1
/* 000E1C 800063BC 901F0004 */  stw     r0, 4(r31)
/* 000E20 800063C0 48000014 */  b       lbl_800063D4
lbl_800063C4:
/* 000E24 800063C4 7CA62B78 */  mr      r6, r5
lbl_800063C8:
/* 000E28 800063C8 28060000 */  cmplwi  r6, 0
/* 000E2C 800063CC 4082FFA0 */  bne     lbl_8000636C
/* 000E30 800063D0 38600000 */  li      r3, 0
lbl_800063D4:
/* 000E34 800063D4 80010024 */  lwz     r0, 0x24(r1)
/* 000E38 800063D8 83E1001C */  lwz     r31, 0x1c(r1)
/* 000E3C 800063DC 38210020 */  addi    r1, r1, 0x20
/* 000E40 800063E0 7C0803A6 */  mtlr    r0
/* 000E44 800063E4 4E800020 */  blr     

glabel xlListMakeItem
/* 000E48 800063E8 7C0802A6 */  mflr    r0
/* 000E4C 800063EC 90010004 */  stw     r0, 4(r1)
/* 000E50 800063F0 9421FFE0 */  stwu    r1, -0x20(r1)
/* 000E54 800063F4 93E1001C */  stw     r31, 0x1c(r1)
/* 000E58 800063F8 3BE40000 */  addi    r31, r4, 0
/* 000E5C 800063FC 93C10018 */  stw     r30, 0x18(r1)
/* 000E60 80006400 7C7E1B78 */  mr      r30, r3
/* 000E64 80006404 80A30000 */  lwz     r5, 0(r3)
/* 000E68 80006408 38610010 */  addi    r3, r1, 0x10
/* 000E6C 8000640C 38850004 */  addi    r4, r5, 4
/* 000E70 80006410 48000DA5 */  bl      xlHeapTake
/* 000E74 80006414 2C030000 */  cmpwi   r3, 0
/* 000E78 80006418 4082000C */  bne     lbl_80006424
/* 000E7C 8000641C 38600000 */  li      r3, 0
/* 000E80 80006420 4800005C */  b       lbl_8000647C
lbl_80006424:
/* 000E84 80006424 80610010 */  lwz     r3, 0x10(r1)
/* 000E88 80006428 38000000 */  li      r0, 0
/* 000E8C 8000642C 389E0008 */  addi    r4, r30, 8
/* 000E90 80006430 90030000 */  stw     r0, 0(r3)
/* 000E94 80006434 80610010 */  lwz     r3, 0x10(r1)
/* 000E98 80006438 38030004 */  addi    r0, r3, 4
/* 000E9C 8000643C 901F0000 */  stw     r0, 0(r31)
/* 000EA0 80006440 48000030 */  b       lbl_80006470
lbl_80006444:
/* 000EA4 80006444 80040000 */  lwz     r0, 0(r4)
/* 000EA8 80006448 28000000 */  cmplwi  r0, 0
/* 000EAC 8000644C 40820020 */  bne     lbl_8000646C
/* 000EB0 80006450 80010010 */  lwz     r0, 0x10(r1)
/* 000EB4 80006454 38600001 */  li      r3, 1
/* 000EB8 80006458 90040000 */  stw     r0, 0(r4)
/* 000EBC 8000645C 809E0004 */  lwz     r4, 4(r30)
/* 000EC0 80006460 38040001 */  addi    r0, r4, 1
/* 000EC4 80006464 901E0004 */  stw     r0, 4(r30)
/* 000EC8 80006468 48000014 */  b       lbl_8000647C
lbl_8000646C:
/* 000ECC 8000646C 7C040378 */  mr      r4, r0
lbl_80006470:
/* 000ED0 80006470 28040000 */  cmplwi  r4, 0
/* 000ED4 80006474 4082FFD0 */  bne     lbl_80006444
/* 000ED8 80006478 38600000 */  li      r3, 0
lbl_8000647C:
/* 000EDC 8000647C 80010024 */  lwz     r0, 0x24(r1)
/* 000EE0 80006480 83E1001C */  lwz     r31, 0x1c(r1)
/* 000EE4 80006484 83C10018 */  lwz     r30, 0x18(r1)
/* 000EE8 80006488 7C0803A6 */  mtlr    r0
/* 000EEC 8000648C 38210020 */  addi    r1, r1, 0x20
/* 000EF0 80006490 4E800020 */  blr     

glabel xlListFree
/* 000EF4 80006494 7C0802A6 */  mflr    r0
/* 000EF8 80006498 90010004 */  stw     r0, 4(r1)
/* 000EFC 8000649C 9421FFE0 */  stwu    r1, -0x20(r1)
/* 000F00 800064A0 93E1001C */  stw     r31, 0x1c(r1)
/* 000F04 800064A4 93C10018 */  stw     r30, 0x18(r1)
/* 000F08 800064A8 93A10014 */  stw     r29, 0x14(r1)
/* 000F0C 800064AC 7C7D1B78 */  mr      r29, r3
/* 000F10 800064B0 83C30000 */  lwz     r30, 0(r3)
/* 000F14 800064B4 801E0008 */  lwz     r0, 8(r30)
/* 000F18 800064B8 9001000C */  stw     r0, 0xc(r1)
/* 000F1C 800064BC 48000024 */  b       lbl_800064E0
lbl_800064C0:
/* 000F20 800064C0 83E30000 */  lwz     r31, 0(r3)
/* 000F24 800064C4 3861000C */  addi    r3, r1, 0xc
/* 000F28 800064C8 48000BD1 */  bl      xlHeapFree
/* 000F2C 800064CC 2C030000 */  cmpwi   r3, 0
/* 000F30 800064D0 4082000C */  bne     lbl_800064DC
/* 000F34 800064D4 38600000 */  li      r3, 0
/* 000F38 800064D8 48000028 */  b       lbl_80006500
lbl_800064DC:
/* 000F3C 800064DC 93E1000C */  stw     r31, 0xc(r1)
lbl_800064E0:
/* 000F40 800064E0 8061000C */  lwz     r3, 0xc(r1)
/* 000F44 800064E4 28030000 */  cmplwi  r3, 0
/* 000F48 800064E8 4082FFD8 */  bne     lbl_800064C0
/* 000F4C 800064EC 38000000 */  li      r0, 0
/* 000F50 800064F0 901E0004 */  stw     r0, 4(r30)
/* 000F54 800064F4 38600001 */  li      r3, 1
/* 000F58 800064F8 901E000C */  stw     r0, 0xc(r30)
/* 000F5C 800064FC 901E0008 */  stw     r0, 8(r30)
lbl_80006500:
/* 000F60 80006500 2C030000 */  cmpwi   r3, 0
/* 000F64 80006504 4082000C */  bne     lbl_80006510
/* 000F68 80006508 38600000 */  li      r3, 0
/* 000F6C 8000650C 48000028 */  b       lbl_80006534
lbl_80006510:
/* 000F70 80006510 3C60800F */  lis     r3, gListList@ha
/* 000F74 80006514 38633FA0 */  addi    r3, r3, gListList@l
/* 000F78 80006518 389D0000 */  addi    r4, r29, 0
/* 000F7C 8000651C 4BFFFE21 */  bl      xlListFreeItem
/* 000F80 80006520 2C030000 */  cmpwi   r3, 0
/* 000F84 80006524 4082000C */  bne     lbl_80006530
/* 000F88 80006528 38600000 */  li      r3, 0
/* 000F8C 8000652C 48000008 */  b       lbl_80006534
lbl_80006530:
/* 000F90 80006530 38600001 */  li      r3, 1
lbl_80006534:
/* 000F94 80006534 80010024 */  lwz     r0, 0x24(r1)
/* 000F98 80006538 83E1001C */  lwz     r31, 0x1c(r1)
/* 000F9C 8000653C 83C10018 */  lwz     r30, 0x18(r1)
/* 000FA0 80006540 7C0803A6 */  mtlr    r0
/* 000FA4 80006544 83A10014 */  lwz     r29, 0x14(r1)
/* 000FA8 80006548 38210020 */  addi    r1, r1, 0x20
/* 000FAC 8000654C 4E800020 */  blr     

glabel xlListMake
/* 000FB0 80006550 7C0802A6 */  mflr    r0
/* 000FB4 80006554 3CA0800F */  lis     r5, gListList@ha
/* 000FB8 80006558 90010004 */  stw     r0, 4(r1)
/* 000FBC 8000655C 38040003 */  addi    r0, r4, 3
/* 000FC0 80006560 9421FFD8 */  stwu    r1, -0x28(r1)
/* 000FC4 80006564 93E10024 */  stw     r31, 0x24(r1)
/* 000FC8 80006568 3BE30000 */  addi    r31, r3, 0
/* 000FCC 8000656C 38610014 */  addi    r3, r1, 0x14
/* 000FD0 80006570 93C10020 */  stw     r30, 0x20(r1)
/* 000FD4 80006574 3BC53FA0 */  addi    r30, r5, gListList@l
/* 000FD8 80006578 93A1001C */  stw     r29, 0x1c(r1)
/* 000FDC 8000657C 541D003A */  rlwinm  r29, r0, 0, 0, 0x1d
/* 000FE0 80006580 80BE0000 */  lwz     r5, 0(r30)
/* 000FE4 80006584 38850004 */  addi    r4, r5, 4
/* 000FE8 80006588 48000C2D */  bl      xlHeapTake
/* 000FEC 8000658C 2C030000 */  cmpwi   r3, 0
/* 000FF0 80006590 4082000C */  bne     lbl_8000659C
/* 000FF4 80006594 38800000 */  li      r4, 0
/* 000FF8 80006598 4800005C */  b       lbl_800065F4
lbl_8000659C:
/* 000FFC 8000659C 80610014 */  lwz     r3, 0x14(r1)
/* 001000 800065A0 38000000 */  li      r0, 0
/* 001004 800065A4 38BE0008 */  addi    r5, r30, 8
/* 001008 800065A8 90030000 */  stw     r0, 0(r3)
/* 00100C 800065AC 80610014 */  lwz     r3, 0x14(r1)
/* 001010 800065B0 38030004 */  addi    r0, r3, 4
/* 001014 800065B4 901F0000 */  stw     r0, 0(r31)
/* 001018 800065B8 48000030 */  b       lbl_800065E8
lbl_800065BC:
/* 00101C 800065BC 80050000 */  lwz     r0, 0(r5)
/* 001020 800065C0 28000000 */  cmplwi  r0, 0
/* 001024 800065C4 40820020 */  bne     lbl_800065E4
/* 001028 800065C8 80010014 */  lwz     r0, 0x14(r1)
/* 00102C 800065CC 38800001 */  li      r4, 1
/* 001030 800065D0 90050000 */  stw     r0, 0(r5)
/* 001034 800065D4 807E0004 */  lwz     r3, 4(r30)
/* 001038 800065D8 38030001 */  addi    r0, r3, 1
/* 00103C 800065DC 901E0004 */  stw     r0, 4(r30)
/* 001040 800065E0 48000014 */  b       lbl_800065F4
lbl_800065E4:
/* 001044 800065E4 7C050378 */  mr      r5, r0
lbl_800065E8:
/* 001048 800065E8 28050000 */  cmplwi  r5, 0
/* 00104C 800065EC 4082FFD0 */  bne     lbl_800065BC
/* 001050 800065F0 38800000 */  li      r4, 0
lbl_800065F4:
/* 001054 800065F4 2C040000 */  cmpwi   r4, 0
/* 001058 800065F8 41820030 */  beq     lbl_80006628
/* 00105C 800065FC 809F0000 */  lwz     r4, 0(r31)
/* 001060 80006600 38000000 */  li      r0, 0
/* 001064 80006604 38600001 */  li      r3, 1
/* 001068 80006608 90040004 */  stw     r0, 4(r4)
/* 00106C 8000660C 809F0000 */  lwz     r4, 0(r31)
/* 001070 80006610 93A40000 */  stw     r29, 0(r4)
/* 001074 80006614 809F0000 */  lwz     r4, 0(r31)
/* 001078 80006618 9004000C */  stw     r0, 0xc(r4)
/* 00107C 8000661C 809F0000 */  lwz     r4, 0(r31)
/* 001080 80006620 90040008 */  stw     r0, 8(r4)
/* 001084 80006624 48000008 */  b       lbl_8000662C
lbl_80006628:
/* 001088 80006628 38600000 */  li      r3, 0
lbl_8000662C:
/* 00108C 8000662C 8001002C */  lwz     r0, 0x2c(r1)
/* 001090 80006630 83E10024 */  lwz     r31, 0x24(r1)
/* 001094 80006634 83C10020 */  lwz     r30, 0x20(r1)
/* 001098 80006638 7C0803A6 */  mtlr    r0
/* 00109C 8000663C 83A1001C */  lwz     r29, 0x1c(r1)
/* 0010A0 80006640 38210028 */  addi    r1, r1, 0x28
/* 0010A4 80006644 4E800020 */  blr     


.section .bss, "wa"

.balign 32

/* 000F1020 800F3FA0 0010 */
gListList:
    .skip 16


