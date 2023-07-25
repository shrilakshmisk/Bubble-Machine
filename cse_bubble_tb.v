`include "cse_bubble.v"
module code_tb;
 wire [4:0] start;
 wire [31:0] out;
 
wire [4:0] pc;  // wire [5:0] op_code;
  // wire [5:0] func_code;
  // wire [4:0] rs;
  // wire [4:0] rt;
  // wire [4:0] rd;
  // wire [4:0] shamt;
  // wire [15:0] address;
  // wire branch;
// reg []
  reg clk =0;
  always #10 clk = ~clk;
//   reg mode;
//   reg [31:0] data_in;
  CPU f ( clk, pc, out);

  // Define clock signal
 

  // Define test cases
  initial begin
    // Test case 1: addition of positive numbers
    // instruction = 32'b001000_00000_01010_00000_00000_001001;
    // // mode = 0;
    // data_in = 32'd1313;
     //add
    // #20;
    // // $display("add -----------------------")
    // $display("out =====%d\n pc ===== %d", out,pc);

    // // instruction = 32'b000000_01011_01010_00000_00000_000001;

    // #20;
    // // $display("add -----------------------")
    // $display("out =====%d\n pc ===== %d", out,pc);


    // // // instruction = 32'b000000_00000_01010_00001_00000_000001;

    // #20
    // // // $display("add -----------------------")
    // $display("out =====%d\n pc ===== %d", out,pc);
#1000000

    // a = 45; b =3;current_instruction_addr = 1; //sub
    // #10;
    // // $display("sub -----------------------")
    // $display("sub ----------------------- \n op1=45 \n op2=3 \n result= %d \n pc= %d \n branch=%d\n", result,next_instruction_addr,branch);

    // a = 2; b = 3;current_instruction_addr = 2; //sll
    // #10;
    // // $display("sll -----------------------")
    // $display("sll ----------------------- \n op1=2 \n op2=3 \n result= %d \n pc= %d \n branch=%d\n", result,next_instruction_addr,branch);

    // a = 20; b = 1;current_instruction_addr = 3; //slr
    // #10;
    // // $display("slr -----------------------")
    // $display("slr ----------------------- \n op1=20 \n op2=1 \n result= %d \n pc= %d \n branch=%d\n", result,next_instruction_addr,branch);

    // a = 10; current_instruction_addr = 4; //j
    // #10;
    // // $display("slr -----------------------")
 
    // $display("j ----------------------- \n jump_to=10 \npc= %d \n branch=%d\n",next_instruction_addr,branch);

    $finish;
  end
  endmodule
