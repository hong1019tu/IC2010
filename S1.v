module S1(clk,
	  rst,
	  RB1_RW,
	  RB1_A,
	  RB1_D,
	  RB1_Q,
	  sen,
	  sd);

  input clk, rst;
  output reg RB1_RW;      // control signal for RB1: Read/Write
  output reg [4:0] RB1_A; // control signal for RB1: address
  output reg [7:0] RB1_D; // data path for RB1: input port
  input [7:0] RB1_Q;  // data path for RB1: output port
  output reg sen, sd;
  reg [143:0] temp;
  reg temp_finish;
  reg [2:0] addr;
  reg [9:0] load1,start;
  
always @(negedge clk or posedge rst) begin
	if(rst)begin
	  RB1_RW <= 1'd1;
	  sen <= 1'd1;
	  RB1_A <= 5'd0;
	  RB1_D <= 8'd0;
	  sd <= 1'd0;
	  temp_finish <= 1'd0;
	  addr <= 3'd0;
	  load1 <= 10'd0;
	end
	else if(temp_finish == 1'd0)begin
	  if (RB1_A < 5'd17) begin
		RB1_A <= RB1_A + 5'd1;	  
	  end
	  if (RB1_A == 0) begin
		temp[7:0] <= RB1_Q;	  
	  end
	  else if (RB1_A == 1) begin
		 temp[15:8] <= RB1_Q;
	  end
	  else if (RB1_A == 2) begin
		 temp[23:16] <= RB1_Q;
	  end
	  else if (RB1_A == 3) begin
		 temp[31:24] <= RB1_Q;
	  end
	  else if (RB1_A == 4) begin
		 temp[39:32] <= RB1_Q;
	  end
	  else if (RB1_A == 5) begin
		 temp[47:40] <= RB1_Q;
	  end
	  else if (RB1_A == 6) begin
		 temp[55:48] <= RB1_Q;
	  end
	  else if (RB1_A == 7) begin
		 temp[63:56] <= RB1_Q;
	  end
	  else if (RB1_A == 8) begin
		 temp[71:64] <= RB1_Q;
	  end
	  else if (RB1_A == 9) begin
		 temp[79:72] <= RB1_Q;
	  end
	  else if (RB1_A == 10) begin
		 temp[87:80] <= RB1_Q;
	  end
	  else if (RB1_A == 11) begin
		 temp[95:88] <= RB1_Q;
	  end
	  else if (RB1_A == 12) begin
		 temp[103:96] <= RB1_Q;
	  end
	  else if (RB1_A == 13) begin
		 temp[111:104] <= RB1_Q;
	  end
	  else if (RB1_A == 14) begin
		 temp[119:112] <= RB1_Q;
	  end
	  else if (RB1_A == 15) begin
		 temp[127:120] <= RB1_Q;
	  end
	  else if (RB1_A == 16) begin
		 temp[135:128] <= RB1_Q;
	  end
	  else if(RB1_A == 17)begin
		 temp[143:136] <= RB1_Q;
		 temp_finish <= 1'd1;
		 //sen <= 1'd0;
	  end
	//   else if (RB1_A == 18) begin
	// 	  temp_finish <= 1'd1;
	//   end
	end
	else begin
	  load1 <= load1 + 10'd1;
	  if (load1 == 10'd0) begin
		  sen <= 1'd0;
		  sd <= addr[2];
		  start <= 7 - addr;
	  end
	  else if (load1 == 10'd1) begin
		  sd <= addr[1];
	  end
	  else if (load1 == 10'd2) begin
		  sd <= addr[0];
	  end
	  else if (load1 == 10'd3) begin
		  sd <= temp[start+136];
	  end
	  else if (load1 == 10'd4) begin
		  sd <= temp[start+128];
	  end
	  else if (load1 == 10'd5) begin
		  sd <= temp[start+120];
	  end
	  else if (load1 == 10'd6) begin
		  sd <= temp[start+112];
	  end
	  else if (load1 == 10'd7) begin
		  sd <= temp[start+104];
	  end
	  else if (load1 == 10'd8) begin
		  sd <= temp[start+96];
	  end
	  else if (load1 == 10'd9) begin
		  sd <= temp[start+88];
	  end
	  else if (load1 == 10'd10) begin
		  sd <= temp[start+80];
	  end
	  else if (load1 == 10'd11) begin
		  sd <= temp[start+72];
	  end
	  else if (load1 == 10'd12) begin
		  sd <= temp[start+64];
	  end
	  else if (load1 == 10'd13) begin
		  sd <= temp[start+56];
	  end
	  else if (load1 == 10'd14) begin
		  sd <= temp[start+48];
	  end
	  else if (load1 == 10'd15) begin
		  sd <= temp[start+40];
	  end
	  else if (load1 == 10'd16) begin
		  sd <= temp[start+32];
	  end
	  else if (load1 == 10'd17) begin
		  sd <= temp[start+24];
	  end
	  else if (load1 == 10'd18) begin
		  sd <= temp[start+16];
	  end
	  else if (load1 == 10'd19) begin
		  sd <= temp[start+8];
	  end
	  else if (load1 == 10'd20) begin
		  sd <= temp[start];
	  end
	  else if(load1 == 10'd21)begin
		load1 <= 10'd0;
		sen <= 1'd1;
		addr <= addr + 3'd1;
	  end
	end
end
endmodule
