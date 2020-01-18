// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.10.2.115
// Netlist written on Sat Oct 13 11:02:28 2018
//
// Verilog Description of module shift_out_24
//

module shift_out_24 (clk, clr, sclk, rclk, ser_in, dig_out) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(1[8:20])
    input clk;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(3[8:11])
    input clr;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(4[8:11])
    input sclk;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(5[8:12])
    input rclk;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(6[8:12])
    input ser_in;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(7[8:14])
    output [23:0]dig_out;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    
    wire clk_c /* synthesis is_clock=1, SET_AS_NETWORK=clk_c */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(3[8:11])
    
    wire GND_net, clr_c, sclk_c, rclk_c, ser_in_c, dig_out_c_23, 
        dig_out_c_22, dig_out_c_21, dig_out_c_20, dig_out_c_19, dig_out_c_18, 
        dig_out_c_17, dig_out_c_16, dig_out_c_15, dig_out_c_14, dig_out_c_13, 
        dig_out_c_12, dig_out_c_11, dig_out_c_10, dig_out_c_9, dig_out_c_8, 
        dig_out_c_7, dig_out_c_6, dig_out_c_5, dig_out_c_4, dig_out_c_3, 
        dig_out_c_2, dig_out_c_1, dig_out_c_0;
    wire [23:0]ff;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(11[12:14])
    
    wire VCC_net, clk_c_enable_25, clk_c_enable_48;
    
    VHI i39 (.Z(VCC_net));
    FD1P3IX dig_out__i1 (.D(ff[0]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_0));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i1.GSR = "ENABLED";
    OB dig_out_pad_22 (.I(dig_out_c_22), .O(dig_out[22]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_21 (.I(dig_out_c_21), .O(dig_out[21]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    FD1P3IX ff__i0 (.D(ser_in_c), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[0]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i0.GSR = "ENABLED";
    LUT4 i31_2_lut (.A(sclk_c), .B(clr_c), .Z(clk_c_enable_25)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i31_2_lut.init = 16'heeee;
    GSR GSR_INST (.GSR(VCC_net));
    TSALL TSALL_INST (.TSALL(GND_net));
    FD1P3IX ff__i1 (.D(ff[0]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[1]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i1.GSR = "ENABLED";
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    VLO i43 (.Z(GND_net));
    OB dig_out_pad_23 (.I(dig_out_c_23), .O(dig_out[23]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_20 (.I(dig_out_c_20), .O(dig_out[20]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_19 (.I(dig_out_c_19), .O(dig_out[19]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_18 (.I(dig_out_c_18), .O(dig_out[18]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_17 (.I(dig_out_c_17), .O(dig_out[17]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_16 (.I(dig_out_c_16), .O(dig_out[16]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_15 (.I(dig_out_c_15), .O(dig_out[15]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_14 (.I(dig_out_c_14), .O(dig_out[14]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_13 (.I(dig_out_c_13), .O(dig_out[13]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_12 (.I(dig_out_c_12), .O(dig_out[12]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_11 (.I(dig_out_c_11), .O(dig_out[11]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_10 (.I(dig_out_c_10), .O(dig_out[10]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_9 (.I(dig_out_c_9), .O(dig_out[9]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_8 (.I(dig_out_c_8), .O(dig_out[8]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_7 (.I(dig_out_c_7), .O(dig_out[7]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_6 (.I(dig_out_c_6), .O(dig_out[6]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_5 (.I(dig_out_c_5), .O(dig_out[5]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_4 (.I(dig_out_c_4), .O(dig_out[4]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_3 (.I(dig_out_c_3), .O(dig_out[3]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_2 (.I(dig_out_c_2), .O(dig_out[2]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_1 (.I(dig_out_c_1), .O(dig_out[1]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    OB dig_out_pad_0 (.I(dig_out_c_0), .O(dig_out[0]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(8[20:27])
    IB clk_pad (.I(clk), .O(clk_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(3[8:11])
    IB clr_pad (.I(clr), .O(clr_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(4[8:11])
    IB sclk_pad (.I(sclk), .O(sclk_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(5[8:12])
    IB rclk_pad (.I(rclk), .O(rclk_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(6[8:12])
    IB ser_in_pad (.I(ser_in), .O(ser_in_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(7[8:14])
    FD1P3IX ff__i2 (.D(ff[1]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[2]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i2.GSR = "ENABLED";
    FD1P3IX ff__i3 (.D(ff[2]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[3]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i3.GSR = "ENABLED";
    FD1P3IX ff__i4 (.D(ff[3]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[4]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i4.GSR = "ENABLED";
    FD1P3IX ff__i5 (.D(ff[4]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[5]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i5.GSR = "ENABLED";
    FD1P3IX ff__i6 (.D(ff[5]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[6]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i6.GSR = "ENABLED";
    FD1P3IX ff__i7 (.D(ff[6]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[7]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i7.GSR = "ENABLED";
    FD1P3IX ff__i8 (.D(ff[7]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[8]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i8.GSR = "ENABLED";
    FD1P3IX ff__i9 (.D(ff[8]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[9]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i9.GSR = "ENABLED";
    FD1P3IX ff__i10 (.D(ff[9]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[10]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i10.GSR = "ENABLED";
    FD1P3IX ff__i11 (.D(ff[10]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[11]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i11.GSR = "ENABLED";
    FD1P3IX ff__i12 (.D(ff[11]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[12]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i12.GSR = "ENABLED";
    FD1P3IX ff__i13 (.D(ff[12]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[13]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i13.GSR = "ENABLED";
    FD1P3IX ff__i14 (.D(ff[13]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[14]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i14.GSR = "ENABLED";
    FD1P3IX ff__i15 (.D(ff[14]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[15]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i15.GSR = "ENABLED";
    FD1P3IX ff__i16 (.D(ff[15]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[16]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i16.GSR = "ENABLED";
    FD1P3IX ff__i17 (.D(ff[16]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[17]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i17.GSR = "ENABLED";
    FD1P3IX ff__i18 (.D(ff[17]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[18]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i18.GSR = "ENABLED";
    FD1P3IX ff__i19 (.D(ff[18]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[19]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i19.GSR = "ENABLED";
    FD1P3IX ff__i20 (.D(ff[19]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[20]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i20.GSR = "ENABLED";
    FD1P3IX ff__i21 (.D(ff[20]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[21]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i21.GSR = "ENABLED";
    FD1P3IX ff__i22 (.D(ff[21]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[22]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i22.GSR = "ENABLED";
    FD1P3IX ff__i23 (.D(ff[22]), .SP(clk_c_enable_25), .CD(clr_c), .CK(clk_c), 
            .Q(ff[23]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam ff__i23.GSR = "ENABLED";
    FD1P3IX dig_out__i2 (.D(ff[1]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_1));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i2.GSR = "ENABLED";
    FD1P3IX dig_out__i3 (.D(ff[2]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_2));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i3.GSR = "ENABLED";
    FD1P3IX dig_out__i4 (.D(ff[3]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_3));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i4.GSR = "ENABLED";
    FD1P3IX dig_out__i5 (.D(ff[4]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_4));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i5.GSR = "ENABLED";
    FD1P3IX dig_out__i6 (.D(ff[5]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_5));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i6.GSR = "ENABLED";
    FD1P3IX dig_out__i7 (.D(ff[6]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_6));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i7.GSR = "ENABLED";
    FD1P3IX dig_out__i8 (.D(ff[7]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_7));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i8.GSR = "ENABLED";
    FD1P3IX dig_out__i9 (.D(ff[8]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_8));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i9.GSR = "ENABLED";
    FD1P3IX dig_out__i10 (.D(ff[9]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_9));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i10.GSR = "ENABLED";
    FD1P3IX dig_out__i11 (.D(ff[10]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_10));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i11.GSR = "ENABLED";
    FD1P3IX dig_out__i12 (.D(ff[11]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_11));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i12.GSR = "ENABLED";
    FD1P3IX dig_out__i13 (.D(ff[12]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_12));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i13.GSR = "ENABLED";
    FD1P3IX dig_out__i14 (.D(ff[13]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_13));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i14.GSR = "ENABLED";
    FD1P3IX dig_out__i15 (.D(ff[14]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_14));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i15.GSR = "ENABLED";
    FD1P3IX dig_out__i16 (.D(ff[15]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_15));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i16.GSR = "ENABLED";
    FD1P3IX dig_out__i17 (.D(ff[16]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_16));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i17.GSR = "ENABLED";
    FD1P3IX dig_out__i18 (.D(ff[17]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_17));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i18.GSR = "ENABLED";
    FD1P3IX dig_out__i19 (.D(ff[18]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_18));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i19.GSR = "ENABLED";
    FD1P3IX dig_out__i20 (.D(ff[19]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_19));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i20.GSR = "ENABLED";
    FD1P3IX dig_out__i21 (.D(ff[20]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_20));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i21.GSR = "ENABLED";
    FD1P3IX dig_out__i22 (.D(ff[21]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_21));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i22.GSR = "ENABLED";
    FD1P3IX dig_out__i23 (.D(ff[22]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_22));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i23.GSR = "ENABLED";
    FD1P3IX dig_out__i24 (.D(ff[23]), .SP(clk_c_enable_48), .CD(clr_c), 
            .CK(clk_c), .Q(dig_out_c_23));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sr_24_out.v(13[8] 26[5])
    defparam dig_out__i24.GSR = "ENABLED";
    LUT4 i30_3_lut (.A(rclk_c), .B(clr_c), .C(sclk_c), .Z(clk_c_enable_48)) /* synthesis lut_function=(A (B+!(C))+!A (B)) */ ;
    defparam i30_3_lut.init = 16'hcece;
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

