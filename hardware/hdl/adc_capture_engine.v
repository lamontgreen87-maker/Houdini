// Gatling V1: 16-Channel ADC Capture Engine
// Designed for Arty Z7-20 (Zynq-7000)
// Purpose: Synchronize photonic pulses from the ADS52J90 to the AXI Bus

module adc_capture_engine #(
    parameter DATA_WIDTH = 12,    // ADC Resolution
    parameter NUM_CHANNELS = 16   // 4x4 Grid
)(
    input  wire                   clk,          // High-speed ADC clock (e.g., 100MHz)
    input  wire                   reset_n,
    
    // Physical Interface to ADC (Simplified LVDS to Parallel)
    input  wire [NUM_CHANNELS-1:0] adc_data_in,  // Serial data lines
    input  wire                   adc_frame_clk, // Sync signal from ADC
    
    // Control Signals from Zynq ARM
    input  wire                   trigger_capture,
    
    // Output to AXI/DMA for Python analysis
    output reg [DATA_WIDTH-1:0]   channel_buffer [0:NUM_CHANNELS-1],
    output reg                    data_valid
);

    // State Machine for Pulse Capture
    localparam IDLE    = 2'b00;
    localparam CAPTURE = 2'b01;
    localparam DONE    = 2'b10;

    reg [1:0] state;
    integer i;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= IDLE;
            data_valid <= 0;
        end else begin
            case (state)
                IDLE: begin
                    data_valid <= 0;
                    if (trigger_capture) begin
                        state <= CAPTURE;
                    end
                end

                CAPTURE: begin
                    // In a real system, we would use an ISERDES primitive here
                    // For guidance, we are mapping the raw ADC bits to our buffer
                    for (i = 0; i < NUM_CHANNELS; i = i + 1) begin
                        channel_buffer[i] <= adc_data_in[i]; // Simplified mapping
                    end
                    state <= DONE;
                end

                DONE: begin
                    data_valid <= 1;
                    if (!trigger_capture) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end

endmodule
