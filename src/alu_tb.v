`timescale 10ns/1ns

module alu_tb();
reg [31:0] a;
reg [31:0] b;
reg status;
reg [3:0] opcode;
reg en;
// wires                                               
wire cout;
wire [31:0]  out;
wire overflow;
localparam period = 50;
                          
ALU i1 (
// port map - connection between master ports and signals/registers   
	.a(a),
	.b(b),
	.cout(cout),
	.status(en),
	.opcode(opcode),
	.out(out),
	.overflow(overflow)
);

initial                                                
	begin   
		$dumpfile("test.vcd");
                $dumpvars(0,alu_tb);
                                             
		a = 8'b00000000;  // initial
		b = 8'b00000000;
		en = 1'b1;
		opcode = 4'b0000;

		#period;

		//#5 en = 1'b1;
		#1 opcode = 4'b1111;  // add
		a = 8'b11111111;
		b = 8'b11111111;
		//#5 en = 1'b0;

		#period;

//		#5 en = 1'b1;
		#1 opcode = 4'b0110;  // or
		a = 8'b11001100;
		b = 8'b00110011;
		//#5 en = 1'b0;
		
		#period;
		
		//#5 en = 1'b1;
		#1 opcode = 4'b0100;  // not
		a = 8'b10101010;
		//#5 en = 1'b0;
		
		#period;
		
		//#5 en = 1'b1;
		#1 opcode = 4'b1110;  //subtract
		a = 8'b00000000;
		b = 8'b00000001;
		//#5 en = 1'b0;
		
		#period;
		
		//#5 en = 1'b1;
		#1 opcode = 4'b0111;  // and
		a = 8'b11001100;
		b = 8'b00110011;
		//#5 en = 1'b0;
		
		#period;
	                                     
	end                                                    
endmodule