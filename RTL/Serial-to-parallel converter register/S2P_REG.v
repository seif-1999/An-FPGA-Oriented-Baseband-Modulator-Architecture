module S2P_REG #(
    parameter portWidth     = 16,
    parameter counterWidth  = 4,
    parameter registerDepth = 8
) (
    // Inputs
    input   wire [portWidth-1:0]  serialInR,       // Serial input as 16 prallel bits at a time (each serial input consists of 16 prallel bit)
    input   wire [portWidth-1:0]  serialInI,       // Serial input as 16 prallel bits at a time (each serial input consists of 16 prallel bit)
    input   wire                  clk,
    input   wire                  rst,
    input   wire                  start,          // A control signal to start or stop conversion (1 = start, 0 = stop)

    // Outputs
    output  reg                   done,           // A flag that shows conversion completion 
    // Real outputs
    output  reg  [portWidth-1:0]  out0R,           // Prallel outputs (of 16-bits each)
    output  reg  [portWidth-1:0]  out1R,
    output  reg  [portWidth-1:0]  out2R,
    output  reg  [portWidth-1:0]  out3R,
    output  reg  [portWidth-1:0]  out4R,
    output  reg  [portWidth-1:0]  out5R,
    output  reg  [portWidth-1:0]  out6R,
    output  reg  [portWidth-1:0]  out7R,
    // Imaginary outputs
    output  reg  [portWidth-1:0]  out0I,           // Prallel outputs (of 16-bits each)
    output  reg  [portWidth-1:0]  out1I,
    output  reg  [portWidth-1:0]  out2I,
    output  reg  [portWidth-1:0]  out3I,
    output  reg  [portWidth-1:0]  out4I,
    output  reg  [portWidth-1:0]  out5I,
    output  reg  [portWidth-1:0]  out6I,
    output  reg  [portWidth-1:0]  out7I
);


reg [portWidth-1:0]  dataR [0:registerDepth-1];  // 2D register to shift and buffer serial inputs 
reg [portWidth-1:0]  dataI [0:registerDepth-1];  // 2D register to shift and buffer serial inputs
reg  [counterWidth:0]  count;                    // A counter used to size the converted inputs
wire convDone;                                   // Internal conversion done signal
reg  ready;                                      // Internal conversion done signal
// Internal conversion done signals are used to delay the the done flag by 2 clock cycles
integer     i,j;                                 // index for a For loop


// Counter handeling
always @(posedge clk or negedge rst) 
    begin
        if(!rst)
            begin
                count <= 'b0;
            end
        else if(start && !convDone)
            begin
                count <= count + 'b1;
            end
        else if(convDone)
            begin
                count <= 'b0;
            end
        else
            begin
                count <= count;
            end
    end

// Delaying the "done" signal by 2 cycles
always @(posedge clk or negedge rst) 
    begin
        if(!rst)
            begin
                ready <= 0;
                done  <= 0;
            end
        else
            begin
        ready <= convDone;
        done <= ready;
            end
    end

assign convDone = (count == registerDepth) ? 1'b1 : 1'b0;




// Shifting and buffering serial inputs

// Real
always @(posedge clk or negedge rst) 
    begin
        if(!rst)
            begin
                for(i = 0; i < registerDepth; i = i+1)
                    begin
                        dataR[i] <= 'b0;
                    end
            end
        else if(start && !convDone)
            begin
                dataR[count] <= serialInR;
            end
        
    end


// Imaginary
always @(posedge clk or negedge rst) 
    begin
        if(!rst)
            begin
                for(j = 0; j < registerDepth; j = j+1)
                    begin
                        dataI[j] <= 'b0;
                    end
            end
        else if(start && !convDone)
            begin
                dataI[count] <= serialInI;
            end
        
    end


// Move buffered inputs to the output register after conversion is done

// Real
always @(posedge clk or negedge rst) 
    begin
        if(!rst)
            begin
                out0R  <= 'b0;
                out1R  <= 'b0;
                out2R  <= 'b0;
                out3R  <= 'b0;
                out4R  <= 'b0;
                out5R  <= 'b0;
                out6R  <= 'b0;
                out7R  <= 'b0;
            end
        else if(ready)
            begin
                out0R  <= dataR[0];
                out1R  <= dataR[1];
                out2R  <= dataR[2];
                out3R  <= dataR[3];
                out4R  <= dataR[4];
                out5R  <= dataR[5];
                out6R  <= dataR[6];
                out7R  <= dataR[7];
            end
        else 
            begin
                out0R  <= out0R;
                out1R  <= out1R;
                out2R  <= out2R;
                out3R  <= out3R;
                out4R  <= out4R;
                out5R  <= out5R;
                out6R  <= out6R;
                out7R  <= out7R;
            end
    end


// Imaginary
always @(posedge clk or negedge rst) 
    begin
        if(!rst)
            begin
                out0I  <= 'b0;
                out1I  <= 'b0;
                out2I  <= 'b0;
                out3I  <= 'b0;
                out4I  <= 'b0;
                out5I  <= 'b0;
                out6I  <= 'b0;
                out7I  <= 'b0;
            end
        else if(ready)
            begin
                out0I  <= dataI[0];
                out1I  <= dataI[1];
                out2I  <= dataI[2];
                out3I  <= dataI[3];
                out4I  <= dataI[4];
                out5I  <= dataI[5];
                out6I  <= dataI[6];
                out7I  <= dataI[7];
            end
        else 
            begin
                out0I  <= out0I;
                out1I  <= out1I;
                out2I  <= out2I;
                out3I  <= out3I;
                out4I  <= out4I;
                out5I  <= out5I;
                out6I  <= out6I;
                out7I  <= out7I;
            end
    end




endmodule