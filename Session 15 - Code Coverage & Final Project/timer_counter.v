module timer_counter (
	input wire sys_clk,
	input wire sys_rst_n,
	input wire count_en,
	input wire timer_disable_pulse,
	input wire tdr0_wr_fire,
	input wire tdr1_wr_fire,
	input wire [31:0] tdr0_wr_data,
	input wire [31:0] tdr1_wr_data,

	output wire [63:0] count_value
);
	reg [63:0] count_q;
	reg [63:0] count_d;
	wire any_tdr_write;
assign any_tdr_write = tdr0_wr_fire | tdr1_wr_fire;
assign count_value = count_q;
always @(*) begin
	count_d = count_q;
	if (timer_disable_pulse) begin
		count_d = 64'h0000_0000_0000_0000;
	end
	else if (any_tdr_write) begin
		if (tdr0_wr_fire)
		       count_d[31:0] = tdr0_wr_data;
       		if (tdr1_wr_fire)
	 		count_d[63:32] = tdr1_wr_data;		
	end
	else if (count_en) begin
		count_d = count_q + 64'd1;
	end
end
always @(posedge sys_clk or negedge sys_rst_n) begin
	if (!sys_rst_n)
		count_q <= 64'h0000_0000_0000_0000;
	else
		count_q <= count_d;
	end	
endmodule
