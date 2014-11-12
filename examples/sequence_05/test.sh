$XSB/bin/xsb -e "open('../results.txt',append,FH), ['etalis.P'], 
set_etalis_flag(output_temporary_files,on), set_etalis_flag(logging_to_file,on), set_etalis_flag(store_fired_events,on),set_etalis_flag(revision_flag,on), 
compile_event_file('../examples/sequence_05/test_01.event'), event(a(1,1)), event(a(1,2)), event(a(1,3)), event(a(1,4))."
