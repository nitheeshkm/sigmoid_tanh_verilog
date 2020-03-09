`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2019 08:29:17 PM
// Design Name: 
// Module Name: sigmoid_function_tb
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


module sigmoid_function_tb(

    );
    
reg [10-1:0] data_in;
reg c_en,clk,reset;
wire [10-1:0] data_out;
reg signed [15:0] mult;
integer period = 10;

sigmoid_function #( 
    .integer_dataWidth_i(5), //including sign-bit
    .fraction_dataWidth_i(5),
    .integer_dataWidth_o(1),
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

//assign mult = 5'b01111 * 8'b00110011; 
//assign mult =  16'b00000000_01000000 - 16'b00000010_00000000;

initial begin
    reset = 1;
    #(period*3)
    
    reset = 0;
    #(period);
    
    mult =  ((16'b00000000_10000000 - 16'b00000101_00000000) * 16'b00000000_100000000);
    #(period);
    
//    mult =  16'b00000000_10000000 - 16'b00000100_00000000;
//    #(period);
    
//    mult =  16'b00000000_10000000 - 16'b00000011_00000000;
//    #(period);
    
//    mult =  16'b00000000_10000000 - 16'b00000010_00000000;
//    #(period);
    
//    mult =  16'b00000000_10000000 - 16'b00000001_00000000;
//    #(period);
    
    c_en = 1;
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
