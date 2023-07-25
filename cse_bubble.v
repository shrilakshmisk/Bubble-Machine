`include "instruction_memory.v"
`include "decode.v"

module CPU (input clk, output [4:0] pc, output reg [31:0] out);
    reg [4:0] pc =5'b0;
    reg [31:0] data_memory [31:0];
    parameter state_fetch = 2'd0;
    parameter state_decode = 2'd1;
    parameter state_execute = 2'd2;
    initial begin
        data_memory[0] = 32'd78; //1st element of array
        data_memory[1] = 32'd456;
        data_memory[2] = 32'd1;
        data_memory[3] = 32'd89;
        data_memory[4] = 32'd13;
        data_memory[5] = 32'd56;
        data_memory[6] = 32'd267;
        data_memory[7] = 32'd102;
        data_memory[8] = 32'd3;
        data_memory[9] = 32'd51; //10th element of array
        data_memory[10] = 32'd0; //s0
        data_memory[11] = 32'd9; //s6
        data_memory[12] = 32'd0; //s1
        data_memory[13] = 32'd0; //t2
        data_memory[14] = 32'd10; //t4
        data_memory[15] = 32'd0; //t6
        data_memory[16] = 32'd0; //t0
        data_memory[17] = 32'd0; //t1
        data_memory[18] = 32'd0; //s7
        data_memory[19] = 32'd0; //s5
        data_memory[21] = 32'b0; //ra
        data_memory[22] = 32'b0; //r0
        data_memory[23] = 32'b0;
        data_memory[24] = 32'b0;
        data_memory[25] = 32'b0;
        data_memory[26] = 32'b0;
        data_memory[27] = 32'b0;
        data_memory[20] = 32'b0;
        data_memory[28] = 32'b0;
        data_memory[29] = 32'b0;
        data_memory[30] = 32'b0;
        data_memory[31] = 32'b0;
    end


    wire [31:0] instruction;
   wire [5:0] op_code;
   wire [5:0] func_code;
    wire [4:0] rs;
   wire [4:0] rt;
   wire [4:0] rd;
   wire [4:0] shamt;
   wire [15:0] address;
   wire branch;
  wire [31:0] op1;
    wire [31:0] op2;
    reg [31:0] ans;
    wire [31:0] lw;
    wire [31:0] sw;
    wire [31:0] temp;
    reg decode_flag;
    // always @(*) begin
        instructions i (pc, instruction);
// assign instruction = instruction_memory[pc];
        decode d (instruction, op_code, func_code, rs, rt, rd, shamt, address, branch, decode_flag);
      
        assign op1 = data_memory[rs];
assign op2 = data_memory[rt];
initial $display("Before Sorting: %d %d %d %d %d %d %d %d %d %d", data_memory[0],data_memory[1],data_memory[2],data_memory[3],data_memory[4],data_memory[5],data_memory[6],data_memory[7],data_memory[8],data_memory[9]);
// initial pc = 5'b0;
        always @ (posedge clk) begin
            if(state_decode) decode_flag = 1;
            ans = data_memory[rd];
        if (op_code == 6'd0 && state_execute) begin // R type
            case(func_code)
                6'd1: begin 
                    ans = op1 + op2; 
                    // $display("add"); 
                end 
                6'd2: begin 
                    ans = op1 - op2; 
                    // $display("sub"); 
                end
                6'd3: begin 
                    ans = op1 + op2; 
                    // $display("addu"); 
                end 
                6'd4: begin 
                    ans = op1 - op2; 
                    // $display("subu"); 
                end
                6'd5: begin 
                    ans = op1 & op2; 
                    // $display("and"); 
                end
                6'd6: begin 
                    ans = op1 | op2; 
                    // $display("or"); 
                end
                6'd9: begin
                    ans = (op1<op2) ? 1 : 0; 
                    // $display("ans");
                end
            endcase
            pc = pc + 5'b1;
// $display("its actually happening %d", pc);

        end
        if (op_code != 6'd0 && op_code != 6'd1)begin
            case(op_code)
                6'd2: begin 
                    ans = op1 + address; 
                    pc = pc + 5'b1; 
                    // $display("addi");
                end
                6'd3: begin 
                    ans = op1 + address; 
                    pc = pc + 5'b1; 
                    // $display("addiu");
                end
                6'd4: begin 
                    ans = op1 & address; 
                    pc = pc + 5'b1; 
                    // $display("andi");
                end
                6'd5: begin 
                    ans = op1 | address; 
                    pc = pc + 5'b1; 
                    // $display("ori");
                end
                6'd6: begin 
                    ans = op1 << address; 
                    pc = pc + 5'b1; 
                    // $display("sll");
                end
                6'd7: begin 
                    ans = op1 >> address; 
                    pc = pc + 5'b1; 
                    // $display("srl");
                end
                6'd9: begin 
                    ans = data_memory[op1+address]; 
                    pc = pc + 5'b1; 
                    // $display("lw");
                end
                6'd8: begin 
                    ans = data_memory[op1+address]; 
                    data_memory[op1+address] = data_memory[rd]; 
                    pc = pc + 5'b1; 
                    // $display("sw");
                end
                6'd10: begin //ble
                    // branch = 1;
                    if(op1 < op2) pc = address;
                    else pc = pc + 1;
                    // $display("ble");
                end
                6'd11: begin //bne
                    // branch = 1;
                    if(op1 != op2) pc = address;
                    else begin
                        pc = pc + 1;
                        if(pc==13) begin
                            $display("After Sorting: %d %d %d %d %d %d %d %d %d %d", data_memory[0],data_memory[1],data_memory[2],data_memory[3],data_memory[4],data_memory[5],data_memory[6],data_memory[7],data_memory[8],data_memory[9]);
                        end
                    end
                    // $display("bne");
                end
                6'd12: begin //beq
                    // branch = 1;
                    if(op1 == op2) pc = address;
                    else pc = pc + 1;
                    // $display("ble");
                end
                6'd13: begin //bgt
                    // branch = 1;
                    if(op1 > op2) pc = address;
                    else pc = pc + 1;
                    // $display("ble");
                end
                6'd14: begin //bgte
                    // branch = 1;
                    if(op1 >= op2) pc = address;
                    else pc = pc + 1;
                    // $display("ble");
                end
                6'd15: begin //bleq
                    // branch = 1;
                    if(op1 <= op2) pc = address;
                    else pc = pc + 1;
                    // $display("ble");
                end

                6'd16: begin //bleq
                    // branch = 1;
                    if(op1 < address) ans=1;
                    else ans=0;
                    pc=pc+1;
                    // $display("ble");
                end
            endcase

        end
        if(op_code==1) begin
            case(op1)
            5'b1:  begin //j
                    // branch = 1;
                    pc = address;
                    // else pc = pc + 1;
                    // $display("j");
                end
            5'd2:  begin //jal
                    // branch = 1;
                    data_memory[21] = pc+1;
                    pc = address;
                    // else pc = pc + 1;
                    // $display("jal");
                end
            5'd3:  begin //jr
                    // branch = 1;
                    pc = data_memory[22];
                    // else pc = pc + 1;
                    // $display("jr");
                end

            endcase

        end

    
        out = ans;
        data_memory[rd] = ans;
        // $display("its actually happening %d %d", pc, out);
                    // $display("%d %d %d %d %d %d", rs, rt, rd, op1, op2, ans);
//         if(pc==12) begin
// // pc = pc + 1;
//         end
        end
        
        // data n5 (clk, rd, rs, 1'b0, ans, temp);

    // $display("its actually happening %d %d", pc, out);

endmodule