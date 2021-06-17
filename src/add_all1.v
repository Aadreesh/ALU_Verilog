`include "FA.v"
module add_all1
{
	input [31:0]a, b,
	output [31:0]out,
	output cout
};
	wire t1[30:0];
	FA FA1(a[0], b[0], 0, out[0], t1[0]);
	FA FA2(a[1], b[1], t1[0], out[1], t1[1]);
	FA FA3(a[2], b[2], t1[1], out[2], t1[2]);
	FA FA4(a[3], b[3], t1[2], out[3], t1[3]);
	FA FA5(a[4], b[4], t1[3], out[4], t1[4]);
	FA FA6(a[5], b[5], t1[4], out[5], t1[5]);
	FA FA7(a[6], b[6], t1[5], out[6], t1[6]);
	FA FA8(a[7], b[7], t1[6], out[7], t1[7]);
	FA FA9(a[8], b[8], t1[7], out[8], t1[8]);
	FA FA10(a[9], b[9], t1[8], out[9], t1[9]);
	FA FA11(a[10], b[10], t1[9], out[10], t1[10]);
	FA FA12(a[11], b[11], t1[10], out[11], t1[11]);
	FA FA13(a[12], b[12], t1[11], out[12], t1[12]);
	FA FA14(a[13], b[13], t1[12], out[13], t1[13]);
	FA FA15(a[14], b[14], t1[13], out[14], t1[14]);
	FA FA16(a[15], b[15], t1[14], out[15], t1[15]);
	FA FA17(a[16], b[16], t1[15], out[16], t1[16]);
	FA FA18(a[17], b[17], t1[16], out[17], t1[17]);
	FA FA19(a[18], b[18], t1[17], out[18], t1[18]);
	FA FA20(a[19], b[19], t1[18], out[19], t1[19]);
	FA FA21(a[20], b[20], t1[19], out[20], t1[20]);
	FA FA22(a[21], b[21], t1[20], out[21], t1[21]);
	FA FA23(a[22], b[22], t1[21], out[22], t1[22]);
	FA FA24(a[23], b[23], t1[22], out[23], t1[23]);
	FA FA25(a[24], b[24], t1[23], out[24], t1[24]);
	FA FA26(a[25], b[25], t1[24], out[25], t1[25]);
	FA FA27(a[26], b[26], t1[25], out[26], t1[26]);
	FA FA28(a[27], b[27], t1[26], out[27], t1[27]);
	FA FA29(a[28], b[28], t1[27], out[28], t1[28]);
	FA FA30(a[29], b[29], t1[28], out[29], t1[29]);
	FA FA31(a[30], b[30], t1[29], out[30], t1[30]);
	FA FA32(a[31], b[31], t1[30], out[31], cout);
endmodule
