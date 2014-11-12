$XSB/bin/xsb -e "[etalis],
set_etalis_flag(output_temporary_files,on),
compile_event_file('test_01.event'),
execute_event_stream_file('events')." 
