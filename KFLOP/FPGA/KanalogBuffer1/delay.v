module delay
(
	input clk,
	input clr,
	input async,
	output reg sync
);

	always @(posedge clk)
	begin
		if(clr)
		begin
			sync <= 1'b0;
		end
		else 
		begin
			sync <= async;
		end
	end
endmodule