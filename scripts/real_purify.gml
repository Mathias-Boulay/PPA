///real_purify(ID,StrToPurify)
if variable_instance_exists(argument0,string(argument1)){
    purify=variable_instance_get(argument0,string(argument1));
    length=string_length(purify);
    purified="";
    
    Allow[0]="0";
    Allow[1]="1";
    Allow[2]="2";
    Allow[3]="3";
    Allow[4]="4";
    Allow[5]="5";
    Allow[6]="6";
    Allow[7]="7";
    Allow[8]="8";
    Allow[9]="9";
    Allow[10]=".";
    Allow[11]="-";
    
    for(w=1;w<=length;w++){
        for(z=0;z<array_length_1d(Allow);z++){
            if string_char_at(purify,1) = Allow[z]{
                purified+=string_copy(purify,1,1);
                z=999999;
                }
            }
        purify=string_delete(purify,1,1);
        }
    return purified;
    }
else{
    print_error("[PURIFY] Unable to purify this number")
    return "";
    }
