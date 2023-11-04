module tb;
  reg clk;
  reg in;
  wire [1:0]out;
  reg state;
  serialparitydetector s0(clk,in,out);
  always #1 clk=~clk;
  initial
    begin
      clk=1'b1;
      #2;
      in=1'b0;
      #2;
      in=1'b1;
      #2;
      in=1'b0;
      #2;
      in=1'b1;
      #2;
      in=1'b0;
      #2;
      #100 $finish;
    end
   initial
    begin
      $dumpfile("serialparitydetector.vcd");
      $dumpvars(0,tb);
      $monitor($time," out=%b in=%b",out,in);
    end
endmodule
    