module kbuf_top 
(
	// External connections for the FPGA 
	// interface between KFLOP board and Kanalog/Konnect for the Bridgeport Discovery 308 Machine
//*******************************************
	// Kanalog Signals
	// signals from KFLOP JP7
	// SPI interface to ADC and SR input
//	input Adout,	// JP7.21	
//	input Acs,		// JP7.22
//	input Asck,		// JP7.19
//	input Adin,		// JP7.20
	input AinDout, 	// ADC Data out signal
	output AinDoutBuff,	// buffered signal to JP7.21
	
	// SPI interface to DAC and SR output
	input Dlatch,	// JP7.17	
	output Ddin,	// JP7.18
	input Dclk,		// JP7.15 - CLK on the schematic
	input Ddout,	// JP7.20
	
	input kreset,	// JP7.4 KFLOP master reset line
	
	input [15:0] ka_in,			// Kanalog inputs	
	// ka_in - optically isolated input on schematic
	// ka_in[0] - OPT_IN_0
	// ka_in[1] - OPT_IN_1 etc.
//	output [23:0] ka_out,		// Kanalog outputs
	output [15:0] ka_out,		// Kanalog outputs	- potential for 24 outputs but only 16 are connected here
	// 24V FET drive
	// ka_out[0] - FET_0
	// ka_out[1] - FET_1
	// ka_out[2] - FET_2
	// ka_out[3] - FET_3
	// ka_out[4] - FET_4
	// ka_out[5] - FET_5
	// ka_out[6] - FET_6
	// ka_out[7] - FET_7
	
	// AC Relay Drive
	// ka_out[8] - AC_0
	// ka_out[9] - AC_1
	// ka_out[10] - AC_2
	// ka_out[11] - AC_3
	// ka_out[12] - AC_4
	// ka_out[13] - AC_5
	// ka_out[14] - AC_6
	// ka_out[15] - AC_7

	output [7:0] dac_out,	// output of the first DAC shift register
	// dac_out contains the data lines of the DAC the serial load line and 
	// dac_out[0] - Keep Alive LED
	// dac_out[1] - DAC_CS*
	// dac_out[2] - SER_LOAD
	// dac_out[3] - OPTO_DATA
	// dac_out[4] - DAC67_DATA
	// dac_out[5] - DAC45_DATA
	// dac_out[6] - DAC23_DATA
	// dac_out[7] - DAC01_DATA

//*******************************************
	// Konnect Signals
	// signals from KFLOP JP6
	input k_clk,			// JP6.15  - CLKIN on the schematic
	input start_in,			// JP6.16
	inout[7:0] kdata_io,	// JP6.5-7, 10-14
	// the reset line is on both JP6 and JP7 of the KFLOP Board so it is not connected twice
	
	// konnect inputs and outputs
	input [23:0] k_in,
	// Encoder and MPG inputs
	// k_in[0] - CHR0
	// k_in[1] - CHR1
	// k_in[2] - CHR2
	// k_in[3] - CHR3
	// k_in[4] - CHR4
	// k_in[5] - CHR5
	// k_in[6] - CHR6
	// k_in[7] - CHR7
	// k_in[8] - MPG_A
	// k_in[9] - MPG_B
	
	output reg [15:0] k_out,

	
	// monitor the KFLOP Signals
	// output xAdout,
	// output xAcs,
	// output xAsck,
	// output xAdin,
	
	// output xDlatch,
	// output xDdin,
	// output xDclk,
	// output xDdout,
	
	// test outputs 
//	output xk_clk,
//	output xstart_in,
//	output [2:0] xstate,
//	output [7:0] xkdata,

//	output t_out,		// test pin
	
//	output [7:0] leds,	// Eval Board LEDs
	
	output reg dac_clk,
	
	output tp3,
	output tp4
	
	);
	
	OSCH #(.NOM_FREQ("66.50")) rc_oscillator(.STDBY(1'b0), .OSC(fpga_clk));	// using the internal 133 MHz clock - div by 2 - SEDSDBY does not need to be connected here
	
//	OSCH #(.NOM_FREQ("66.50")) rc_oscillator(.STDBY(1'b0), .OSC(fpga_clk));	// using the internal 133 MHz clock - div by 2 - SEDSDBY does not need to be connected here
	
	// assign xAdout = Adout;
	// assign xAcs = Acs;
	// assign xAsck = Asck;
	// assign xAdin = Adin;
	
	// assign xDlatch = Dlatch;
//	assign xDdin = Ddin;
	// assign xDclk = Dclk;
	// assign xDdout = Ddout;
	
//	assign Ddin = t_out;

	assign AinDoutBuff = AinDout;	// buffered ADC output
	
	wire sclk_rise;
	wire sclk_fall;
	wire ser_out;
	wire rclk_rise;
	wire rclk_fall;
	

	
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
	
	// the first shift register - kanalog U31
	SR_Latch_N #(.N(8)) sr1(.clk(fpga_clk), .clr(~kreset), .sclk(sclk_rise), .rclk(rclk_rise), .ser_in(ser_out),  .par_out(dac_out));

	wire [23:0] ka_outx;

	// opto output latch - kanalog U24, U11, U25
//	SR_Latch_N #(.N(24)) ka_out_latch(.clk(fpga_clk), .clr(~kreset), .sclk(rclk_fall), .rclk(ser_load_rise), .ser_in(dac_out[3]), .par_out(ka_out));
	SR_Latch_N #(.N(24)) ka_out_latch(.clk(fpga_clk), .clr(~kreset), .sclk(rclk_fall), .rclk(ser_load_rise), .ser_in(dac_out[3]), .par_out(ka_outx));
	
	assign ka_out[15:8] = ka_outx[7:0];

	assign ka_out[7:0] = ka_outx[15:8];
	
