# ctype.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel toupper
/* 0C9008 800CE5A8 2C03FFFF */  cmpwi   r3, -1
/* 0C900C 800CE5AC 4082000C */  bne     lbl_800CE5B8
/* 0C9010 800CE5B0 3860FFFF */  li      r3, -1
/* 0C9014 800CE5B4 4E800020 */  blr     
lbl_800CE5B8:
/* 0C9018 800CE5B8 3C80800D */  lis     r4, __upper_map@ha
/* 0C901C 800CE5BC 5463063E */  clrlwi  r3, r3, 0x18
/* 0C9020 800CE5C0 380435B0 */  addi    r0, r4, __upper_map@l
/* 0C9024 800CE5C4 7C601A14 */  add     r3, r0, r3
/* 0C9028 800CE5C8 88630000 */  lbz     r3, 0(r3)
/* 0C902C 800CE5CC 4E800020 */  blr     

glabel tolower
/* 0C9030 800CE5D0 2C03FFFF */  cmpwi   r3, -1
/* 0C9034 800CE5D4 4082000C */  bne     lbl_800CE5E0
/* 0C9038 800CE5D8 3860FFFF */  li      r3, -1
/* 0C903C 800CE5DC 4E800020 */  blr     
lbl_800CE5E0:
/* 0C9040 800CE5E0 3C80800D */  lis     r4, __lower_map@ha
/* 0C9044 800CE5E4 5463063E */  clrlwi  r3, r3, 0x18
/* 0C9048 800CE5E8 380434B0 */  addi    r0, r4, __lower_map@l
/* 0C904C 800CE5EC 7C601A14 */  add     r3, r0, r3
/* 0C9050 800CE5F0 88630000 */  lbz     r3, 0(r3)
/* 0C9054 800CE5F4 4E800020 */  blr     

.section .rodata, "a"

.balign 8

/* 000D0430 800D33B0 0100 */
glabel __ctype_map
    .long 0x01010101, 0x01010101, 0x01020202, 0x02020101, 0x01010101, 0x01010101, 0x01010101, 0x01010101, 0x04080808, 0x08080808, 0x08080808, 0x08080808, 0x30303030, 0x30303030, 0x30300808, 0x08080808
    .long 0x08A0A0A0, 0xA0A0A080, 0x80808080, 0x80808080, 0x80808080, 0x80808080, 0x80808008, 0x08080808, 0x08606060, 0x60606040, 0x40404040, 0x40404040, 0x40404040, 0x40404040, 0x40404008, 0x08080801
    .long 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    .long 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000

/* 000D0530 800D34B0 0100 */
glabel __lower_map
    .long 0x00010203, 0x04050607, 0x08090A0B, 0x0C0D0E0F, 0x10111213, 0x14151617, 0x18191A1B, 0x1C1D1E1F, 0x20212223, 0x24252627, 0x28292A2B, 0x2C2D2E2F, 0x30313233, 0x34353637, 0x38393A3B, 0x3C3D3E3F
    .long 0x40616263, 0x64656667, 0x68696A6B, 0x6C6D6E6F, 0x70717273, 0x74757677, 0x78797A5B, 0x5C5D5E5F, 0x60616263, 0x64656667, 0x68696A6B, 0x6C6D6E6F, 0x70717273, 0x74757677, 0x78797A7B, 0x7C7D7E7F
    .long 0x80818283, 0x84858687, 0x88898A8B, 0x8C8D8E8F, 0x90919293, 0x94959697, 0x98999A9B, 0x9C9D9E9F, 0xA0A1A2A3, 0xA4A5A6A7, 0xA8A9AAAB, 0xACADAEAF, 0xB0B1B2B3, 0xB4B5B6B7, 0xB8B9BABB, 0xBCBDBEBF
    .long 0xC0C1C2C3, 0xC4C5C6C7, 0xC8C9CACB, 0xCCCDCECF, 0xD0D1D2D3, 0xD4D5D6D7, 0xD8D9DADB, 0xDCDDDEDF, 0xE0E1E2E3, 0xE4E5E6E7, 0xE8E9EAEB, 0xECEDEEEF, 0xF0F1F2F3, 0xF4F5F6F7, 0xF8F9FAFB, 0xFCFDFEFF

/* 000D0630 800D35B0 0100 */
glabel __upper_map
    .long 0x00010203, 0x04050607, 0x08090A0B, 0x0C0D0E0F, 0x10111213, 0x14151617, 0x18191A1B, 0x1C1D1E1F, 0x20212223, 0x24252627, 0x28292A2B, 0x2C2D2E2F, 0x30313233, 0x34353637, 0x38393A3B, 0x3C3D3E3F
    .long 0x40414243, 0x44454647, 0x48494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x58595A5B, 0x5C5D5E5F, 0x60414243, 0x44454647, 0x48494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x58595A7B, 0x7C7D7E7F
    .long 0x80818283, 0x84858687, 0x88898A8B, 0x8C8D8E8F, 0x90919293, 0x94959697, 0x98999A9B, 0x9C9D9E9F, 0xA0A1A2A3, 0xA4A5A6A7, 0xA8A9AAAB, 0xACADAEAF, 0xB0B1B2B3, 0xB4B5B6B7, 0xB8B9BABB, 0xBCBDBEBF
    .long 0xC0C1C2C3, 0xC4C5C6C7, 0xC8C9CACB, 0xCCCDCECF, 0xD0D1D2D3, 0xD4D5D6D7, 0xD8D9DADB, 0xDCDDDEDF, 0xE0E1E2E3, 0xE4E5E6E7, 0xE8E9EAEB, 0xECEDEEEF, 0xF0F1F2F3, 0xF4F5F6F7, 0xF8F9FAFB, 0xFCFDFEFF
