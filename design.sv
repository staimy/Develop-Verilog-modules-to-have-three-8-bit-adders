// Code your design here
module adder_hw4(in1,in2,in3,in4,out,enbl,clk,rst);
  input [7:0] in1,in2,in3,in4;
  input [1:0] enbl;
  input clk,rst;
  output reg [7:0] out;
  
  wire [7:0] out1,out2,sum;
  reg [7:0] a,b,c,d,sum1,sum2;

  always@(posedge clk or negedge rst)begin
    if(rst)begin
      a<=0;b<=0;c<=0;d<=0;
      out<=0;sum1<=0;sum2<=0;
    end
    else begin
      out<= sum;
      if(enbl==0)begin
        a<=in1;
        b<=in2;
      end
      if(enbl==1)begin
        c<=in3;
        sum1<=out1;
      end
      if(enbl==2)begin
        d<=in4;
        sum2<=out2;
      end
    end
  end
  
  assign out1 = a+b;
  assign out2 = c+sum1;
  assign sum = d+ sum2;
  

endmodule