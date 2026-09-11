module timer_counter_control (
	input wire sys_clk,
	input wire sys_rst_n,
	input wire timer_en,
	input wire div_en,
	input wire [3:0] div_val,
	input wire dbg_mode,
	input wire halt_req,
	input wire timer_disable_pulse,

	output wire count_en,
	output wire halt_ack,
	output wire [7:0] int_cnt
);
	wire halt_active;	
	reg [7:0] int_cnt_q;
	reg [7:0] div_limit;
	wire at_limit;

	wire bypass_count;
	wire count_request;

assign int_cnt = int_cnt_q;
assign halt_active = dbg_mode & halt_req;
assign halt_ack = halt_active;

always @(*) begin
	case (div_val)
		4'd1: div_limit = 8'd1;
		4'd2: div_limit = 8'd3;
		4'd3: div_limit = 8'd7;
		4'd4: div_limit = 8'd15;
		4'd5: div_limit = 8'd31;
		4'd6: div_limit = 8'd63;
		4'd7: div_limit = 8'd127;
		4'd8: div_limit = 8'd255;
		default: div_limit = 8'd0;
	endcase
end

assign at_limit = (div_val != 4'd0) & (int_cnt_q == div_limit);
assign bypass_count = ~div_en | (div_val == 4'd0);
assign count_request = timer_en & (bypass_count | at_limit);
assign count_en = sys_rst_n & ~halt_active & count_request;

always @(posedge sys_clk or negedge sys_rst_n) begin
	if (!sys_rst_n)
		int_cnt_q <= 8'd0;
	else if (timer_disable_pulse)
		int_cnt_q <= 8'd0;
	else if (!timer_en)
		int_cnt_q <= 8'd0;
	else if (!div_en)
		int_cnt_q <= 8'd0;
	else if (div_val == 4'd0)
		int_cnt_q <= 8'd0;
	else if (halt_active)
		int_cnt_q <= int_cnt_q;
	else if (at_limit)
		int_cnt_q <= 8'd0;
	else
		int_cnt_q <= int_cnt_q + 8'd1;
end

endmodule
