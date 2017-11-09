module labK;
	reg a, b, c, expect;
	wire z;
	integer i, j, k;
	not my_not(Nc, c);
	and my_and(t1, a, Nc);
	and my_and2(t2, b, c);
	or my_or(z, t1, t2);

	initial
	begin
		for (i=0; i<2; i++) begin
			for (j=0; j<2; j++) begin
				for (k=0; k<2; k++) begin
					a=i; b = j; c = k;
					expect = (a & ~c) | (c & b);
						#1; // wait for z
						if (expect === z)	
							$display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);
						else
							$display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
	
					end
				end
			end
			$finish;
		end
endmodule
