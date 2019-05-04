// Code your design here
module router(din,
             frame_n,
             valid_n,
             reset_n,
             clock,
             dout,
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
  reg frame_n_d[15:0];
  integer i;
  reg port_state[15:0]
  always @(posedge clk ) begin
    frame_n_d <= frame_n;
    for( i=0; i< 16; i++) begin
      if( frame_n_d[i]  & !frame_n[i]) begin
        port_state[i]= 2'b1;
      end
      if( !frame_n_d[i]  & frame_n[i]) begin
        port_state[i]= 2'b3;
      end
      
      case (port_state[i])
        2'b1 : begin 
            header[i][n]= din[i];
            n=n+1;
            if(n==3)
              port_state[i]= 1'b2;
          valido_n[header[i]] = 1;
          frame0_n[header[i]] = 0;
            end
        2'b2 : begin
          if (valid_n==0) begin
            valid_o_n[header[i]]=0;
            frameo_n[header[i]]=0;
            dout[header[i]]=din[i];
          end
          else 
            valido_n[header[i]]=1;
          frameo_n[header[i]] = 0;
        end
        2'b3: begin
         if (valid_n==0) begin
            valid_o_n[header[i]]=0;
           frameo_n[header[i]]=1;
            dout[header[i]]=din[i];
          end
          else 
            valido_n[header[i]]=1;
          frameo_n[header[i]] = 0;
        end //else
      end //case 
      
    end // for each
  end // always
  
endmodule
