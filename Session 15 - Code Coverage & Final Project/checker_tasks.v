// TEST_BENCH INITIALIZATION
task initialize_tb;
begin
	sys_rst_n = 1'b0;
	tim_psel = 1'b0;
	tim_penable = 1'b0;
	tim_pwrite = 1'b0;
	tim_paddr = 12'h000;
	tim_pwdata = 32'h0000_0000;
	tim_pstrb = 4'b0000;
	dbg_mode = 1'b0;
	check_count = 0;
	error_count = 0;
	warning_count = 0;
	test_done = 1'b0;
end
endtask

//==========================================================================================
// DUT RESET
task reset_dut;
begin
	// Bus must remain IDLE during reset
	tim_psel = 1'b0;
	tim_penable = 1'b0;
	tim_pwrite = 1'b0;
	tim_paddr = 12'h000;
	tim_pwdata = 32'h0000_0000;
	tim_pstrb = 4'b0000;
	dbg_mode = 1'b0;
	// Asynchronous active-low reset assertion
	sys_rst_n = 1'b0;
	// Hold reset across several clk
	repeat(3) @(posedge sys_clk);
	// Release reset at a falling edge to avoid race
	@(negedge sys_clk);
	sys_rst_n = 1'b1;
	// Wait until the first normal active edge completes
	@(posedge sys_clk);
	#1;
end
endtask

//==========================================================================================
// 1-BIT CHECKER
task check_bit;
	input [8*80-1:0] check_name;
	input actual;
	input expected;
begin
	check_count = check_count + 1;
	if (actual !== expected) begin
		error_count = error_count + 1;
		$display("================================");
		$display(" [FAIL] %0s | expected = %b , actual = %b | time = %0t ",check_name,expected,actual,$time);
		$display("================================");
	end
	else begin
		$display("================================");
		$display(" [PASS] %0s | value = %b | time = %0t ",check_name,actual,$time);
		$display("================================");
	end
end
endtask

//==========================================================================================
// 8-BIT CHECKER
task check8;
	input [8*80-1:0] check_name;
	input [7:0] actual;
	input [7:0] expected;
begin
	check_count = check_count + 1;
	if (actual !== expected) begin
		error_count = error_count + 1;
		$display("================================");
		$display(" [FAIL] %0s | expected = %02h , actual = %02h | time = %0t ",check_name,expected,actual,$time);
		$display("================================");
	end
	else begin
		$display("================================");
		$display(" [PASS] %0s | value = %02h | time = %0t ",check_name,actual,$time);
		$display("================================");
	end
end
endtask

//==========================================================================================
// 32-BIT CHECKER
task check32;
	input [8*80-1:0] check_name;
	input [31:0] actual;
	input [31:0] expected;
begin
	check_count = check_count + 1;
 	if (actual !== expected) begin
		error_count = error_count + 1;
		$display("================================");
		$display(" [FAIL] %0s | expected = %08h , actual = %08h | time = %0t ",check_name,expected,actual,$time);
		$display("================================");
	end
	else begin
		$display("================================");
		$display(" [PASS] %0s | value = %08h | time = %0t ",check_name,actual,$time);
		$display("================================");
	end
end
endtask

//==========================================================================================
// 64_BIT CHECKER
task check64;
	input [8*80-1:0] check_name;
	input [63:0] actual;
	input [63:0] expected;
begin
	check_count = check_count + 1;
	if (actual !== expected) begin
		error_count = error_count + 1;
		$display("================================");
		$display(" [FAIL] %0s | expected = %016h , actual = %016h | time = %0t ",check_name,expected,actual,$time);
		$display("================================");
	end
	else begin
		$display("================================");
		$display(" [PASS] %0s | value = %016h | time = %0t ",check_name,actual,$time);
		$display("================================");
	end
end
endtask

//==========================================================================================
// CHECK NO X
task check_no_x;
	input [8*80-1:0] name;
	input [31:0] value;
begin
	check_count = check_count + 1;
	if (^value === 1'bx) begin
		error_count = error_count + 1;
		$display(" [FAIL] %0s contains X/Z | value = %h | time = %0t ",name,value,$time);
	end
	else begin
		$display(" [PASS] %0s has no X/Z | value = %h | time = %0t ",name,value,$time);
	end
end
endtask

//==========================================================================================
// FINAL TEST RESULT
task print_test_result;
begin
	$display("================================");
	$display(" TOTAL CHECKS = %0d ",check_count);
	$display(" TOTAL ERRORS = %0d ",error_count);
	$display(" TOTAL WARININGS = %0d ",warning_count);
	if (error_count == 0) begin
		$display("================================");
		$display(" TEST_RESULT: PASS ");
		$display("================================");
	end
	else begin
		$display("================================");
		$display(" TEST_RESULT: FAIL ");
		$display("================================");
	end
	$display("================================");
end
endtask
