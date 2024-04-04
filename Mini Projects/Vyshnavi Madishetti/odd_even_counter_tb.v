module odd_even_counter_tb();
reg CLK,RST,OE;
  wire [2:0] OUT;

  parameter CLOCK = 5;

  always #(CLOCK/2) CLK<=~CLK;

odd_even_counter dut(CLK, OE, OUT, RST);

task initialize;
  begin
    RST<=0;
    CLK<=0;
    OE<=0;
  end
endtask

task reset;
	begin
      @(posedge CLK)
		RST=1;
      @(posedge CLK)
		RST=0;
	end
endtask
task odd_even(input i);
	begin
      @(posedge CLK)
		OE=i;
	end
endtask

initial 
begin
	initialize;
	reset;
	//odd transition
	odd_even(1);   //s0 to s1;
	odd_even(1);   //s1 to s3;
	odd_even(1);    // s3 to s5;
        odd_even(1);    //s5 to s7
	odd_even(1);    //s7 to s0

	// even transition
       	repeat(5)
		begin
			odd_even(0);	
		end

	//repeated transition
	odd_even(1); 
	odd_even(0); 
	odd_even(1); 
	odd_even(0); 
	odd_even(1); 
	odd_even(0); 
	odd_even(1); 
	odd_even(0); 
	odd_even(1);
        odd_even(0);
	#100 $finish;
end
endmodule
