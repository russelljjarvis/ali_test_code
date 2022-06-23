`timescale 1ns/1ns

module adder_8in_tb();
parameter p_w = 6;

reg [2*p_w-1:0]  r_a,r_b,r_c,r_d;
reg [2*p_w-1:0]  r_e,r_f,r_g,r_h;
wire [2*p_w+2:0] w_s;

adder_8in
#(.p_width(p_w)) uut
(
	.i_a(r_a),
	.i_b(r_b),
	.i_c(r_c),
	.i_d(r_d),
	.i_e(r_e),
	.i_f(r_f),
	.i_g(r_g),
	.i_h(r_h),
	.o_s(w_s)
);

initial
begin
		r_a = 6'h0;
		r_b = 6'h0;
		r_c = 6'h0;
		r_d = 6'h0;
		r_e = 6'h0;
		r_f = 6'h0;
		r_g = 6'h0;
		r_h = 6'h0;
#50
		r_a = 6'h3f;
		r_b = 6'h0f;
		r_c = 6'h0f;
		r_d = 6'h0f;
		r_e = 6'h0f;
		r_f = 6'h0f;
		r_g = 6'h0f;
		r_h = 6'h0f;
#50
		r_a = 6'h1f;
		r_b = 6'h1f;
		r_c = 6'h1f;
		r_d = 6'h1f;
		r_e = 6'h1f;
		r_f = 6'h1f;
		r_g = 6'h1f;
		r_h = 6'h1f;
#50
		r_a = 6'h3f;
		r_b = 6'h3f;
		r_c = 6'h3f;
		r_d = 6'h3f;
		r_e = 6'h3f;
		r_f = 6'h3f;
		r_g = 6'h3f;
		r_h = 6'h3f;
#50
		r_a = 6'h10;
		r_b = 6'h11;
		r_c = 6'h12;
		r_d = 6'h13;
		r_e = 6'h14;
		r_f = 6'h15;
		r_g = 6'h1b;
		r_h = 6'h1d;
end

TEST_SUITE begin
    TEST_CASE("Test 1") begin
			$display("This test case is expected to pass");
			CHECK_EQUAL(1, 1);
	    // vunit: .requirement-117
     end
		 TEST_CASE("Test that a test case that takes too long time fails with a timeout") begin
				$display("This test is expected to timeout because of the watch dog below.");
				#2ns; //
		 end
 end

endmodule
