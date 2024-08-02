module jk_flipflop( input [1:0]j,
                   input clk,
                   input reset,
                   output reg [1:0]qn);
  
  reg [95:0] state_keyword;
  always@(posedge clk or posedge reset)
    begin
     if(j == 2'b00)
        begin
          qn = qn;
          state_keyword ="Nochange";
        end
      else if(j == 2'b01)
        begin
          qn <= 0;
          state_keyword ="RESET";
        end
      else if(j == 2'b10)
        begin
          qn <= 1;
          state_keyword ="SET";
        end
          else if(j == 2'b11)
            begin
              qn <= ~qn;
              state_keyword ="toggle";
            end
        end
       initial
        begin
          $monitor("Time = %0d , input j = %b , output qn = %b , state = %s" , $time , j,qn,state_keyword);
        end
      initial
        begin
          $dumpfile("dump.vcd");
          $dumpvars(0,jk_flipflop);
        end
      initial
        begin
          #150
          $finish;
        end
      endmodule
