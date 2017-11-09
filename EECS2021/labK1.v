module labK;
	reg [31:0] x; 
	reg [1:0] one; 
	reg [2:0] two; 
	reg [3:0] three; 


	initial
	begin
		$display("time = %5d, x = %b", $time, x);
		x = 32'hffff0000;
		$display("time = %5d, x = %b", $time, x);
		x = x + 2;
		$display("time = %5d, x = %b", $time, x);
		one = &x;            // and reduction
		$display("time = %5d, x = %b", $time, one);
		two = x[1:0];        // part-select
		$display("time = %5d, x = %b", $time, two);
		three = {one, two};  // concatenate
		$display("time = %5d, x = %b", $time, three);

		$finish;
	end

endmodule 
