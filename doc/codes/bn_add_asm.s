.global bn_add_asm
.type bn_add_asm, %function

/* void bn_add_asm(
        uint64_t* res,
        const uint64_t* op1,
        const uint64_t* op2,
        int32_t n);
    x0: res (Address)
    x1: op1 (Address)
    x2: op2 (Address)
    x3: n
    x4: *res (Contents)
    x5: *op1 (Contents)
    x6: *op2 (Contents)
    x7: counter */
bn_add_asm:
        mov     w7, wzr

        ldr     x5, [x1, x7, lsl #3]
        ldr     x6, [x2, x7, lsl #3]
        adds    x4, x5, x6
        str     x4, [x0, x7, lsl #3]
        add     w7, w7, #1

LOOP:
        ldr     x5, [x1, x7, lsl #3]
        ldr     x6, [x2, x7, lsl #3]
        adcs    x4, x5, x6
        str     x4, [x0, x7, lsl #3]
        add     w7, w7, #1
        cmp     w3, w7
        bgt     LOOP

END_LOOP:
        adc     w0, wzr, wzr

        ret
        .size bn_add_asm, (. - bn_add_asm)
