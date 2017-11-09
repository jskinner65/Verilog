module labK;
	reg a, b, c, flag, expect;
	wire z;
	not my_not(Nc, c);
	and my_and(t1, a, Nc);
	and my_and2(t2, b, c);
	or my_or(z, t1, t2);

	initial
	begin
		flag = $value$plusargs("a=%b", a); 
		flag = $value$plusargs("b=%b", b); 
		flag = $value$plusargs("c=%b", c); 
		if (a === expect || b === expect || c === expect) begin
			$display("Missing arguements, please include a=0or1 b=0or1 c=0or1");
		end else begin
			expect = (a & ~c) | (c & b);
				#1; // wait for z
				if (expect === z)	
					$display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);
				else
					$display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
			end
			$finish;
		end
endmodule
