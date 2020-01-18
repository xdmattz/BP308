// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.10.0.111.2
// Netlist written on Thu Mar 14 22:59:16 2019
//
// Verilog Description of module kbuf_top
//

module kbuf_top (AinDout, AinDoutBuff, Dlatch, Ddin, Dclk, Ddout, 
            kreset, ka_in, ka_out, dac_out, k_clk, start_in, kdata_io, 
            k_in, k_out, dac_clk, tp3, tp4) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(1[8:16])
    input AinDout;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(13[8:15])
    output AinDoutBuff;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(14[9:20])
    input Dlatch;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(17[8:14])
    output Ddin;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(18[9:13])
    input Dclk;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(19[8:12])
    input Ddout;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(20[8:13])
    input kreset;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(22[8:14])
    input [15:0]ka_in;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    output [15:0]ka_out;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    output [7:0]dac_out;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(50[15:22])
    input k_clk;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(64[8:13])
    input start_in;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(65[8:16])
    inout [7:0]kdata_io;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(66[13:21])
    input [23:0]k_in;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    output [15:0]k_out;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    output dac_clk;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(107[13:20])
    output tp3;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(109[9:12])
    output tp4;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(110[9:12])
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    wire GND_net, VCC_net, AinDoutBuff_c_c, Dlatch_c, Ddin_c_0, Dclk_c, 
        Ddout_c, kreset_c, ka_in_c_15, ka_in_c_14, ka_in_c_13, ka_in_c_12, 
        ka_in_c_11, ka_in_c_10, ka_in_c_9, ka_in_c_8, ka_in_c_7, ka_in_c_6, 
        ka_in_c_5, ka_in_c_4, ka_in_c_3, ka_in_c_2, ka_in_c_1, ka_in_c_0, 
        ka_out_c_15, ka_out_c_14, ka_out_c_13, ka_out_c_12, ka_out_c_11, 
        ka_out_c_10, ka_out_c_9, ka_out_c_8, ka_out_c_7, ka_out_c_6, 
        ka_out_c_5, ka_out_c_4, ka_out_c_3, ka_out_c_2, ka_out_c_1, 
        ka_out_c_0, dac_out_c_7, dac_out_c_6, dac_out_c_5, dac_out_c_4, 
        dac_out_c_3, dac_out_c_2, dac_out_c_1, dac_out_c_0, k_clk_c, 
        start_in_c, k_in_c_23, k_in_c_22, k_in_c_21, k_in_c_20, k_in_c_19, 
        k_in_c_18, k_in_c_17, k_in_c_16, k_in_c_9, k_in_c_8, k_in_c_7, 
        k_in_c_6, k_in_c_5, k_in_c_4, k_in_c_3, k_in_c_2, k_in_c_1, 
        k_in_c_0, k_out_c_15, k_out_c_14, k_out_c_13, k_out_c_12, 
        k_out_c_11, k_out_c_10, k_out_c_9, k_out_c_8, k_out_c_7, k_out_c_6, 
        k_out_c_5, k_out_c_4, k_out_c_3, k_out_c_2, k_out_c_1, k_out_c_0, 
        dac_clk_c, tp3_c, ser_out, n1290, dDclk, ddDclk, dDlatch, 
        ddDlatch, n1289, dk_clk, ddk_clk, fpga_clk_enable_100, dstart_in, 
        ddstart_in, sm_en;
    wire [2:0]state_cnt;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(220[12:21])
    wire [7:0]data_in;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(222[13:20])
    wire [7:0]data_out;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(223[12:20])
    
    wire n1287, tp4_N_63, tp4_N_61, sm_en_N_68, n1286, fpga_clk_enable_87, 
        fpga_clk_enable_31, fpga_clk_enable_48, fpga_clk_enable_38, n1284, 
        n1283, n6, fpga_clk_enable_80, n1281, n1288, n1285, n1282, 
        n1261, n1273, n1279, fpga_clk_enable_101, n1265, n1264, 
        n1280, fpga_clk_enable_55, n630, n1262, n1278, n1277, n428, 
        n427, n429, resync, fpga_clk_enable_46, resync_adj_235, resync_adj_236, 
        n1275, n1274, n1260, n1219, n1299, n1259, n1263, n1241, 
        n1276, n6_adj_237, n1272, n640, n1240;
    wire [15:0]ff_adj_245;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(12[14:16])
    
    wire n1271;
    wire [15:0]ff_15__N_219;
    
    wire n1198, resync_adj_238, n1269, n1270, fpga_clk_enable_6, n1267, 
        resync_adj_239, fpga_clk_enable_1, n1239;
    
    VHI i2 (.Z(VCC_net));
    edge_det start_in_edge (.resync(resync_adj_239), .fpga_clk(fpga_clk), 
            .n1265(n1265), .ddstart_in(ddstart_in)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(214[11:118])
    BB io_port7 (.I(data_out[7]), .T(tp4_N_61), .B(kdata_io[7]), .O(data_in[7])) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(228[5:78])
    LUT4 mux_174_i6_else_4_lut (.A(k_in_c_5), .B(state_cnt[2]), .C(state_cnt[0]), 
         .D(state_cnt[1]), .Z(n1270)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C+(D)))) */ ;
    defparam mux_174_i6_else_4_lut.init = 16'hcec0;
    FD1P3IX sm_en_79 (.D(sm_en_N_68), .SP(fpga_clk_enable_1), .CD(n1265), 
            .CK(fpga_clk), .Q(sm_en));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam sm_en_79.GSR = "ENABLED";
    delay_U8 dly3 (.dDlatch(dDlatch), .fpga_clk(fpga_clk), .n1265(n1265), 
            .Dlatch_c(Dlatch_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(148[8:75])
    LUT4 i813_4_lut (.A(k_clk_c), .B(tp4_N_63), .C(start_in_c), .D(sm_en), 
         .Z(tp4_N_61)) /* synthesis lut_function=(((C+!(D))+!B)+!A) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(226[21:88])
    defparam i813_4_lut.init = 16'hf7ff;
    LUT4 k_in_c_6_bdd_4_lut_4_lut_then_3_lut (.A(state_cnt[0]), .B(k_in_c_22), 
         .C(state_cnt[1]), .Z(n1274)) /* synthesis lut_function=(A+!((C)+!B)) */ ;
    defparam k_in_c_6_bdd_4_lut_4_lut_then_3_lut.init = 16'haeae;
    LUT4 i2_3_lut_4_lut (.A(n1198), .B(n1262), .C(n6), .D(kreset_c), 
         .Z(n640)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;
    defparam i2_3_lut_4_lut.init = 16'h2000;
    OB ka_out_pad_12 (.I(ka_out_c_12), .O(ka_out[12]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OB Ddin_pad (.I(Ddin_c_0), .O(Ddin));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(18[9:13])
    OB ka_out_pad_13 (.I(ka_out_c_13), .O(ka_out[13]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OSCH rc_oscillator (.STDBY(GND_net), .OSC(fpga_clk)) /* synthesis syn_instantiated=1 */ ;
    defparam rc_oscillator.NOM_FREQ = "66.50";
    OB ka_out_pad_14 (.I(ka_out_c_14), .O(ka_out[14]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    FD1P3IX k_out__i1 (.D(data_in[0]), .SP(fpga_clk_enable_38), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_0));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i1.GSR = "ENABLED";
    LUT4 i2_3_lut (.A(ddk_clk), .B(sm_en), .C(resync_adj_238), .Z(n1198)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;
    defparam i2_3_lut.init = 16'h4040;
    OB ka_out_pad_6 (.I(ka_out_c_6), .O(ka_out[6]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    FD1P3IX state_cnt__i0 (.D(n429), .SP(fpga_clk_enable_48), .CD(n630), 
            .CK(fpga_clk), .Q(state_cnt[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam state_cnt__i0.GSR = "ENABLED";
    FD1P3IX data_out__i0 (.D(n1287), .SP(fpga_clk_enable_55), .CD(n640), 
            .CK(fpga_clk), .Q(data_out[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam data_out__i0.GSR = "ENABLED";
    LUT4 i285_2_lut_3_lut (.A(state_cnt[0]), .B(n1269), .C(state_cnt[1]), 
         .Z(n428)) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(261[17:30])
    defparam i285_2_lut_3_lut.init = 16'h7878;
    LUT4 k_in_c_6_bdd_4_lut_4_lut_else_3_lut (.A(state_cnt[0]), .B(k_in_c_6), 
         .C(state_cnt[1]), .Z(n1273)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;
    defparam k_in_c_6_bdd_4_lut_4_lut_else_3_lut.init = 16'h4040;
    BB io_port6 (.I(data_out[6]), .T(tp4_N_61), .B(kdata_io[6]), .O(data_in[6])) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(229[5:78])
    BB io_port5 (.I(data_out[5]), .T(tp4_N_61), .B(kdata_io[5]), .O(data_in[5])) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(230[5:78])
    BB io_port4 (.I(data_out[4]), .T(tp4_N_61), .B(kdata_io[4]), .O(data_in[4])) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(231[5:78])
    BB io_port3 (.I(data_out[3]), .T(tp4_N_61), .B(kdata_io[3]), .O(data_in[3])) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(232[5:78])
    BB io_port2 (.I(data_out[2]), .T(tp4_N_61), .B(kdata_io[2]), .O(data_in[2])) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(233[5:78])
    BB io_port1 (.I(data_out[1]), .T(tp4_N_61), .B(kdata_io[1]), .O(data_in[1])) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(234[5:78])
    BB io_port0 (.I(data_out[0]), .T(tp4_N_61), .B(kdata_io[0]), .O(data_in[0])) /* synthesis syn_instantiated=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(235[5:78])
    OB ka_out_pad_7 (.I(ka_out_c_7), .O(ka_out[7]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    FD1P3IX dac_clk_77 (.D(n1299), .SP(fpga_clk_enable_6), .CD(n1260), 
            .CK(fpga_clk), .Q(dac_clk_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(178[9] 188[5])
    defparam dac_clk_77.GSR = "ENABLED";
    LUT4 i292_3_lut_4_lut (.A(state_cnt[0]), .B(n1269), .C(state_cnt[1]), 
         .D(state_cnt[2]), .Z(n427)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(261[17:30])
    defparam i292_3_lut_4_lut.init = 16'h7f80;
    delay_U10 dly1 (.dDclk(dDclk), .fpga_clk(fpga_clk), .n1265(n1265), 
            .Dclk_c(Dclk_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(142[9:72])
    delay_U7 dly4 (.ddDlatch(ddDlatch), .fpga_clk(fpga_clk), .n1265(n1265), 
            .dDlatch(dDlatch)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(149[8:77])
    LUT4 i820_2_lut_3_lut_4_lut_4_lut_4_lut (.A(kreset_c), .B(n1198), .C(n1262), 
         .D(n1263), .Z(fpga_clk_enable_38)) /* synthesis lut_function=(!(A ((C+(D))+!B)+!A (D))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(176[56:63])
    defparam i820_2_lut_3_lut_4_lut_4_lut_4_lut.init = 16'h005d;
    delay_U6 dly5 (.dk_clk(dk_clk), .fpga_clk(fpga_clk), .n1265(n1265), 
            .k_clk_c(k_clk_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(203[8:73])
    LUT4 k_in_c_4_bdd_4_lut_4_lut_then_3_lut (.A(state_cnt[0]), .B(k_in_c_20), 
         .C(state_cnt[1]), .Z(n1277)) /* synthesis lut_function=(A+!((C)+!B)) */ ;
    defparam k_in_c_4_bdd_4_lut_4_lut_then_3_lut.init = 16'haeae;
    LUT4 i2_4_lut (.A(n1262), .B(kreset_c), .C(n1263), .D(n1198), .Z(fpga_clk_enable_55)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;
    defparam i2_4_lut.init = 16'h4000;
    delay_U9 dly2 (.ddDclk(ddDclk), .fpga_clk(fpga_clk), .n1265(n1265), 
            .dDclk(dDclk)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(143[8:73])
    \SR_Latch_N(N=24)  ka_out_15__I_0 (.fpga_clk(fpga_clk), .fpga_clk_enable_80(fpga_clk_enable_80), 
            .n1265(n1265), .ka_out_c_9(ka_out_c_9), .fpga_clk_enable_101(fpga_clk_enable_101), 
            .ka_out_c_10(ka_out_c_10), .ka_out_c_11(ka_out_c_11), .ka_out_c_12(ka_out_c_12), 
            .ka_out_c_13(ka_out_c_13), .ka_out_c_14(ka_out_c_14), .ka_out_c_15(ka_out_c_15), 
            .ka_out_c_0(ka_out_c_0), .ka_out_c_1(ka_out_c_1), .ka_out_c_2(ka_out_c_2), 
            .ka_out_c_3(ka_out_c_3), .ka_out_c_4(ka_out_c_4), .ka_out_c_5(ka_out_c_5), 
            .ka_out_c_6(ka_out_c_6), .ka_out_c_7(ka_out_c_7), .dac_out_c_3(dac_out_c_3), 
            .ka_out_c_8(ka_out_c_8)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(167[23:146])
    delay_U5 dly6 (.ddk_clk(ddk_clk), .fpga_clk(fpga_clk), .n1265(n1265), 
            .dk_clk(dk_clk)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(204[8:75])
    LUT4 i818_4_lut (.A(data_in[5]), .B(n1219), .C(data_in[7]), .D(n6_adj_237), 
         .Z(sm_en_N_68)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(254[7:33])
    defparam i818_4_lut.init = 16'h0004;
    delay_U4 dly7 (.dstart_in(dstart_in), .fpga_clk(fpga_clk), .n1265(n1265), 
            .start_in_c(start_in_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(212[8:79])
    OB ka_out_pad_8 (.I(ka_out_c_8), .O(ka_out[8]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    SR_Latch_N sr1 (.dac_out_c_0(dac_out_c_0), .fpga_clk(fpga_clk), .fpga_clk_enable_31(fpga_clk_enable_31), 
            .n1265(n1265), .fpga_clk_enable_87(fpga_clk_enable_87), .dac_out_c_1(dac_out_c_1), 
            .dac_out_c_2(dac_out_c_2), .dac_out_c_3(dac_out_c_3), .dac_out_c_4(dac_out_c_4), 
            .dac_out_c_5(dac_out_c_5), .dac_out_c_6(dac_out_c_6), .dac_out_c_7(dac_out_c_7), 
            .ser_out(ser_out)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(161[22:130])
    LUT4 k_in_c_4_bdd_4_lut_4_lut_else_3_lut (.A(state_cnt[0]), .B(k_in_c_4), 
         .C(state_cnt[1]), .Z(n1276)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;
    defparam k_in_c_4_bdd_4_lut_4_lut_else_3_lut.init = 16'h4040;
    LUT4 mux_174_i4_then_4_lut (.A(state_cnt[0]), .B(state_cnt[1]), .C(state_cnt[2]), 
         .D(k_in_c_19), .Z(n1280)) /* synthesis lut_function=(!(A+(B (C)+!B !(C (D))))) */ ;
    defparam mux_174_i4_then_4_lut.init = 16'h1404;
    OB ka_out_pad_9 (.I(ka_out_c_9), .O(ka_out[9]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OB AinDoutBuff_pad (.I(AinDoutBuff_c_c), .O(AinDoutBuff));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(14[9:20])
    OB ka_out_pad_15 (.I(ka_out_c_15), .O(ka_out[15]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OB ka_out_pad_10 (.I(ka_out_c_10), .O(ka_out[10]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OB ka_out_pad_11 (.I(ka_out_c_11), .O(ka_out[11]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    LUT4 mux_174_i4_else_4_lut (.A(state_cnt[0]), .B(state_cnt[1]), .C(state_cnt[2]), 
         .D(k_in_c_19), .Z(n1279)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam mux_174_i4_else_4_lut.init = 16'h1000;
    OB ka_out_pad_5 (.I(ka_out_c_5), .O(ka_out[5]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OB ka_out_pad_4 (.I(ka_out_c_4), .O(ka_out[4]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OB ka_out_pad_3 (.I(ka_out_c_3), .O(ka_out[3]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OB ka_out_pad_2 (.I(ka_out_c_2), .O(ka_out[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OB ka_out_pad_1 (.I(ka_out_c_1), .O(ka_out[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OB ka_out_pad_0 (.I(ka_out_c_0), .O(ka_out[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(29[16:22])
    OB dac_out_pad_7 (.I(dac_out_c_7), .O(dac_out[7]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(50[15:22])
    OB dac_out_pad_6 (.I(dac_out_c_6), .O(dac_out[6]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(50[15:22])
    OB dac_out_pad_5 (.I(dac_out_c_5), .O(dac_out[5]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(50[15:22])
    OB dac_out_pad_4 (.I(dac_out_c_4), .O(dac_out[4]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(50[15:22])
    OB dac_out_pad_3 (.I(dac_out_c_3), .O(dac_out[3]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(50[15:22])
    OB dac_out_pad_2 (.I(dac_out_c_2), .O(dac_out[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(50[15:22])
    OB dac_out_pad_1 (.I(dac_out_c_1), .O(dac_out[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(50[15:22])
    OB dac_out_pad_0 (.I(dac_out_c_0), .O(dac_out[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(50[15:22])
    OB k_out_pad_15 (.I(k_out_c_15), .O(k_out[15]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_14 (.I(k_out_c_14), .O(k_out[14]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_13 (.I(k_out_c_13), .O(k_out[13]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_12 (.I(k_out_c_12), .O(k_out[12]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_11 (.I(k_out_c_11), .O(k_out[11]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_10 (.I(k_out_c_10), .O(k_out[10]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_9 (.I(k_out_c_9), .O(k_out[9]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_8 (.I(k_out_c_8), .O(k_out[8]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_7 (.I(k_out_c_7), .O(k_out[7]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_6 (.I(k_out_c_6), .O(k_out[6]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_5 (.I(k_out_c_5), .O(k_out[5]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_4 (.I(k_out_c_4), .O(k_out[4]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_3 (.I(k_out_c_3), .O(k_out[3]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_2 (.I(k_out_c_2), .O(k_out[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_1 (.I(k_out_c_1), .O(k_out[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB k_out_pad_0 (.I(k_out_c_0), .O(k_out[0]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(83[20:25])
    OB dac_clk_pad (.I(dac_clk_c), .O(dac_clk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(107[13:20])
    OB tp3_pad (.I(tp3_c), .O(tp3));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(109[9:12])
    OB tp4_pad (.I(tp4_N_61), .O(tp4));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(110[9:12])
    IB AinDoutBuff_c_pad (.I(AinDout), .O(AinDoutBuff_c_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(13[8:15])
    IB Dlatch_pad (.I(Dlatch), .O(Dlatch_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(17[8:14])
    IB Dclk_pad (.I(Dclk), .O(Dclk_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(19[8:12])
    IB Ddout_pad (.I(Ddout), .O(Ddout_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(20[8:13])
    IB kreset_pad (.I(kreset), .O(kreset_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(22[8:14])
    IB ka_in_pad_15 (.I(ka_in[15]), .O(ka_in_c_15));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_14 (.I(ka_in[14]), .O(ka_in_c_14));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_13 (.I(ka_in[13]), .O(ka_in_c_13));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_12 (.I(ka_in[12]), .O(ka_in_c_12));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_11 (.I(ka_in[11]), .O(ka_in_c_11));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_10 (.I(ka_in[10]), .O(ka_in_c_10));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_9 (.I(ka_in[9]), .O(ka_in_c_9));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_8 (.I(ka_in[8]), .O(ka_in_c_8));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_7 (.I(ka_in[7]), .O(ka_in_c_7));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_6 (.I(ka_in[6]), .O(ka_in_c_6));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_5 (.I(ka_in[5]), .O(ka_in_c_5));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_4 (.I(ka_in[4]), .O(ka_in_c_4));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_3 (.I(ka_in[3]), .O(ka_in_c_3));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_2 (.I(ka_in[2]), .O(ka_in_c_2));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_1 (.I(ka_in[1]), .O(ka_in_c_1));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB ka_in_pad_0 (.I(ka_in[0]), .O(ka_in_c_0));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(24[15:20])
    IB k_clk_pad (.I(k_clk), .O(k_clk_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(64[8:13])
    IB start_in_pad (.I(start_in), .O(start_in_c));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(65[8:16])
    IB k_in_pad_23 (.I(k_in[23]), .O(k_in_c_23));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_22 (.I(k_in[22]), .O(k_in_c_22));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_21 (.I(k_in[21]), .O(k_in_c_21));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_20 (.I(k_in[20]), .O(k_in_c_20));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_19 (.I(k_in[19]), .O(k_in_c_19));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_18 (.I(k_in[18]), .O(k_in_c_18));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_17 (.I(k_in[17]), .O(k_in_c_17));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_16 (.I(k_in[16]), .O(k_in_c_16));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_9 (.I(k_in[9]), .O(k_in_c_9));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_8 (.I(k_in[8]), .O(k_in_c_8));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_7 (.I(k_in[7]), .O(k_in_c_7));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_6 (.I(k_in[6]), .O(k_in_c_6));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_5 (.I(k_in[5]), .O(k_in_c_5));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_4 (.I(k_in[4]), .O(k_in_c_4));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_3 (.I(k_in[3]), .O(k_in_c_3));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_2 (.I(k_in[2]), .O(k_in_c_2));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_1 (.I(k_in[1]), .O(k_in_c_1));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    IB k_in_pad_0 (.I(k_in[0]), .O(k_in_c_0));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(70[15:19])
    LUT4 i14_4_lut_3_lut (.A(state_cnt[2]), .B(state_cnt[0]), .C(state_cnt[1]), 
         .Z(n6)) /* synthesis lut_function=(A (B (C))+!A !(B+(C))) */ ;
    defparam i14_4_lut_3_lut.init = 16'h8181;
    LUT4 i2_3_lut_rep_14 (.A(sm_en), .B(resync_adj_238), .C(ddk_clk), 
         .Z(n1269)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(259[11:29])
    defparam i2_3_lut_rep_14.init = 16'h2020;
    LUT4 i277_2_lut_4_lut (.A(sm_en), .B(resync_adj_238), .C(ddk_clk), 
         .D(state_cnt[0]), .Z(n429)) /* synthesis lut_function=(A (B (D)+!B !(C (D)+!C !(D)))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(259[11:29])
    defparam i277_2_lut_4_lut.init = 16'hdf20;
    LUT4 i809_2_lut_rep_7 (.A(ddstart_in), .B(resync_adj_239), .Z(n1262)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i809_2_lut_rep_7.init = 16'h6666;
    LUT4 i1_2_lut_rep_4_3_lut (.A(ddstart_in), .B(resync_adj_239), .C(n1198), 
         .Z(n1259)) /* synthesis lut_function=(A (B (C))+!A !(B+!(C))) */ ;
    defparam i1_2_lut_rep_4_3_lut.init = 16'h9090;
    LUT4 mux_174_i3_then_4_lut (.A(k_in_c_2), .B(state_cnt[2]), .C(state_cnt[0]), 
         .D(state_cnt[1]), .Z(n1283)) /* synthesis lut_function=(A (B+!(C+!(D)))+!A (B)) */ ;
    defparam mux_174_i3_then_4_lut.init = 16'hcecc;
    LUT4 mux_174_i3_else_4_lut (.A(k_in_c_2), .B(state_cnt[2]), .C(state_cnt[0]), 
         .D(state_cnt[1]), .Z(n1282)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C+(D)))) */ ;
    defparam mux_174_i3_else_4_lut.init = 16'hcec0;
    LUT4 i799_4_lut (.A(data_in[0]), .B(data_in[3]), .C(data_in[2]), .D(data_in[1]), 
         .Z(n1219)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i799_4_lut.init = 16'h8000;
    LUT4 mux_174_i1_4_lut_then_3_lut (.A(state_cnt[0]), .B(k_in_c_16), .C(state_cnt[1]), 
         .Z(n1286)) /* synthesis lut_function=(A+(B+(C))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(272[9] 290[28])
    defparam mux_174_i1_4_lut_then_3_lut.init = 16'hfefe;
    LUT4 mux_174_i1_4_lut_else_3_lut (.A(k_in_c_8), .B(k_in_c_0), .C(state_cnt[0]), 
         .D(state_cnt[1]), .Z(n1285)) /* synthesis lut_function=(A (B (D)+!B (C (D)))+!A !((C+!(D))+!B)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(272[9] 290[28])
    defparam mux_174_i1_4_lut_else_3_lut.init = 16'hac00;
    LUT4 i827_then_4_lut (.A(k_in_c_7), .B(state_cnt[2]), .C(state_cnt[0]), 
         .D(state_cnt[1]), .Z(n1289)) /* synthesis lut_function=(!(A (B (C)+!B (C+!(D)))+!A ((C)+!B))) */ ;
    defparam i827_then_4_lut.init = 16'h0e0c;
    LUT4 i827_else_4_lut (.A(k_in_c_7), .B(state_cnt[2]), .C(state_cnt[0]), 
         .D(state_cnt[1]), .Z(n1288)) /* synthesis lut_function=(!(A (C+!(D))+!A ((C+!(D))+!B))) */ ;
    defparam i827_else_4_lut.init = 16'h0e00;
    LUT4 i2_3_lut_rep_8 (.A(state_cnt[1]), .B(state_cnt[2]), .C(state_cnt[0]), 
         .Z(n1263)) /* synthesis lut_function=(A+(B+!(C))) */ ;
    defparam i2_3_lut_rep_8.init = 16'hefef;
    LUT4 state_cnt_2__I_0_3_lut (.A(state_cnt[2]), .B(state_cnt[1]), .C(state_cnt[0]), 
         .Z(tp4_N_63)) /* synthesis lut_function=(A+(B (C))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(226[41:87])
    defparam state_cnt_2__I_0_3_lut.init = 16'heaea;
    FD1P3IX k_out__i2 (.D(data_in[1]), .SP(fpga_clk_enable_38), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_1));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i2.GSR = "ENABLED";
    FD1P3IX k_out__i3 (.D(data_in[2]), .SP(fpga_clk_enable_38), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_2));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i3.GSR = "ENABLED";
    FD1P3IX k_out__i4 (.D(data_in[3]), .SP(fpga_clk_enable_38), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_3));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i4.GSR = "ENABLED";
    FD1P3IX k_out__i5 (.D(data_in[4]), .SP(fpga_clk_enable_38), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_4));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i5.GSR = "ENABLED";
    FD1P3IX k_out__i6 (.D(data_in[5]), .SP(fpga_clk_enable_38), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_5));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i6.GSR = "ENABLED";
    FD1P3IX k_out__i7 (.D(data_in[6]), .SP(fpga_clk_enable_38), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_6));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i7.GSR = "ENABLED";
    FD1P3IX k_out__i8 (.D(data_in[7]), .SP(fpga_clk_enable_38), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_7));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i8.GSR = "ENABLED";
    FD1P3IX k_out__i9 (.D(data_in[0]), .SP(fpga_clk_enable_46), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_8));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i9.GSR = "ENABLED";
    FD1P3IX k_out__i10 (.D(data_in[1]), .SP(fpga_clk_enable_46), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_9));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i10.GSR = "ENABLED";
    FD1P3IX k_out__i11 (.D(data_in[2]), .SP(fpga_clk_enable_46), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_10));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i11.GSR = "ENABLED";
    FD1P3IX k_out__i12 (.D(data_in[3]), .SP(fpga_clk_enable_46), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_11));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i12.GSR = "ENABLED";
    FD1P3IX k_out__i13 (.D(data_in[4]), .SP(fpga_clk_enable_46), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_12));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i13.GSR = "ENABLED";
    FD1P3IX k_out__i14 (.D(data_in[5]), .SP(fpga_clk_enable_46), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_13));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i14.GSR = "ENABLED";
    FD1P3IX k_out__i15 (.D(data_in[6]), .SP(fpga_clk_enable_46), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_14));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i15.GSR = "ENABLED";
    FD1P3IX k_out__i16 (.D(data_in[7]), .SP(fpga_clk_enable_46), .CD(n1265), 
            .CK(fpga_clk), .Q(k_out_c_15));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam k_out__i16.GSR = "ENABLED";
    FD1P3IX state_cnt__i1 (.D(n428), .SP(fpga_clk_enable_48), .CD(n630), 
            .CK(fpga_clk), .Q(state_cnt[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam state_cnt__i1.GSR = "ENABLED";
    FD1P3IX state_cnt__i2 (.D(n427), .SP(fpga_clk_enable_48), .CD(n630), 
            .CK(fpga_clk), .Q(state_cnt[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam state_cnt__i2.GSR = "ENABLED";
    FD1P3IX data_out__i1 (.D(n1241), .SP(fpga_clk_enable_55), .CD(n640), 
            .CK(fpga_clk), .Q(data_out[1]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam data_out__i1.GSR = "ENABLED";
    edge_det_U2 r_edge (.resync(resync_adj_235), .fpga_clk(fpga_clk), .n1265(n1265), 
            .ddDlatch(ddDlatch), .fpga_clk_enable_6(fpga_clk_enable_6), 
            .kreset_c(kreset_c), .fpga_clk_enable_80(fpga_clk_enable_80), 
            .n1260(n1260)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(150[11:101])
    LUT4 kreset_I_0_1_lut_rep_10 (.A(kreset_c), .Z(n1265)) /* synthesis lut_function=(!(A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(176[56:63])
    defparam kreset_I_0_1_lut_rep_10.init = 16'h5555;
    FD1P3IX data_out__i2 (.D(n1284), .SP(fpga_clk_enable_55), .CD(n640), 
            .CK(fpga_clk), .Q(data_out[2]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam data_out__i2.GSR = "ENABLED";
    FD1P3IX data_out__i3 (.D(n1281), .SP(fpga_clk_enable_55), .CD(n640), 
            .CK(fpga_clk), .Q(data_out[3]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam data_out__i3.GSR = "ENABLED";
    FD1P3IX data_out__i4 (.D(n1278), .SP(fpga_clk_enable_55), .CD(n640), 
            .CK(fpga_clk), .Q(data_out[4]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam data_out__i4.GSR = "ENABLED";
    FD1P3IX data_out__i5 (.D(n1272), .SP(fpga_clk_enable_55), .CD(n640), 
            .CK(fpga_clk), .Q(data_out[5]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam data_out__i5.GSR = "ENABLED";
    FD1P3IX data_out__i6 (.D(n1275), .SP(fpga_clk_enable_55), .CD(n640), 
            .CK(fpga_clk), .Q(data_out[6]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam data_out__i6.GSR = "ENABLED";
    FD1P3IX data_out__i7 (.D(n1290), .SP(fpga_clk_enable_55), .CD(n640), 
            .CK(fpga_clk), .Q(data_out[7]));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(240[9] 296[5])
    defparam data_out__i7.GSR = "ENABLED";
    edge_det_U1 s_edge (.resync(resync), .fpga_clk(fpga_clk), .n1265(n1265), 
            .ddDclk(ddDclk), .n1264(n1264)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(144[11:99])
    LUT4 i220_3_lut_4_lut_4_lut (.A(kreset_c), .B(n1264), .C(resync_adj_235), 
         .D(ddDlatch), .Z(fpga_clk_enable_31)) /* synthesis lut_function=(!(A (B+(C+!(D))))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(176[56:63])
    defparam i220_3_lut_4_lut_4_lut.init = 16'h5755;
    LUT4 tp3_I_0_2_lut (.A(start_in_c), .B(sm_en), .Z(tp3_c)) /* synthesis lut_function=(!(A+!(B))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(225[18:37])
    defparam tp3_I_0_2_lut.init = 16'h4444;
    LUT4 i221_2_lut_3_lut_3_lut (.A(kreset_c), .B(resync), .C(ddDclk), 
         .Z(fpga_clk_enable_87)) /* synthesis lut_function=(!(A (B+!(C)))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(176[56:63])
    defparam i221_2_lut_3_lut_3_lut.init = 16'h7575;
    LUT4 i222_4_lut_4_lut (.A(kreset_c), .B(resync_adj_236), .C(fpga_clk_enable_6), 
         .D(dac_out_c_2), .Z(fpga_clk_enable_101)) /* synthesis lut_function=(!(A (B+(C+!(D))))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(176[56:63])
    defparam i222_4_lut_4_lut.init = 16'h5755;
    LUT4 i124_3_lut_3_lut (.A(kreset_c), .B(resync_adj_239), .C(ddstart_in), 
         .Z(n630)) /* synthesis lut_function=(!(A (B+!(C)))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(176[56:63])
    defparam i124_3_lut_3_lut.init = 16'h7575;
    LUT4 i3_3_lut_4_lut_4_lut_4_lut (.A(kreset_c), .B(n1259), .C(n1261), 
         .D(state_cnt[2]), .Z(fpga_clk_enable_46)) /* synthesis lut_function=(!(A (((D)+!C)+!B)+!A ((D)+!C))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(176[56:63])
    defparam i3_3_lut_4_lut_4_lut_4_lut.init = 16'h00d0;
    LUT4 i1_2_lut_rep_6 (.A(state_cnt[1]), .B(state_cnt[0]), .Z(n1261)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam i1_2_lut_rep_6.init = 16'h2222;
    LUT4 i2_3_lut_4_lut_4_lut (.A(kreset_c), .B(n1267), .C(resync_adj_235), 
         .D(ddDlatch), .Z(fpga_clk_enable_100)) /* synthesis lut_function=((B+!(C+!(D)))+!A) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(176[56:63])
    defparam i2_3_lut_4_lut_4_lut.init = 16'hdfdd;
    PFUMX i841 (.BLUT(n1288), .ALUT(n1289), .C0(k_in_c_23), .Z(n1290));
    LUT4 i1_2_lut (.A(data_in[6]), .B(data_in[4]), .Z(n6_adj_237)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    PFUMX i839 (.BLUT(n1285), .ALUT(n1286), .C0(state_cnt[2]), .Z(n1287));
    LUT4 i1_2_lut_rep_11 (.A(resync_adj_239), .B(ddstart_in), .Z(fpga_clk_enable_1)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(248[8] 292[6])
    defparam i1_2_lut_rep_11.init = 16'h2222;
    edge_det_U0 ser_load_edge (.resync(resync_adj_236), .dac_out_c_2(dac_out_c_2), 
            .ka_in_c_4(ka_in_c_4), .\ff[5] (ff_adj_245[5]), .ff_15__N_219({ff_15__N_219}), 
            .ka_in_c_11(ka_in_c_11), .\ff[12] (ff_adj_245[12]), .ka_in_c_10(ka_in_c_10), 
            .\ff[11] (ff_adj_245[11]), .ka_in_c_5(ka_in_c_5), .\ff[6] (ff_adj_245[6]), 
            .fpga_clk(fpga_clk), .n1265(n1265), .ka_in_c_6(ka_in_c_6), 
            .\ff[7] (ff_adj_245[7]), .ka_in_c_3(ka_in_c_3), .\ff[4] (ff_adj_245[4]), 
            .ka_in_c_2(ka_in_c_2), .\ff[3] (ff_adj_245[3]), .ka_in_c_13(ka_in_c_13), 
            .\ff[14] (ff_adj_245[14]), .ka_in_c_9(ka_in_c_9), .\ff[10] (ff_adj_245[10]), 
            .ka_in_c_15(ka_in_c_15), .ka_in_c_1(ka_in_c_1), .\ff[2] (ff_adj_245[2]), 
            .ka_in_c_0(ka_in_c_0), .\ff[1] (ff_adj_245[1]), .ka_in_c_14(ka_in_c_14), 
            .\ff[15] (ff_adj_245[15]), .ka_in_c_12(ka_in_c_12), .\ff[13] (ff_adj_245[13]), 
            .n1267(n1267), .ka_in_c_7(ka_in_c_7), .\ff[8] (ff_adj_245[8]), 
            .ka_in_c_8(ka_in_c_8), .\ff[9] (ff_adj_245[9])) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(156[11:118])
    PFUMX i837 (.BLUT(n1282), .ALUT(n1283), .C0(k_in_c_18), .Z(n1284));
    edge_det_U3 kclk_edge (.resync(resync_adj_238), .fpga_clk(fpga_clk), 
            .n1265(n1265), .ddk_clk(ddk_clk)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(205[11:105])
    LUT4 state_cnt_2__bdd_4_lut_4_lut (.A(state_cnt[1]), .B(state_cnt[0]), 
         .C(k_in_c_9), .D(k_in_c_1), .Z(n1240)) /* synthesis lut_function=(A (B (C)+!B (D))) */ ;
    defparam state_cnt_2__bdd_4_lut_4_lut.init = 16'ha280;
    LUT4 i823_2_lut_3_lut (.A(resync_adj_239), .B(ddstart_in), .C(kreset_c), 
         .Z(fpga_clk_enable_48)) /* synthesis lut_function=((B+!(C))+!A) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(248[8] 292[6])
    defparam i823_2_lut_3_lut.init = 16'hdfdf;
    delay dly8 (.ddstart_in(ddstart_in), .fpga_clk(fpga_clk), .n1265(n1265), 
          .dstart_in(dstart_in)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(213[8:81])
    Latch_SR_N ka_in_latch (.\ff[13] (ff_adj_245[13]), .fpga_clk(fpga_clk), 
            .fpga_clk_enable_100(fpga_clk_enable_100), .n1265(n1265), .ff_15__N_219({ff_15__N_219}), 
            .\ff[15] (ff_adj_245[15]), .\ff[14] (ff_adj_245[14]), .\ff[12] (ff_adj_245[12]), 
            .\ff[11] (ff_adj_245[11]), .\ff[10] (ff_adj_245[10]), .\ff[9] (ff_adj_245[9]), 
            .\ff[8] (ff_adj_245[8]), .\ff[7] (ff_adj_245[7]), .\ff[6] (ff_adj_245[6]), 
            .\ff[5] (ff_adj_245[5]), .\ff[4] (ff_adj_245[4]), .\ff[3] (ff_adj_245[3]), 
            .\ff[2] (ff_adj_245[2]), .\ff[1] (ff_adj_245[1]), .Ddin_c_0(Ddin_c_0)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(176[23:147])
    GSR GSR_INST (.GSR(VCC_net));
    LUT4 mux_174_i6_then_4_lut (.A(k_in_c_5), .B(state_cnt[2]), .C(state_cnt[0]), 
         .D(state_cnt[1]), .Z(n1271)) /* synthesis lut_function=(A (B+!(C+!(D)))+!A (B)) */ ;
    defparam mux_174_i6_then_4_lut.init = 16'hcecc;
    PFUMX i835 (.BLUT(n1279), .ALUT(n1280), .C0(k_in_c_3), .Z(n1281));
    TSALL TSALL_INST (.TSALL(GND_net));
    LUT4 state_cnt_2__bdd_3_lut_826_3_lut (.A(state_cnt[1]), .B(state_cnt[0]), 
         .C(k_in_c_17), .Z(n1239)) /* synthesis lut_function=(A (B)+!A (B+(C))) */ ;
    defparam state_cnt_2__bdd_3_lut_826_3_lut.init = 16'hdcdc;
    PFUMX i833 (.BLUT(n1276), .ALUT(n1277), .C0(state_cnt[2]), .Z(n1278));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    PFUMX i831 (.BLUT(n1273), .ALUT(n1274), .C0(state_cnt[2]), .Z(n1275));
    VLO i1 (.Z(GND_net));
    PFUMX i829 (.BLUT(n1270), .ALUT(n1271), .C0(k_in_c_21), .Z(n1272));
    PFUMX i824 (.BLUT(n1240), .ALUT(n1239), .C0(state_cnt[2]), .Z(n1241));
    LUT4 m1_lut (.Z(n1299)) /* synthesis lut_function=1, syn_instantiated=1 */ ;
    defparam m1_lut.init = 16'hffff;
    sig_sync ser_edge (.ser_out(ser_out), .fpga_clk(fpga_clk), .Ddout_c(Ddout_c)) /* synthesis syn_module_defined=1 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(152[11:70])
    
endmodule
//
// Verilog Description of module edge_det
//

module edge_det (resync, fpga_clk, n1265, ddstart_in) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input fpga_clk;
    input n1265;
    input ddstart_in;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX resync_10 (.D(ddstart_in), .CK(fpga_clk), .CD(n1265), .Q(resync));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U8
//

module delay_U8 (dDlatch, fpga_clk, n1265, Dlatch_c) /* synthesis syn_module_defined=1 */ ;
    output dDlatch;
    input fpga_clk;
    input n1265;
    input Dlatch_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX sync_6 (.D(Dlatch_c), .CK(fpga_clk), .CD(n1265), .Q(dDlatch));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U10
//

module delay_U10 (dDclk, fpga_clk, n1265, Dclk_c) /* synthesis syn_module_defined=1 */ ;
    output dDclk;
    input fpga_clk;
    input n1265;
    input Dclk_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX sync_6 (.D(Dclk_c), .CK(fpga_clk), .CD(n1265), .Q(dDclk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U7
//

module delay_U7 (ddDlatch, fpga_clk, n1265, dDlatch) /* synthesis syn_module_defined=1 */ ;
    output ddDlatch;
    input fpga_clk;
    input n1265;
    input dDlatch;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX sync_6 (.D(dDlatch), .CK(fpga_clk), .CD(n1265), .Q(ddDlatch));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U6
//

module delay_U6 (dk_clk, fpga_clk, n1265, k_clk_c) /* synthesis syn_module_defined=1 */ ;
    output dk_clk;
    input fpga_clk;
    input n1265;
    input k_clk_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX sync_6 (.D(k_clk_c), .CK(fpga_clk), .CD(n1265), .Q(dk_clk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U9
//

module delay_U9 (ddDclk, fpga_clk, n1265, dDclk) /* synthesis syn_module_defined=1 */ ;
    output ddDclk;
    input fpga_clk;
    input n1265;
    input dDclk;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX sync_6 (.D(dDclk), .CK(fpga_clk), .CD(n1265), .Q(ddDclk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module \SR_Latch_N(N=24) 
//

module \SR_Latch_N(N=24)  (fpga_clk, fpga_clk_enable_80, n1265, ka_out_c_9, 
            fpga_clk_enable_101, ka_out_c_10, ka_out_c_11, ka_out_c_12, 
            ka_out_c_13, ka_out_c_14, ka_out_c_15, ka_out_c_0, ka_out_c_1, 
            ka_out_c_2, ka_out_c_3, ka_out_c_4, ka_out_c_5, ka_out_c_6, 
            ka_out_c_7, dac_out_c_3, ka_out_c_8) /* synthesis syn_module_defined=1 */ ;
    input fpga_clk;
    input fpga_clk_enable_80;
    input n1265;
    output ka_out_c_9;
    input fpga_clk_enable_101;
    output ka_out_c_10;
    output ka_out_c_11;
    output ka_out_c_12;
    output ka_out_c_13;
    output ka_out_c_14;
    output ka_out_c_15;
    output ka_out_c_0;
    output ka_out_c_1;
    output ka_out_c_2;
    output ka_out_c_3;
    output ka_out_c_4;
    output ka_out_c_5;
    output ka_out_c_6;
    output ka_out_c_7;
    input dac_out_c_3;
    output ka_out_c_8;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    wire [23:0]ff;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(12[15:17])
    
    FD1P3IX ff__i0 (.D(ff[1]), .SP(fpga_clk_enable_80), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i0.GSR = "ENABLED";
    FD1P3IX par_out__i2 (.D(ff[1]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_9)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i2.GSR = "ENABLED";
    FD1P3IX par_out__i3 (.D(ff[2]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_10)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i3.GSR = "ENABLED";
    FD1P3IX par_out__i4 (.D(ff[3]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_11)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i4.GSR = "ENABLED";
    FD1P3IX par_out__i5 (.D(ff[4]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_12)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i5.GSR = "ENABLED";
    FD1P3IX par_out__i6 (.D(ff[5]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_13)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i6.GSR = "ENABLED";
    FD1P3IX par_out__i7 (.D(ff[6]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_14)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i7.GSR = "ENABLED";
    FD1P3IX par_out__i8 (.D(ff[7]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_15)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i8.GSR = "ENABLED";
    FD1P3IX par_out__i9 (.D(ff[8]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_0)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i9.GSR = "ENABLED";
    FD1P3IX par_out__i10 (.D(ff[9]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_1)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i10.GSR = "ENABLED";
    FD1P3IX par_out__i11 (.D(ff[10]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_2)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i11.GSR = "ENABLED";
    FD1P3IX par_out__i12 (.D(ff[11]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_3)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i12.GSR = "ENABLED";
    FD1P3IX par_out__i13 (.D(ff[12]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_4)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i13.GSR = "ENABLED";
    FD1P3IX par_out__i14 (.D(ff[13]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_5)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i14.GSR = "ENABLED";
    FD1P3IX par_out__i15 (.D(ff[14]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_6)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i15.GSR = "ENABLED";
    FD1P3IX par_out__i16 (.D(ff[15]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_7)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i16.GSR = "ENABLED";
    FD1P3IX ff__i1 (.D(ff[2]), .SP(fpga_clk_enable_80), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i1.GSR = "ENABLED";
    FD1P3IX ff__i2 (.D(ff[3]), .SP(fpga_clk_enable_80), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[2])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i2.GSR = "ENABLED";
    FD1P3IX ff__i3 (.D(ff[4]), .SP(fpga_clk_enable_80), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[3])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i3.GSR = "ENABLED";
    FD1P3IX ff__i4 (.D(ff[5]), .SP(fpga_clk_enable_80), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[4])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i4.GSR = "ENABLED";
    FD1P3IX ff__i5 (.D(ff[6]), .SP(fpga_clk_enable_80), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[5])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i5.GSR = "ENABLED";
    FD1P3IX ff__i6 (.D(ff[7]), .SP(fpga_clk_enable_80), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[6])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i6.GSR = "ENABLED";
    FD1P3IX ff__i7 (.D(ff[8]), .SP(fpga_clk_enable_80), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[7])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i7.GSR = "ENABLED";
    FD1P3IX ff__i8 (.D(ff[9]), .SP(fpga_clk_enable_80), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[8])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i8.GSR = "ENABLED";
    FD1P3IX ff__i9 (.D(ff[10]), .SP(fpga_clk_enable_80), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[9])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i9.GSR = "ENABLED";
    FD1P3IX ff__i10 (.D(ff[11]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[10])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i10.GSR = "ENABLED";
    FD1P3IX ff__i11 (.D(ff[12]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[11])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i11.GSR = "ENABLED";
    FD1P3IX ff__i12 (.D(ff[13]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[12])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i12.GSR = "ENABLED";
    FD1P3IX ff__i13 (.D(ff[14]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[13])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i13.GSR = "ENABLED";
    FD1P3IX ff__i14 (.D(ff[15]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[14])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i14.GSR = "ENABLED";
    FD1P3IX ff__i15 (.D(ff[16]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[15])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i15.GSR = "ENABLED";
    FD1P3IX ff__i16 (.D(ff[17]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[16])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i16.GSR = "ENABLED";
    FD1P3IX ff__i17 (.D(ff[18]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[17])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i17.GSR = "ENABLED";
    FD1P3IX ff__i18 (.D(ff[19]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[18])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i18.GSR = "ENABLED";
    FD1P3IX ff__i19 (.D(ff[20]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[19])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i19.GSR = "ENABLED";
    FD1P3IX ff__i20 (.D(ff[21]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[20])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i20.GSR = "ENABLED";
    FD1P3IX ff__i21 (.D(ff[22]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[21])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i21.GSR = "ENABLED";
    FD1P3IX ff__i22 (.D(ff[23]), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[22])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i22.GSR = "ENABLED";
    FD1P3IX ff__i23 (.D(dac_out_c_3), .SP(fpga_clk_enable_80), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[23])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i23.GSR = "ENABLED";
    FD1P3IX par_out__i1 (.D(ff[0]), .SP(fpga_clk_enable_101), .CD(n1265), 
            .CK(fpga_clk), .Q(ka_out_c_8)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=146, LSE_LLINE=167, LSE_RLINE=167 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i1.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U5
//

module delay_U5 (ddk_clk, fpga_clk, n1265, dk_clk) /* synthesis syn_module_defined=1 */ ;
    output ddk_clk;
    input fpga_clk;
    input n1265;
    input dk_clk;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX sync_6 (.D(dk_clk), .CK(fpga_clk), .CD(n1265), .Q(ddk_clk));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay_U4
//

module delay_U4 (dstart_in, fpga_clk, n1265, start_in_c) /* synthesis syn_module_defined=1 */ ;
    output dstart_in;
    input fpga_clk;
    input n1265;
    input start_in_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX sync_6 (.D(start_in_c), .CK(fpga_clk), .CD(n1265), .Q(dstart_in));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module SR_Latch_N
//

module SR_Latch_N (dac_out_c_0, fpga_clk, fpga_clk_enable_31, n1265, 
            fpga_clk_enable_87, dac_out_c_1, dac_out_c_2, dac_out_c_3, 
            dac_out_c_4, dac_out_c_5, dac_out_c_6, dac_out_c_7, ser_out) /* synthesis syn_module_defined=1 */ ;
    output dac_out_c_0;
    input fpga_clk;
    input fpga_clk_enable_31;
    input n1265;
    input fpga_clk_enable_87;
    output dac_out_c_1;
    output dac_out_c_2;
    output dac_out_c_3;
    output dac_out_c_4;
    output dac_out_c_5;
    output dac_out_c_6;
    output dac_out_c_7;
    input ser_out;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    wire [7:0]ff;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(12[15:17])
    
    FD1P3IX par_out__i1 (.D(ff[0]), .SP(fpga_clk_enable_31), .CD(n1265), 
            .CK(fpga_clk), .Q(dac_out_c_0)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i1.GSR = "ENABLED";
    FD1P3IX ff__i0 (.D(ff[1]), .SP(fpga_clk_enable_87), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i0.GSR = "ENABLED";
    FD1P3IX par_out__i2 (.D(ff[1]), .SP(fpga_clk_enable_31), .CD(n1265), 
            .CK(fpga_clk), .Q(dac_out_c_1)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i2.GSR = "ENABLED";
    FD1P3IX par_out__i3 (.D(ff[2]), .SP(fpga_clk_enable_31), .CD(n1265), 
            .CK(fpga_clk), .Q(dac_out_c_2)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i3.GSR = "ENABLED";
    FD1P3IX par_out__i4 (.D(ff[3]), .SP(fpga_clk_enable_31), .CD(n1265), 
            .CK(fpga_clk), .Q(dac_out_c_3)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i4.GSR = "ENABLED";
    FD1P3IX par_out__i5 (.D(ff[4]), .SP(fpga_clk_enable_31), .CD(n1265), 
            .CK(fpga_clk), .Q(dac_out_c_4)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i5.GSR = "ENABLED";
    FD1P3IX par_out__i6 (.D(ff[5]), .SP(fpga_clk_enable_31), .CD(n1265), 
            .CK(fpga_clk), .Q(dac_out_c_5)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i6.GSR = "ENABLED";
    FD1P3IX par_out__i7 (.D(ff[6]), .SP(fpga_clk_enable_31), .CD(n1265), 
            .CK(fpga_clk), .Q(dac_out_c_6)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i7.GSR = "ENABLED";
    FD1P3IX par_out__i8 (.D(ff[7]), .SP(fpga_clk_enable_31), .CD(n1265), 
            .CK(fpga_clk), .Q(dac_out_c_7)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam par_out__i8.GSR = "ENABLED";
    FD1P3IX ff__i1 (.D(ff[2]), .SP(fpga_clk_enable_87), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i1.GSR = "ENABLED";
    FD1P3IX ff__i2 (.D(ff[3]), .SP(fpga_clk_enable_87), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[2])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i2.GSR = "ENABLED";
    FD1P3IX ff__i3 (.D(ff[4]), .SP(fpga_clk_enable_87), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[3])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i3.GSR = "ENABLED";
    FD1P3IX ff__i4 (.D(ff[5]), .SP(fpga_clk_enable_87), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[4])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i4.GSR = "ENABLED";
    FD1P3IX ff__i5 (.D(ff[6]), .SP(fpga_clk_enable_87), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[5])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i5.GSR = "ENABLED";
    FD1P3IX ff__i6 (.D(ff[7]), .SP(fpga_clk_enable_87), .CD(n1265), .CK(fpga_clk), 
            .Q(ff[6])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i6.GSR = "ENABLED";
    FD1P3IX ff__i7 (.D(ser_out), .SP(fpga_clk_enable_87), .CD(n1265), 
            .CK(fpga_clk), .Q(ff[7])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=22, LSE_RCOL=130, LSE_LLINE=161, LSE_RLINE=161 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sr_latch.v(16[10] 29[8])
    defparam ff__i7.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module edge_det_U2
//

module edge_det_U2 (resync, fpga_clk, n1265, ddDlatch, fpga_clk_enable_6, 
            kreset_c, fpga_clk_enable_80, n1260) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input fpga_clk;
    input n1265;
    input ddDlatch;
    output fpga_clk_enable_6;
    input kreset_c;
    output fpga_clk_enable_80;
    output n1260;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX resync_10 (.D(ddDlatch), .CK(fpga_clk), .CD(n1265), .Q(resync));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    LUT4 resync_I_0_2_lut_rep_13 (.A(resync), .B(ddDlatch), .Z(fpga_clk_enable_6)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam resync_I_0_2_lut_rep_13.init = 16'h2222;
    LUT4 i223_2_lut_2_lut_3_lut (.A(resync), .B(ddDlatch), .C(kreset_c), 
         .Z(fpga_clk_enable_80)) /* synthesis lut_function=(!(A (B (C))+!A (C))) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam i223_2_lut_2_lut_3_lut.init = 16'h2f2f;
    LUT4 s_in_I_0_11_2_lut_rep_5 (.A(ddDlatch), .B(resync), .Z(n1260)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(10[17:31])
    defparam s_in_I_0_11_2_lut_rep_5.init = 16'h2222;
    
endmodule
//
// Verilog Description of module edge_det_U1
//

module edge_det_U1 (resync, fpga_clk, n1265, ddDclk, n1264) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input fpga_clk;
    input n1265;
    input ddDclk;
    output n1264;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX resync_10 (.D(ddDclk), .CK(fpga_clk), .CD(n1265), .Q(resync));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    LUT4 s_in_I_0_11_2_lut_rep_9 (.A(ddDclk), .B(resync), .Z(n1264)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(10[17:31])
    defparam s_in_I_0_11_2_lut_rep_9.init = 16'h2222;
    
endmodule
//
// Verilog Description of module edge_det_U0
//

module edge_det_U0 (resync, dac_out_c_2, ka_in_c_4, \ff[5] , ff_15__N_219, 
            ka_in_c_11, \ff[12] , ka_in_c_10, \ff[11] , ka_in_c_5, 
            \ff[6] , fpga_clk, n1265, ka_in_c_6, \ff[7] , ka_in_c_3, 
            \ff[4] , ka_in_c_2, \ff[3] , ka_in_c_13, \ff[14] , ka_in_c_9, 
            \ff[10] , ka_in_c_15, ka_in_c_1, \ff[2] , ka_in_c_0, \ff[1] , 
            ka_in_c_14, \ff[15] , ka_in_c_12, \ff[13] , n1267, ka_in_c_7, 
            \ff[8] , ka_in_c_8, \ff[9] ) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input dac_out_c_2;
    input ka_in_c_4;
    input \ff[5] ;
    output [15:0]ff_15__N_219;
    input ka_in_c_11;
    input \ff[12] ;
    input ka_in_c_10;
    input \ff[11] ;
    input ka_in_c_5;
    input \ff[6] ;
    input fpga_clk;
    input n1265;
    input ka_in_c_6;
    input \ff[7] ;
    input ka_in_c_3;
    input \ff[4] ;
    input ka_in_c_2;
    input \ff[3] ;
    input ka_in_c_13;
    input \ff[14] ;
    input ka_in_c_9;
    input \ff[10] ;
    input ka_in_c_15;
    input ka_in_c_1;
    input \ff[2] ;
    input ka_in_c_0;
    input \ff[1] ;
    input ka_in_c_14;
    input \ff[15] ;
    input ka_in_c_12;
    input \ff[13] ;
    output n1267;
    input ka_in_c_7;
    input \ff[8] ;
    input ka_in_c_8;
    input \ff[9] ;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    LUT4 mux_4_i5_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_4), 
         .D(\ff[5] ), .Z(ff_15__N_219[4])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i5_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i12_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_11), 
         .D(\ff[12] ), .Z(ff_15__N_219[11])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i12_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i11_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_10), 
         .D(\ff[11] ), .Z(ff_15__N_219[10])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i11_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i6_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_5), 
         .D(\ff[6] ), .Z(ff_15__N_219[5])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i6_3_lut_4_lut.init = 16'hfd20;
    FD1S3IX resync_10 (.D(dac_out_c_2), .CK(fpga_clk), .CD(n1265), .Q(resync));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    LUT4 mux_4_i7_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_6), 
         .D(\ff[7] ), .Z(ff_15__N_219[6])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i7_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i4_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_3), 
         .D(\ff[4] ), .Z(ff_15__N_219[3])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i4_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i3_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_2), 
         .D(\ff[3] ), .Z(ff_15__N_219[2])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i3_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i14_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_13), 
         .D(\ff[14] ), .Z(ff_15__N_219[13])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i14_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i10_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_9), 
         .D(\ff[10] ), .Z(ff_15__N_219[9])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i10_3_lut_4_lut.init = 16'hfd20;
    LUT4 i567_2_lut_3_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_15), 
         .Z(ff_15__N_219[15])) /* synthesis lut_function=((B+(C))+!A) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam i567_2_lut_3_lut.init = 16'hfdfd;
    LUT4 mux_4_i2_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_1), 
         .D(\ff[2] ), .Z(ff_15__N_219[1])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i2_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i1_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_0), 
         .D(\ff[1] ), .Z(ff_15__N_219[0])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i1_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i15_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_14), 
         .D(\ff[15] ), .Z(ff_15__N_219[14])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i15_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i13_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_12), 
         .D(\ff[13] ), .Z(ff_15__N_219[12])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i13_3_lut_4_lut.init = 16'hfd20;
    LUT4 resync_I_0_2_lut_rep_12 (.A(resync), .B(dac_out_c_2), .Z(n1267)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam resync_I_0_2_lut_rep_12.init = 16'h2222;
    LUT4 mux_4_i8_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_7), 
         .D(\ff[8] ), .Z(ff_15__N_219[7])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i8_3_lut_4_lut.init = 16'hfd20;
    LUT4 mux_4_i9_3_lut_4_lut (.A(resync), .B(dac_out_c_2), .C(ka_in_c_8), 
         .D(\ff[9] ), .Z(ff_15__N_219[8])) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(11[17:31])
    defparam mux_4_i9_3_lut_4_lut.init = 16'hfd20;
    
endmodule
//
// Verilog Description of module edge_det_U3
//

module edge_det_U3 (resync, fpga_clk, n1265, ddk_clk) /* synthesis syn_module_defined=1 */ ;
    output resync;
    input fpga_clk;
    input n1265;
    input ddk_clk;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX resync_10 (.D(ddk_clk), .CK(fpga_clk), .CD(n1265), .Q(resync));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/edge_det.v(13[10] 21[8])
    defparam resync_10.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module delay
//

module delay (ddstart_in, fpga_clk, n1265, dstart_in) /* synthesis syn_module_defined=1 */ ;
    output ddstart_in;
    input fpga_clk;
    input n1265;
    input dstart_in;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1S3IX sync_6 (.D(dstart_in), .CK(fpga_clk), .CD(n1265), .Q(ddstart_in));   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/delay.v(9[9] 19[5])
    defparam sync_6.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module Latch_SR_N
//

module Latch_SR_N (\ff[13] , fpga_clk, fpga_clk_enable_100, n1265, ff_15__N_219, 
            \ff[15] , \ff[14] , \ff[12] , \ff[11] , \ff[10] , \ff[9] , 
            \ff[8] , \ff[7] , \ff[6] , \ff[5] , \ff[4] , \ff[3] , 
            \ff[2] , \ff[1] , Ddin_c_0) /* synthesis syn_module_defined=1 */ ;
    output \ff[13] ;
    input fpga_clk;
    input fpga_clk_enable_100;
    input n1265;
    input [15:0]ff_15__N_219;
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
    output Ddin_c_0;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    
    FD1P3IX ff__i14 (.D(ff_15__N_219[13]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[13] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i14.GSR = "ENABLED";
    FD1P3IX ff__i16 (.D(ff_15__N_219[15]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[15] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i16.GSR = "ENABLED";
    FD1P3IX ff__i15 (.D(ff_15__N_219[14]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[14] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i15.GSR = "ENABLED";
    FD1P3IX ff__i13 (.D(ff_15__N_219[12]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[12] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i13.GSR = "ENABLED";
    FD1P3IX ff__i12 (.D(ff_15__N_219[11]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[11] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i12.GSR = "ENABLED";
    FD1P3IX ff__i11 (.D(ff_15__N_219[10]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[10] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i11.GSR = "ENABLED";
    FD1P3IX ff__i10 (.D(ff_15__N_219[9]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[9] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i10.GSR = "ENABLED";
    FD1P3IX ff__i9 (.D(ff_15__N_219[8]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[8] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i9.GSR = "ENABLED";
    FD1P3IX ff__i8 (.D(ff_15__N_219[7]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[7] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i8.GSR = "ENABLED";
    FD1P3IX ff__i7 (.D(ff_15__N_219[6]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[6] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i7.GSR = "ENABLED";
    FD1P3IX ff__i6 (.D(ff_15__N_219[5]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[5] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i6.GSR = "ENABLED";
    FD1P3IX ff__i5 (.D(ff_15__N_219[4]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[4] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i5.GSR = "ENABLED";
    FD1P3IX ff__i4 (.D(ff_15__N_219[3]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[3] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i4.GSR = "ENABLED";
    FD1P3IX ff__i3 (.D(ff_15__N_219[2]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[2] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i3.GSR = "ENABLED";
    FD1P3IX ff__i2 (.D(ff_15__N_219[1]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(\ff[1] )) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i2.GSR = "ENABLED";
    FD1P3IX ff__i1 (.D(ff_15__N_219[0]), .SP(fpga_clk_enable_100), .CD(n1265), 
            .CK(fpga_clk), .Q(Ddin_c_0)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=23, LSE_RCOL=147, LSE_LLINE=176, LSE_RLINE=176 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/latch_sr_n.v(16[9] 30[5])
    defparam ff__i1.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module sig_sync
//

module sig_sync (ser_out, fpga_clk, Ddout_c) /* synthesis syn_module_defined=1 */ ;
    output ser_out;
    input fpga_clk;
    input Ddout_c;
    
    wire fpga_clk /* synthesis is_clock=1, SET_AS_NETWORK=fpga_clk */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/kbuf_top.v(114[62:70])
    wire [1:0]resync;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sig_sync.v(7[14:20])
    
    FD1S3AX resync_i1 (.D(resync[1]), .CK(fpga_clk), .Q(ser_out)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=70, LSE_LLINE=152, LSE_RLINE=152 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sig_sync.v(11[10] 14[8])
    defparam resync_i1.GSR = "ENABLED";
    FD1S3AX resync_i2 (.D(Ddout_c), .CK(fpga_clk), .Q(resync[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=70, LSE_LLINE=152, LSE_RLINE=152 */ ;   // c:/dan/eng projects/bp308/kflop/fpga/kanalogbuffer_realboard/sig_sync.v(11[10] 14[8])
    defparam resync_i2.GSR = "ENABLED";
    
endmodule
