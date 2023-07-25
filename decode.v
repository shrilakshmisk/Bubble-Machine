module decode (input [31:0] instruction, output reg [5:0] op_code, output reg [5:0] func_code, output reg [4:0] rs, output reg [4:0] rt, output reg [4:0] rd, output reg [4:0] shamt, output reg [15:0] address, output reg branch, input decode_flag);
    initial begin
        op_code = 6'b0;
        func_code = 6'b0;
        rs = 5'b0;
        rt = 5'b0;
        rd = 5'b0;
        shamt = 5'b0;
        address = 16'b0;
        // op1 = 32'b0;
    end
    always @ (*) begin
        op_code = instruction [31:26];
        if (op_code == 0) begin // R type
            func_code = instruction [5:0];
            rs = instruction [25:21];
            // data n1 (rs, op1, 1'b1, 32'b0);
            rt = instruction [20:16];
            rd = instruction [15:11];
            shamt = instruction [10:6];
            branch = 0;

        end
        else if (op_code == 1) begin // J type
            address = instruction [15:0];
            branch = 1;
        end
        else begin // I type
            address = instruction [15:0];
            rs = instruction [25:21];
            rd = instruction [20:16];
            rt = instruction [20:16];
            branch = 1;
        end

        

    end

endmodule