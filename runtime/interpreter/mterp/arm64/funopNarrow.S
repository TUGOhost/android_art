%default {"srcreg":"s0", "tgtreg":"d0"}
    /*
     * Generic 32bit-to-32bit floating point unary operation.  Provide an
     * "instr" line that specifies an instruction that performs "$tgtreg = op $srcreg".
     *
     * For: int-to-float, float-to-int
     * TODO: refactor all of the conversions - parameterize width and use same template.
     */
    /* unop vA, vB */
    lsr     w3, wINST, #12              // w3<- B
    lsr     w4, wINST, #8               // w4<- A+
    GET_VREG $srcreg, w3
    FETCH_ADVANCE_INST 1                // advance rPC, load wINST
    and     w4, w4, #15                 // w4<- A
    $instr                              // d0<- op
    GET_INST_OPCODE ip                  // extract opcode from wINST
    SET_VREG $tgtreg, w4                // vA<- d0
    GOTO_OPCODE ip                      // jump to next instruction
