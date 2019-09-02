///get_text(InstructionsToShow,SomeText);
var This_instance;
This_instance = instance_create(0,0,object_get_string);
This_instance.CallingPart = id;
This_instance.Instruction = argument0;
if argument_count > 1{
    This_instance.String = argument1;
    This_instance.CursorPosition = string_length(argument1)+1;
    }


