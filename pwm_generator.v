module pwm_generator(
	input clk,
	input [7:0] duty,
	output reg pwm_out,
	output [7:0] duty_led,
	output [6:0] hex4,hex5
);

	reg [7:0] counter;

	always@(posedge clk)begin
		counter <= counter + 1;
		if(counter < duty)
			pwm_out = 1;
		else
			pwm_out = 0;
	end
	
	assign duty_led = duty;
	
	reg [6:0] percentage;
	wire [3:0] ones, tens;
	
	always@(*)begin
		percentage = (duty * 100)/256;
	end
	
	assign tens = percentage / 10;
	assign ones = percentage % 10;
	
	seven_segment ones_place(.digit(ones),.hex(hex4));
	seven_segment tens_place(.digit(tens),.hex(hex5));

endmodule