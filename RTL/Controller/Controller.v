module Controller #(
    parameter test = 10
) (
    // Inputs
    input   wire         S2P_done,
    input   wire         S2P_REG_done,
    input   wire         CPI_done,
    input   wire         clk,
    input   wire         rst,
    input   wire         go,

    // Outputs
    output  reg          S2P_start,
    output  reg          S2P_REG_start,
    output  reg          CPI_start,
    output  reg          CPIdataValid,
    output  reg          busy   
);
    
    reg [3:0]   stateL1;
    reg [3:0]   stateL2;

    // Idle state
    parameter idleState = 0;
    // Serial to prallel conversion level 1 state
    parameter S2PStateL1 = 1;

        // Serial to prallel conversion level 2 state
        parameter S2PStateL2   = 0;
        //QAM state
        parameter QAMState     = 1;
        // Serial to paralle register conversion state
        parameter S2P_REGState = 2;

    // IFFT processing state
    parameter IFFTState  = 2;
    // Cyclic prefix insertion & Serialization state
    parameter CPIState   = 3;

    always @(posedge clk or negedge rst) 
        begin
            if(!rst)
                begin
                    stateL1        <= idleState; // set state to idle
                    stateL2        <= S2PStateL2;
                    S2P_start      <= 0;
                    S2P_REG_start  <= 0;
                    CPI_start      <= 0;
                    CPIdataValid   <= 0;
                    busy           <= 0;
                end
            else
                begin

                    CPIdataValid <= 0;

                    case (stateL1)
                       // idle
                       idleState : begin
                           busy      <= 0;
                           CPI_start <= 0;
                            if(go)
                                begin
                                    stateL1 <= S2PStateL1; // set state to serial conversion
                                    stateL2 <= S2PStateL2; // reset state level 2 to 0
                                end
                       end


                       // S2P conversion
                       S2PStateL1 : begin

                           busy <= 1;                       // once out of idle state, busy flag is held high
                           case (stateL2)

                               // S2P
                               S2PStateL2 : begin           // when S2P is done, move to QAM
                                    if(S2P_done)
                                     begin
                                         S2P_start <= 0;
                                         stateL2   <= QAMState;
                                     end
                                    else if(S2P_REG_done)   // when S2P_REG is doen move to IFFT
                                        begin
                                            stateL1 <= IFFTState;
                                        end
                                    else
                                        begin
                                            S2P_start <= 1;
                                        end
                               end

                               // QAM
                               QAMState : begin             // when QAM is done, move to S2P_REG
                                    stateL2       <= S2P_REGState;
                                    S2P_REG_start <= 1;
                               end

                               // S2P REG
                               S2P_REGState : begin          // when a QAM output is registered in S2P_REG move to S2P and repeat till S2P_REG is done
                                   
                                    S2P_REG_start <= 0;
                                    stateL2       <= S2PStateL2;
                                        
                               end
                               default: stateL1 <= idleState;
                           endcase
                           
                       end
                       // IFFT processing
                       IFFTState : begin                    // when IFFT is done, move to CPI
                            stateL1      <= CPIState;
                            CPI_start    <= 1;
                            CPIdataValid <= 1;
                       end
                       // CPI & Serializing
                       CPIState : begin                     // when CPI is done, move to idle
                            if(CPI_done)
                                begin
                                    stateL1 <= idleState;
                                end
                            else 
                                begin
                                    stateL1 <= CPIState;
                                end
                       end

                        default: stateL1 <= idleState; // set state to idle
                    endcase
                end
        end
endmodule