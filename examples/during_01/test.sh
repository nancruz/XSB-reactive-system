$XSB/bin/xsb -e "open('../results.txt',append,FH), ['etalis.P'], 
set_etalis_flag(output_temporary_files,on), set_etalis_flag(logging_to_file,on), set_etalis_flag(store_fired_events,on), 
compile_event_file('test_01.event'),
event(a0(1)), event(a(1)), event(b(1)), event(b0(1)), halt."
