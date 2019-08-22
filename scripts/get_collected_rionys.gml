///get_collected_rionys(LevelName)

//*****   This function assumes the    *****\\
//***** global variable SELECTED_SAVE  *****\\
//*****   points towards something     *****\\
var Collected;

//Avoid corruption
ini_close();

if variable_global_exists("SELECTED_SAVE"){
    if file_exists(global.SELECTED_SAVE){
        ini_open(global.SELECTED_SAVE);
        
        Collected[0] = ini_read_real(string(argument0),"PartOneRionys",0);
        Collected[1] = ini_read_real(string(argument0),"PartTwoRionys",0);
        Collected[2] = ini_read_real(string(argument0),"PartThreeRionys",0);
        Collected[3] = ini_read_real(string(argument0),"PartFourRionys",0);
        Collected[4] = ini_read_real(string(argument0),"PartFiveRionys",0);
        Collected[5] = ini_read_real(string(argument0),"BossRionys",0); 
        
        ini_close();
        
        return Collected;   
        
        }
    else{
        print_error("[SAVE PART PARSER] Save not found !");
        return "";
        }
    
    }
else{
    print_error("[SAVE PART PARSER] No selected save !");
    return "";
    }
