module timer_interrupt (
	input wire sys_clk,
	input wire sys_rst_n,
	input wire [63:0] count_value,
	input wire [63:0] compare_value,
	input wire int_en,
	input wire int_clear,
	
	output wire int_st,
	output wire tim_int
);

	reg int_st_q;
	wire counter_match;

assign counter_match = (count_value == compare_value);	
assign int_st = int_st_q;
assign tim_int = int_en & int_st_q;

// RW1C clear has the highest priority required by the specification
always @(posedge sys_clk or negedge sys_rst_n) begin
	if (!sys_rst_n)
		int_st_q <= 1'b0;
	else if (int_clear)
		int_st_q <= 1'b0;
	else if (counter_match)
		int_st_q <= 1'b1;
	else
		int_st_q <= int_st_q;
end

endmodule
