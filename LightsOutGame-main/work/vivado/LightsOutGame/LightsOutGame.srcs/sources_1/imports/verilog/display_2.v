/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module display_2 (
    input clk,
    input rst,
    input [15:0] state,
    output reg [3:0] out
  );
  
  
  
  localparam LED_OFF = 1'h0;
  
  localparam LED_0 = 1'h1;
  
  localparam COLOR_RED = 24'h008010;
  
  localparam COLOR_BLUE = 24'h0000ff;
  
  reg [15:0] M_board_d, M_board_q = 1'h0;
  
  reg [13:0] M_counter_d, M_counter_q = 1'h0;
  
  reg [10:0] foo;
  
  reg [0:0] led_state;
  
  reg [23:0] grb;
  
  integer r;
  integer c;
  
  always @* begin
    M_counter_d = M_counter_q;
    M_board_d = M_board_q;
    
    out = 4'h0;
    for (r = 1'h0; r < 3'h4; r = r + 1) begin
      for (c = 1'h0; c < 3'h4; c = c + 1) begin
        M_board_d[(r)*1+(c)*1+0-:1] = {state[(r * c)*1+0-:1], state[(r * c)*1+0-:1]};
      end
    end
    for (r = 1'h0; r < 3'h4; r = r + 1) begin
      if (M_counter_q < 13'h0600) begin
        c = M_counter_q / 10'h180;
        led_state = M_board_q[(r)*1+(c)*1+0-:1];
        
        case (led_state)
          1'h0: begin
            grb = 24'h0000ff;
          end
          1'h1: begin
            grb = 24'h008010;
          end
          default: begin
            grb = 24'h0000ff;
          end
        endcase
        foo = M_counter_q - ((M_counter_q / 10'h180) * 10'h180);
        if (grb[(5'h17 - (foo >> 3'h6))*1+0-:1] == 1'h0) begin
          if (foo[0+5-:6] < 3'h5) begin
            out[(r)*1+0-:1] = 1'h1;
          end
        end else begin
          if (foo[0+5-:6] < 4'ha) begin
            out[(r)*1+0-:1] = 1'h1;
          end
        end
      end
      M_counter_d = M_counter_q + 2'h3;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_board_q <= 1'h0;
    end else begin
      M_board_q <= M_board_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule
