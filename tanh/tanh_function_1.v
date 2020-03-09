`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UMBC-EEHPC
// Engineer: Nitheesh Manjunath
// 
// Create Date: 09/19/2019 01:21:38 PM
// Design Name: 
// Module Name: tanh_function_1
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
//Note that the input must be 5'bit sign number between -7.00 to +7.00. Limitation is in Sigmoid number

module tanh_function_1#(
    parameter integer_dataWidth_i = 5, //including sign-bit
    parameter fraction_dataWidth_i =  5,
    parameter integer_dataWidth_o = 3,
    parameter fraction_dataWidth_o = 9
    )
    (
    input wire clk,
    input wire reset,
    input wire c_en,
    input wire [integer_dataWidth_i-1:-fraction_dataWidth_i] data_in,
    output wire [9:0] data_out
    );
    
(* keep = "true" *) reg [integer_dataWidth_i-1:-fraction_dataWidth_i] data_in_internal_1;
(* keep = "true" *) reg [19:0] data_out_internal;



wire [9:0] sigmoid_out;

wire  [19:0] mult_out, mult_out_1;

sigmoid_function #( 
    .integer_dataWidth_i(integer_dataWidth_i), //including sign-bit
    .fraction_dataWidth_i(fraction_dataWidth_i),
    .integer_dataWidth_o(2),
    .fraction_dataWidth_o(8)
    )uut(
    .clk(clk),
    .reset(reset),
    .c_en(c_en),
    .data_in(mult_out[15:5]),
    .data_out(sigmoid_out)
    );
    
//mult_gen_1 
//        multiplier_0(.A(data_in),
//                     .B(10'b00010_00000),
//                     .P(mult_out));
                     
constant_coeff_multiplier #(
    .constant_coeff(10'b00010_00000),
    .dataWidth_i(integer_dataWidth_i+fraction_dataWidth_i),
    .dataWidth_o(20)
    )multiplier_0(
//    .clk(clk),
    .A(data_in),
//    .P_seq(mult)
    .P_combi(mult_out)
    );

//mult_gen_1
//    multiplier_1(.A(sigmoid_out),
//                 .B(10'b10_0000000),
//                 .P(mult_out_1));
                 
constant_coeff_multiplier #(
     .constant_coeff(10'b10_0000000),
     .dataWidth_i(10),
     .dataWidth_o(20)
     )multiplier_1(
 //    .clk(clk),
     .A(sigmoid_out),
 //    .P_seq(mult)
     .P_combi(mult_out_1)
     );
                 

always@(posedge clk) begin
    if(reset) begin
        data_out_internal <= 0;
    end
    else begin
        data_out_internal <= mult_out_1 - 19'b0001_000000000000000;
    end
end

assign data_out = data_out_internal[17:8];

endmodule
