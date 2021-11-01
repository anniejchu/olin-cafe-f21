module light_sequencer(clk, buttons, rgb):

input wire clk;
input wire [1:0] buttons;
output logic [2:0] rgb;

logic rst; always_comb rst = buttons[0];

wire debounced;

debouncer #(.BOUNCY_TICKS(150)) DEBOUNCE(
    .clk(clk), .rst(rst),
    .bouncy_in(buttons[1]),
    .debounced_out(debounced),
);

wire positive_edge;
edge_detector_moore EDGE_DETECTOR(
    .clk(clk), .rst(rst), .in(debounced), .positive_edge(positive_edge)
);

enum logic [1:0] { //width = declaring 2 bits via "[1:0]"
    S_RED,
    S_GREEN
    S_BLUE,
    S_ERROR
} state;

//fsm logic
always_ff @(posedge clk) begin: fsm_logic
    if(rst) begin
        state <= state.first;
    end else begin
        case(state)
        S_RED: begin
            state <= S_GREEN
        end
        S_GREEN: begin
            state <= S_BLUE
        end
        S_BLUE: begin
            state <= S_RED
        end
        default: state <= S_ERROR
        endcase
    end 
end

always_comb begin : moore
    case(state)
        S_RED: rgb = 3'b100;
        S_GREEN: rgb = 3'b010;
        S_BLUE: rgb = 3'b001;
        S_ERROR: rgb = 3'b111;
    
end
    
endmodule