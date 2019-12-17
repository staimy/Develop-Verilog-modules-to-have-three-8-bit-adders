
module adder_hw4_tb();
  reg [7:0] in1,in2,in3,in4;
  reg [1:0] enbl;
  reg clk,rst;
  wire [7:0] out;
  
  adder_hw4 uut(.clk(clk),
                .enbl(enbl),
                .in1(in1),
                .in2(in2),
                .in3(in3),
                .in4(in4),
                .rst(rst),
                .out(out));
  
   initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  initial begin
    rst <=1;
    
    $monitor("%d Values Reset=%d Enable=%d A=%d B=%d C=%d E=%d Sum=%d",$time,rst,enbl,in1,in2,in3,in4,out);
    
    #20
    rst <=0;
    enbl <= 0;
    in1  <= 2;
    in2 <= 3;
    in3  <= 4;
    in4 <= 5;
    #20
    enbl  <= 1;
    #20
    enbl  <= 2;
    #200 $finish;  
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
end
 
endmodule