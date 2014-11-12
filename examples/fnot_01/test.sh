$XSB/bin/xsb -e "open('../results.txt',append,FH), ['etalis.P'], 
set_etalis_flag(output_temporary_files,on), set_etalis_flag(logging_to_file,on), set_etalis_flag(store_fired_events,on), 
compile_event_file('../examples/fnot_01/test_01.event'), event(b(2)), event(c(2)), event(a(1)),
findall(stored_event(event(d(X),T)),stored_event(event(d(X),T)),List), ( List=[stored_event(event(d(2),[datime(_,_,_,_,_,_,_),datime(_,_,_,_,_,_,_)]))] -> write(FH,'fnot_01\t\t\t\tpassed\n'),write('fnot_01\t\t\t\tpassed\n') ; write(FH,'fnot_01\t\t\t\tfailed\n'),write('fnot_01\t\t\t\tfailed\n') ),halt."
