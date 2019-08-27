///image_size_check(ImageToCheck,ExpectedWidth,ExpectedHeight);
var ImgCheck;
ImgCheck = true;
if sprite_exists(argument0){

    if sprite_get_width(argument0) > argument1{
        print_warning("[IMG SIZE CHECKER] The image is " + string(sprite_get_width(LevelImg)-argument1) + "wider than expected");
        }
    else{
        if sprite_get_width(argument0) < argument1{
            print_warning("[IMG SIZE CHECKER] The image is " + string(abs(sprite_get_width(LevelImg)-argument1)) + "less wide than expected");
            }
        }
        
    if sprite_get_height(argument0) > argument2{
        print_warning("[IMG SIZE CHECKER] The image is " + string(sprite_get_height(LevelImg)-argument2) + "taller than expected");
        }
    else{
        if sprite_get_height(argument0) < argument2{
            print_warning("[IMG SIZE CHECKER] The image is " + string(abs(sprite_get_height(LevelImg)-argument2)) + "less tall than expected");
            }
        }
        
    }
else{
    print_error("[IMG SIZE CHECKER] The sprite does not exist");
    }
