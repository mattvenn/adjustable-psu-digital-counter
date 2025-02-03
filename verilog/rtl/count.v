`default_nettype none
module count_macro (
    input wire clk,                 // expect a 10M clock
    input wire n_reset,
    output wire [3:0] count        // 8 bit out to the R2R DAC
    );

    reg rst;
    assign count = counter;
    reg [3:0] counter;

    initial begin
        $dumpfile ("count.vcd");
        $dumpvars (0, count);
    end

    // reset handling
    always @(posedge clk or posedge n_reset) begin
        if(n_reset)
            rst <= 1'b0;
        else 
            rst <= 1'b1;
    end

    // counter
    always @(posedge clk) begin
        if(rst) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

endmodule
