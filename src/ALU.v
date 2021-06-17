`include "and_all.v"
`include "exor_all.v"
`include "or_all.v"
`include "not_all.v"

module ALU
{
    input status,
    input [31:0]a,
    input [31:0]b,
    input [3:0]opcode,
    output reg [31:0] result,
    output reg cout, overflow
};

    wire [31:0] add_out, sub_out, inc_out, dec_out, and_out, or_out, exor_out, not_out;
    wire add_cout, sub_cout, inc_cout, dec_cout, over_flow;
    
    add_all add(a[31:0], b[31:0], 1b'0, add_out[31:0], add_cout);
    sub_all sub(a[31:0], b[31:0], 1b'0, sub_out[31:0], sub_cout);
    inc_all inc(a[31:0], inc_out[31:0], inc_cout);
    dec_all dec(a[31:0], dec_out[31:0], dec_cout);
    and_all and(a[31:0], b[31:0], and_out[31:0]);
     or_all  or(a[31:0], b[31:0], or_out[31:0]);
    exor_all exor(a[31:0], b[31:0], exor_out[31:0]);
    not_all not (a[31:0], b[31:0], not_out[31:0]);

    always @ (status, a, b, opcode) 
    begin
        
        if (status)
        begin
               if(opcode[3] == 1)
               begin
                   case(opcode[2:0])    
                        3'b111: 
                                begin
                                    out = add_out;
                                    cout = add_cout;
                                end
                        
                        3'b110: 
                                begin
                                    out = sub_out;
                                    cout = sub_out;
                                end		
								
				        3'b101:
				                begin
				                	out = inc_out;
			                		cout = inc_cout;
			                	end
			
			        	3'b100:
			                	begin
			                		out = dec_out;
			                		cout = dec_cout;
			                	end
				
			        	default:
			                	begin
			                		out  = 8'b00000000;
                                    cout = 1'b0;
			                	end
                    endcase 
               end

               else
         		begin
			
        			cout = 1'b0;

        			case(opcode[2:0])
				
        				3'b111: out = and_out;
				
        				3'b110: out = or_out;
				
        				3'b101: out = exor_out;
				
        				3'b100: out = not_out;
				
				        default:
				                begin
				                	out = 8'b00000000;
				                end
				
        			endcase
    
        		end                         
        end

        else
        begin
         
            result = 8b'0;
            cout = 0;

        end    
    end

endmodule    








