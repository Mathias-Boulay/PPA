///get_rionys_in_part_level(PartToCheck)

var PossibleParts;
PossibleParts[5]="Boss";
PossibleParts[4]="PartFive";
PossibleParts[3]="PartFour";
PossibleParts[2]="PartThree";
PossibleParts[1]="PartTwo";
PossibleParts[0]="PartOne";

return ini_read_real(PossibleParts[argument0],"RionysNumber",0);
