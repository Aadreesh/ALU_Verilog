`include "and_all.v"
`include "exor_all.v"
`include "or.v"
`include "and.v"
`include "not_all.v"
module sub_all #(parameter N = 32)

(
	input [31:0]a, d,
	input c,
	output [31:0]out, 
	output cout
);
	genvar index;
	wire [31:0] G, P, b;
	wire [31:0] C, E;
	wire temp, temp2;
	not_all not2(E[31:0], d[31:0]);
	add_all add2(E[31:0], 32'b1, 1'b0, b[31:0], temp2);
	assign C[0] = c;

	and_all Cgen(a[31:0], b[31:0], G[31:0]);
	exor_all Cprop(a[31:0], b[31:0], P[31:0]);
	generate
		for(index = 0; index < N-1; index++)
			begin  
				and and33(temp, P[index], C[index]);
				or or33(C[index+1], G[index], temp);
				exor exor33(out[index], P[index], C[index]);
			end
		for(index = 0; index < N; index++)
			begin  
				exor exor33(out[index], P[index], C[index]);
			end
		
	endgenerate
	assign cout = C[31];

endmodule