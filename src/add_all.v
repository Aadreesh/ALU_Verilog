`include "and_all.v"
`include "exor_all.v"
`include "or.v"
`include "and.v"

module add_all #(parameter N = 32)

(
	input [31:0]a, b,
	input c,
	output [31:0]out, 
	output cout
);
	genvar index;
	wire [31:0] G, P;
	wire [31:0] C;
	wire temp;
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