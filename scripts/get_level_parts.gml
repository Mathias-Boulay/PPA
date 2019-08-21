///get_level_parts(LevelToCheck)
var PossibleParts;
PossibleParts[5]="Boss";
PossibleParts[4]="PartFive";
PossibleParts[3]="PartFour";
PossibleParts[2]="PartThree";
PossibleParts[1]="PartTwo";
PossibleParts[0]="PartOne";

var AvailableParts;
    
if file_exists(LEVELS_DIR + "Level " + string(argument0)){
    //Avoid corruption
    ini_close();
    
    ini_open(LEVELS_DIR + "Level " + string(argument0));
    
    //Then the bulky part
    for(z=0; z<= 5; z++){
        if ini_section_exists(PossibleParts[z]){
        
            for(w=0; w<= 2; w++){
                if AvailableParts[w] = ""{
                    AvailableParts[w] = PossibleParts[z];
                    break;
                    }
                }
                
            
            }
        }
    ini_close();    
    
    return AvailableParts;
    
    }
else{
    print_debug("[PART PARSER] File not found ! (Level " +string(argument0))
    }
