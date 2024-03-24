module TOP_module_tb();
reg TCK,TMS,TDI;
  TOP_module uut(.TCK(TCK),.TMS(TMS),.TDI(TDI), .TDO(TDO));
  
task clk_gen;
  begin
	TCK=1;
	forever #10 TCK=~TCK;
end
endtask
  
  task initialize;
    begin
        TCK<=1;
        TMS<=0;
        TDI<=0;
    end
endtask


  task Shift_IR(input i);
    begin
       TDI<=i;    
    end
endtask


  task Shift_DR(input i);
    begin
       TDI<=i;    
    end
endtask
  
initial begin
  initialize;
  @(posedge TCK) TMS=0;   
	#20; //run_ test
	@(posedge TCK) TMS=1;
	#20;// select DR scan
    @(posedge TCK) TMS=1;
    #20; // select IR scan
  @(posedge TCK) TMS=0; 
    #20; //capture_IR
  @(posedge TCK) TMS=0;//shift IR
  
  //shifting IR with 00000
  
  @(posedge TCK) shift_IR(0);
  @(posedge TCK) shift_IR(0);
  @(posedge TCK) shift_IR(0);
  @(posedge TCK) shift_IR(0);
  @(posedge TCK) shift_IR(0);
    #20;
    @(posedge TCK) TMS=1;
    #20;
    @(posedge TCK) TMS=1;
  //update_IR;
    #20;
    @(posedge TCK) TMS=1;
    #20;
  @(posedge TCK) TMS=1;
  #20;
  @(posedge TCK) TMS=0;
  #20;
  @(posedge TCK) TMS=0;
  @(posedge TCK) shift_IR(1);
  #20;
  @(posedge TCK) TMS=1;
  #20;
  @(posedge TCK) TMS=1;
  #20;
  @(posedge TCK) TMS=1;
  #20;
    @(posedge TCK) TMS=0;
    #20;
    @(posedge TCK) TMS=0;
  // shifting DR
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(1);
  @(posedge TCK) shift_DR(0);
  
    #20; 
    @(posedge TCK) TMS=1;
    #20;
    @(posedge TCK) TMS=1;
  //update_DR
    #20;
    @(posedge TCK) TMS=1;
    #20;
    @(posedge TCK) TMS=1;
    #20;
    @(posedge TCK) TMS=1;
    #20 $finish;
end
  
initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
end
endmodule
