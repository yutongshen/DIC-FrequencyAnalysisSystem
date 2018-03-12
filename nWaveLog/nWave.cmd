wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/yutongshen/HW6/FAS.fsdb}
wvRestoreSignal -win $_nWave1 "/home/yutongshen/HW6/FAS1.rc" -overWriteAutoAlias \
           on
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/DUT/clk} \
{/testfixture1/DUT/rst} \
{/testfixture1/DUT/data_valid} \
{/testfixture1/DUT/data\[15:0\]} \
{/testfixture1/DUT/fir_valid} \
{/testfixture1/DUT/fir_d\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/DUT"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/DUT/fft/pe1"
wvCloseFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvTpfCloseForm -win $_nWave1
wvGetSignalClose -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/yutongshen/HW6/pre_sim1.fsdb}
wvRestoreSignal -win $_nWave1 "/home/yutongshen/HW6/FAS1.rc" -overWriteAutoAlias \
           on
wvSelectSignal -win $_nWave1 {( "G5" 36 )} 
wvScrollDown -win $_nWave1 1
wvSelectGroup -win $_nWave1 {G6}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvGetSignalSetScope -win $_nWave1 "/testfixture1/DUT/ana"
wvSetPosition -win $_nWave1 {("G6" 4)}
wvSetPosition -win $_nWave1 {("G6" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/DUT/clk} \
{/testfixture1/DUT/rst} \
{/testfixture1/DUT/data_valid} \
{/testfixture1/DUT/data\[15:0\]} \
{/testfixture1/DUT/fir_valid} \
{/testfixture1/DUT/fir_d\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/DUT/fir/cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/DUT/fir/fir_d\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture1/DUT/fft/r_data1\[0:8\]} \
{/testfixture1/DUT/fft/r_data2\[0:12\]} \
{/testfixture1/DUT/fft/r_data2\[0\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[1\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[2\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[3\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[4\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[5\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[6\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[7\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[8\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[9\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[10\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[11\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[12\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[0:6\]} \
{/testfixture1/DUT/fft/r_data3\[0\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[1\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[2\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[3\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[4\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[5\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[6\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data4\[0:3\]} \
{/testfixture1/DUT/fft/r_data5\[0:15\]} \
{/testfixture1/DUT/fft/fft_valid} \
{/testfixture1/DUT/fft/r_w1\[0:7\]} \
{/testfixture1/DUT/fft/r_w2\[0:3\]} \
{/testfixture1/DUT/fft/r_w3\[0:1\]} \
{/testfixture1/DUT/fft/pe1/w_real\[17:0\]} \
{/testfixture1/DUT/fft/pe1/w_imag\[17:0\]} \
{/testfixture1/DUT/fft/pe1/X\[31:0\]} \
{/testfixture1/DUT/fft/pe1/Y\[31:0\]} \
{/testfixture1/DUT/fft/pe1/fft_a\[31:0\]} \
{/testfixture1/DUT/fft/pe1/fft_b\[31:0\]} \
{/testfixture1/DUT/fft/flag1} \
{/testfixture1/DUT/fft/flag2} \
{/testfixture1/DUT/fft/flag3} \
{/testfixture1/DUT/fft/flag4} \
{/testfixture1/DUT/fft/cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/testfixture1/DUT/ana/done} \
{/testfixture1/DUT/ana/start} \
{/testfixture1/DUT/ana/ref\[1:0\]} \
{/testfixture1/DUT/ana/cnt\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G6" 4 )} 
wvSetPosition -win $_nWave1 {("G6" 4)}
wvSetPosition -win $_nWave1 {("G6" 4)}
wvSetPosition -win $_nWave1 {("G6" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/DUT/clk} \
{/testfixture1/DUT/rst} \
{/testfixture1/DUT/data_valid} \
{/testfixture1/DUT/data\[15:0\]} \
{/testfixture1/DUT/fir_valid} \
{/testfixture1/DUT/fir_d\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/DUT/fir/cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/DUT/fir/fir_d\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture1/DUT/fft/r_data1\[0:8\]} \
{/testfixture1/DUT/fft/r_data2\[0:12\]} \
{/testfixture1/DUT/fft/r_data2\[0\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[1\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[2\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[3\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[4\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[5\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[6\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[7\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[8\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[9\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[10\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[11\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[12\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[0:6\]} \
{/testfixture1/DUT/fft/r_data3\[0\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[1\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[2\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[3\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[4\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[5\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[6\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data4\[0:3\]} \
{/testfixture1/DUT/fft/r_data5\[0:15\]} \
{/testfixture1/DUT/fft/fft_valid} \
{/testfixture1/DUT/fft/r_w1\[0:7\]} \
{/testfixture1/DUT/fft/r_w2\[0:3\]} \
{/testfixture1/DUT/fft/r_w3\[0:1\]} \
{/testfixture1/DUT/fft/pe1/w_real\[17:0\]} \
{/testfixture1/DUT/fft/pe1/w_imag\[17:0\]} \
{/testfixture1/DUT/fft/pe1/X\[31:0\]} \
{/testfixture1/DUT/fft/pe1/Y\[31:0\]} \
{/testfixture1/DUT/fft/pe1/fft_a\[31:0\]} \
{/testfixture1/DUT/fft/pe1/fft_b\[31:0\]} \
{/testfixture1/DUT/fft/flag1} \
{/testfixture1/DUT/fft/flag2} \
{/testfixture1/DUT/fft/flag3} \
{/testfixture1/DUT/fft/flag4} \
{/testfixture1/DUT/fft/cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/testfixture1/DUT/ana/done} \
{/testfixture1/DUT/ana/start} \
{/testfixture1/DUT/ana/ref\[1:0\]} \
{/testfixture1/DUT/ana/cnt\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G6" 4 )} 
wvSetPosition -win $_nWave1 {("G6" 4)}
wvGetSignalClose -win $_nWave1
wvScrollUp -win $_nWave1 20
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetCursor -win $_nWave1 4141.611204 -snap {("G5" 14)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvResizeWindow -win $_nWave1 1975 50 1535 924
wvResizeWindow -win $_nWave1 70 46 3651 924
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 85404.368187 -snap {("G6" 3)}
wvSetCursor -win $_nWave1 6643.896847 -snap {("G6" 3)}
wvSelectSignal -win $_nWave1 {( "G6" 4 )} 
wvSelectSignal -win $_nWave1 {( "G6" 3 )} 
wvResizeWindow -win $_nWave1 70 131 3651 839
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 930357.197162 -snap {("G5" 39)}
wvSelectSignal -win $_nWave1 {( "G5" 40 )} 
wvSetCursor -win $_nWave1 928777.299841 -snap {("G5" 37)}
wvSetCursor -win $_nWave1 930382.886550 -snap {("G5" 39)}
wvSelectSignal -win $_nWave1 {( "G6" 3 )} 
wvSetCursor -win $_nWave1 930755.382666 -snap {("G6" 1)}
wvSetCursor -win $_nWave1 7231.562534 -snap {("G6" 2)}
wvSelectSignal -win $_nWave1 {( "G6" 3 )} 
wvSetPosition -win $_nWave1 {("G6" 3)}
wvExpandBus -win $_nWave1 {("G6" 3)}
wvSetPosition -win $_nWave1 {("G6" 6)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 -10 111 1920 839
wvSetCursor -win $_nWave1 122944.831466 -snap {("G5" 32)}
wvResizeWindow -win $_nWave1 -30 136 3827 839
wvResizeWindow -win $_nWave1 -10 51 3827 926
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvResizeWindow -win $_nWave1 -10 31 3827 946
wvSelectSignal -win $_nWave1 {( "G6" 3 )} 
wvSetPosition -win $_nWave1 {("G6" 3)}
wvCollapseBus -win $_nWave1 {("G6" 3)}
wvSetPosition -win $_nWave1 {("G6" 3)}
wvSetPosition -win $_nWave1 {("G6" 4)}
wvSetCursor -win $_nWave1 139145.399485 -snap {("G5" 24)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 1975 31 1855 946
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1/DUT/fft/pe2"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/DUT/ana"
wvSetPosition -win $_nWave1 {("G6" 7)}
wvSetPosition -win $_nWave1 {("G6" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/DUT/clk} \
{/testfixture1/DUT/rst} \
{/testfixture1/DUT/data_valid} \
{/testfixture1/DUT/data\[15:0\]} \
{/testfixture1/DUT/fir_valid} \
{/testfixture1/DUT/fir_d\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/DUT/fir/cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/DUT/fir/fir_d\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture1/DUT/fft/r_data1\[0:8\]} \
{/testfixture1/DUT/fft/r_data2\[0:12\]} \
{/testfixture1/DUT/fft/r_data2\[0\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[1\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[2\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[3\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[4\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[5\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[6\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[7\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[8\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[9\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[10\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[11\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[12\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[0:6\]} \
{/testfixture1/DUT/fft/r_data3\[0\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[1\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[2\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[3\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[4\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[5\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[6\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data4\[0:3\]} \
{/testfixture1/DUT/fft/r_data5\[0:15\]} \
{/testfixture1/DUT/fft/fft_valid} \
{/testfixture1/DUT/fft/r_w1\[0:7\]} \
{/testfixture1/DUT/fft/r_w2\[0:3\]} \
{/testfixture1/DUT/fft/r_w3\[0:1\]} \
{/testfixture1/DUT/fft/pe1/w_real\[17:0\]} \
{/testfixture1/DUT/fft/pe1/w_imag\[17:0\]} \
{/testfixture1/DUT/fft/pe1/X\[31:0\]} \
{/testfixture1/DUT/fft/pe1/Y\[31:0\]} \
{/testfixture1/DUT/fft/pe1/fft_a\[31:0\]} \
{/testfixture1/DUT/fft/pe1/fft_b\[31:0\]} \
{/testfixture1/DUT/fft/flag1} \
{/testfixture1/DUT/fft/flag2} \
{/testfixture1/DUT/fft/flag3} \
{/testfixture1/DUT/fft/flag4} \
{/testfixture1/DUT/fft/cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/testfixture1/DUT/ana/done} \
{/testfixture1/DUT/ana/start} \
{/testfixture1/DUT/ana/ref\[1:0\]} \
{/testfixture1/DUT/ana/cnt\[3:0\]} \
{/testfixture1/DUT/ana/freq\[3:0\]} \
{/testfixture1/DUT/ana/square_sum\[31:0\]} \
{/testfixture1/DUT/ana/r_max\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G6" 7 )} 
wvSetPosition -win $_nWave1 {("G6" 7)}
wvSetPosition -win $_nWave1 {("G6" 7)}
wvSetPosition -win $_nWave1 {("G6" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/DUT/clk} \
{/testfixture1/DUT/rst} \
{/testfixture1/DUT/data_valid} \
{/testfixture1/DUT/data\[15:0\]} \
{/testfixture1/DUT/fir_valid} \
{/testfixture1/DUT/fir_d\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/DUT/fir/cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/DUT/fir/fir_d\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture1/DUT/fft/r_data1\[0:8\]} \
{/testfixture1/DUT/fft/r_data2\[0:12\]} \
{/testfixture1/DUT/fft/r_data2\[0\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[1\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[2\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[3\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[4\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[5\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[6\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[7\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[8\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[9\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[10\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[11\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data2\[12\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[0:6\]} \
{/testfixture1/DUT/fft/r_data3\[0\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[1\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[2\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[3\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[4\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[5\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data3\[6\]\[31:0\]} \
{/testfixture1/DUT/fft/r_data4\[0:3\]} \
{/testfixture1/DUT/fft/r_data5\[0:15\]} \
{/testfixture1/DUT/fft/fft_valid} \
{/testfixture1/DUT/fft/r_w1\[0:7\]} \
{/testfixture1/DUT/fft/r_w2\[0:3\]} \
{/testfixture1/DUT/fft/r_w3\[0:1\]} \
{/testfixture1/DUT/fft/pe1/w_real\[17:0\]} \
{/testfixture1/DUT/fft/pe1/w_imag\[17:0\]} \
{/testfixture1/DUT/fft/pe1/X\[31:0\]} \
{/testfixture1/DUT/fft/pe1/Y\[31:0\]} \
{/testfixture1/DUT/fft/pe1/fft_a\[31:0\]} \
{/testfixture1/DUT/fft/pe1/fft_b\[31:0\]} \
{/testfixture1/DUT/fft/flag1} \
{/testfixture1/DUT/fft/flag2} \
{/testfixture1/DUT/fft/flag3} \
{/testfixture1/DUT/fft/flag4} \
{/testfixture1/DUT/fft/cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/testfixture1/DUT/ana/done} \
{/testfixture1/DUT/ana/start} \
{/testfixture1/DUT/ana/ref\[1:0\]} \
{/testfixture1/DUT/ana/cnt\[3:0\]} \
{/testfixture1/DUT/ana/freq\[3:0\]} \
{/testfixture1/DUT/ana/square_sum\[31:0\]} \
{/testfixture1/DUT/ana/r_max\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G6" 7 )} 
wvSetPosition -win $_nWave1 {("G6" 7)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G6" 6 )} 
wvSetCursor -win $_nWave1 140414.568231 -snap {("G5" 39)}
wvSelectSignal -win $_nWave1 {( "G5" 16 )} 
wvSetPosition -win $_nWave1 {("G5" 16)}
wvCollapseBus -win $_nWave1 {("G5" 16)}
wvSetPosition -win $_nWave1 {("G5" 16)}
wvSetPosition -win $_nWave1 {("G6" 7)}
wvScrollUp -win $_nWave1 2
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSetPosition -win $_nWave1 {("G5" 2)}
wvCollapseBus -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G6" 7)}
wvResizeWindow -win $_nWave1 171 51 3487 946
wvResizeWindow -win $_nWave1 31 51 3627 946
wvResizeWindow -win $_nWave1 31 51 3737 946
wvSetCursor -win $_nWave1 110920.412274 -snap {("G6" 6)}
wvSetCursor -win $_nWave1 138597.279536 -snap {("G5" 12)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 -10 51 1920 946
wvResizeWindow -win $_nWave1 -10 14 960 1028
wvResizeWindow -win $_nWave1 916 60 1920 946
wvSetCursor -win $_nWave1 131815.914424 -snap {("G1" 3)}
wvResizeWindow -win $_nWave1 916 60 2898 946
wvResizeWindow -win $_nWave1 916 60 2898 946
wvResizeWindow -win $_nWave1 46 60 3768 946
wvSetCursor -win $_nWave1 896170.319772 -snap {("G5" 19)}
wvSetCursor -win $_nWave1 891161.730309 -snap {("G5" 14)}
wvSetCursor -win $_nWave1 892882.630278 -snap {("G5" 10)}
wvSetCursor -win $_nWave1 891508.478810 -snap {("G5" 12)}
wvSetCursor -win $_nWave1 894603.530248 -snap {("G5" 11)}
wvSetCursor -win $_nWave1 893704.552652 -snap {("G5" 11)}
wvSetCursor -win $_nWave1 895065.861583 -snap {("G5" 10)}
wvSetCursor -win $_nWave1 896645.493644 -snap {("G5" 10)}
wvSetCursor -win $_nWave1 897698.581685 -snap {("G5" 10)}
wvSetCursor -win $_nWave1 896080.422012 -snap {("G5" 11)}
wvSetCursor -win $_nWave1 894089.828764 -snap {("G5" 8)}
wvSetCursor -win $_nWave1 892009.337757 -snap {("G5" 7)}
wvSetCursor -win $_nWave1 893255.063854 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 893062.425798 -snap {("G5" 8)}
wvSetCursor -win $_nWave1 891752.487015 -snap {("G5" 9)}
wvSetCursor -win $_nWave1 890018.744509 -snap {("G5" 9)}
wvSetCursor -win $_nWave1 888927.128856 -snap {("G5" 10)}
wvSetCursor -win $_nWave1 886063.243087 -snap {("G5" 9)}
wvSetCursor -win $_nWave1 884021.279690 -snap {("G5" 9)}
