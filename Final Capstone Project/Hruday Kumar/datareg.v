module Data_Reg #(parameter DR_Length = 5) (input TDI ,tdr_select, TCK , Shift_DR , Capture_DR , Update_DR , output  TDO , output [DR_Length-1:0] DR_OUT);

reg [DR_Length-1:0] Shift_reg,Update_DR_reg;

always @(posedge TCK)
    begin
       if(tdr_select)
       begin
         if(Capture_DR)
            begin
                Shift_reg <= {DR_Length{1'b1}};
            end
        else if(Shift_DR)  
            begin
               Shift_reg<={ Shift_reg[DR_Length-2:0] ,TDI}; 
            end  
        else if(Update_DR)
            begin
                Update_DR_reg <= Shift_reg;
            end        
        end
    end
 assign TDO = Shift_reg[4];
 assign DR_OUT = Update_DR_reg;
endmodule
