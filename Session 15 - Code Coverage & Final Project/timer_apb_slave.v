module timer_apb_slave (
	input wire sys_clk,
	input wire sys_rst_n,
	input wire tim_psel,
	input wire tim_penable,
	input wire tim_pwrite,
	input wire [11:0] tim_paddr,
	input wire [31:0] tim_pwdata,
	input wire [3:0] tim_pstrb,
	input wire [31:0] reg_rdata,
	input wire access_error,

	output wire [31:0] tim_prdata,
	output wire tim_pready,
	output wire tim_pslverr,
	output wire [11:0] req_addr,
	output wire [31:0] req_wdata,
	output wire [3:0] req_pstrb,
	output wire req_write,
	output wire wr_commit
);
	
	wire setup_phase;
	wire access_phase;
	wire wr_complete;
	wire rd_complete;

	reg [11:0] req_addr_q;
	reg [31:0] req_wdata_q;
	reg [3:0] req_pstrb_q;
	reg req_write_q;
	reg wait_seen_q;

assign setup_phase = tim_psel & ~tim_penable;
assign access_phase = tim_psel & tim_penable;

assign tim_pready = access_phase & wait_seen_q;

assign wr_complete = tim_pready & req_write_q;
assign wr_commit = wr_complete & ~access_error;
assign rd_complete = tim_pready & ~req_write_q;

assign tim_pslverr = wr_complete & access_error;
assign tim_prdata = rd_complete ? reg_rdata : 32'h0000_0000;

assign req_addr = req_addr_q;
assign req_wdata = req_wdata_q;
assign req_pstrb = req_pstrb_q;
assign req_write = req_write_q;

always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		req_addr_q <= 12'h000;
		req_wdata_q <= 32'h0000_0000;
		req_pstrb_q <= 4'b0000;
		req_write_q <= 1'b0;
	end
	else if (setup_phase) begin
		req_addr_q <= tim_paddr;
		req_wdata_q <= tim_pwdata;
		req_pstrb_q <= tim_pstrb;
		req_write_q <= tim_pwrite;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
	if (!sys_rst_n) begin
		wait_seen_q <= 1'b0;
	end
	else if (!access_phase) begin
		wait_seen_q <= 1'b0;
	end
	else if (!wait_seen_q) begin
		wait_seen_q <= 1'b1;
	end
	else begin
		wait_seen_q <= 1'b1;
	end
end
endmodule
