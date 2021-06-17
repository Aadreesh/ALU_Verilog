module HA
{
	input a, b,
	output out, cout
};
	assign  out = a ^ b;
	assign cout = a & b;

endmodule