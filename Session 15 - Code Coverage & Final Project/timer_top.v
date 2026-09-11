module timer_top (
	input wire sys_clk,
	input wire sys_rst_n,
	input wire tim_psel,
	input wire tim_pwrite,
	input wire tim_penable,
	input wire [11:0] tim_paddr,
	input wire [31:0] tim_pwdata,
	input wire [3:0] tim_pstrb,
	input wire dbg_mode,

	output wire [31:0] tim_prdata,
	output wire tim_pready,
	output wire tim_pslverr,
	output wire tim_int
);

	wire [11:0] req_addr;
	wire [31:0] req_wdata;
	wire [3:0] req_pstrb;
	wire req_write;
	wire wr_commit;
	wire [31:0] reg_rdata;
	wire access_error;

	wire timer_en;
	wire div_en;
	wire [3:0] div_val;
	wire int_en;
	wire halt_req;
	wire halt_ack;
	wire count_en;
	wire [7:0] int_cnt_unused;

	wire [63:0] count_value;
	wire [63:0] compare_value;
	wire timer_disable_pulse;
	wire tdr0_wr_fire;
	wire tdr1_wr_fire;
	wire [31:0] tdr0_wr_data;
	wire [31:0] tdr1_wr_data;

	wire int_clear;
	wire int_st;
	
timer_apb_slave u_apb_slave (
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.tim_psel(tim_psel),
	.tim_penable(tim_penable),
	.tim_pwrite(tim_pwrite),
	.tim_paddr(tim_paddr),
	.tim_pwdata(tim_pwdata),
	.tim_pstrb(tim_pstrb),
	.reg_rdata(reg_rdata),
	.access_error(access_error),
	.tim_prdata(tim_prdata),
	.tim_pready(tim_pready),
	.tim_pslverr(tim_pslverr),
	.req_addr(req_addr),
	.req_wdata(req_wdata),
	.req_pstrb(req_pstrb),
	.req_write(req_write),
	.wr_commit(wr_commit)
);

timer_reg u_reg (
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.req_addr(req_addr),
	.req_wdata(req_wdata),
	.req_pstrb(req_pstrb),
	.req_write(req_write),
	.wr_commit(wr_commit),
        .count_value(count_value),
	.int_st(int_st),
	.halt_ack(halt_ack),
	.reg_rdata(reg_rdata),
	.access_error(access_error),
	.timer_en(timer_en),
	.div_en(div_en),
	.div_val(div_val),
	.int_en(int_en),
	.halt_req(halt_req),
	.compare_value(compare_value),
	.timer_disable_pulse(timer_disable_pulse),
	.tdr0_wr_fire(tdr0_wr_fire),
	.tdr1_wr_fire(tdr1_wr_fire),
	.tdr0_wr_data(tdr0_wr_data),
	.tdr1_wr_data(tdr1_wr_data),
	.int_clear(int_clear)
);

timer_counter_control u_counter_control (
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.timer_en(timer_en),
	.div_en(div_en),
	.div_val(div_val),
	.dbg_mode(dbg_mode),
	.halt_req(halt_req),
	.timer_disable_pulse(timer_disable_pulse),
	.count_en(count_en),
	.halt_ack(halt_ack),
	.int_cnt(int_cnt_unused)
);

timer_counter u_counter (
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.count_en(count_en),
	.timer_disable_pulse(timer_disable_pulse),
	.tdr0_wr_fire(tdr0_wr_fire),
	.tdr1_wr_fire(tdr1_wr_fire),
	.tdr0_wr_data(tdr0_wr_data),
	.tdr1_wr_data(tdr1_wr_data),
	.count_value(count_value)
);

timer_interrupt u_interrupt (
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.count_value(count_value),
	.compare_value(compare_value),
	.int_en(int_en),
	.int_clear(int_clear),
	.int_st(int_st),
	.tim_int(tim_int)
);

endmodule
