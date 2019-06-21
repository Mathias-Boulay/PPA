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
    
    for(j=1;j<=length;j++){
        for(i=0;i<array_length_1d(Allow);i++){
            if string_char_at(purify,1) = Allow[i]{
                purified+=string_copy(purify,1,1);
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
