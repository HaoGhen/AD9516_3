module AD9516(clk,clk_spi,spi_clk,spi_mosi,spi_miso,spi_le,led);

	//operate parameter
	localparam  SM_VALUE0	=	24'h000099,
                SM_VALUE1    =    24'h000100,
                SM_VALUE2    =    24'h000210,
                SM_VALUE3    =    24'h000343,
                SM_VALUE4    =    24'h000401,
                SM_VALUE5    =    24'h00107C,//4.8mA
                SM_VALUE6    =    24'h001101,
                SM_VALUE7    =    24'h001200,
                SM_VALUE8    =    24'h001308,
                SM_VALUE9    =    24'h00140C,
                SM_VALUE10    =    24'h001500,
                SM_VALUE11    =    24'h001605,
                SM_VALUE12    =    24'h001700,
                SM_VALUE13    =    24'h001806,
                SM_VALUE14    =    24'h001900,
                SM_VALUE15    =    24'h001A00,
                SM_VALUE16    =    24'h001B00,
                SM_VALUE17    =    24'h001C44,
                SM_VALUE18    =    24'h001D00,
                SM_VALUE19    =    24'h001E00,
                SM_VALUE20    =    24'h001F0E,
                SM_VALUE21    =    24'h00A000,
                SM_VALUE22    =    24'h00A100,
                SM_VALUE23    =    24'h00A200,
                SM_VALUE24    =    24'h00A300,
                SM_VALUE25    =    24'h00A400,
                SM_VALUE26    =    24'h00A500,
                SM_VALUE27    =    24'h00A600,
                SM_VALUE28    =    24'h00A700,
                SM_VALUE29    =    24'h00A800,
                SM_VALUE30    =    24'h00A900,
                SM_VALUE31    =    24'h00AA00,
                SM_VALUE32    =    24'h00AB00,
                SM_VALUE33    =    24'h00F008,
                SM_VALUE34    =    24'h00F108,
                SM_VALUE35    =    24'h00F208,
                SM_VALUE36    =    24'h00F308,
                SM_VALUE37    =    24'h00F408,
                SM_VALUE38    =    24'h00F508,
                SM_VALUE39    =    24'h014042,
                SM_VALUE40    =    24'h014142,
                SM_VALUE41    =    24'h014242,
                SM_VALUE42    =    24'h014342,
                SM_VALUE43    =    24'h019000,
                SM_VALUE44    =    24'h019100,
                SM_VALUE45    =    24'h019200,
                SM_VALUE46    =    24'h019300,
                SM_VALUE47    =    24'h019400,
                SM_VALUE48    =    24'h019500,
                SM_VALUE49    =    24'h019600,
                SM_VALUE50    =    24'h019700,
                SM_VALUE51    =    24'h019800,
                SM_VALUE52    =    24'h019944,
                SM_VALUE53    =    24'h019A00,
                SM_VALUE54    =    24'h019B44,
                SM_VALUE55    =    24'h019C00,
                SM_VALUE56    =    24'h019D00,
                SM_VALUE57    =    24'h019E22,
                SM_VALUE58    =    24'h019F00,
                SM_VALUE59    =    24'h01A011,
                SM_VALUE60    =    24'h01A100,
                SM_VALUE61    =    24'h01A200,
                SM_VALUE62    =    24'h01A300,
                SM_VALUE63    =    24'h01E002,
                SM_VALUE64    =    24'h01E102,
                SM_VALUE65    =    24'h023000,
                SM_VALUE66    =    24'h023100,
                SM_VALUE67    =    24'h023201,
                SM_VALUE68    =    24'h001807,
                SM_VALUE69    =    24'h023201;

      
    localparam  SM_VALUE70    =    24'h801F00;//read
					
    localparam  SM_IDLE 	 =	  8'd00,
                SM_STATE0    =    8'd01,
                SM_STATE1    =    8'd02,
                SM_STATE2    =    8'd03,
                SM_STATE3    =    8'd04,
                SM_STATE4    =    8'd05,
                SM_STATE5    =    8'd06,
                SM_STATE6    =    8'd07,
                SM_STATE7    =    8'd08,
                SM_STATE8    =    8'd09,
                SM_STATE9    =    8'd10,
                SM_STATE10    =    8'd11,
                SM_STATE11    =    8'd12,
                SM_STATE12    =    8'd13,
                SM_STATE13    =    8'd14,
                SM_STATE14    =    8'd15,
                SM_STATE15    =    8'd16,
                SM_STATE16    =    8'd17,
                SM_STATE17    =    8'd18,
                SM_STATE18    =    8'd19,
                SM_STATE19    =    8'd20,
                SM_STATE20    =    8'd21,
                SM_STATE21    =    8'd22,
                SM_STATE22    =    8'd23,
                SM_STATE23    =    8'd24,
                SM_STATE24    =    8'd25,
                SM_STATE25    =    8'd26,
                SM_STATE26    =    8'd27,
                SM_STATE27    =    8'd28,
                SM_STATE28    =    8'd29,
                SM_STATE29    =    8'd30,
                SM_STATE30    =    8'd31,
                SM_STATE31    =    8'd32,
                SM_STATE32    =    8'd33,
                SM_STATE33    =    8'd34,
                SM_STATE34    =    8'd35,
                SM_STATE35    =    8'd36,
                SM_STATE36    =    8'd37,
                SM_STATE37    =    8'd38,
                SM_STATE38    =    8'd39,
                SM_STATE39    =    8'd40,
                SM_STATE40    =    8'd41,
                SM_STATE41    =    8'd42,
                SM_STATE42    =    8'd43,
                SM_STATE43    =    8'd44,
                SM_STATE44    =    8'd45,
                SM_STATE45    =    8'd46,
                SM_STATE46    =    8'd47,
                SM_STATE47    =    8'd48,
                SM_STATE48    =    8'd49,
                SM_STATE49    =    8'd50,
                SM_STATE50    =    8'd51,
                SM_STATE51    =    8'd52,
                SM_STATE52    =    8'd53,
                SM_STATE53    =    8'd54,
                SM_STATE54    =    8'd55,
                SM_STATE55    =    8'd56,
                SM_STATE56    =    8'd57,
                SM_STATE57    =    8'd58,
                SM_STATE58    =    8'd59,
                SM_STATE59    =    8'd60,
                SM_STATE60    =    8'd61,
                SM_STATE61    =    8'd62,
                SM_STATE62    =    8'd63,
                SM_STATE63    =    8'd64,
                SM_STATE64    =    8'd65,
                SM_STATE65    =    8'd66,
                SM_STATE66    =    8'd67,
                SM_STATE67    =    8'd68,
                SM_STATE68    =    8'd69,
                SM_STATE69    =    8'd70,
                SM_STATE70    =    8'd71,
                SM_STATE71    =    8'd72,
                SM_WAIT       =    8'd73,
                SM_CONFIG     =    8'd74,
                SM_STOP       =    8'd75,
                SM_READ       =    8'd76;

	input  clk,clk_spi;
	input  spi_miso;
	output spi_clk;
	output reg spi_mosi;
	output spi_le;
	output[7:0] led;
	
	reg[23:0] spi_data;
	
    reg[7:0]  SM = 8'h00;
    reg[7:0]  SM_NEXT;
    reg[7:0]  config_count;
    reg       spi_le_wr;
    reg       spi_clken;
    
    reg[7:0] led_r = 8'hff;
                
    assign spi_clk   = spi_clken ? clk_spi : 1'b0;
    assign spi_le    = spi_le_wr;
    
    assign led[7:0]  = led_r[7:0];
	
	    
    always @(posedge spi_clk)
    if(SM == SM_READ)
    begin
      if(config_count > 16 && config_count <= 24)
      begin
        led_r[0] <= spi_miso;
        led_r[7:1] <= led_r[6:0];
       end
     end
     
	always@(posedge clk)
    case(SM)
      SM_CONFIG:
        if(config_count >= 128)
            begin
            config_count<=8'h0;
            SM<=SM_NEXT;
            end
        else if(config_count>=24)
            begin
            spi_clken<=1'b0;
            config_count<=config_count+1'b1;
            spi_le_wr<=1'b1;
            end
        else    
            begin
            spi_clken<=1'b1;
            spi_le_wr<=1'b0;
            config_count<=config_count+1'b1;
            spi_mosi<=spi_data[23];
            spi_data<=spi_data<<1'b1;
            end
        SM_READ:
            if(config_count >= 128)
                begin
                config_count<=8'h0;
                SM<=SM_NEXT;
                end
            else if(config_count>=24)
                begin
                spi_clken<=1'b0;
                config_count<=config_count+1'b1;
                spi_le_wr<=1'b1;
                end
            else
                begin
                spi_clken<=1'b1;
                spi_le_wr<=1'b0;
                config_count<=config_count+1'b1;
                spi_mosi<=spi_data[23];
                spi_data <= spi_data<<1'b1;
                end
        SM_WAIT:
            begin
            if(spi_data >= 300000) //1s
                SM<=SM_NEXT;
            else
                spi_data <= spi_data + 1'b1;
            end
            
        SM_IDLE:
            begin
            SM<=SM_STATE0;
            config_count<=8'h00;
            end
        SM_STATE0:
            begin
            spi_data<=SM_VALUE0;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE1;
            end
        SM_STATE1:
            begin
            spi_data<=SM_VALUE1;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE2;
            end		
        SM_STATE2:
            begin
            spi_data<=SM_VALUE2;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE3;
            end    				
        SM_STATE3:
            begin
            spi_data<=SM_VALUE3;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE4;
            end    	
        SM_STATE4:
            begin
            spi_data<=SM_VALUE4;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE5;
            end    
        SM_STATE5:
            begin
            spi_data<=SM_VALUE5;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE6;
            end    
        SM_STATE6:
            begin
            spi_data<=SM_VALUE6;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE7;
            end    
        SM_STATE7:
            begin
            spi_data<=SM_VALUE7;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE8;
            end    
        SM_STATE8:
            begin
            spi_data<=SM_VALUE8;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE9;
            end    
        SM_STATE9:
            begin
            spi_data<=SM_VALUE9;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE10;
            end    
        SM_STATE10:
            begin
            spi_data<=SM_VALUE10;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE11;
            end    
        SM_STATE11:
            begin
            spi_data<=SM_VALUE11;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE12;
            end    
        SM_STATE12:
            begin
            spi_data<=SM_VALUE12;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE13;
            end    
        SM_STATE13:
            begin
            spi_data<=SM_VALUE13;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE14;
            end
        SM_STATE14:
            begin
            spi_data<=SM_VALUE14;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE15;
            end
        SM_STATE15:
            begin
            spi_data<=SM_VALUE15;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE16;
            end        
        SM_STATE16:
            begin
            spi_data<=SM_VALUE16;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE17;
            end                    
        SM_STATE17:
            begin
            spi_data<=SM_VALUE17;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE18;
            end        
        SM_STATE18:
            begin
            spi_data<=SM_VALUE18;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE19;
            end    
        SM_STATE19:
            begin
            spi_data<=SM_VALUE19;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE20;
            end    
        SM_STATE20:
            begin
            spi_data<=SM_VALUE20;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE21;
            end    
        SM_STATE21:
            begin
            spi_data<=SM_VALUE21;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE22;
            end    
        SM_STATE22:
            begin
            spi_data<=SM_VALUE22;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE23;
            end    
        SM_STATE23:
            begin
            spi_data<=SM_VALUE23;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE24;
            end    
        SM_STATE24:
            begin
            spi_data<=SM_VALUE24;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE25;
            end    
        SM_STATE25:
            begin
            spi_data<=SM_VALUE25;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE26;
            end    
        SM_STATE26:
            begin
            spi_data<=SM_VALUE26;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE27;
            end    
        SM_STATE27:
            begin
            spi_data<=SM_VALUE27;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE28;
            end      
        SM_STATE28:
            begin
            spi_data<=SM_VALUE28;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE29;
            end    
        SM_STATE29:
            begin
            spi_data<=SM_VALUE29;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE30;
            end
        SM_STATE30:
            begin
            spi_data<=SM_VALUE30;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE31;
            end    
        SM_STATE31:
            begin
            spi_data<=SM_VALUE31;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE32;
            end    
        SM_STATE32:
            begin
            spi_data<=SM_VALUE32;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE33;
            end    
        SM_STATE33:
            begin
            spi_data<=SM_VALUE33;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE34;
            end
        SM_STATE34:
            begin
            spi_data<=SM_VALUE34;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE35;
            end
        SM_STATE35:
            begin
            spi_data<=SM_VALUE35;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE36;
            end        
        SM_STATE36:
            begin
            spi_data<=SM_VALUE36;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE37;
            end                    
        SM_STATE37:
            begin
            spi_data<=SM_VALUE37;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE38;
            end        
        SM_STATE38:
            begin
            spi_data<=SM_VALUE38;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE39;
            end    
        SM_STATE39:
            begin
            spi_data<=SM_VALUE39;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE40;
            end    
        SM_STATE40:
            begin
            spi_data<=SM_VALUE40;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE41;
            end    
        SM_STATE41:
            begin
            spi_data<=SM_VALUE41;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE42;
            end    
        SM_STATE42:
            begin
            spi_data<=SM_VALUE42;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE43;
            end    
        SM_STATE43:
            begin
            spi_data<=SM_VALUE43;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE44;
            end    
        SM_STATE44:
            begin
            spi_data<=SM_VALUE44;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE45;
            end    
        SM_STATE45:
            begin
            spi_data<=SM_VALUE45;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE46;
            end    
        SM_STATE46:
            begin
            spi_data<=SM_VALUE46;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE47;
            end    
        SM_STATE47:
            begin
            spi_data<=SM_VALUE47;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE48;
            end      
        SM_STATE48:
            begin
            spi_data<=SM_VALUE48;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE49;
            end    
        SM_STATE49:
            begin
            spi_data<=SM_VALUE49;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE50;
            end 
        SM_STATE50:
            begin
            spi_data<=SM_VALUE50;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE51;
            end    
        SM_STATE51:
            begin
            spi_data<=SM_VALUE51;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE52;
            end    
        SM_STATE52:
            begin
            spi_data<=SM_VALUE52;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE53;
            end    
        SM_STATE53:
            begin
            spi_data<=SM_VALUE53;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE54;
            end
        SM_STATE54:
            begin
            spi_data<=SM_VALUE54;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE55;
            end
        SM_STATE55:
            begin
            spi_data<=SM_VALUE55;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE56;
            end        
        SM_STATE56:
            begin
            spi_data<=SM_VALUE56;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE57;
            end                    
        SM_STATE57:
            begin
            spi_data<=SM_VALUE57;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE58;
            end        
        SM_STATE58:
            begin
            spi_data<=SM_VALUE58;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE59;
            end    
        SM_STATE59:
            begin
            spi_data<=SM_VALUE59;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE60;
            end    
        SM_STATE60:
            begin
            spi_data<=SM_VALUE60;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE61;
            end    
        SM_STATE61:
            begin
            spi_data<=SM_VALUE61;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE62;
            end    
        SM_STATE62:
            begin
            spi_data<=SM_VALUE62;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE63;
            end    
        SM_STATE63:
            begin
            spi_data<=SM_VALUE63;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE64;
            end    
        SM_STATE64:
            begin
            spi_data<=SM_VALUE64;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE65;
            end    
        SM_STATE65:
            begin
            spi_data<=SM_VALUE65;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE66;
            end    
        SM_STATE66:
            begin
            spi_data<=SM_VALUE66;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE67;
            end    
        SM_STATE67:
            begin
            spi_data<=SM_VALUE67;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE68;
            end  
        SM_STATE68:
            begin
            spi_data<=SM_VALUE68;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE69;
            end    
        SM_STATE69:
            begin
            spi_data<=SM_VALUE69;
            SM<=SM_CONFIG;
            SM_NEXT<=SM_STATE70;
            end
        SM_STATE70:
            begin
            spi_data<=0;
            SM<=SM_WAIT;
            SM_NEXT<=SM_STATE71;
            end
        
        SM_STATE71:
            begin
            spi_data<=SM_VALUE70;
            SM<=SM_READ;
            SM_NEXT<=SM_STATE70;
            end 
            
       SM_STOP:
            begin
            SM <= SM_NEXT;
            end
        default:
        SM<=SM_IDLE;
    endcase

endmodule