module kbuf_top 
(
	// signals from KFLOP JP7
	input Adout,	// SPI interface to ADC and SR input
	input Acs,
	input Asck,
	input Adin,
	
	input Dlatch,	// SPI interface to DAC and SR output
	output Ddin,
	input Dclk,
	input Ddout,
	
	input kreset,	// KFLOP master reset line
	
	// monitor the KFLOP Signals
	output xAdout,
	output xAcs,
	output xAsck,
	output xAdin,
	
	output xDlatch,
	output xDdin,
	output xDclk,
	output xDdout,

	input [15:0] ka_in,		// Kanalog inputs

	output [7:0] dac_out,	// output of the first DAC shift register
	
	output t_out,		// test pin
	
	output [7:0] leds,	// Eval Board LEDs
	
	output reg dac_clk
	
	);
	
	OSCH #(.NOM_FREQ("66.50")) rc_oscillator(.STDBY(1'b0), .OSC(fpga_clk));	// using the internal 133 MHz clock
	
	assign xAdout = Adout;
	assign xAcs = Acs;
	assign xAsck = Asck;
	assign xAdin = Adin;
	
	assign xDlatch = Dlatch;
//	assign xDdin = Ddin;
	assign xDclk = Dclk;
	assign xDdout = Ddout;
	
	assign Ddin = t_out;
	
	wire sclk_rise;
	wire sclk_fall;
	wire ser_out;
	wire rclk_rise;
	wire rclk_fall;
	
	wire [23:0] ka_out;
	
	wire dDclk;
	wire ddDclk;
 	delay dly1(.clk(fpga_clk), .clr(~kreset), .async(Dclk), .sync(dDclk));
	delay dly2(.clk(fpga_clk), .clr(~kreset), .async(dDclk), .sync(ddDclk));
	edge_det s_edge(.clk(fpga_clk), .clr(~kreset), .s_in(ddDclk), .rise(sclk_rise), .fall(sclk_fall));	// digitial and DAC serial clock
	
	wire dDlatch;
	wire ddDlatch;
	delay dly3(.clk(fpga_clk), .clr(~kreset), .async(Dlatch), .sync(dDlatch));
	delay dly4(.clk(fpga_clk), .clr(~kreset), .async(dDlatch), .sync(ddDlatch));
	edge_det r_edge(.clk(fpga_clk), .clr(~kreset), .s_in(ddDlatch), .rise(rclk_rise), .fall(rclk_fall)); // digital and DAC output register load
	
	sig_sync ser_edge(.clk(fpga_clk), .async(Ddout), .sync_out(ser_out));				// digital and DAC serial input - resynched

	wire ser_load_rise;
	wire ser_load_fall;
	edge_det ser_load_edge(.clk(fpga_clk), .clr(~kreset), .s_in(dac_out[2]), .rise(ser_load_rise), .fall(ser_load_fall));
	
//	assign t_out = dac_out[2];
	
	SR_Latch_N #(.N(8)) sr1(.clk(fpga_clk), .clr(~kreset), .sclk(sclk_rise), .rclk(rclk_rise), .ser_in(ser_out),  .par_out(dac_out));
	SR_Latch_N #(.N(24)) ka_out_latch(.clk(fpga_clk), .clr(~kreset), .sclk(rclk_fall), .rclk(ser_load_rise), .ser_in(dac_out[3]), .par_out(ka_out));
	
	assign leds = ka_out[23:16];
	// kanalog Inputs
	Latch_SR_N #(.N(16)) ka_in_latch(.clk(fpga_clk), .clr(~kreset), .p_in(ka_in), .load(ser_load_fall), .shift(rclk_rise), .s_in(1'b1), .s_out(Ddin));

	always @(posedge fpga_clk)	// invert and synchronize Dlatch to become the DAC clock
	begin
		if(rclk_rise)
		begin
			dac_clk <= 1'b0;
		end 
		else if (rclk_fall)
		begin
			dac_clk <= 1'b1;
		end
	end
	
	
	
endmodule
	
	