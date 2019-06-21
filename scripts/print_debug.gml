///print_debug(Str)
file=file_text_open_append(working_directory+"logs/last_logs.txt");
file_text_write_string(file,"[DEBUG] "+argument0+".");
show_debug_message("[DEBUG] "+argument0+".");
file_text_writeln(file);
file_text_close(file);
