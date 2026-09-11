module timer_reg (
	input wire sys_clk,
	input wire sys_rst_n,
	input wire [11:0] req_addr,
	input wire [31:0] req_wdata,
	input wire [3:0] req_pstrb,
	input wire req_write,
	input wire wr_commit,	
	input wire [63:0] count_value,
	input wire int_st,
	input wire halt_ack,
	
	output reg [31:0] reg_rdata,
	output wire access_error,
	output wire timer_en,
	output wire div_en,
	output wire [3:0]  div_val,
	output wire int_en,
	output wire halt_req,
	output wire [63:0] compare_value,
	output wire timer_disable_pulse,
	output wire tdr0_wr_fire,	
	output wire tdr1_wr_fire,	
	output wire [31:0] tdr0_wr_data,
	output wire [31:0] tdr1_wr_data,
	output wire int_clear
);

	localparam [11:0] ADDR_TCR 	= 12'h000;
	localparam [11:0] ADDR_TDR0	= 12'h004;
	localparam [11:0] ADDR_TDR1	= 12'h008;
	localparam [11:0] ADDR_TCMP0	= 12'h00C;
	localparam [11:0] ADDR_TCMP1	= 12'h010;
	localparam [11:0] ADDR_TIER	= 12'h014;
	localparam [11:0] ADDR_TISR	= 12'h018;
	localparam [11:0] ADDR_THCSR	= 12'h01C;
	
	reg timer_en_q;
	reg div_en_q;
	reg [3:0] div_val_q;
	reg [31:0] tcmp0_q;
	reg [31:0] tcmp1_q;
	reg int_en_q;
	reg halt_req_q;

	wire hit_tcr;
	wire hit_tdr0;
	wire hit_tdr1;
	wire hit_tcmp0;
	wire hit_tcmp1;
	wire hit_tier;
	wire hit_tisr;
	wire hit_thcsr;
	
	wire [31:0] byte_mask;

	wire [31:0] tcr_current;
	wire [31:0] tcmp0_candidate;
	wire [31:0] tcmp1_candidate;
	wire candidate_div_en;
	wire [3:0] candidate_div_val;
	wire candidate_timer_en;

	wire invalid_div_val;
	wire running_div_en_change;
	wire running_div_val_change;
	wire tcr_illegal;
	wire tcr_wr;

assign hit_tcr = (req_addr == ADDR_TCR);
assign hit_tdr0 = (req_addr == ADDR_TDR0);
assign hit_tdr1 = (req_addr == ADDR_TDR1);
assign hit_tcmp0 = (req_addr == ADDR_TCMP0);
assign hit_tcmp1 = (req_addr == ADDR_TCMP1);
assign hit_tier = (req_addr == ADDR_TIER);
assign hit_tisr = (req_addr == ADDR_TISR);
assign hit_thcsr = (req_addr == ADDR_THCSR);

assign byte_mask = {{8{req_pstrb[3]}},{8{req_pstrb[2]}},{8{req_pstrb[1]}},{8{req_pstrb[0]}}};

assign timer_en = timer_en_q;
assign div_en = div_en_q;
assign div_val = div_val_q;
assign int_en = int_en_q;
assign halt_req = halt_req_q;
assign compare_value = {tcmp1_q, tcmp0_q};
assign tcr_current = {20'h0, div_val_q, 6'h0, div_en_q, timer_en_q};
assign candidate_timer_en = req_pstrb[0] ? req_wdata[0] : timer_en_q;
assign candidate_div_en = req_pstrb[0] ? req_wdata[1] : div_en_q;
assign candidate_div_val = req_pstrb[1] ? req_wdata[11:8] : div_val_q;

assign invalid_div_val = req_pstrb[1] & (candidate_div_val  > 4'd8);
assign running_div_en_change = timer_en_q & req_pstrb[0] & (candidate_div_en != div_en_q);
assign running_div_val_change = timer_en_q & req_pstrb[1] & (candidate_div_val != div_val_q);
assign tcr_illegal = invalid_div_val | running_div_en_change | running_div_val_change;
assign access_error = req_write & hit_tcr & tcr_illegal;
assign tcr_wr = wr_commit & hit_tcr;
assign timer_disable_pulse = tcr_wr & timer_en_q & ~candidate_timer_en;

assign tcmp0_candidate = (tcmp0_q & ~byte_mask) | (req_wdata & byte_mask);
assign tcmp1_candidate = (tcmp1_q & ~byte_mask) | (req_wdata & byte_mask);
assign tdr0_wr_fire = wr_commit & hit_tdr0 & (|req_pstrb); 
assign tdr1_wr_fire = wr_commit & hit_tdr1 & (|req_pstrb); 
assign tdr0_wr_data = (count_value[31:0] & ~byte_mask) | (req_wdata & byte_mask);
assign tdr1_wr_data = (count_value[63:32] & ~byte_mask) | (req_wdata & byte_mask);

assign int_clear = wr_commit & hit_tisr & req_pstrb[0] & req_wdata[0];

always @(*) begin
	case (req_addr)
		ADDR_TCR: reg_rdata = tcr_current;
		ADDR_TDR0: reg_rdata = count_value[31:0];
		ADDR_TDR1: reg_rdata = count_value[63:32];
		ADDR_TCMP0: reg_rdata = tcmp0_q;
		ADDR_TCMP1: reg_rdata = tcmp1_q;
		ADDR_TIER: reg_rdata = {31'h0, int_en_q};
		ADDR_TISR: reg_rdata = {31'h0, int_st};
		ADDR_THCSR: reg_rdata = {30'h0, halt_ack, halt_req_q};
		default: reg_rdata = 32'h0000_0000;
	endcase
end

always @(posedge sys_clk or negedge sys_rst_n) begin
	if (!sys_rst_n) begin
		timer_en_q <= 1'b0;
		div_en_q <= 1'b0;
		div_val_q <= 4'd1;
		tcmp0_q <= 32'hFFFF_FFFF;
		tcmp1_q <= 32'hFFFF_FFFF;
		int_en_q <= 1'b0;
		halt_req_q <= 1'b0;
	end
	else begin
		if (tcr_wr) begin
			timer_en_q <= candidate_timer_en;
			div_en_q <= candidate_div_en;
			div_val_q <= candidate_div_val;
		end
		if (wr_commit & hit_tcmp0) 
			tcmp0_q <= tcmp0_candidate;
		if (wr_commit & hit_tcmp1) 
			tcmp1_q <= tcmp1_candidate;
		if (wr_commit & hit_tier & req_pstrb[0])
			int_en_q <= req_wdata[0];
		if (wr_commit & hit_thcsr & req_pstrb[0])
			halt_req_q <= req_wdata[0];
	end
end

endmodule
