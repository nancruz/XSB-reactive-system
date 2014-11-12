$XSB/bin/xsb-mt --shared_predicates -e "['etalis.P'], 
set_etalis_flag(rule_sharing,on), set_etalis_flag(output_temporary_files,on), 
set_etalis_flag(store_fired_events,on), 
compile_event_file('test_01.event'), 
event(a(1)), event(b(1)), event(c(1)),halt."
