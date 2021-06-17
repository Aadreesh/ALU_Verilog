`include "HA.v"
module FA
{
	input a, b, c,
	output out, cout
};
	wire ha_sum,ha_cout;
	HA aa(a, b, ha_sum, ha_cout);
	HA ab(t1, c, out, cout);
endmodule
