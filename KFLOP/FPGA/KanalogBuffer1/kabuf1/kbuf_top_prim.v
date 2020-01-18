// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.10.2.115
// Netlist written on Sat Dec 08 15:54:07 2018
//
// Verilog Description of module kbuf_top
//

module kbuf_top (Dlatch, Ddin, Dclk, Ddout, kreset, ka_in, ka_out, 
            dac_out, k_clk, start_in, kdata_io, k_out, xk_clk, xstart_in, 
            xstate, xkdata, t_out, dac_clk) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(1[8:16])
    input Dlatch;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(12[8:14])
    output Ddin;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(13[9:13])
    input Dclk;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(14[8:12])
    input Ddout;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(15[8:13])
    input kreset;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(17[8:14])
    input [15:0]ka_in;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    output [7:0]ka_out;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(21[15:21])
    output [7:0]dac_out;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(23[15:22])
    input k_clk;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(27[8:13])
    input start_in;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(28[8:16])
    inout [7:0]kdata_io;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(29[13:21])
    output [15:0]k_out;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    output xk_clk;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(48[9:15])
    output xstart_in;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(49[9:18])
    output [2:0]xstate;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(50[15:21])
    output [7:0]xkdata;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(51[15:21])
    output t_out;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(55[9:14])
    output dac_clk;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(59[13:20])
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    wire GND_net, VCC_net, Dlatch_c, Ddin_c_0, Dclk_c, Ddout_c, 
        kreset_c, ka_in_c_15, ka_in_c_14, ka_in_c_13, ka_in_c_12, 
        ka_in_c_11, ka_in_c_10, ka_in_c_9, ka_in_c_8, ka_in_c_7, ka_in_c_6, 
        ka_in_c_5, ka_in_c_4, ka_in_c_3, ka_in_c_2, ka_in_c_1, ka_in_c_0, 
        ka_out_c_7, ka_out_c_6, ka_out_c_5, ka_out_c_4, ka_out_c_3, 
        ka_out_c_2, ka_out_c_1, ka_out_c_0, dac_out_c_7, dac_out_c_6, 
        dac_out_c_5, dac_out_c_4, dac_out_c_3, dac_out_c_2, dac_out_c_1, 
        dac_out_c_0, xk_clk_c_c, xstart_in_c_c, k_out_c_15, k_out_c_14, 
        k_out_c_13, k_out_c_12, k_out_c_11, k_out_c_10, k_out_c_9, 
        k_out_c_8, k_out_c_7, k_out_c_6, k_out_c_5, k_out_c_4, k_out_c_3, 
        k_out_c_2, k_out_c_1, k_out_c_0, xstate_c_2, xstate_c_1, xstate_c_0, 
        xkdata_c_7, xkdata_c_6, xkdata_c_5, xkdata_c_4, xkdata_c_3, 
        xkdata_c_2, xkdata_c_1, xkdata_c_0, dac_clk_c, ser_out, dDclk, 
        ddDclk, dDlatch, ddDlatch, dk_clk, ddk_clk, dstart_in, ddstart_in, 
        sm_en;
    wire [7:0]data_out;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(155[12:20])
    
    wire n990, t_out_N_59, t_out_N_57, sm_en_N_66, n450, fpga_clk_enable_77, 
        n551, n550, n549, n547, n546, n545, n544, fpga_clk_enable_49, 
        fpga_clk_enable_63, fpga_clk_enable_56, fpga_clk_enable_33, fpga_clk_enable_35, 
        fpga_clk_enable_42, n609, n988, n412, n411, n413, resync, 
        resync_adj_139, resync_adj_140, fpga_clk_enable_9, n996, n995, 
        n619;
    wire [15:0]ff_adj_155;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(12[14:16])
    
    wire n989, n994;
    wire [15:0]ff_15__N_123;
    
    wire fpga_clk_enable_26, resync_adj_141, fpga_clk_enable_10, n987, 
        fpga_clk_enable_18, n992, n999, resync_adj_142, n961;
    
    VHI i2 (.Z(VCC_net));
    edge_det start_in_edge (.resync(resync_adj_142), .fpga_clk(fpga_clk), 
            .n994(n994), .ddstart_in(ddstart_in), .kreset_c(kreset_c), 
            .fpga_clk_enable_35(fpga_clk_enable_35)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(146[11:118])
    BB io_port7 (.I(data_out[7]), .T(t_out_N_57), .B(kdata_io[7]), .O(xkdata_c_7)) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(160[5:78])
    delay_U10 dly2 (.ddDclk(ddDclk), .fpga_clk(fpga_clk), .n994(n994), 
            .dDclk(dDclk)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(88[8:73])
    FD1P3IX k_out__i1 (.D(xkdata_c_0), .SP(fpga_clk_enable_18), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_0));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i1.GSR = "ENABLED";
    LUT4 m1_lut (.Z(n999)) /* synthesis lut_function=1, syn_instantiated=1 */ ;
    defparam m1_lut.init = 16'hffff;
    OB ka_out_pad_4 (.I(ka_out_c_4), .O(ka_out[4]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(21[15:21])
    OSCH rc_oscillator (.STDBY(GND_net), .OSC(fpga_clk)) /* synthesis syn_instantiated=1 */ ;
    defparam rc_oscillator.NOM_FREQ = "66.50";
    OB ka_out_pad_5 (.I(ka_out_c_5), .O(ka_out[5]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(21[15:21])
    OB dac_out_pad_2 (.I(dac_out_c_2), .O(dac_out[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(23[15:22])
    OB dac_out_pad_1 (.I(dac_out_c_1), .O(dac_out[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(23[15:22])
    FD1P3IX state_cnt__i1 (.D(n413), .SP(fpga_clk_enable_35), .CD(n609), 
            .CK(fpga_clk), .Q(xstate_c_0));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam state_cnt__i1.GSR = "ENABLED";
    FD1P3IX data_out__i0 (.D(n551), .SP(fpga_clk_enable_42), .CD(n619), 
            .CK(fpga_clk), .Q(data_out[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam data_out__i0.GSR = "ENABLED";
    BB io_port6 (.I(data_out[6]), .T(t_out_N_57), .B(kdata_io[6]), .O(xkdata_c_6)) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(161[5:78])
    BB io_port5 (.I(data_out[5]), .T(t_out_N_57), .B(kdata_io[5]), .O(xkdata_c_5)) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(162[5:78])
    BB io_port4 (.I(data_out[4]), .T(t_out_N_57), .B(kdata_io[4]), .O(xkdata_c_4)) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(163[5:78])
    BB io_port3 (.I(data_out[3]), .T(t_out_N_57), .B(kdata_io[3]), .O(xkdata_c_3)) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(164[5:78])
    BB io_port2 (.I(data_out[2]), .T(t_out_N_57), .B(kdata_io[2]), .O(xkdata_c_2)) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(165[5:78])
    BB io_port1 (.I(data_out[1]), .T(t_out_N_57), .B(kdata_io[1]), .O(xkdata_c_1)) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(166[5:78])
    BB io_port0 (.I(data_out[0]), .T(t_out_N_57), .B(kdata_io[0]), .O(xkdata_c_0)) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(167[5:78])
    OB ka_out_pad_6 (.I(ka_out_c_6), .O(ka_out[6]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(21[15:21])
    delay_U9 dly3 (.dDlatch(dDlatch), .fpga_clk(fpga_clk), .n994(n994), 
            .Dlatch_c(Dlatch_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(93[8:75])
    OB ka_out_pad_2 (.I(ka_out_c_2), .O(ka_out[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(21[15:21])
    OB ka_out_pad_3 (.I(ka_out_c_3), .O(ka_out[3]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(21[15:21])
    delay_U8 dly4 (.ddDlatch(ddDlatch), .fpga_clk(fpga_clk), .n994(n994), 
            .dDlatch(dDlatch)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(94[8:77])
    delay_U7 dly5 (.dk_clk(dk_clk), .fpga_clk(fpga_clk), .n994(n994), 
            .xk_clk_c_c(xk_clk_c_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(135[8:73])
    FD1P3IX sm_en_79 (.D(sm_en_N_66), .SP(fpga_clk_enable_9), .CD(n994), 
            .CK(fpga_clk), .Q(sm_en));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam sm_en_79.GSR = "ENABLED";
    FD1P3IX dac_clk_77 (.D(n999), .SP(fpga_clk_enable_10), .CD(n990), 
            .CK(fpga_clk), .Q(dac_clk_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(114[9] 124[5])
    defparam dac_clk_77.GSR = "ENABLED";
    delay_U6 dly6 (.ddk_clk(ddk_clk), .fpga_clk(fpga_clk), .n994(n994), 
            .dk_clk(dk_clk)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(136[8:75])
    delay_U11 dly1 (.dDclk(dDclk), .fpga_clk(fpga_clk), .n994(n994), .Dclk_c(Dclk_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(87[9:72])
    delay_U5 dly7 (.dstart_in(dstart_in), .fpga_clk(fpga_clk), .n994(n994), 
            .xstart_in_c_c(xstart_in_c_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(144[8:79])
    OB ka_out_pad_7 (.I(ka_out_c_7), .O(ka_out[7]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(21[15:21])
    edge_det_U2 r_edge (.resync(resync_adj_139), .fpga_clk(fpga_clk), .n994(n994), 
            .ddDlatch(ddDlatch), .n990(n990), .fpga_clk_enable_10(fpga_clk_enable_10)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(95[11:101])
    FD1P3IX k_out__i2 (.D(xkdata_c_1), .SP(fpga_clk_enable_18), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_1));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i2.GSR = "ENABLED";
    OB Ddin_pad (.I(Ddin_c_0), .O(Ddin));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(13[9:13])
    LUT4 i461_2_lut_3_lut_3_lut (.A(xstate_c_1), .B(xstate_c_0), .C(xstate_c_2), 
         .Z(n549)) /* synthesis lut_function=(A ((C)+!B)+!A (B (C))) */ ;
    defparam i461_2_lut_3_lut_3_lut.init = 16'he2e2;
    OB dac_out_pad_3 (.I(dac_out_c_3), .O(dac_out[3]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(23[15:22])
    OB dac_out_pad_4 (.I(dac_out_c_4), .O(dac_out[4]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(23[15:22])
    OB dac_out_pad_5 (.I(dac_out_c_5), .O(dac_out[5]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(23[15:22])
    OB dac_out_pad_6 (.I(dac_out_c_6), .O(dac_out[6]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(23[15:22])
    OB dac_out_pad_7 (.I(dac_out_c_7), .O(dac_out[7]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(23[15:22])
    OB ka_out_pad_0 (.I(ka_out_c_0), .O(ka_out[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(21[15:21])
    OB ka_out_pad_1 (.I(ka_out_c_1), .O(ka_out[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(21[15:21])
    OB dac_out_pad_0 (.I(dac_out_c_0), .O(dac_out[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(23[15:22])
    OB k_out_pad_15 (.I(k_out_c_15), .O(k_out[15]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_14 (.I(k_out_c_14), .O(k_out[14]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_13 (.I(k_out_c_13), .O(k_out[13]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_12 (.I(k_out_c_12), .O(k_out[12]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_11 (.I(k_out_c_11), .O(k_out[11]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_10 (.I(k_out_c_10), .O(k_out[10]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_9 (.I(k_out_c_9), .O(k_out[9]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_8 (.I(k_out_c_8), .O(k_out[8]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_7 (.I(k_out_c_7), .O(k_out[7]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_6 (.I(k_out_c_6), .O(k_out[6]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_5 (.I(k_out_c_5), .O(k_out[5]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_4 (.I(k_out_c_4), .O(k_out[4]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_3 (.I(k_out_c_3), .O(k_out[3]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_2 (.I(k_out_c_2), .O(k_out[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_1 (.I(k_out_c_1), .O(k_out[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB k_out_pad_0 (.I(k_out_c_0), .O(k_out[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(34[20:25])
    OB xk_clk_pad (.I(xk_clk_c_c), .O(xk_clk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(48[9:15])
    OB xstart_in_pad (.I(xstart_in_c_c), .O(xstart_in));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(49[9:18])
    OB xstate_pad_2 (.I(xstate_c_2), .O(xstate[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(50[15:21])
    OB xstate_pad_1 (.I(xstate_c_1), .O(xstate[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(50[15:21])
    OB xstate_pad_0 (.I(xstate_c_0), .O(xstate[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(50[15:21])
    OB xkdata_pad_7 (.I(xkdata_c_7), .O(xkdata[7]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(51[15:21])
    OB xkdata_pad_6 (.I(xkdata_c_6), .O(xkdata[6]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(51[15:21])
    OB xkdata_pad_5 (.I(xkdata_c_5), .O(xkdata[5]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(51[15:21])
    OB xkdata_pad_4 (.I(xkdata_c_4), .O(xkdata[4]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(51[15:21])
    OB xkdata_pad_3 (.I(xkdata_c_3), .O(xkdata[3]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(51[15:21])
    OB xkdata_pad_2 (.I(xkdata_c_2), .O(xkdata[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(51[15:21])
    OB xkdata_pad_1 (.I(xkdata_c_1), .O(xkdata[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(51[15:21])
    OB xkdata_pad_0 (.I(xkdata_c_0), .O(xkdata[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(51[15:21])
    OB t_out_pad (.I(t_out_N_57), .O(t_out));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(55[9:14])
    OB dac_clk_pad (.I(dac_clk_c), .O(dac_clk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(59[13:20])
    IB Dlatch_pad (.I(Dlatch), .O(Dlatch_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(12[8:14])
    IB Dclk_pad (.I(Dclk), .O(Dclk_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(14[8:12])
    IB Ddout_pad (.I(Ddout), .O(Ddout_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(15[8:13])
    IB kreset_pad (.I(kreset), .O(kreset_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(17[8:14])
    IB ka_in_pad_15 (.I(ka_in[15]), .O(ka_in_c_15));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_14 (.I(ka_in[14]), .O(ka_in_c_14));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_13 (.I(ka_in[13]), .O(ka_in_c_13));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_12 (.I(ka_in[12]), .O(ka_in_c_12));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_11 (.I(ka_in[11]), .O(ka_in_c_11));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_10 (.I(ka_in[10]), .O(ka_in_c_10));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_9 (.I(ka_in[9]), .O(ka_in_c_9));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_8 (.I(ka_in[8]), .O(ka_in_c_8));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_7 (.I(ka_in[7]), .O(ka_in_c_7));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_6 (.I(ka_in[6]), .O(ka_in_c_6));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_5 (.I(ka_in[5]), .O(ka_in_c_5));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_4 (.I(ka_in[4]), .O(ka_in_c_4));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_3 (.I(ka_in[3]), .O(ka_in_c_3));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_2 (.I(ka_in[2]), .O(ka_in_c_2));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_1 (.I(ka_in[1]), .O(ka_in_c_1));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB ka_in_pad_0 (.I(ka_in[0]), .O(ka_in_c_0));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(19[15:20])
    IB xk_clk_c_pad (.I(k_clk), .O(xk_clk_c_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(27[8:13])
    IB xstart_in_c_pad (.I(start_in), .O(xstart_in_c_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(28[8:16])
    LUT4 xstate_2__I_0_3_lut (.A(xstate_c_2), .B(xstate_c_1), .C(xstate_c_0), 
         .Z(t_out_N_59)) /* synthesis lut_function=(A+(B (C))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(158[41:87])
    defparam xstate_2__I_0_3_lut.init = 16'heaea;
    FD1P3IX k_out__i3 (.D(xkdata_c_2), .SP(fpga_clk_enable_18), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_2));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i3.GSR = "ENABLED";
    FD1P3IX k_out__i4 (.D(xkdata_c_3), .SP(fpga_clk_enable_18), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_3));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i4.GSR = "ENABLED";
    FD1P3IX k_out__i5 (.D(xkdata_c_4), .SP(fpga_clk_enable_18), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_4));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i5.GSR = "ENABLED";
    FD1P3IX k_out__i6 (.D(xkdata_c_5), .SP(fpga_clk_enable_18), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_5));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i6.GSR = "ENABLED";
    FD1P3IX k_out__i7 (.D(xkdata_c_6), .SP(fpga_clk_enable_18), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_6));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i7.GSR = "ENABLED";
    FD1P3IX k_out__i8 (.D(xkdata_c_7), .SP(fpga_clk_enable_18), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_7));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i8.GSR = "ENABLED";
    FD1P3IX k_out__i9 (.D(xkdata_c_0), .SP(fpga_clk_enable_26), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_8));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i9.GSR = "ENABLED";
    FD1P3IX k_out__i10 (.D(xkdata_c_1), .SP(fpga_clk_enable_26), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_9));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i10.GSR = "ENABLED";
    FD1P3IX k_out__i11 (.D(xkdata_c_2), .SP(fpga_clk_enable_26), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_10));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i11.GSR = "ENABLED";
    FD1P3IX k_out__i12 (.D(xkdata_c_3), .SP(fpga_clk_enable_26), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_11));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i12.GSR = "ENABLED";
    FD1P3IX k_out__i13 (.D(xkdata_c_4), .SP(fpga_clk_enable_26), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_12));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i13.GSR = "ENABLED";
    FD1P3IX k_out__i14 (.D(xkdata_c_5), .SP(fpga_clk_enable_26), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_13));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i14.GSR = "ENABLED";
    FD1P3IX k_out__i15 (.D(xkdata_c_6), .SP(fpga_clk_enable_26), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_14));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i15.GSR = "ENABLED";
    FD1P3IX k_out__i16 (.D(xkdata_c_7), .SP(fpga_clk_enable_26), .CD(n994), 
            .CK(fpga_clk), .Q(k_out_c_15));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam k_out__i16.GSR = "ENABLED";
    FD1P3IX state_cnt__i2 (.D(n412), .SP(fpga_clk_enable_35), .CD(n609), 
            .CK(fpga_clk), .Q(xstate_c_1));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam state_cnt__i2.GSR = "ENABLED";
    FD1P3IX state_cnt__i3 (.D(n411), .SP(fpga_clk_enable_35), .CD(n609), 
            .CK(fpga_clk), .Q(xstate_c_2));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam state_cnt__i3.GSR = "ENABLED";
    FD1P3IX data_out__i1 (.D(n550), .SP(fpga_clk_enable_42), .CD(n619), 
            .CK(fpga_clk), .Q(data_out[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam data_out__i1.GSR = "ENABLED";
    FD1P3IX data_out__i2 (.D(n549), .SP(fpga_clk_enable_42), .CD(n619), 
            .CK(fpga_clk), .Q(data_out[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam data_out__i2.GSR = "ENABLED";
    FD1P3IX data_out__i3 (.D(n961), .SP(fpga_clk_enable_42), .CD(n619), 
            .CK(fpga_clk), .Q(data_out[3]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam data_out__i3.GSR = "ENABLED";
    FD1P3IX data_out__i4 (.D(n547), .SP(fpga_clk_enable_42), .CD(n619), 
            .CK(fpga_clk), .Q(data_out[4]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam data_out__i4.GSR = "ENABLED";
    FD1P3IX data_out__i5 (.D(n546), .SP(fpga_clk_enable_42), .CD(n619), 
            .CK(fpga_clk), .Q(data_out[5]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam data_out__i5.GSR = "ENABLED";
    FD1P3IX data_out__i6 (.D(n545), .SP(fpga_clk_enable_42), .CD(n619), 
            .CK(fpga_clk), .Q(data_out[6]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam data_out__i6.GSR = "ENABLED";
    FD1P3IX data_out__i7 (.D(n544), .SP(fpga_clk_enable_42), .CD(n619), 
            .CK(fpga_clk), .Q(data_out[7]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam data_out__i7.GSR = "ENABLED";
    edge_det_U1 s_edge (.resync(resync), .fpga_clk(fpga_clk), .n994(n994), 
            .ddDclk(ddDclk)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(89[11:99])
    LUT4 mux_174_i7_3_lut_3_lut_3_lut (.A(xstate_c_1), .B(xstate_c_0), .C(xstate_c_2), 
         .Z(n545)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A (B (C))) */ ;
    defparam mux_174_i7_3_lut_3_lut_3_lut.init = 16'hc2c2;
    LUT4 i3_4_lut_then_4_lut (.A(resync_adj_141), .B(sm_en), .C(ddk_clk), 
         .D(ddstart_in), .Z(n996)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;
    defparam i3_4_lut_then_4_lut.init = 16'h0800;
    LUT4 i463_2_lut_rep_9 (.A(xstate_c_1), .B(xstate_c_2), .Z(n989)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(201[9] 219[28])
    defparam i463_2_lut_rep_9.init = 16'h2222;
    LUT4 i3_4_lut_else_4_lut (.A(resync_adj_141), .B(sm_en), .C(ddk_clk), 
         .D(ddstart_in), .Z(n995)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i3_4_lut_else_4_lut.init = 16'h0008;
    LUT4 mux_174_i8_3_lut_3_lut_3_lut (.A(xstate_c_1), .B(xstate_c_0), .C(xstate_c_2), 
         .Z(n544)) /* synthesis lut_function=(!((B (C)+!B !(C))+!A)) */ ;
    defparam mux_174_i8_3_lut_3_lut_3_lut.init = 16'h2828;
    LUT4 i2_3_lut_rep_7 (.A(xstate_c_1), .B(xstate_c_2), .C(xstate_c_0), 
         .Z(n987)) /* synthesis lut_function=(A+(B+!(C))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam i2_3_lut_rep_7.init = 16'hefef;
    LUT4 mux_174_i6_3_lut_4_lut_3_lut (.A(xstate_c_1), .B(xstate_c_0), .C(xstate_c_2), 
         .Z(n546)) /* synthesis lut_function=(A (B+(C))+!A (B (C))) */ ;
    defparam mux_174_i6_3_lut_4_lut_3_lut.init = 16'he8e8;
    LUT4 i299_2_lut_3_lut (.A(xstate_c_1), .B(xstate_c_0), .C(xstate_c_2), 
         .Z(n547)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A (C)) */ ;
    defparam i299_2_lut_3_lut.init = 16'hd2d2;
    LUT4 i1_2_lut_3_lut_3_lut (.A(xstate_c_1), .B(xstate_c_0), .C(xstate_c_2), 
         .Z(n961)) /* synthesis lut_function=(!(((C)+!B)+!A)) */ ;
    defparam i1_2_lut_3_lut_3_lut.init = 16'h0808;
    LUT4 i460_2_lut_4_lut_3_lut (.A(xstate_c_1), .B(xstate_c_0), .C(xstate_c_2), 
         .Z(n550)) /* synthesis lut_function=(A (B)+!A (B (C))) */ ;
    defparam i460_2_lut_4_lut_3_lut.init = 16'hc8c8;
    edge_det_U0 ser_load_edge (.resync(resync_adj_140), .fpga_clk(fpga_clk), 
            .n994(n994), .dac_out_c_2(dac_out_c_2), .n992(n992), .ka_in_c_9(ka_in_c_9), 
            .\ff[10] (ff_adj_155[10]), .ff_15__N_123({ff_15__N_123}), .ka_in_c_4(ka_in_c_4), 
            .\ff[5] (ff_adj_155[5]), .ka_in_c_7(ka_in_c_7), .\ff[8] (ff_adj_155[8]), 
            .ka_in_c_3(ka_in_c_3), .\ff[4] (ff_adj_155[4]), .ka_in_c_5(ka_in_c_5), 
            .\ff[6] (ff_adj_155[6]), .ka_in_c_6(ka_in_c_6), .\ff[7] (ff_adj_155[7]), 
            .ka_in_c_2(ka_in_c_2), .\ff[3] (ff_adj_155[3]), .ka_in_c_1(ka_in_c_1), 
            .\ff[2] (ff_adj_155[2]), .ka_in_c_13(ka_in_c_13), .\ff[14] (ff_adj_155[14]), 
            .ka_in_c_15(ka_in_c_15), .ka_in_c_12(ka_in_c_12), .\ff[13] (ff_adj_155[13]), 
            .ka_in_c_11(ka_in_c_11), .\ff[12] (ff_adj_155[12]), .ka_in_c_10(ka_in_c_10), 
            .\ff[11] (ff_adj_155[11]), .ka_in_c_8(ka_in_c_8), .\ff[9] (ff_adj_155[9]), 
            .ka_in_c_0(ka_in_c_0), .\ff[1] (ff_adj_155[1]), .ka_in_c_14(ka_in_c_14), 
            .\ff[15] (ff_adj_155[15])) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(101[11:118])
    Latch_SR_N ka_in_latch (.\ff[13] (ff_adj_155[13]), .fpga_clk(fpga_clk), 
            .fpga_clk_enable_77(fpga_clk_enable_77), .n994(n994), .ff_15__N_123({ff_15__N_123}), 
            .\ff[15] (ff_adj_155[15]), .\ff[12] (ff_adj_155[12]), .\ff[11] (ff_adj_155[11]), 
            .\ff[10] (ff_adj_155[10]), .\ff[9] (ff_adj_155[9]), .\ff[8] (ff_adj_155[8]), 
            .\ff[7] (ff_adj_155[7]), .\ff[6] (ff_adj_155[6]), .\ff[5] (ff_adj_155[5]), 
            .\ff[4] (ff_adj_155[4]), .\ff[3] (ff_adj_155[3]), .\ff[2] (ff_adj_155[2]), 
            .\ff[1] (ff_adj_155[1]), .Ddin_c_0(Ddin_c_0), .\ff[14] (ff_adj_155[14])) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(112[23:147])
    LUT4 xstate_c_0_bdd_4_lut (.A(xstate_c_0), .B(fpga_clk_enable_42), .C(xstate_c_2), 
         .D(xstate_c_1), .Z(n619)) /* synthesis lut_function=(A (B (C (D)))+!A !((C+(D))+!B)) */ ;
    defparam xstate_c_0_bdd_4_lut.init = 16'h8004;
    LUT4 i1_2_lut (.A(resync_adj_142), .B(ddstart_in), .Z(fpga_clk_enable_9)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(169[9] 222[5])
    defparam i1_2_lut.init = 16'h2222;
    LUT4 kreset_I_0_1_lut_rep_14 (.A(kreset_c), .Z(n994)) /* synthesis lut_function=(!(A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(112[56:63])
    defparam kreset_I_0_1_lut_rep_14.init = 16'h5555;
    LUT4 i3_4_lut (.A(xkdata_c_0), .B(xkdata_c_2), .C(xkdata_c_1), .D(xkdata_c_3), 
         .Z(sm_en_N_66)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3_4_lut.init = 16'h8000;
    LUT4 i2_3_lut_4_lut_4_lut (.A(kreset_c), .B(n989), .C(xstate_c_0), 
         .D(n450), .Z(fpga_clk_enable_26)) /* synthesis lut_function=(!(A ((C+!(D))+!B)+!A ((C)+!B))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(112[56:63])
    defparam i2_3_lut_4_lut_4_lut.init = 16'h0c04;
    LUT4 i216_2_lut_3_lut_3_lut (.A(kreset_c), .B(resync), .C(ddDclk), 
         .Z(fpga_clk_enable_56)) /* synthesis lut_function=(!(A (B+!(C)))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(112[56:63])
    defparam i216_2_lut_3_lut_3_lut.init = 16'h7575;
    LUT4 i580_2_lut_3_lut_3_lut_3_lut (.A(kreset_c), .B(n450), .C(n987), 
         .Z(fpga_clk_enable_18)) /* synthesis lut_function=(!(A ((C)+!B)+!A (C))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(112[56:63])
    defparam i580_2_lut_3_lut_3_lut_3_lut.init = 16'h0d0d;
    SR_Latch_N_U4 ka_out_7__I_0 (.fpga_clk(fpga_clk), .fpga_clk_enable_49(fpga_clk_enable_49), 
            .n994(n994), .ka_out_c_0(ka_out_c_0), .fpga_clk_enable_63(fpga_clk_enable_63), 
            .dac_out_c_3(dac_out_c_3), .ka_out_c_1(ka_out_c_1), .ka_out_c_2(ka_out_c_2), 
            .ka_out_c_3(ka_out_c_3), .ka_out_c_4(ka_out_c_4), .ka_out_c_5(ka_out_c_5), 
            .ka_out_c_6(ka_out_c_6), .ka_out_c_7(ka_out_c_7)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(107[22:144])
    GSR GSR_INST (.GSR(VCC_net));
    LUT4 i124_2_lut_3_lut_3_lut (.A(kreset_c), .B(resync_adj_142), .C(ddstart_in), 
         .Z(n609)) /* synthesis lut_function=(!(A (B+!(C)))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(112[56:63])
    defparam i124_2_lut_3_lut_3_lut.init = 16'h7575;
    LUT4 i217_4_lut_4_lut (.A(kreset_c), .B(fpga_clk_enable_10), .C(resync_adj_140), 
         .D(dac_out_c_2), .Z(fpga_clk_enable_63)) /* synthesis lut_function=(!(A (B+(C+!(D))))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(112[56:63])
    defparam i217_4_lut_4_lut.init = 16'h5755;
    LUT4 i2_3_lut_4_lut_4_lut_adj_3 (.A(kreset_c), .B(n992), .C(resync_adj_139), 
         .D(ddDlatch), .Z(fpga_clk_enable_77)) /* synthesis lut_function=((B+!(C+!(D)))+!A) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(112[56:63])
    defparam i2_3_lut_4_lut_4_lut_adj_3.init = 16'hdfdd;
    LUT4 i218_2_lut_3_lut_3_lut (.A(kreset_c), .B(ddDlatch), .C(resync_adj_139), 
         .Z(fpga_clk_enable_49)) /* synthesis lut_function=(!(A (B+!(C)))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(112[56:63])
    defparam i218_2_lut_3_lut_3_lut.init = 16'h7575;
    LUT4 i215_3_lut_4_lut_4_lut (.A(kreset_c), .B(n990), .C(resync), .D(ddDclk), 
         .Z(fpga_clk_enable_33)) /* synthesis lut_function=((B (C+!(D)))+!A) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(112[56:63])
    defparam i215_3_lut_4_lut_4_lut.init = 16'hd5dd;
    SR_Latch_N sr1 (.dac_out_c_0(dac_out_c_0), .fpga_clk(fpga_clk), .fpga_clk_enable_33(fpga_clk_enable_33), 
            .n994(n994), .fpga_clk_enable_56(fpga_clk_enable_56), .dac_out_c_1(dac_out_c_1), 
            .dac_out_c_2(dac_out_c_2), .dac_out_c_3(dac_out_c_3), .dac_out_c_4(dac_out_c_4), 
            .dac_out_c_5(dac_out_c_5), .dac_out_c_6(dac_out_c_6), .dac_out_c_7(dac_out_c_7), 
            .ser_out(ser_out)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(105[22:130])
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    LUT4 i2_3_lut (.A(n450), .B(kreset_c), .C(n987), .Z(fpga_clk_enable_42)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i2_3_lut.init = 16'h8080;
    delay dly8 (.ddstart_in(ddstart_in), .fpga_clk(fpga_clk), .n994(n994), 
          .dstart_in(dstart_in)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(145[8:81])
    VLO i1 (.Z(GND_net));
    sig_sync ser_edge (.ser_out(ser_out), .fpga_clk(fpga_clk), .Ddout_c(Ddout_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(97[11:70])
    LUT4 i280_2_lut_3_lut (.A(xstate_c_0), .B(n988), .C(xstate_c_1), .Z(n412)) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(190[17:30])
    defparam i280_2_lut_3_lut.init = 16'h7878;
    LUT4 i575_4_lut (.A(t_out_N_59), .B(xk_clk_c_c), .C(xstart_in_c_c), 
         .D(sm_en), .Z(t_out_N_57)) /* synthesis lut_function=(((C+!(D))+!B)+!A) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(158[21:88])
    defparam i575_4_lut.init = 16'hf7ff;
    LUT4 i2_3_lut_rep_8 (.A(sm_en), .B(resync_adj_141), .C(ddk_clk), .Z(n988)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(188[11:29])
    defparam i2_3_lut_rep_8.init = 16'h2020;
    edge_det_U3 kclk_edge (.resync(resync_adj_141), .fpga_clk(fpga_clk), 
            .n994(n994), .ddk_clk(ddk_clk)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(137[11:105])
    LUT4 i287_3_lut_4_lut (.A(xstate_c_0), .B(n988), .C(xstate_c_1), .D(xstate_c_2), 
         .Z(n411)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(190[17:30])
    defparam i287_3_lut_4_lut.init = 16'h7f80;
    LUT4 i449_2_lut_3_lut (.A(xstate_c_1), .B(xstate_c_0), .C(xstate_c_2), 
         .Z(n551)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;
    defparam i449_2_lut_3_lut.init = 16'hf2f2;
    LUT4 i272_2_lut_4_lut (.A(sm_en), .B(resync_adj_141), .C(ddk_clk), 
         .D(xstate_c_0), .Z(n413)) /* synthesis lut_function=(A (B (D)+!B !(C (D)+!C !(D)))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(188[11:29])
    defparam i272_2_lut_4_lut.init = 16'hdf20;
    PFUMX i581 (.BLUT(n995), .ALUT(n996), .C0(resync_adj_142), .Z(n450));
    TSALL TSALL_INST (.TSALL(GND_net));
    
endmodule
//
// Verilog Description of module edge_det
//

module edge_det (resync, fpga_clk, n994, ddstart_in, kreset_c, fpga_clk_enable_35) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input fpga_clk;
    input n994;
    input ddstart_in;
    input kreset_c;
    output fpga_clk_enable_35;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX resync_10 (.D(ddstart_in), .CK(fpga_clk), .CD(n994), .Q(resync));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    LUT4 i578_2_lut_3_lut (.A(resync), .B(ddstart_in), .C(kreset_c), .Z(fpga_clk_enable_35)) /* synthesis lut_function=((B+!(C))+!A) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam i578_2_lut_3_lut.init = 16'hdfdf;
    
endmodule
//
// Verilog Description of module delay_U10
//

module delay_U10 (ddDclk, fpga_clk, n994, dDclk) /* synthesis syn_module_defined=1 */ ;
    output ddDclk;
    input fpga_clk;
    input n994;
    input dDclk;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX sync_6 (.D(dDclk), .CK(fpga_clk), .CD(n994), .Q(ddDclk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U9
//

module delay_U9 (dDlatch, fpga_clk, n994, Dlatch_c) /* synthesis syn_module_defined=1 */ ;
    output dDlatch;
    input fpga_clk;
    input n994;
    input Dlatch_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX sync_6 (.D(Dlatch_c), .CK(fpga_clk), .CD(n994), .Q(dDlatch));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U8
//

module delay_U8 (ddDlatch, fpga_clk, n994, dDlatch) /* synthesis syn_module_defined=1 */ ;
    output ddDlatch;
    input fpga_clk;
    input n994;
    input dDlatch;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX sync_6 (.D(dDlatch), .CK(fpga_clk), .CD(n994), .Q(ddDlatch));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U7
//

module delay_U7 (dk_clk, fpga_clk, n994, xk_clk_c_c) /* synthesis syn_module_defined=1 */ ;
    output dk_clk;
    input fpga_clk;
    input n994;
    input xk_clk_c_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX sync_6 (.D(xk_clk_c_c), .CK(fpga_clk), .CD(n994), .Q(dk_clk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U6
//

module delay_U6 (ddk_clk, fpga_clk, n994, dk_clk) /* synthesis syn_module_defined=1 */ ;
    output ddk_clk;
    input fpga_clk;
    input n994;
    input dk_clk;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX sync_6 (.D(dk_clk), .CK(fpga_clk), .CD(n994), .Q(ddk_clk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U11
//

module delay_U11 (dDclk, fpga_clk, n994, Dclk_c) /* synthesis syn_module_defined=1 */ ;
    output dDclk;
    input fpga_clk;
    input n994;
    input Dclk_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX sync_6 (.D(Dclk_c), .CK(fpga_clk), .CD(n994), .Q(dDclk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U5
//

module delay_U5 (dstart_in, fpga_clk, n994, xstart_in_c_c) /* synthesis syn_module_defined=1 */ ;
    output dstart_in;
    input fpga_clk;
    input n994;
    input xstart_in_c_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX sync_6 (.D(xstart_in_c_c), .CK(fpga_clk), .CD(n994), .Q(dstart_in));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module edge_det_U2
//

module edge_det_U2 (resync, fpga_clk, n994, ddDlatch, n990, fpga_clk_enable_10) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input fpga_clk;
    input n994;
    input ddDlatch;
    output n990;
    output fpga_clk_enable_10;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX resync_10 (.D(ddDlatch), .CK(fpga_clk), .CD(n994), .Q(resync));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    LUT4 s_in_I_0_11_2_lut_rep_10 (.A(ddDlatch), .B(resync), .Z(n990)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(10[17:31])
    defparam s_in_I_0_11_2_lut_rep_10.init = 16'h2222;
    LUT4 resync_I_0_2_lut_rep_13 (.A(resync), .B(ddDlatch), .Z(fpga_clk_enable_10)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam resync_I_0_2_lut_rep_13.init = 16'h2222;
    
endmodule
//
// Verilog Description of module edge_det_U1
//

module edge_det_U1 (resync, fpga_clk, n994, ddDclk) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input fpga_clk;
    input n994;
    input ddDclk;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX resync_10 (.D(ddDclk), .CK(fpga_clk), .CD(n994), .Q(resync));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module edge_det_U0
//

module edge_det_U0 (resync, fpga_clk, n994, dac_out_c_2, n992, ka_in_c_9, 
            \ff[10] , ff_15__N_123, ka_in_c_4, \ff[5] , ka_in_c_7, 
            \ff[8] , ka_in_c_3, \ff[4] , ka_in_c_5, \ff[6] , ka_in_c_6, 
            \ff[7] , ka_in_c_2, \ff[3] , ka_in_c_1, \ff[2] , ka_in_c_13, 
            \ff[14] , ka_in_c_15, ka_in_c_12, \ff[13] , ka_in_c_11, 
            \ff[12] , ka_in_c_10, \ff[11] , ka_in_c_8, \ff[9] , ka_in_c_0, 
            \ff[1] , ka_in_c_14, \ff[15] ) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input fpga_clk;
    input n994;
    input dac_out_c_2;
    output n992;
    input ka_in_c_9;
    input \ff[10] ;
    output [15:0]ff_15__N_123;
    input ka_in_c_4;
    input \ff[5] ;
    input ka_in_c_7;
    input \ff[8] ;
    input ka_in_c_3;
    input \ff[4] ;
    input ka_in_c_5;
    input \ff[6] ;
    input ka_in_c_6;
    input \ff[7] ;
    input ka_in_c_2;
    input \ff[3] ;
    input ka_in_c_1;
    input \ff[2] ;
    input ka_in_c_13;
    input \ff[14] ;
    input ka_in_c_15;
    input ka_in_c_12;
    input \ff[13] ;
    input ka_in_c_11;
    input \ff[12] ;
    input ka_in_c_10;
    input \ff[11] ;
    input ka_in_c_8;
    input \ff[9] ;
    input ka_in_c_0;
    input \ff[1] ;
    input ka_in_c_14;
    input \ff[15] ;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX resync_10 (.D(dac_out_c_2), .CK(fpga_clk), .CD(n994), .Q(resync));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    LUT4 resync_I_0_2_lut_rep_12 (.A(resync), .B(dac_out_c_2), .Z(n992)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam resync_I_0_2_lut_rep_12.init = 16'h2222;
    LUT4 mux_4_i10_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_9), 
         .D(\ff[10] ), .Z(ff_15__N_123[9])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i10_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i5_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_4), 
         .D(\ff[5] ), .Z(ff_15__N_123[4])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i5_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i8_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_7), 
         .D(\ff[8] ), .Z(ff_15__N_123[7])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i8_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i4_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_3), 
         .D(\ff[4] ), .Z(ff_15__N_123[3])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i4_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i6_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_5), 
         .D(\ff[6] ), .Z(ff_15__N_123[5])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i6_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i7_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_6), 
         .D(\ff[7] ), .Z(ff_15__N_123[6])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i7_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i3_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_2), 
         .D(\ff[3] ), .Z(ff_15__N_123[2])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i3_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i2_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_1), 
         .D(\ff[2] ), .Z(ff_15__N_123[1])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i2_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i14_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_13), 
         .D(\ff[14] ), .Z(ff_15__N_123[13])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i14_3_lut_4_lut.init = 16'hfd20;
    LUT4 i465_2_lut_3_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_15), 
         .Z(ff_15__N_123[15])) /* synthesis lut_function=((B+(C))+!A) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam i465_2_lut_3_lut.init = 16'hfdfd;
    LUT4 mux_4_i13_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_12), 
         .D(\ff[13] ), .Z(ff_15__N_123[12])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i13_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i12_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_11), 
         .D(\ff[12] ), .Z(ff_15__N_123[11])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i12_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i11_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_10), 
         .D(\ff[11] ), .Z(ff_15__N_123[10])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i11_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i9_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_8), 
         .D(\ff[9] ), .Z(ff_15__N_123[8])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i9_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i1_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_0), 
         .D(\ff[1] ), .Z(ff_15__N_123[0])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i1_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i15_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_14), 
         .D(\ff[15] ), .Z(ff_15__N_123[14])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(11[17:31])
    defparam mux_4_i15_3_lut_4_lut.init = 16'hfd20;
    
endmodule
//
// Verilog Description of module Latch_SR_N
//

module Latch_SR_N (\ff[13] , fpga_clk, fpga_clk_enable_77, n994, ff_15__N_123, 
            \ff[15] , \ff[12] , \ff[11] , \ff[10] , \ff[9] , \ff[8] , 
            \ff[7] , \ff[6] , \ff[5] , \ff[4] , \ff[3] , \ff[2] , 
            \ff[1] , Ddin_c_0, \ff[14] ) /* synthesis syn_module_defined=1 */ ;
    output \ff[13] ;
    input fpga_clk;
    input fpga_clk_enable_77;
    input n994;
    input [15:0]ff_15__N_123;
    output \ff[15] ;
    output \ff[12] ;
    output \ff[11] ;
    output \ff[10] ;
    output \ff[9] ;
    output \ff[8] ;
    output \ff[7] ;
    output \ff[6] ;
    output \ff[5] ;
    output \ff[4] ;
    output \ff[3] ;
    output \ff[2] ;
    output \ff[1] ;
    output Ddin_c_0;
    output \ff[14] ;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1P3IX ff__i14 (.D(ff_15__N_123[13]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[13] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i14.GSR = "ENABLED";
    FD1P3IX ff__i16 (.D(ff_15__N_123[15]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[15] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i16.GSR = "ENABLED";
    FD1P3IX ff__i13 (.D(ff_15__N_123[12]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[12] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i13.GSR = "ENABLED";
    FD1P3IX ff__i12 (.D(ff_15__N_123[11]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[11] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i12.GSR = "ENABLED";
    FD1P3IX ff__i11 (.D(ff_15__N_123[10]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[10] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i11.GSR = "ENABLED";
    FD1P3IX ff__i10 (.D(ff_15__N_123[9]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[9] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i10.GSR = "ENABLED";
    FD1P3IX ff__i9 (.D(ff_15__N_123[8]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[8] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i9.GSR = "ENABLED";
    FD1P3IX ff__i8 (.D(ff_15__N_123[7]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[7] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i8.GSR = "ENABLED";
    FD1P3IX ff__i7 (.D(ff_15__N_123[6]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[6] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i7.GSR = "ENABLED";
    FD1P3IX ff__i6 (.D(ff_15__N_123[5]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[5] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i6.GSR = "ENABLED";
    FD1P3IX ff__i5 (.D(ff_15__N_123[4]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[4] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i5.GSR = "ENABLED";
    FD1P3IX ff__i4 (.D(ff_15__N_123[3]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[3] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i4.GSR = "ENABLED";
    FD1P3IX ff__i3 (.D(ff_15__N_123[2]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[2] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i3.GSR = "ENABLED";
    FD1P3IX ff__i2 (.D(ff_15__N_123[1]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[1] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i2.GSR = "ENABLED";
    FD1P3IX ff__i1 (.D(ff_15__N_123[0]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(Ddin_c_0)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i1.GSR = "ENABLED";
    FD1P3IX ff__i15 (.D(ff_15__N_123[14]), .SP(fpga_clk_enable_77), .CD(n994), 
            .CK(fpga_clk), .Q(\ff[14] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=112, LSE_RLINE=112 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/latch_sr_n.v(16[9] 30[5])
    defparam ff__i15.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module SR_Latch_N_U4
//

module SR_Latch_N_U4 (fpga_clk, fpga_clk_enable_49, n994, ka_out_c_0, 
            fpga_clk_enable_63, dac_out_c_3, ka_out_c_1, ka_out_c_2, 
            ka_out_c_3, ka_out_c_4, ka_out_c_5, ka_out_c_6, ka_out_c_7) /* synthesis syn_module_defined=1 */ ;
    input fpga_clk;
    input fpga_clk_enable_49;
    input n994;
    output ka_out_c_0;
    input fpga_clk_enable_63;
    input dac_out_c_3;
    output ka_out_c_1;
    output ka_out_c_2;
    output ka_out_c_3;
    output ka_out_c_4;
    output ka_out_c_5;
    output ka_out_c_6;
    output ka_out_c_7;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    wire [7:0]ff;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(12[15:17])
    
    FD1P3IX ff__i0 (.D(ff[1]), .SP(fpga_clk_enable_49), .CD(n994), .CK(fpga_clk), 
            .Q(ff[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i0.GSR = "ENABLED";
    FD1P3IX par_out__i1 (.D(ff[0]), .SP(fpga_clk_enable_63), .CD(n994), 
            .CK(fpga_clk), .Q(ka_out_c_0)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i1.GSR = "ENABLED";
    FD1P3IX ff__i1 (.D(ff[2]), .SP(fpga_clk_enable_49), .CD(n994), .CK(fpga_clk), 
            .Q(ff[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i1.GSR = "ENABLED";
    FD1P3IX ff__i2 (.D(ff[3]), .SP(fpga_clk_enable_49), .CD(n994), .CK(fpga_clk), 
            .Q(ff[2])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i2.GSR = "ENABLED";
    FD1P3IX ff__i3 (.D(ff[4]), .SP(fpga_clk_enable_49), .CD(n994), .CK(fpga_clk), 
            .Q(ff[3])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i3.GSR = "ENABLED";
    FD1P3IX ff__i4 (.D(ff[5]), .SP(fpga_clk_enable_49), .CD(n994), .CK(fpga_clk), 
            .Q(ff[4])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i4.GSR = "ENABLED";
    FD1P3IX ff__i5 (.D(ff[6]), .SP(fpga_clk_enable_49), .CD(n994), .CK(fpga_clk), 
            .Q(ff[5])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i5.GSR = "ENABLED";
    FD1P3IX ff__i6 (.D(ff[7]), .SP(fpga_clk_enable_49), .CD(n994), .CK(fpga_clk), 
            .Q(ff[6])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i6.GSR = "ENABLED";
    FD1P3IX ff__i7 (.D(dac_out_c_3), .SP(fpga_clk_enable_49), .CD(n994), 
            .CK(fpga_clk), .Q(ff[7])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i7.GSR = "ENABLED";
    FD1P3IX par_out__i2 (.D(ff[1]), .SP(fpga_clk_enable_63), .CD(n994), 
            .CK(fpga_clk), .Q(ka_out_c_1)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i2.GSR = "ENABLED";
    FD1P3IX par_out__i3 (.D(ff[2]), .SP(fpga_clk_enable_63), .CD(n994), 
            .CK(fpga_clk), .Q(ka_out_c_2)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i3.GSR = "ENABLED";
    FD1P3IX par_out__i4 (.D(ff[3]), .SP(fpga_clk_enable_63), .CD(n994), 
            .CK(fpga_clk), .Q(ka_out_c_3)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i4.GSR = "ENABLED";
    FD1P3IX par_out__i5 (.D(ff[4]), .SP(fpga_clk_enable_63), .CD(n994), 
            .CK(fpga_clk), .Q(ka_out_c_4)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i5.GSR = "ENABLED";
    FD1P3IX par_out__i6 (.D(ff[5]), .SP(fpga_clk_enable_63), .CD(n994), 
            .CK(fpga_clk), .Q(ka_out_c_5)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i6.GSR = "ENABLED";
    FD1P3IX par_out__i7 (.D(ff[6]), .SP(fpga_clk_enable_63), .CD(n994), 
            .CK(fpga_clk), .Q(ka_out_c_6)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i7.GSR = "ENABLED";
    FD1P3IX par_out__i8 (.D(ff[7]), .SP(fpga_clk_enable_63), .CD(n994), 
            .CK(fpga_clk), .Q(ka_out_c_7)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=144, LSE_LLINE=107, LSE_RLINE=107 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i8.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module SR_Latch_N
//

module SR_Latch_N (dac_out_c_0, fpga_clk, fpga_clk_enable_33, n994, 
            fpga_clk_enable_56, dac_out_c_1, dac_out_c_2, dac_out_c_3, 
            dac_out_c_4, dac_out_c_5, dac_out_c_6, dac_out_c_7, ser_out) /* synthesis syn_module_defined=1 */ ;
    output dac_out_c_0;
    input fpga_clk;
    input fpga_clk_enable_33;
    input n994;
    input fpga_clk_enable_56;
    output dac_out_c_1;
    output dac_out_c_2;
    output dac_out_c_3;
    output dac_out_c_4;
    output dac_out_c_5;
    output dac_out_c_6;
    output dac_out_c_7;
    input ser_out;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    wire [7:0]ff;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(12[15:17])
    
    FD1P3IX par_out__i1 (.D(ff[0]), .SP(fpga_clk_enable_33), .CD(n994), 
            .CK(fpga_clk), .Q(dac_out_c_0)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i1.GSR = "ENABLED";
    FD1P3IX ff__i0 (.D(ff[1]), .SP(fpga_clk_enable_56), .CD(n994), .CK(fpga_clk), 
            .Q(ff[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i0.GSR = "ENABLED";
    FD1P3IX par_out__i2 (.D(ff[1]), .SP(fpga_clk_enable_33), .CD(n994), 
            .CK(fpga_clk), .Q(dac_out_c_1)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i2.GSR = "ENABLED";
    FD1P3IX par_out__i3 (.D(ff[2]), .SP(fpga_clk_enable_33), .CD(n994), 
            .CK(fpga_clk), .Q(dac_out_c_2)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i3.GSR = "ENABLED";
    FD1P3IX par_out__i4 (.D(ff[3]), .SP(fpga_clk_enable_33), .CD(n994), 
            .CK(fpga_clk), .Q(dac_out_c_3)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i4.GSR = "ENABLED";
    FD1P3IX par_out__i5 (.D(ff[4]), .SP(fpga_clk_enable_33), .CD(n994), 
            .CK(fpga_clk), .Q(dac_out_c_4)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i5.GSR = "ENABLED";
    FD1P3IX par_out__i6 (.D(ff[5]), .SP(fpga_clk_enable_33), .CD(n994), 
            .CK(fpga_clk), .Q(dac_out_c_5)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i6.GSR = "ENABLED";
    FD1P3IX par_out__i7 (.D(ff[6]), .SP(fpga_clk_enable_33), .CD(n994), 
            .CK(fpga_clk), .Q(dac_out_c_6)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i7.GSR = "ENABLED";
    FD1P3IX par_out__i8 (.D(ff[7]), .SP(fpga_clk_enable_33), .CD(n994), 
            .CK(fpga_clk), .Q(dac_out_c_7)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam par_out__i8.GSR = "ENABLED";
    FD1P3IX ff__i1 (.D(ff[2]), .SP(fpga_clk_enable_56), .CD(n994), .CK(fpga_clk), 
            .Q(ff[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i1.GSR = "ENABLED";
    FD1P3IX ff__i2 (.D(ff[3]), .SP(fpga_clk_enable_56), .CD(n994), .CK(fpga_clk), 
            .Q(ff[2])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i2.GSR = "ENABLED";
    FD1P3IX ff__i3 (.D(ff[4]), .SP(fpga_clk_enable_56), .CD(n994), .CK(fpga_clk), 
            .Q(ff[3])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i3.GSR = "ENABLED";
    FD1P3IX ff__i4 (.D(ff[5]), .SP(fpga_clk_enable_56), .CD(n994), .CK(fpga_clk), 
            .Q(ff[4])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i4.GSR = "ENABLED";
    FD1P3IX ff__i5 (.D(ff[6]), .SP(fpga_clk_enable_56), .CD(n994), .CK(fpga_clk), 
            .Q(ff[5])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i5.GSR = "ENABLED";
    FD1P3IX ff__i6 (.D(ff[7]), .SP(fpga_clk_enable_56), .CD(n994), .CK(fpga_clk), 
            .Q(ff[6])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i6.GSR = "ENABLED";
    FD1P3IX ff__i7 (.D(ser_out), .SP(fpga_clk_enable_56), .CD(n994), .CK(fpga_clk), 
            .Q(ff[7])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=105, LSE_RLINE=105 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sr_latch.v(16[10] 29[8])
    defparam ff__i7.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module delay
//

module delay (ddstart_in, fpga_clk, n994, dstart_in) /* synthesis syn_module_defined=1 */ ;
    output ddstart_in;
    input fpga_clk;
    input n994;
    input dstart_in;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX sync_6 (.D(dstart_in), .CK(fpga_clk), .CD(n994), .Q(ddstart_in));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module sig_sync
//

module sig_sync (ser_out, fpga_clk, Ddout_c) /* synthesis syn_module_defined=1 */ ;
    output ser_out;
    input fpga_clk;
    input Ddout_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    wire [1:0]resync;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sig_sync.v(7[14:20])
    
    FD1S3AX resync_i1 (.D(resync[1]), .CK(fpga_clk), .Q(ser_out)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=70, LSE_LLINE=97, LSE_RLINE=97 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sig_sync.v(11[10] 14[8])
    defparam resync_i1.GSR = "ENABLED";
    FD1S3AX resync_i2 (.D(Ddout_c), .CK(fpga_clk), .Q(resync[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=70, LSE_LLINE=97, LSE_RLINE=97 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/sig_sync.v(11[10] 14[8])
    defparam resync_i2.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module edge_det_U3
//

module edge_det_U3 (resync, fpga_clk, n994, ddk_clk) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input fpga_clk;
    input n994;
    input ddk_clk;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/kbuf_top.v(63[62:70])
    
    FD1S3IX resync_10 (.D(ddk_clk), .CK(fpga_clk), .CD(n994), .Q(resync));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer1/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

