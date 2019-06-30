///print_warning(Str)
file=file_text_open_append(working_directory+"logs/last_errors.txt");
file_text_write_string(file,"[WARNING] "+argument0+"...");
show_debug_message("[WARNING] "+argument0+" ...");
file_text_writeln(file);
file_text_close(file);

file=file_text_open_append(working_directory+"logs/last_logs.txt");
file_text_write_string(file,"[WARNING] "+argument0+"...");
file_text_writeln(file);
file_text_close(file);

file=file_text_open_append(working_directory+"logs/last_warnings_and_errors.txt");
file_text_write_string(file,"[WARNING] "+argument0+"...");
file_text_writeln(file);
file_text_close(file);
