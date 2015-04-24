package lc3b_types;

typedef logic [15:0] lc3b_word;
typedef logic  [7:0] lc3b_byte;

typedef logic  [8:0] lc3b_offset9;
typedef logic  [5:0] lc3b_offset6;

typedef logic  [2:0] lc3b_reg;
typedef logic  [2:0] lc3b_nzp;
typedef logic  [1:0] lc3b_mem_wmask;

typedef logic	[19:0] lc3b_twenty;
typedef logic	[10:0] lc3b_eleven;
typedef logic	[3:0] lc3b_four;

typedef logic [10:0] lc3b_cs;
typedef logic [2:0] lc3b_cc;
typedef logic [2:0] lc3b_drid;

typedef enum bit [3:0] {
    op_add  = 4'b0001,
    op_and  = 4'b0101,
    op_br   = 4'b0000,
    op_jmp  = 4'b1100,   /* also RET */
    op_jsr  = 4'b0100,   /* also JSRR */
    op_ldb  = 4'b0010,
    op_ldi  = 4'b1010,
    op_ldr  = 4'b0110,
    op_lea  = 4'b1110,
    op_not  = 4'b1001,
    op_rti  = 4'b1000,
    op_shf  = 4'b1101,
    op_stb  = 4'b0011,
    op_sti  = 4'b1011,
    op_str  = 4'b0111,
    op_trap = 4'b1111
} lc3b_opcode;

typedef enum bit [3:0] {
    alu_add,
    alu_and,
    alu_not,
    alu_pass,
    alu_sll,
    alu_srl,
    alu_sra
} lc3b_aluop;

typedef struct packed {
    logic [3:0] opcode;
    lc3b_aluop aluop;
    

    logic load_cc;
    logic load_regfile;
    logic load_mdr;
    logic load_mar;
    logic mem_read;
    logic mem_write;


    logic destmux_sel; 
    logic storemux_sel;
    logic adjmux_sel; 
    
    logic [2:0] pcmux_sel;
    logic [2:0] alumux_sel;
    logic [2:0] regfilemux_sel;
    logic [1:0] mdrmux_sel;
    logic [1:0] marmux_sel;
    
    logic if_id_enable;
    logic id_ex_enable;
    logic ex_mem_enable;
    logic mem_wb_enable;
    
    logic in_branch;
    logic in_byte;
    logic in_indirect;
    logic in_sti;
    logic in_mem;
    logic in_ld;
    logic in_st;
    logic set_r7;
    logic in_lea;

    /* ... other signals ... */
} lc3b_control_word;

endpackage : lc3b_types
