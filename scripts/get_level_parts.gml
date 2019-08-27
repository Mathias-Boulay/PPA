///get_level_parts(LevelToCheck)
var PossibleParts;
PossibleParts[5]="Boss";
PossibleParts[4]="PartFive";
PossibleParts[3]="PartFour";
PossibleParts[2]="PartThree";
PossibleParts[1]="PartTwo";
PossibleParts[0]="PartOne";

var count;
count = 0;

var AvailableParts;
    
if file_exists(LEVELS_DIR + "Level " + string(argument0)){
    //Avoid corruption
    ini_close();
    
    ini_open(LEVELS_DIR + "Level " + string(argument0));
    
    //Then the bulky part
    for(z=0; z<= 5; z++){
        if ini_section_exists(PossibleParts[z]){
            if count >= 3{
                print_warning("[LEVEL PART PARSER] Too many parts !");
                break; 
                }
            AvailableParts[count] = z;
            
            count++;
            }
        }
    ini_close();    
    
    if is_array(AvailableParts){
        return AvailableParts;
        }
    else{
        print_error("[LEVEL PART PARSER] No parts found !");
        return "";
        }
    
    }
else{
    print_error("[LEVEL PART PARSER] File not found ! (Level " +string(argument0));
    return "";
    }
