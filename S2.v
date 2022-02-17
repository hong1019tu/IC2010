module S2(clk,
	  rst,
	  S2_done,
	  RB2_RW,
	  RB2_A,
	  RB2_D,
	  RB2_Q,
	  sen,
	  sd);

input clk, rst;
output reg S2_done, RB2_RW;
output reg [2:0] RB2_A;
output reg [17:0] RB2_D;
input [17:0] RB2_Q;
input sen, sd;
reg [9:0] load,count;
reg [20:0] pack;

always @(posedge clk or posedge rst) begin
	if(rst)begin
	  RB2_RW <= 1'd1;
	  RB2_A <= 3'd0;
	  RB2_D <= 18'd0;
	  S2_done <= 1'd0;
	  load <= 10'd0;
	  count <= 10'd0;
	  //S2_done <= 1'd1;
	end
	else if(!sen)begin
		load <= load + 10'd1;
	  	if(load == 10'd0)begin
			//RB2_A[2] <= sd;
			RB2_RW <= 1'd1;
			pack[20] <= sd;
	  	end
		else if (load == 10'd1 ) begin
			//RB2_A[1] <= sd;
			pack[19] <= sd;
		end
		else if (load == 10'd2) begin
			//RB2_A[0] <= sd;
			pack[18] <= sd;
		end
		else if (load == 10'd3) begin
			pack[17] <= sd;
		end
		else if (load == 10'd4) begin
			pack[16] <= sd;
		end
		else if (load == 10'd5) begin
			pack[15] <= sd;
		end
		else if (load == 10'd6) begin
			pack[14] <= sd;
		end
		else if (load == 10'd7) begin
			pack[13] <= sd;
		end
		else if (load == 10'd8) begin
			pack[12] <= sd;
		end
		else if (load == 10'd9) begin
			pack[11] <= sd;
		end
		else if (load == 10'd10) begin
			pack[10] <= sd;
		end
		else if (load == 10'd11) begin
			pack[9] <= sd;
		end
		else if (load == 10'd12) begin
			pack[8] <= sd;
		end
		else if (load == 10'd13) begin
			pack[7] <= sd;
		end
		else if (load == 10'd14) begin
			pack[6] <= sd;
		end
		else if (load == 10'd15) begin
			pack[5] <= sd;
		end
		else if (load == 10'd16) begin
			pack[4] <= sd;
		end
		else if (load == 10'd17) begin
			pack[3] <= sd;
		end
		else if (load == 10'd18) begin
			pack[2] <= sd;
		end
		else if (load == 10'd19) begin
			pack[1] <= sd;
		end
		else if (load == 10'd20) begin
			pack[0] <= sd;
			RB2_RW <= 1'd0;
		end
		else if (load == 10'd21) begin
			// RB2_A <= pack[20:18];
			// RB2_D <= pack[17:0];
			// count <= count + 10'd1;
			// load <= 10'd0;
			// RB2_RW <= 1'd1;
			// pack <= 21'dz;
			// if (count == 10'd8) begin
			// 	S2_done <= 1'd1;
			// end
		end
	end
	// else if(sen)begin
	//   RB2_A <= pack[20:18];
	// 	RB2_D <= pack[17:0];
	// 	count <= count + 10'd1;
	// 	load <= 10'd0;
	// 	RB2_RW <= 1'd1;
	// 	pack <= 21'dz;
	// 	if (count == 10'd8) begin
	// 		S2_done <= 1'd1;
	// 	end
	// end
end
always @(*) begin
	if(sen==1&&load!=0)begin
	  RB2_A <= pack[20:18];
			RB2_D <= pack[17:0];
			count <= count + 10'd1;
			load <= 10'd0;
			pack <= 21'dz;
			if (count == 10'd8) begin
				S2_done <= 1'd1;
			end
	end
end
endmodule