//	assign leds = ka_out[23:16];
//	assign leds = k_out[7:0];
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
	
//	assign TP3 = dac_out[2];
//	assign TP4 = dac_out[3];
	
	
	// konnect state machine and control
	
	parameter MY_ADDRESS = 8'b00001111;	// Konnect board address 
	
	wire dk_clk;
	wire ddk_clk;
	wire k_clk_rise;
	wire k_clk_fall;
	
	delay dly5(.clk(fpga_clk), .clr(~kreset), .async(k_clk), .sync(dk_clk));
	delay dly6(.clk(fpga_clk), .clr(~kreset), .async(dk_clk), .sync(ddk_clk));
	edge_det kclk_edge(.clk(fpga_clk), .clr(~kreset), .s_in(ddk_clk), .rise(k_clk_rise), .fall(k_clk_fall));	// konnect clock edges
	
	wire dstart_in;
	wire ddstart_in;
	wire start_in_rise;
	wire start_in_fall;
	
	delay dly7(.clk(fpga_clk), .clr(~kreset), .async(start_in), .sync(dstart_in));
	delay dly8(.clk(fpga_clk), .clr(~kreset), .async(dstart_in), .sync(ddstart_in));
	edge_det start_in_edge(.clk(fpga_clk), .clr(~kreset), .s_in(ddstart_in), .rise(start_in_rise), .fall(start_in_fall));	// konnect start_in edges
	
	wire output_en;
	reg sm_en;
	wire sm_enx;
	
	reg [2:0] state_cnt;		// state machine registers
	
	wire [7:0] data_in;			// Konnect bus data input
	reg [7:0] data_out;			// Konnect but data output - these two get muxed together with the BB primitive - equialent to Xilinx IOBUF
	
	assign sm_enx = (~start_in) & sm_en;	// state machine enable 
	assign output_en = ~(k_clk  & sm_enx & (state_cnt[2] | (state_cnt[1] & state_cnt[0])));	// output enable onto the KFLOP bus when k_clk is high and the state machine is enabled
	
	BB io_port7(.I(data_out[7]), .T(output_en), .O(data_in[7]), .B(kdata_io[7]));
	BB io_port6(.I(data_out[6]), .T(output_en), .O(data_in[6]), .B(kdata_io[6]));
	BB io_port5(.I(data_out[5]), .T(output_en), .O(data_in[5]), .B(kdata_io[5]));
	BB io_port4(.I(data_out[4]), .T(output_en), .O(data_in[4]), .B(kdata_io[4]));
	BB io_port3(.I(data_out[3]), .T(output_en), .O(data_in[3]), .B(kdata_io[3]));
	BB io_port2(.I(data_out[2]), .T(output_en), .O(data_in[2]), .B(kdata_io[2]));
	BB io_port1(.I(data_out[1]), .T(output_en), .O(data_in[1]), .B(kdata_io[1]));
	BB io_port0(.I(data_out[0]), .T(output_en), .O(data_in[0]), .B(kdata_io[0]));
	
	assign tp3 = sm_enx;
	assign tp4 = output_en;
	
	always @ (posedge fpga_clk)
	begin
		if(!kreset)
		begin
			k_out <= 16'h0000;		// all registers and outputs cleared
			sm_en <= 1'b0;
			state_cnt <= 3'b000;
		end
		else if(start_in_rise)
		begin
			state_cnt <= 3'b000;	// reset state count to start a transaction
		end
		else if(start_in_fall)
		begin
			if(data_in[7:0] == MY_ADDRESS)
				sm_en <= 1'b1;
			else
				sm_en <= 1'b0;
		end
		else if(k_clk_rise & sm_en)	// on the rising edge of k_clk increment the state machine if sm_en is set
		begin
			state_cnt <= state_cnt + 1;

//			if(state_cnt == 3'b010)			// state 2
				//data_out[7:0] <= k_in[7:0];
//				 data_out[7:0] <= 8'h55;

		end
		else if((k_clk_fall & sm_en))			// on k_clk falling edge and if sm_en is set 
		begin
			if(state_cnt == 3'b001)			// state 1 falling edge
				k_out[7:0] <= data_in[7:0];
			else if (state_cnt == 3'b010)	// state 2 falling edge
				begin
					k_out[15:8] <= data_in[7:0];
					data_out[7:0] <= k_in[7:0];				// Konnect input 7:0
					// data_out[7:0] <= 8'h55;	
				end
			else if(state_cnt == 3'b011)	// state 3
				 data_out[7:0] <= {6'b000000, k_in[9:8]};	// Konnect input 15:8
				// data_out[7:0] <= 8'haa;			
			else if(state_cnt == 3'b100)	// state 4
				 data_out[7:0] <= k_in[23:16];			// Konnect input 23:16
				// data_out[7:0] <= 8'h11;
			else if(state_cnt == 3'b101)	// state 5
				// data_out[7:0] <= k_in[31:24];			// Konnect input 31:24
				data_out[7:0] <= 8'h77;
			else if(state_cnt == 3'b110)	// state 6
				data_out[7:0] <= 8'ha5;		// Konnect End of cycle indicator
			else 
				data_out[7:0] <= 8'h00;		// state 7 - state machine idle	
			
		end
		

		
	end
	
// test outputs to monitor with the logic analyzer
//	assign xk_clk = k_clk;
//	assign xstart_in = start_in;
//	assign xstate = state_cnt;
//	assign t_out = output_en;
//	assign xkdata = data_in;

	
endmodule
	
	