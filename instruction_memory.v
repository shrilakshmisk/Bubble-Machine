module instructions(input [4:0] address, output reg [31:0] instruction); //Uses Veda Memory
    reg [31:0] instruction_memory [31:0];
    initial begin //these insstructions are in the order of the instructions in bubble_sort.asm MIPS code
        instruction_memory[0] = 32'b000110_01100_01111_00000_00000_000000; //sll 
        instruction_memory[1] = 32'b000000_10010_01111_01111_00000_000001; //add
        instruction_memory[2] = 32'b001001_01111_10000_00000_00000_000000; //lw
        instruction_memory[3] = 32'b001001_01111_10001_00000_00000_000001; //lw
        instruction_memory[4] = 32'b001010_10000_10001_00000_00000_000111; //ble
        instruction_memory[5] = 32'b001000_01111_10001_00000_00000_000000; //sw
        instruction_memory[6] = 32'b001000_01111_10000_00000_00000_000001; //sw
        instruction_memory[7] = 32'b000010_01100_01100_00000_00000_000001; //addi
        instruction_memory[8] = 32'b000000_01011_01010_10011_00000_000010; //sub
        instruction_memory[9] = 32'b001011_01100_10011_00000_00000_000000; //bne
        instruction_memory[10] = 32'b000010_01010_01010_00000_00000_000001; //addi
        instruction_memory[11] = 32'b000000_01100_01100_01100_00000_000010; //bne
        instruction_memory[12] = 32'b001011_01010_01011_00000_00000_000000; //end
        instruction_memory[13] = 32'b0;
        instruction_memory[14] = 32'b0;
        instruction_memory[15] = 32'b0;
        instruction_memory[16] = 32'b0;
        instruction_memory[17] = 32'b0;
        instruction_memory[18] = 32'b0;
        instruction_memory[19] = 32'b0;
        instruction_memory[21] = 32'b0;
        instruction_memory[22] = 32'b0;
        instruction_memory[23] = 32'b0;
        instruction_memory[24] = 32'b0;
        instruction_memory[25] = 32'b0;
        instruction_memory[26] = 32'b0;
        instruction_memory[27] = 32'b0;
        instruction_memory[20] = 32'b0;
        instruction_memory[28] = 32'b0;
        instruction_memory[29] = 32'b0;
        instruction_memory[30] = 32'b0;
        instruction_memory[31] = 32'b0;
    end

    always@(*) begin
    instruction <= instruction_memory[address];
    end

endmodule

module data (input clk, input [4:0] address, input mode, input [31:0] data_in, output reg [31:0] data_out); //VEDA memory
    reg [31:0] data_memory [31:0];
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
        data_memory[22] = 32'b0; 
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

    always @(posedge clk) begin
        if(mode==0)begin
            data_memory[address]= data_in;
        end
        else
        data_out = data_memory[address]; 
    end
    // assign 
endmodule