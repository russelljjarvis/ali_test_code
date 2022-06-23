module adder_8in
#(parameter p_width = 6)
(
input  [2*p_width-1:0]  i_a,
input  [2*p_width-1:0]  i_b,
input  [2*p_width-1:0]  i_c,
input  [2*p_width-1:0]  i_d,

input  [2*p_width-1:0]  i_e,
input  [2*p_width-1:0]  i_f,
input  [2*p_width-1:0]  i_g,
input  [2*p_width-1:0]  i_h,

output [2*p_width+2:0]  o_s
);

wire [2*p_width-1:0]  w_p10;
wire [2*p_width-1:0]  w_p11;
wire [2*p_width-1:0]  w_g10;
wire [2*p_width-1:0]  w_g11;
wire [2*p_width-1:0]  w_s11;
wire [2*p_width-1:0]  w_p20;
wire [2*p_width-1:0]  w_p21;
wire [2*p_width-1:0]  w_g20;
wire [2*p_width-1:0]  w_g21;
wire [2*p_width-1:0]  w_s12;
wire [2*p_width  :0]  w_co11;
wire [2*p_width+1:0]  w_co12;
wire [2*p_width+1:0]  w_s21;
wire [2*p_width+1:0]  w_s22;
wire [2*p_width  :0]  w_co21;
wire [2*p_width+1:0]  w_co22;

assign  w_p10 = i_a^i_b;
assign  w_p11 = i_c^i_d;
assign  w_g10 = i_a & i_b;
assign  w_g11 = i_c & i_d;
assign  w_s11 = w_p10^w_p11;
assign  w_co11= {((w_g10 & ~w_g11) |  (~w_g10 & w_g11) | (w_p10 & w_p11)), 1'b0};
assign  w_co12= {(w_g10 & w_g11), 2'b0};

assign  w_p20 = i_e^i_f;
assign  w_p21 = i_g^i_h;
assign  w_g20 = i_e & i_f;
assign  w_g21 = i_g & i_h;
assign  w_s12 = w_p20^w_p21;
assign  w_co21= {((w_g20 & ~w_g21) |  (~w_g20 & w_g21) | (w_p20 & w_p21)),1'b0};
assign  w_co22= {(w_g20 & w_g21), 2'b0};

assign w_s21 = w_s11 + w_co11 + w_co12;
assign w_s22 = w_s12 + w_co21 + w_co22;

assign o_s = {1'b0, w_s21} + {1'b0, w_s22};

endmodule