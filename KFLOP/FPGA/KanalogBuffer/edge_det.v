module edge_det (
  input clk,
  input clr,
  input s_in,
  output rise,
  output fall);
  
  reg resync;
 
  assign rise = s_in & ~resync;
  assign fall = resync & ~s_in;
  
  always @(posedge clk)
	if(clr)
	begin
		resync <= 1'b0;
	end
	else
    begin
      resync <= s_in;
    end
endmodule