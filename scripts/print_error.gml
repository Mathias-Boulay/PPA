///print_error(Str)
file=file_text_open_write(working_directory+"logs/last_errors.txt");
file_text_write_string(file,"ERROR: "+argument0+" !");
file_text_writeln(file);
file_text_close(file);
