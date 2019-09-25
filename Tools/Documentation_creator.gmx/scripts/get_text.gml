///get_text(InstructionsToShow,SomeText);
var This_instance;
This_instance = instance_create(0,0,object_get_string);
This_instance.CallingPart = id;
This_instance.Instruction = argument0;
if argument_count > 1{
    with(This_instance){
        tte_ext_input_set_text(argument1);
        }
    }


