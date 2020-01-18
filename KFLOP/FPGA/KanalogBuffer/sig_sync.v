module sig_sync(
  input clk,
  input async,
  output sync_out
);
 
  reg  [1:0] resync;
  
  assign sync_out = resync[0];
  
  always @(posedge clk)
    begin
      resync <= {async, resync[1]};
    end
endmodule