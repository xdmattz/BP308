// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.10.2.115
// Netlist written on Sun Oct 14 21:26:37 2018
//
// Verilog Description of module kbuf_top
//

module kbuf_top (Adout, Acs, Asck, Adin, Dlatch, Ddin, Dclk, Ddout, 
            kreset, xAdout, xAcs, xAsck, xAdin, xDlatch, xDdin, 
            xDclk, xDdout, ka_in, dac_out, t_out, leds, dac_clk) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(1[8:16])
    input Adout;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(4[8:13])
    input Acs;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(5[8:11])
    input Asck;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(6[8:12])
    input Adin;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(7[8:12])
    input Dlatch;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(9[8:14])
    output Ddin;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(10[9:13])
    input Dclk;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(11[8:12])
    input Ddout;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(12[8:13])
    input kreset;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(14[8:14])
    output xAdout;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(17[9:15])
    output xAcs;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(18[9:13])
    output xAsck;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(19[9:14])
    output xAdin;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(20[9:14])
    output xDlatch;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(22[9:16])
    output xDdin;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(23[9:14])
    output xDclk;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(24[9:14])
    output xDdout;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(25[9:15])
    input [15:0]ka_in;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    output [7:0]dac_out;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(29[15:22])
    output t_out;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(31[9:14])
    output [7:0]leds;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(33[15:19])
    output dac_clk;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(35[13:20])
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    
    wire GND_net, VCC_net, xAdout_c_c, xAcs_c_c, xAsck_c_c, xAdin_c_c, 
        xDlatch_c_c, t_out_c, xDclk_c_c, xDdout_c_c, kreset_c, ka_in_c_15, 
        ka_in_c_14, ka_in_c_13, ka_in_c_12, ka_in_c_11, ka_in_c_10, 
        ka_in_c_9, ka_in_c_8, ka_in_c_7, ka_in_c_6, ka_in_c_5, ka_in_c_4, 
        ka_in_c_3, ka_in_c_2, ka_in_c_1, ka_in_c_0, dac_out_c_7, dac_out_c_6, 
        dac_out_c_5, dac_out_c_4, dac_out_c_3, dac_out_c_2, dac_out_c_1, 
        dac_out_c_0, leds_c_7, leds_c_6, leds_c_5, leds_c_4, leds_c_3, 
        leds_c_2, leds_c_1, leds_c_0, dac_clk_c, ser_out, rclk_rise, 
        dDclk, ddDclk, dDlatch, ddDlatch, n228, n231, resync, 
        fpga_clk_enable_29, fpga_clk_enable_12, fpga_clk_enable_36, fpga_clk_enable_49, 
        fpga_clk_enable_19;
    wire [15:0]ff_adj_175;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(12[14:16])
    wire [15:0]ff_15__N_155;
    
    wire fpga_clk_enable_2;
    
    VHI i2 (.Z(VCC_net));
    edge_det ser_load_edge (.resync(resync), .fpga_clk(fpga_clk), .n228(n228), 
            .dac_out_c_2(dac_out_c_2), .ka_in_c_14(ka_in_c_14), .\ff[15] (ff_adj_175[15]), 
            .ff_15__N_155({ff_15__N_155}), .ka_in_c_12(ka_in_c_12), .\ff[13] (ff_adj_175[13]), 
            .ka_in_c_11(ka_in_c_11), .\ff[12] (ff_adj_175[12]), .ka_in_c_10(ka_in_c_10), 
            .\ff[11] (ff_adj_175[11]), .ka_in_c_9(ka_in_c_9), .\ff[10] (ff_adj_175[10]), 
            .ka_in_c_8(ka_in_c_8), .\ff[9] (ff_adj_175[9]), .ka_in_c_7(ka_in_c_7), 
            .\ff[8] (ff_adj_175[8]), .ka_in_c_6(ka_in_c_6), .\ff[7] (ff_adj_175[7]), 
            .ka_in_c_5(ka_in_c_5), .\ff[6] (ff_adj_175[6]), .ka_in_c_4(ka_in_c_4), 
            .\ff[5] (ff_adj_175[5]), .ka_in_c_1(ka_in_c_1), .\ff[2] (ff_adj_175[2]), 
            .ka_in_c_0(ka_in_c_0), .\ff[1] (ff_adj_175[1]), .ka_in_c_2(ka_in_c_2), 
            .\ff[3] (ff_adj_175[3]), .ka_in_c_3(ka_in_c_3), .\ff[4] (ff_adj_175[4]), 
            .rclk_rise(rclk_rise), .kreset_c(kreset_c), .fpga_clk_enable_49(fpga_clk_enable_49), 
            .ka_in_c_13(ka_in_c_13), .\ff[14] (ff_adj_175[14]), .ka_in_c_15(ka_in_c_15)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(77[11:118])
    OB dac_out_pad_2 (.I(dac_out_c_2), .O(dac_out[2]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(29[15:22])
    delay_U2 dly3 (.dDlatch(dDlatch), .fpga_clk(fpga_clk), .n228(n228), 
            .xDlatch_c_c(xDlatch_c_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(69[8:75])
    OB xAdin_pad (.I(xAdin_c_c), .O(xAdin));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(20[9:14])
    OSCH rc_oscillator (.STDBY(GND_net), .OSC(fpga_clk)) /* synthesis syn_instantiated=1 */ ;
    defparam rc_oscillator.NOM_FREQ = "66.50";
    OB dac_out_pad_3 (.I(dac_out_c_3), .O(dac_out[3]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(29[15:22])
    OB dac_out_pad_4 (.I(dac_out_c_4), .O(dac_out[4]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(29[15:22])
    OB dac_out_pad_5 (.I(dac_out_c_5), .O(dac_out[5]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(29[15:22])
    OB xAsck_pad (.I(xAsck_c_c), .O(xAsck));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(19[9:14])
    OB dac_out_pad_6 (.I(dac_out_c_6), .O(dac_out[6]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(29[15:22])
    OB xAcs_pad (.I(xAcs_c_c), .O(xAcs));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(18[9:13])
    OB dac_out_pad_7 (.I(dac_out_c_7), .O(dac_out[7]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(29[15:22])
    OB xDdout_pad (.I(xDdout_c_c), .O(xDdout));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(25[9:15])
    delay_U4 dly1 (.dDclk(dDclk), .fpga_clk(fpga_clk), .n228(n228), .xDclk_c_c(xDclk_c_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(63[9:72])
    OB xDclk_pad (.I(xDclk_c_c), .O(xDclk));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(24[9:14])
    OB xDdin_pad (.I(GND_net), .O(xDdin));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(23[9:14])
    LUT4 kreset_I_0_1_lut_rep_1 (.A(kreset_c), .Z(n228)) /* synthesis lut_function=(!(A)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(86[56:63])
    defparam kreset_I_0_1_lut_rep_1.init = 16'h5555;
    FD1P3IX dac_clk_17 (.D(n231), .SP(fpga_clk_enable_2), .CD(rclk_rise), 
            .CK(fpga_clk), .Q(dac_clk_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(88[9] 98[5])
    defparam dac_clk_17.GSR = "ENABLED";
    SR_Latch_N dac_out_7__I_0 (.dac_out_c_0(dac_out_c_0), .fpga_clk(fpga_clk), 
            .fpga_clk_enable_19(fpga_clk_enable_19), .n228(n228), .fpga_clk_enable_36(fpga_clk_enable_36), 
            .dac_out_c_1(dac_out_c_1), .dac_out_c_2(dac_out_c_2), .dac_out_c_3(dac_out_c_3), 
            .dac_out_c_4(dac_out_c_4), .dac_out_c_5(dac_out_c_5), .dac_out_c_6(dac_out_c_6), 
            .dac_out_c_7(dac_out_c_7), .ser_out(ser_out)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(81[22:130])
    OB xAdout_pad (.I(xAdout_c_c), .O(xAdout));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(17[9:15])
    OB Ddin_pad (.I(t_out_c), .O(Ddin));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(10[9:13])
    OB xDlatch_pad (.I(xDlatch_c_c), .O(xDlatch));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(22[9:16])
    OB dac_out_pad_1 (.I(dac_out_c_1), .O(dac_out[1]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(29[15:22])
    OB dac_out_pad_0 (.I(dac_out_c_0), .O(dac_out[0]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(29[15:22])
    OB t_out_pad (.I(t_out_c), .O(t_out));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(31[9:14])
    OB leds_pad_7 (.I(leds_c_7), .O(leds[7]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(33[15:19])
    OB leds_pad_6 (.I(leds_c_6), .O(leds[6]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(33[15:19])
    OB leds_pad_5 (.I(leds_c_5), .O(leds[5]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(33[15:19])
    OB leds_pad_4 (.I(leds_c_4), .O(leds[4]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(33[15:19])
    OB leds_pad_3 (.I(leds_c_3), .O(leds[3]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(33[15:19])
    OB leds_pad_2 (.I(leds_c_2), .O(leds[2]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(33[15:19])
    OB leds_pad_1 (.I(leds_c_1), .O(leds[1]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(33[15:19])
    OB leds_pad_0 (.I(leds_c_0), .O(leds[0]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(33[15:19])
    OB dac_clk_pad (.I(dac_clk_c), .O(dac_clk));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(35[13:20])
    IB xAdout_c_pad (.I(Adout), .O(xAdout_c_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(4[8:13])
    IB xAcs_c_pad (.I(Acs), .O(xAcs_c_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(5[8:11])
    IB xAsck_c_pad (.I(Asck), .O(xAsck_c_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(6[8:12])
    IB xAdin_c_pad (.I(Adin), .O(xAdin_c_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(7[8:12])
    IB xDlatch_c_pad (.I(Dlatch), .O(xDlatch_c_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(9[8:14])
    IB xDclk_c_pad (.I(Dclk), .O(xDclk_c_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(11[8:12])
    IB xDdout_c_pad (.I(Ddout), .O(xDdout_c_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(12[8:13])
    IB kreset_pad (.I(kreset), .O(kreset_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(14[8:14])
    IB ka_in_pad_15 (.I(ka_in[15]), .O(ka_in_c_15));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_14 (.I(ka_in[14]), .O(ka_in_c_14));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_13 (.I(ka_in[13]), .O(ka_in_c_13));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_12 (.I(ka_in[12]), .O(ka_in_c_12));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_11 (.I(ka_in[11]), .O(ka_in_c_11));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_10 (.I(ka_in[10]), .O(ka_in_c_10));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_9 (.I(ka_in[9]), .O(ka_in_c_9));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_8 (.I(ka_in[8]), .O(ka_in_c_8));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_7 (.I(ka_in[7]), .O(ka_in_c_7));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_6 (.I(ka_in[6]), .O(ka_in_c_6));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_5 (.I(ka_in[5]), .O(ka_in_c_5));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_4 (.I(ka_in[4]), .O(ka_in_c_4));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_3 (.I(ka_in[3]), .O(ka_in_c_3));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_2 (.I(ka_in[2]), .O(ka_in_c_2));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_1 (.I(ka_in[1]), .O(ka_in_c_1));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    IB ka_in_pad_0 (.I(ka_in[0]), .O(ka_in_c_0));   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(27[15:20])
    edge_det_U0 s_edge (.fpga_clk(fpga_clk), .n228(n228), .ddDclk(ddDclk), 
            .kreset_c(kreset_c), .fpga_clk_enable_36(fpga_clk_enable_36), 
            .rclk_rise(rclk_rise), .fpga_clk_enable_19(fpga_clk_enable_19)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(65[11:99])
    Latch_SR_N ka_in_latch (.\ff[13] (ff_adj_175[13]), .fpga_clk(fpga_clk), 
            .fpga_clk_enable_49(fpga_clk_enable_49), .n228(n228), .ff_15__N_155({ff_15__N_155}), 
            .\ff[15] (ff_adj_175[15]), .\ff[14] (ff_adj_175[14]), .\ff[12] (ff_adj_175[12]), 
            .\ff[11] (ff_adj_175[11]), .\ff[10] (ff_adj_175[10]), .\ff[9] (ff_adj_175[9]), 
            .\ff[8] (ff_adj_175[8]), .\ff[7] (ff_adj_175[7]), .\ff[6] (ff_adj_175[6]), 
            .\ff[5] (ff_adj_175[5]), .\ff[4] (ff_adj_175[4]), .\ff[3] (ff_adj_175[3]), 
            .\ff[2] (ff_adj_175[2]), .\ff[1] (ff_adj_175[1]), .t_out_c(t_out_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(86[23:147])
    \SR_Latch_N(N=24)  ka_out_latch (.leds_c_0(leds_c_0), .fpga_clk(fpga_clk), 
            .fpga_clk_enable_12(fpga_clk_enable_12), .n228(n228), .leds_c_1(leds_c_1), 
            .leds_c_2(leds_c_2), .leds_c_3(leds_c_3), .leds_c_4(leds_c_4), 
            .leds_c_5(leds_c_5), .leds_c_6(leds_c_6), .leds_c_7(leds_c_7), 
            .fpga_clk_enable_29(fpga_clk_enable_29), .dac_out_c_3(dac_out_c_3)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(82[23:145])
    edge_det_U1 r_edge (.fpga_clk(fpga_clk), .n228(n228), .ddDlatch(ddDlatch), 
            .fpga_clk_enable_2(fpga_clk_enable_2), .kreset_c(kreset_c), 
            .fpga_clk_enable_29(fpga_clk_enable_29), .rclk_rise(rclk_rise)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(71[11:101])
    delay dly4 (.ddDlatch(ddDlatch), .fpga_clk(fpga_clk), .n228(n228), 
          .dDlatch(dDlatch)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(70[8:77])
    delay_U3 dly2 (.ddDclk(ddDclk), .fpga_clk(fpga_clk), .n228(n228), 
            .dDclk(dDclk)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(64[8:73])
    GSR GSR_INST (.GSR(VCC_net));
    LUT4 i53_4_lut_4_lut (.A(kreset_c), .B(resync), .C(fpga_clk_enable_2), 
         .D(dac_out_c_2), .Z(fpga_clk_enable_12)) /* synthesis lut_function=(!(A (B+(C+!(D))))) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(86[56:63])
    defparam i53_4_lut_4_lut.init = 16'h5755;
    sig_sync ser_edge (.ser_out(ser_out), .fpga_clk(fpga_clk), .xDdout_c_c(xDdout_c_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(73[11:70])
    VLO i1 (.Z(GND_net));
    TSALL TSALL_INST (.TSALL(GND_net));
    LUT4 m1_lut (.Z(n231)) /* synthesis lut_function=1, syn_instantiated=1 */ ;
    defparam m1_lut.init = 16'hffff;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    
endmodule
//
// Verilog Description of module edge_det
//

module edge_det (resync, fpga_clk, n228, dac_out_c_2, ka_in_c_14, 
            \ff[15] , ff_15__N_155, ka_in_c_12, \ff[13] , ka_in_c_11, 
            \ff[12] , ka_in_c_10, \ff[11] , ka_in_c_9, \ff[10] , ka_in_c_8, 
            \ff[9] , ka_in_c_7, \ff[8] , ka_in_c_6, \ff[7] , ka_in_c_5, 
            \ff[6] , ka_in_c_4, \ff[5] , ka_in_c_1, \ff[2] , ka_in_c_0, 
            \ff[1] , ka_in_c_2, \ff[3] , ka_in_c_3, \ff[4] , rclk_rise, 
            kreset_c, fpga_clk_enable_49, ka_in_c_13, \ff[14] , ka_in_c_15) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input fpga_clk;
    input n228;
    input dac_out_c_2;
    input ka_in_c_14;
    input \ff[15] ;
    output [15:0]ff_15__N_155;
    input ka_in_c_12;
    input \ff[13] ;
    input ka_in_c_11;
    input \ff[12] ;
    input ka_in_c_10;
    input \ff[11] ;
    input ka_in_c_9;
    input \ff[10] ;
    input ka_in_c_8;
    input \ff[9] ;
    input ka_in_c_7;
    input \ff[8] ;
    input ka_in_c_6;
    input \ff[7] ;
    input ka_in_c_5;
    input \ff[6] ;
    input ka_in_c_4;
    input \ff[5] ;
    input ka_in_c_1;
    input \ff[2] ;
    input ka_in_c_0;
    input \ff[1] ;
    input ka_in_c_2;
    input \ff[3] ;
    input ka_in_c_3;
    input \ff[4] ;
    input rclk_rise;
    input kreset_c;
    output fpga_clk_enable_49;
    input ka_in_c_13;
    input \ff[14] ;
    input ka_in_c_15;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    
    FD1S3IX resync_10 (.D(dac_out_c_2), .CK(fpga_clk), .CD(n228), .Q(resync));   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    LUT4 mux_4_i15_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_14), 
         .D(\ff[15] ), .Z(ff_15__N_155[14])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i15_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i13_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_12), 
         .D(\ff[13] ), .Z(ff_15__N_155[12])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i13_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i12_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_11), 
         .D(\ff[12] ), .Z(ff_15__N_155[11])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i12_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i11_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_10), 
         .D(\ff[11] ), .Z(ff_15__N_155[10])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i11_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i10_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_9), 
         .D(\ff[10] ), .Z(ff_15__N_155[9])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i10_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i9_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_8), 
         .D(\ff[9] ), .Z(ff_15__N_155[8])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i9_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i8_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_7), 
         .D(\ff[8] ), .Z(ff_15__N_155[7])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i8_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i7_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_6), 
         .D(\ff[7] ), .Z(ff_15__N_155[6])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i7_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i6_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_5), 
         .D(\ff[6] ), .Z(ff_15__N_155[5])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i6_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i5_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_4), 
         .D(\ff[5] ), .Z(ff_15__N_155[4])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i5_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i2_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_1), 
         .D(\ff[2] ), .Z(ff_15__N_155[1])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i2_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i1_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_0), 
         .D(\ff[1] ), .Z(ff_15__N_155[0])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i1_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i3_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_2), 
         .D(\ff[3] ), .Z(ff_15__N_155[2])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i3_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i4_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_3), 
         .D(\ff[4] ), .Z(ff_15__N_155[3])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i4_3_lut_4_lut.init = 16'hfd20;
    LUT4 i2_3_lut_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(rclk_rise), 
         .D(kreset_c), .Z(fpga_clk_enable_49)) /* synthesis lut_function=(A ((C+!(D))+!B)+!A (C+!(D))) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam i2_3_lut_3_lut_4_lut.init = 16'hf2ff;
    LUT4 mux_4_i14_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_13), 
         .D(\ff[14] ), .Z(ff_15__N_155[13])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam mux_4_i14_3_lut_4_lut.init = 16'hfd20;
    LUT4 i144_2_lut_3_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_15), 
         .Z(ff_15__N_155[15])) /* synthesis lut_function=((B+(C))+!A) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam i144_2_lut_3_lut.init = 16'hfdfd;
    
endmodule
//
// Verilog Description of module delay_U2
//

module delay_U2 (dDlatch, fpga_clk, n228, xDlatch_c_c) /* synthesis syn_module_defined=1 */ ;
    output dDlatch;
    input fpga_clk;
    input n228;
    input xDlatch_c_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    
    FD1S3IX sync_6 (.D(xDlatch_c_c), .CK(fpga_clk), .CD(n228), .Q(dDlatch));   // c:/dan/engineering/lattice/learning/kanalogbuffer/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U4
//

module delay_U4 (dDclk, fpga_clk, n228, xDclk_c_c) /* synthesis syn_module_defined=1 */ ;
    output dDclk;
    input fpga_clk;
    input n228;
    input xDclk_c_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    
    FD1S3IX sync_6 (.D(xDclk_c_c), .CK(fpga_clk), .CD(n228), .Q(dDclk));   // c:/dan/engineering/lattice/learning/kanalogbuffer/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module SR_Latch_N
//

module SR_Latch_N (dac_out_c_0, fpga_clk, fpga_clk_enable_19, n228, 
            fpga_clk_enable_36, dac_out_c_1, dac_out_c_2, dac_out_c_3, 
            dac_out_c_4, dac_out_c_5, dac_out_c_6, dac_out_c_7, ser_out) /* synthesis syn_module_defined=1 */ ;
    output dac_out_c_0;
    input fpga_clk;
    input fpga_clk_enable_19;
    input n228;
    input fpga_clk_enable_36;
    output dac_out_c_1;
    output dac_out_c_2;
    output dac_out_c_3;
    output dac_out_c_4;
    output dac_out_c_5;
    output dac_out_c_6;
    output dac_out_c_7;
    input ser_out;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    wire [7:0]ff;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(12[15:17])
    
    FD1P3IX par_out__i1 (.D(ff[0]), .SP(fpga_clk_enable_19), .CD(n228), 
            .CK(fpga_clk), .Q(dac_out_c_0)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i1.GSR = "ENABLED";
    FD1P3IX ff__i0 (.D(ff[1]), .SP(fpga_clk_enable_36), .CD(n228), .CK(fpga_clk), 
            .Q(ff[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i0.GSR = "ENABLED";
    FD1P3IX par_out__i2 (.D(ff[1]), .SP(fpga_clk_enable_19), .CD(n228), 
            .CK(fpga_clk), .Q(dac_out_c_1)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i2.GSR = "ENABLED";
    FD1P3IX par_out__i3 (.D(ff[2]), .SP(fpga_clk_enable_19), .CD(n228), 
            .CK(fpga_clk), .Q(dac_out_c_2)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i3.GSR = "ENABLED";
    FD1P3IX par_out__i4 (.D(ff[3]), .SP(fpga_clk_enable_19), .CD(n228), 
            .CK(fpga_clk), .Q(dac_out_c_3)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i4.GSR = "ENABLED";
    FD1P3IX par_out__i5 (.D(ff[4]), .SP(fpga_clk_enable_19), .CD(n228), 
            .CK(fpga_clk), .Q(dac_out_c_4)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i5.GSR = "ENABLED";
    FD1P3IX par_out__i6 (.D(ff[5]), .SP(fpga_clk_enable_19), .CD(n228), 
            .CK(fpga_clk), .Q(dac_out_c_5)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i6.GSR = "ENABLED";
    FD1P3IX par_out__i7 (.D(ff[6]), .SP(fpga_clk_enable_19), .CD(n228), 
            .CK(fpga_clk), .Q(dac_out_c_6)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i7.GSR = "ENABLED";
    FD1P3IX par_out__i8 (.D(ff[7]), .SP(fpga_clk_enable_19), .CD(n228), 
            .CK(fpga_clk), .Q(dac_out_c_7)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i8.GSR = "ENABLED";
    FD1P3IX ff__i1 (.D(ff[2]), .SP(fpga_clk_enable_36), .CD(n228), .CK(fpga_clk), 
            .Q(ff[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i1.GSR = "ENABLED";
    FD1P3IX ff__i2 (.D(ff[3]), .SP(fpga_clk_enable_36), .CD(n228), .CK(fpga_clk), 
            .Q(ff[2])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i2.GSR = "ENABLED";
    FD1P3IX ff__i3 (.D(ff[4]), .SP(fpga_clk_enable_36), .CD(n228), .CK(fpga_clk), 
            .Q(ff[3])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i3.GSR = "ENABLED";
    FD1P3IX ff__i4 (.D(ff[5]), .SP(fpga_clk_enable_36), .CD(n228), .CK(fpga_clk), 
            .Q(ff[4])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i4.GSR = "ENABLED";
    FD1P3IX ff__i5 (.D(ff[6]), .SP(fpga_clk_enable_36), .CD(n228), .CK(fpga_clk), 
            .Q(ff[5])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i5.GSR = "ENABLED";
    FD1P3IX ff__i6 (.D(ff[7]), .SP(fpga_clk_enable_36), .CD(n228), .CK(fpga_clk), 
            .Q(ff[6])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i6.GSR = "ENABLED";
    FD1P3IX ff__i7 (.D(ser_out), .SP(fpga_clk_enable_36), .CD(n228), .CK(fpga_clk), 
            .Q(ff[7])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=81, LSE_RLINE=81 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i7.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module edge_det_U0
//

module edge_det_U0 (fpga_clk, n228, ddDclk, kreset_c, fpga_clk_enable_36, 
            rclk_rise, fpga_clk_enable_19) /* synthesis syn_module_defined=1 */ ;
    input fpga_clk;
    input n228;
    input ddDclk;
    input kreset_c;
    output fpga_clk_enable_36;
    input rclk_rise;
    output fpga_clk_enable_19;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    
    wire resync;
    
    FD1S3IX resync_10 (.D(ddDclk), .CK(fpga_clk), .CD(n228), .Q(resync));   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    LUT4 i52_2_lut_2_lut_3_lut (.A(ddDclk), .B(resync), .C(kreset_c), 
         .Z(fpga_clk_enable_36)) /* synthesis lut_function=(!(A (B (C))+!A (C))) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(10[17:31])
    defparam i52_2_lut_2_lut_3_lut.init = 16'h2f2f;
    LUT4 i51_3_lut_3_lut_4_lut (.A(ddDclk), .B(resync), .C(rclk_rise), 
         .D(kreset_c), .Z(fpga_clk_enable_19)) /* synthesis lut_function=(A (B (C+!(D))+!B !(D))+!A (C+!(D))) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(10[17:31])
    defparam i51_3_lut_3_lut_4_lut.init = 16'hd0ff;
    
endmodule
//
// Verilog Description of module Latch_SR_N
//

module Latch_SR_N (\ff[13] , fpga_clk, fpga_clk_enable_49, n228, ff_15__N_155, 
            \ff[15] , \ff[14] , \ff[12] , \ff[11] , \ff[10] , \ff[9] , 
            \ff[8] , \ff[7] , \ff[6] , \ff[5] , \ff[4] , \ff[3] , 
            \ff[2] , \ff[1] , t_out_c) /* synthesis syn_module_defined=1 */ ;
    output \ff[13] ;
    input fpga_clk;
    input fpga_clk_enable_49;
    input n228;
    input [15:0]ff_15__N_155;
    output \ff[15] ;
    output \ff[14] ;
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
    output t_out_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    
    FD1P3IX ff__i14 (.D(ff_15__N_155[13]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[13] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i14.GSR = "ENABLED";
    FD1P3IX ff__i16 (.D(ff_15__N_155[15]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[15] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i16.GSR = "ENABLED";
    FD1P3IX ff__i15 (.D(ff_15__N_155[14]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[14] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i15.GSR = "ENABLED";
    FD1P3IX ff__i13 (.D(ff_15__N_155[12]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[12] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i13.GSR = "ENABLED";
    FD1P3IX ff__i12 (.D(ff_15__N_155[11]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[11] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i12.GSR = "ENABLED";
    FD1P3IX ff__i11 (.D(ff_15__N_155[10]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[10] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i11.GSR = "ENABLED";
    FD1P3IX ff__i10 (.D(ff_15__N_155[9]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[9] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i10.GSR = "ENABLED";
    FD1P3IX ff__i9 (.D(ff_15__N_155[8]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[8] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i9.GSR = "ENABLED";
    FD1P3IX ff__i8 (.D(ff_15__N_155[7]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[7] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i8.GSR = "ENABLED";
    FD1P3IX ff__i7 (.D(ff_15__N_155[6]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[6] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i7.GSR = "ENABLED";
    FD1P3IX ff__i6 (.D(ff_15__N_155[5]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[5] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i6.GSR = "ENABLED";
    FD1P3IX ff__i5 (.D(ff_15__N_155[4]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[4] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i5.GSR = "ENABLED";
    FD1P3IX ff__i4 (.D(ff_15__N_155[3]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[3] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i4.GSR = "ENABLED";
    FD1P3IX ff__i3 (.D(ff_15__N_155[2]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[2] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i3.GSR = "ENABLED";
    FD1P3IX ff__i2 (.D(ff_15__N_155[1]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(\ff[1] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i2.GSR = "ENABLED";
    FD1P3IX ff__i1 (.D(ff_15__N_155[0]), .SP(fpga_clk_enable_49), .CD(n228), 
            .CK(fpga_clk), .Q(t_out_c)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=86, LSE_RLINE=86 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/latch_sr_n.v(16[9] 30[5])
    defparam ff__i1.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module \SR_Latch_N(N=24) 
//

module \SR_Latch_N(N=24)  (leds_c_0, fpga_clk, fpga_clk_enable_12, n228, 
            leds_c_1, leds_c_2, leds_c_3, leds_c_4, leds_c_5, leds_c_6, 
            leds_c_7, fpga_clk_enable_29, dac_out_c_3) /* synthesis syn_module_defined=1 */ ;
    output leds_c_0;
    input fpga_clk;
    input fpga_clk_enable_12;
    input n228;
    output leds_c_1;
    output leds_c_2;
    output leds_c_3;
    output leds_c_4;
    output leds_c_5;
    output leds_c_6;
    output leds_c_7;
    input fpga_clk_enable_29;
    input dac_out_c_3;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    wire [23:0]ff;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(12[15:17])
    
    FD1P3IX par_out__i16 (.D(ff[16]), .SP(fpga_clk_enable_12), .CD(n228), 
            .CK(fpga_clk), .Q(leds_c_0)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i16.GSR = "ENABLED";
    FD1P3IX par_out__i17 (.D(ff[17]), .SP(fpga_clk_enable_12), .CD(n228), 
            .CK(fpga_clk), .Q(leds_c_1)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i17.GSR = "ENABLED";
    FD1P3IX par_out__i18 (.D(ff[18]), .SP(fpga_clk_enable_12), .CD(n228), 
            .CK(fpga_clk), .Q(leds_c_2)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i18.GSR = "ENABLED";
    FD1P3IX par_out__i19 (.D(ff[19]), .SP(fpga_clk_enable_12), .CD(n228), 
            .CK(fpga_clk), .Q(leds_c_3)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i19.GSR = "ENABLED";
    FD1P3IX par_out__i20 (.D(ff[20]), .SP(fpga_clk_enable_12), .CD(n228), 
            .CK(fpga_clk), .Q(leds_c_4)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i20.GSR = "ENABLED";
    FD1P3IX par_out__i21 (.D(ff[21]), .SP(fpga_clk_enable_12), .CD(n228), 
            .CK(fpga_clk), .Q(leds_c_5)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i21.GSR = "ENABLED";
    FD1P3IX par_out__i22 (.D(ff[22]), .SP(fpga_clk_enable_12), .CD(n228), 
            .CK(fpga_clk), .Q(leds_c_6)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i22.GSR = "ENABLED";
    FD1P3IX par_out__i23 (.D(ff[23]), .SP(fpga_clk_enable_12), .CD(n228), 
            .CK(fpga_clk), .Q(leds_c_7)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam par_out__i23.GSR = "ENABLED";
    FD1P3IX ff__i16 (.D(ff[17]), .SP(fpga_clk_enable_29), .CD(n228), .CK(fpga_clk), 
            .Q(ff[16])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i16.GSR = "ENABLED";
    FD1P3IX ff__i17 (.D(ff[18]), .SP(fpga_clk_enable_29), .CD(n228), .CK(fpga_clk), 
            .Q(ff[17])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i17.GSR = "ENABLED";
    FD1P3IX ff__i18 (.D(ff[19]), .SP(fpga_clk_enable_29), .CD(n228), .CK(fpga_clk), 
            .Q(ff[18])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i18.GSR = "ENABLED";
    FD1P3IX ff__i19 (.D(ff[20]), .SP(fpga_clk_enable_29), .CD(n228), .CK(fpga_clk), 
            .Q(ff[19])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i19.GSR = "ENABLED";
    FD1P3IX ff__i20 (.D(ff[21]), .SP(fpga_clk_enable_29), .CD(n228), .CK(fpga_clk), 
            .Q(ff[20])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i20.GSR = "ENABLED";
    FD1P3IX ff__i21 (.D(ff[22]), .SP(fpga_clk_enable_29), .CD(n228), .CK(fpga_clk), 
            .Q(ff[21])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i21.GSR = "ENABLED";
    FD1P3IX ff__i22 (.D(ff[23]), .SP(fpga_clk_enable_29), .CD(n228), .CK(fpga_clk), 
            .Q(ff[22])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i22.GSR = "ENABLED";
    FD1P3IX ff__i23 (.D(dac_out_c_3), .SP(fpga_clk_enable_29), .CD(n228), 
            .CK(fpga_clk), .Q(ff[23])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=145, LSE_LLINE=82, LSE_RLINE=82 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_latch.v(16[10] 29[8])
    defparam ff__i23.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module edge_det_U1
//

module edge_det_U1 (fpga_clk, n228, ddDlatch, fpga_clk_enable_2, kreset_c, 
            fpga_clk_enable_29, rclk_rise) /* synthesis syn_module_defined=1 */ ;
    input fpga_clk;
    input n228;
    input ddDlatch;
    output fpga_clk_enable_2;
    input kreset_c;
    output fpga_clk_enable_29;
    output rclk_rise;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    
    wire resync;
    
    FD1S3IX resync_10 (.D(ddDlatch), .CK(fpga_clk), .CD(n228), .Q(resync));   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    LUT4 resync_I_0_2_lut_rep_2 (.A(resync), .B(ddDlatch), .Z(fpga_clk_enable_2)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam resync_I_0_2_lut_rep_2.init = 16'h2222;
    LUT4 i54_2_lut_2_lut_3_lut (.A(resync), .B(ddDlatch), .C(kreset_c), 
         .Z(fpga_clk_enable_29)) /* synthesis lut_function=(!(A (B (C))+!A (C))) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(11[17:31])
    defparam i54_2_lut_2_lut_3_lut.init = 16'h2f2f;
    LUT4 s_in_I_0_11_2_lut (.A(ddDlatch), .B(resync), .Z(rclk_rise)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/edge_det.v(10[17:31])
    defparam s_in_I_0_11_2_lut.init = 16'h2222;
    
endmodule
//
// Verilog Description of module delay
//

module delay (ddDlatch, fpga_clk, n228, dDlatch) /* synthesis syn_module_defined=1 */ ;
    output ddDlatch;
    input fpga_clk;
    input n228;
    input dDlatch;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    
    FD1S3IX sync_6 (.D(dDlatch), .CK(fpga_clk), .CD(n228), .Q(ddDlatch));   // c:/dan/engineering/lattice/learning/kanalogbuffer/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U3
//

module delay_U3 (ddDclk, fpga_clk, n228, dDclk) /* synthesis syn_module_defined=1 */ ;
    output ddDclk;
    input fpga_clk;
    input n228;
    input dDclk;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    
    FD1S3IX sync_6 (.D(dDclk), .CK(fpga_clk), .CD(n228), .Q(ddDclk));   // c:/dan/engineering/lattice/learning/kanalogbuffer/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module sig_sync
//

module sig_sync (ser_out, fpga_clk, xDdout_c_c) /* synthesis syn_module_defined=1 */ ;
    output ser_out;
    input fpga_clk;
    input xDdout_c_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/kbuf_top.v(39[62:70])
    wire [1:0]resync;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(7[14:20])
    
    FD1S3AX resync_i1 (.D(resync[1]), .CK(fpga_clk), .Q(ser_out)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=70, LSE_LLINE=73, LSE_RLINE=73 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(11[10] 14[8])
    defparam resync_i1.GSR = "ENABLED";
    FD1S3AX resync_i2 (.D(xDdout_c_c), .CK(fpga_clk), .Q(resync[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=70, LSE_LLINE=73, LSE_RLINE=73 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(11[10] 14[8])
    defparam resync_i2.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

