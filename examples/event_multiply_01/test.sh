sh $XSB/bin/xsb -e "open('../results.txt',append,FH), ['etalis.P'], 
set_etalis_flag(output_temporary_files,on), set_etalis_flag(logging_to_file,on), set_etalis_flag(store_fired_events,on), 
compile_event_file('../examples/event_multiply_01/test_01.event'), event(a(1)), 
findall(stored_event(event(b(X),T)),stored_event(event(b(X),T)),List), ( List=[stored_event(event(b(2),[datime(_,_,_,_,_,_,_),datime(_,_,_,_,_,_,_)])),stored_event(event(b(3),[datime(_,_,_,_,_,_,_),datime(_,_,_,_,_,_,_)]))] -> write(FH,'event_multiply_01\t\tpassed\n'),write('event_multiply_01\t\tpassed\n') ; write(FH,'event_multiply_01\t\tfailed\n'),write('event_multiply_01\t\tfailed\n') ),halt."
