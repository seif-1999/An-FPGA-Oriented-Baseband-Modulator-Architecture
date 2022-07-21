module QAM_16 #(
   parameter inPortWidth  = 4,
   parameter outPortWidth = 16
) (
    // Inputs
    input  wire [inPortWidth-1:0]    in,
    input  wire                      clk,
    input  wire                      rst,

    // Outputs
    output reg [outPortWidth-1:0]    outR,
    output reg [outPortWidth-1:0]    outI 
);

    // Real outputs
    always @(posedge clk or negedge rst) 
        begin
          if(!rst)
              begin
                outR <= 16'b00000_00000000000;     //0
                outI <= 16'b00000_00000000000;     //0
              end
          else
              begin
                  case(in)
                  // For input (0) 0000, output is -3 + j3
                    4'b0000 : begin
                              outR <= 16'b11101_00000000000;     //-3.0
                              outI <= 16'b00011_00000000000;     //3.0
                              end

                  // For input (1) 0001, output is -3 + j1
                    4'b0001 : begin
                              outR <= 16'b11101_00000000000;     //-3.0
                              outI <= 16'b00001_00000000000;     //1.0
                              end

                  // For input (2) 0010, output is -3 - j3
                    4'b0010 : begin
                              outR <= 16'b11101_00000000000;     //-3.0
                              outI <= 16'b11101_00000000000;     //-3.0
                              end

                  // For input (3) 0011, output is -3 - j1
                    4'b0011 : begin
                              outR <= 16'b11101_00000000000;     //-3.0
                              outI <= 16'b11111_00000000000;     //-1.0
                              end

                  // For input (4) 0100, output is -1 + j3
                    4'b0100 : begin
                              outR <= 16'b11111_00000000000;     //-1.0
                              outI <= 16'b00011_00000000000;     //3.0
                              end

                  // For input (5) 0101, output is -1 + j1
                    4'b0101 : begin
                              outR <= 16'b11111_00000000000;     //-1.0
                              outI <= 16'b00001_00000000000;     //1.0
                              end
                  // For input (6) 0110, output is -1 - j3
                    4'b0110 : begin
                              outR <= 16'b11111_00000000000;     //-1.0
                              outI <= 16'b11101_00000000000;     //-3.0
                              end

                  // For input (7) 0111, output is -1 + j1
                    4'b0111 : begin
                              outR <= 16'b11111_00000000000;     //-1.0
                              outI <= 16'b11111_00000000000;     //-1.0
                              end

                  // For input (8) 1000, output is 3 + j3
                    4'b1000 : begin
                              outR <= 16'b00011_00000000000;     //3.0
                              outI <= 16'b00011_00000000000;     //3.0
                              end

                  // For input (9) 0001, output is 3 + j1
                    4'b1001 : begin
                              outR <= 16'b00011_00000000000;     //3.0
                              outI <= 16'b00001_00000000000;     //1.0
                              end

                  // For input (10) 1010, output is 3 - j3
                    4'b1010 : begin
                              outR <= 16'b00011_00000000000;     //3.0
                              outI <= 16'b11101_00000000000;     //-3.0
                              end

                  // For input (11) 1011, output is -3 - j1
                    4'b1011 : begin
                              outR <= 16'b00011_00000000000;     //3.0
                              outI <= 16'b11111_00000000000;     //-1.0
                              end

                  // For input (12) 1100, output is 1 + j3
                    4'b1100 : begin
                              outR <= 16'b00001_00000000000;     //1.0
                              outI <= 16'b00011_00000000000;     //3.0
                              end

                  // For input (13) 1101, output is 1 + j1
                    4'b1101 : begin
                              outR <= 16'b00001_00000000000;     //1.0
                              outI <= 16'b00001_00000000000;     //1.0
                              end
                  // For input (14) 1110, output is 1 - j3
                    4'b1110 : begin
                              outR <= 16'b00001_00000000000;     //1.0
                              outI <= 16'b11101_00000000000;     //-3.0
                              end

                  // For input (15) 1111, output is 1 - j1
                    4'b1111 : begin
                              outR <= 16'b00001_00000000000;     //1.0
                              outI <= 16'b11111_00000000000;     //-1.0
                              end

                     default : begin
                              outR <= 16'b00000_00000000000;     //0.0
                              outI <= 16'b00000_00000000000;     //0.0
                               end
                  endcase
              end
        end




   
endmodule