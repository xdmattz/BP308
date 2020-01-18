module SR_Latch_N #(parameter N=8)
(
  // port definitions
  input clk,
  input clr,
  input sclk,
  input rclk,
  input ser_in,
  output reg [N-1:0] par_out
  );
  
  reg [N-1:0] ff;
   
  assign test_out = rclk;
  
  always @(posedge clk)
    begin
      if (clr)
        begin
          	ff <= 0;	// reset
			par_out <= 0; 
        end else if (sclk)
        begin
		  ff <= {ser_in, ff[N-1:1]};	// left shift into the LSB
        end else if (rclk)
        begin
             par_out <= ff;
        end
    end

endmodule