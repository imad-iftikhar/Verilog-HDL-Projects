`timescale 1ns / 1ps

module regfile(
input [1:0] address,
input write_en,
input [63:0] data_in,
input clk,
output reg [63:0] data_out
    );
    reg [63:0] r0=0,r1=0,r2=0,r3=0;
    always @(posedge clk)
    begin
    if(write_en)
    begin
    case(address)
    2'b00: r0<=data_in;
    2'b01: r1<=data_in;
    2'b10: r2<=data_in;
    2'b11: r3<=data_in;
    endcase
    
        end
    end
   always @(*)
   begin
       case(address)
           2'b00: data_out = r0;
           2'b01: data_out = r1;
           2'b10: data_out = r2;
           2'b11: data_out = r3;
       endcase
   end 
endmodule
