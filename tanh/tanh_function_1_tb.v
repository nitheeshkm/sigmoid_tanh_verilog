`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2019 01:41:52 PM
// Design Name: 
// Module Name: tanh_function_1_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tanh_function_1_tb(

    );
reg [10-1:0] data_in;
    reg c_en,clk,reset;
    wire [13-1:0] data_out;
//    wire [15:0] mult;
    integer period = 10;
    
tanh_function_1 #( 
    .integer_dataWidth_i(5), //including sign-bit
    .fraction_dataWidth_i(5),
    .integer_dataWidth_o(4),
    .fraction_dataWidth_o(9)
    )uut(
    .clk(clk),
    .reset(reset),
    .c_en(c_en),
    .data_in(data_in),
    .data_out(data_out)
    );
    
initial begin
    clk = 0;
    forever #(period/2) clk = ~clk;
end

//assign mult = 16'b00000000_01000000 - 16'b00000001_00000000; 


initial begin
    reset = 1;
    #(period*3)
    
    reset = 0;
    #(period);
    
    c_en = 1;
    #(period);
    
    data_in = 10'b0_0010_01000;
    #(period);
    
    data_in = 10'b1_1100_00100;
    #(10*period);
    
    data_in = 10'b1_1101_00100;
    #(10*period);
    
    data_in = 10'b1_1101_01111;
    #(10*period);
    
    data_in = 10'b1_1101_10000;
    #(10*period);

    data_in = 10'b1_1101_11111;
    #(10*period);
    
    data_in = 10'b1_1110_10000;
    #(10*period);
    
    data_in = 10'b1_1111_11111;
    #(10*period);
    
    data_in = 10'b1_1111_11110;
    #(10*period);
    
    data_in = 10'b1_1111_11100;
    #(10*period);
    
    data_in = 10'b1_1111_11000;
    #(10*period);
    
    data_in = 10'b1_1111_10000;
    #(10*period);
    
    data_in = 10'b1_1111_00000;
    #(10*period);
    
    data_in = 10'b0_0000_00000;
    #(10*period);
    
    data_in = 10'b0_0000_00001;
    #(10*period);
    
    data_in = 10'b0_0000_00011;
    #(10*period);
    
    data_in = 10'b0_0000_00111;
    #(10*period);
    
    data_in = 10'b0_0000_01111;
    #(10*period);
    
    data_in = 10'b0_0000_11111;
    #(10*period);
    
    data_in = 10'b0_0001_00000;
    #(10*period);
    
    data_in = 10'b0_0001_10000;
    #(10*period);
    
    data_in = 10'b0_0010_00000;
    #(10*period);
    
    data_in = 10'b0_0010_01000;
    #(10*period);
    
    data_in = 10'b0_0010_10000;
    #(10*period);
    
    data_in = 10'b0_0010_11100;
    #(10*period);
    
    data_in = 10'b0_0011_00000;
    #(10*period);
    
    data_in = 10'b0_0100_00000;
    #(10*period);
    
    data_in = 10'b0_1111_00000;
    #(10*period);
    
    data_in = 10'b0_0001_10010;
    #(10*period);
    
    $finish();
  end
endmodule
