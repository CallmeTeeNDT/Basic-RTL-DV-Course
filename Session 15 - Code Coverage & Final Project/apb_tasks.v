task apb_write;
	input [11:0] addr;
	input [31:0] data;
	input [3:0] strb;
	input expected_error;
begin
// SETUP PHASE
	@(negedge sys_clk);
	tim_psel = 1'b1;
	tim_penable = 1'b0;
	tim_pwrite = 1'b1;
	tim_paddr = addr;
	tim_pwdata = data;
	tim_pstrb = strb;
	@(posedge sys_clk);
	#1;
	check_bit(" WRITE SETUP: PREADY ",tim_pready,1'b0);
	check_bit(" WRITE SETUP: PSLVERR ",tim_pslverr,1'b0);

// FIRST ACCESS CYCLE: WAIT-STATE
	@(negedge sys_clk);
	tim_penable = 1'b1;
	// First ACCESS cycle has started, but wait_seen_q is still zero.
	#1;
	check_bit(" WRITE ACCESS-WAIT: PREADY ",tim_pready,1'b0);
	check_bit(" WRITE ACCESS-WAIT: PSLVERR ",tim_pslverr,1'b0);
	// First ACCESS rising edge, pready was zero before, so no transfer completes.
	@(posedge sys_clk);
	
// SECOND ACCESS CYCLE: COMPLETION
	@(negedge sys_clk);
	#1;
	check_bit(" WRITE ACCESS-COMPLETE: PREADY ",tim_pready,1'b1);
	check_bit(" WRITE ACCESS-COMPLETE: PSLVERR ",tim_pslverr,expected_error);
	// Completion is sampled at this rising edge.
	@(posedge sys_clk);
	#1;

// RETURN TO IDLE
	@(negedge sys_clk);
	tim_psel = 1'b0;
	tim_penable = 1'b0;
	tim_pwrite = 1'b0;
	tim_paddr = 12'h000;
	tim_pwdata = 32'h0000_0000;
	tim_pstrb = 4'b0000;
	@(posedge sys_clk);
	#1;
end

endtask

//==============================================================================
task apb_read;
	input [11:0] addr;
	output [31:0] data;
	input expected_error;
begin
// SETUP
	@(negedge sys_clk);
	tim_psel = 1'b1;
	tim_penable = 1'b0;
	tim_pwrite = 1'b0;
	tim_paddr = addr;
	tim_pwdata = 32'h0000_0000;
	tim_pstrb = 4'b0000;
	@(posedge sys_clk);
	#1;
	check_bit(" READ SETUP: PREADY ",tim_pready,1'b0);
	check_bit(" READ SETUP: PSLVERR ",tim_pslverr,1'b0);

// FIRST ACCESS: WAIT
	@(negedge sys_clk);
	tim_penable = 1'b1;
	#1;
	check_bit(" READ ACCESS-WAIT: PREADY ",tim_pready,1'b0);
	check_bit(" READ ACCESS-WAIT: PSLVERR ",tim_pslverr,1'b0);
	@(posedge sys_clk);

// SECOND ACCESS: COMPLETION
	@(negedge sys_clk);
	#1;
	check_bit(" READ ACCESS-COMPLETE: PREADY ",tim_pready,1'b1);
	check_bit(" READ ACCESS-COMPLETE: PSLVERR ",tim_pslverr,expected_error);
	// Prdata must already be valid during completion phase.
	data = tim_prdata;
	// Completion rising edge.
	@(posedge sys_clk);
	#1;

// IDLE
	@(negedge sys_clk);
	tim_psel = 1'b0;
	tim_penable = 1'b0;
	tim_pwrite = 1'b0;
	tim_paddr = 12'h000;
	tim_pwdata = 32'h0000_0000;
	tim_pstrb = 4'b0000;
	@(posedge sys_clk);
	#1;
end

endtask

//==============================================================================
task program_counter64;
	input [63:0] value;
begin
// TIMER NEN DUOC DISABLE TRUOC KHI PROGRAM COUNTER
apb_write(`ADDR_TDR1, value[63:32], `STRB_ALL, `APB_NO_ERROR);
apb_write(`ADDR_TDR0, value[31:0], `STRB_ALL, `APB_NO_ERROR);
end

endtask

//==============================================================================
task program_compare64;
	input [63:0] value;
begin
apb_write(`ADDR_TCMP1, value[63:32], `STRB_ALL, `APB_NO_ERROR);
apb_write(`ADDR_TCMP0, value[31:0], `STRB_ALL, `APB_NO_ERROR);
end

endtask

//==============================================================================
task read_counter64;
	output [63:0] value;
	reg [31:0] value_hi;
	reg [31:0] value_lo;
begin
apb_read(`ADDR_TDR1, value_hi, `APB_NO_ERROR);
apb_read(`ADDR_TDR0, value_lo, `APB_NO_ERROR);
value = {value_hi, value_lo};
end

endtask

//==============================================================================
task read_compare64;
	output [63:0] value;
	reg [31:0] value_hi;
	reg [31:0] value_lo;
begin
apb_read(`ADDR_TCMP1, value_hi, `APB_NO_ERROR);
apb_read(`ADDR_TCMP0, value_lo, `APB_NO_ERROR);
value = {value_hi, value_lo};
end

endtask


