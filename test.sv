module test();
  reg clock;
  reg reset_n;
  wire [15:0] din;
  wire [15:0] frame_n;
  wire [15:0] valid_n;
  wire [15:0] dout;
  wire [15:0] frameo_n;
  wire [15:0] valido_n;
  
   router router_inst(
   .din(din),
   .frame_n(frame_n),
   .valid_n(valid_n),
   .clock(clock),
   .reset_n(reset_n),
   .dout(dout),
   .frameo_n(frameo_n),
   .valido_n(valido_n)
   );
  forever  begin
  clock <= #5 clock ;
  end
  initial begin
  reset = 0;
  #20 din[5] = 0 ; valid_n = 1 ; frame_n = 1;
  #10 din[5] = 0 ; valid_n = 1 ; frame_n = 1;
  #10 din[5] = 1 ; valid_n = 1 ; frame_n = 0;
  #10 din[5] = 1 ; valid_n = 1 ; frame_n = 0;
  #10 din[5] = 0 ; valid_n = 1 ; frame_n = 0;
  #10 din[5] = 1 ; valid_n = 1 ; frame_n = 0;
  #10 din[5] = 0 ; valid_n = 0 ; frame_n = 0;
  #10 din[5] = 1 ; valid_n = 0 ; frame_n = 0;
  #10 din[5] = 1 ; valid_n = 0 ; frame_n = 0;
  #10 din[5] = 0 ; valid_n = 0 ; frame_n = 0;
  #10 din[5] = 1 ; valid_n = 1 ; frame_n = 0;
  #10 din[5] = 1 ; valid_n = 0 ; frame_n = 0;
  #10 din[5] = 0 ; valid_n = 0 ; frame_n = 0;
  #10 din[5] = 1 ; valid_n = 0 ; frame_n = 1;
  #10 din[5] = 1 ; valid_n = 1 ; frame_n = 1;
   #100 $finish;
initial begin
          $monitor($time, " clock=%1b,frameo_n=%16b,vaildo_n=%16b,dout=%4b",clock,frameo_n,valido_n,dout);
		 end
endmodule
