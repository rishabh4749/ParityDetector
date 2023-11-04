module serialparitydetector(clk,in,out);
  input clk,in;
  output reg[1:0]out;
  parameter S0=0,S1=1;
  reg state;
  always@(posedge clk)
    case(state)
      S0:begin
        if(!in)
          begin
            state<=S0;
            out<=2'b00;
          end
        else
          begin
            state<=S1;
            out<=2'b01;
          end
      end
      S1:begin
        if(!in)
          begin
            state<=S1;
            out<=2'b01;
          end
        else
          begin
            state<=S0;
            out<=2'b00;
          end
      end
      default:begin
            state<=S0;
            out<=2'b00;
          end
    endcase
endmodule