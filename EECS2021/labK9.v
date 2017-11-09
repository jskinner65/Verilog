module labK;
	reg a, b, Cin;
	reg[1:0] expect;
	wire z, Cout;
	integer i, j, k;
	and (t2, a, b);
	and (t3, t1, Cin);
	or (Cout, t2, t3);
	xor (t1, a, b);
	xor (z, t1, Cin);

	initial
	begin
		for (i=0; i<2; i++) begin
			for (j=0; j<2; j++) begin
				for (k=0; k<2; k++) begin
					a=i; b = j; Cin	= k;
					expect = a + b + Cin;
						#1; // wait for z
						if (expect[0] === z && expect[1] === Cout)	
							$display("PASS: a=%b b=%b Cin=%b Cout=%b z=%b", a, b, Cin, Cout, z);
						else
							$display("FAIL: a=%b b=%b Cin=%b Cout=%b z=%b", a, b, Cin, Cout, z);
	
					end
				end
			end
			$finish;
		end
endmodule
