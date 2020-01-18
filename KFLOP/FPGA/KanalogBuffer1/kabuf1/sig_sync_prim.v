// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.10.2.115
// Netlist written on Fri Oct 12 23:37:58 2018
//
// Verilog Description of module sig_sync
//

module sig_sync (clk, async, sync_out) /* synthesis syn_module_defined=1 */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(1[8:16])
    input clk;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(2[9:12])
    input async;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(3[9:14])
    output sync_out;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(4[10:18])
    
    wire clk_c /* synthesis is_clock=1, SET_AS_NETWORK=clk_c */ ;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(2[9:12])
    
    wire GND_net, async_c, sync_out_c;
    wire [1:0]resync;   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(15[14:20])
    
    wire VCC_net;
    
    VHI i14 (.Z(VCC_net));
    GSR GSR_INST (.GSR(VCC_net));
    OB sync_out_pad (.I(sync_out_c), .O(sync_out));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(4[10:18])
    IB clk_pad (.I(clk), .O(clk_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(2[9:12])
    IB async_pad (.I(async), .O(async_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(3[9:14])
    FD1S3AX resync_i2 (.D(async_c), .CK(clk_c), .Q(resync[1]));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(19[10] 22[8])
    defparam resync_i2.GSR = "ENABLED";
    TSALL TSALL_INST (.TSALL(GND_net));
    FD1S3AX resync_i1 (.D(resync[1]), .CK(clk_c), .Q(sync_out_c));   // c:/dan/engineering/lattice/learning/kanalogbuffer/sig_sync.v(19[10] 22[8])
    defparam resync_i1.GSR = "ENABLED";
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    VLO i18 (.Z(GND_net));
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

