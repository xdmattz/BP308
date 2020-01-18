module SR_24_out
(
	input clk,	
	input clr,
	input sclk,
	input rclk,
	input ser_in,
	output reg [23:0] dig_out
);

reg [23:0] ff;

always @(posedge clk)
	if (clr)
	begin
		ff <= 24'b0;
		dig_out <= 24'b0;
	end 
	else if (sclk)
	begin
		ff <= {ff[22:0], ser_in};	// left shift into the LSB
	end
	else if (rclk)
	begin
		dig_out <= ff;
	end
			

endmodule