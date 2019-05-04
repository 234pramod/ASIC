// Code your design here
module router(din,
             frame_n,
             valid_n,
             reset_n,
             clock,
             dour,
             frameo_n,
             valido_n);

  input din[15:0];
  input frame_n[15:0];
  input valid_n[15:0];
  input reset_n;
  input clock ;
  output dout [15:0];
  output frameo_n[15:0];
  output valido_n[15:0];
endmodule
