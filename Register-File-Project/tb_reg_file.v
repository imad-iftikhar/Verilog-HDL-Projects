`timescale 1ns / 1ps

module tb_reg_file;
    reg clk;
    reg [1:0] address;
    reg [63:0] data_in;
    reg write_en;
    wire [63:0] data_out;
    
    regfile uut(
    .clk(clk),
    .address(address),
    .write_en(write_en),
    .data_in(data_in),
    .data_out(data_out)
    );
    
    initial begin
            clk = 0;
            forever #5 clk = ~clk;
        end
        
    initial begin
    
    address = 0;
    write_en = 0;
    data_in = 0;
    
    
    write_en=1;
    
    address=2'b00; data_in=64'd10; #10;
    address=2'b01; data_in=64'd20; #10;
    address=2'b10; data_in=64'd30; #10;
    address=2'b11; data_in=64'd40; #10;
    
    #50;
    
    
    write_en=0;
    
    address=2'b00;#10;
    address=2'b01;#10;
    address=2'b10;#10;
    address=2'b11;#10;
    
    #200;
    
    write_en=1;
        
        address=2'b00; data_in=64'd100; #50;
        address=2'b01; data_in=64'd200; #50;
        address=2'b10; data_in=64'd300; #50;
        address=2'b11; data_in=64'd400; #50;
        
        
        write_en=0;
        #200
    address = 2'b00; #20;
    address = 2'b01; #20;
    address = 2'b10; #20;
    address = 2'b11; #20;

    $finish;
    end
    
    
    
    
endmodule
