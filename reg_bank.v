module reg_bank (  
      input clk,   
	input [64:0] read_address1,
	input [64:0] read_address2,
	input [64:0] write_address,
      input [64:0] write_data,  
      input write_en,  
      input read_en,  
      output [64:0] read_data1,
	output [64:0] read_data2
 );  
      integer i;  
      reg [64:0] ram [255:0];  
      wire [7 : 0] ram_address1 = read_address1[8 : 1];  
	wire [7 : 0] ram_address2 = read_address2[8 : 1];
	wire [7 : 0] ram_write_address = write_address[8 :1];
  
      initial begin  
           for(i=0;i<256;i=i+1)  
                ram[i] <= 16'd0;  
      end  
      always @(posedge clk) begin  
           if (write_en)  
                ram[ram_write_address] <= write_data;  
      end  
      assign read_data1 = (read_en==1'b1) ? ram[ram_address1]: 16'd0;
	assign read_data2 = (read_en==1'b1) ? ram[ram_address2]: 16'd0;   
 endmodule;   