module Latch_SR_N #(parameter N=16)
(
	input clk,
	input clr,
	input [N-1:0] p_in,
	input shift,
	input load,
	input s_in,
	output s_out
);

	reg [N-1:0] ff;
	
	assign s_out = ff[0];

	always @(posedge clk)
	begin
		if(clr)
		begin
			ff <= 0;
		end
		else if(load)
		begin
			ff <= p_in;
		end
		else if(shift)
		begin
			ff <= {s_in, ff[N-1:1]};
		end
	end

endmodule