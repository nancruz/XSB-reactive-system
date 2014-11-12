$XSB/bin/xsb-mt --shared_predicates -e "['etalis.P'], 
set_etalis_flag(store_fired_events,on),
set_etalis_flag(output_temporary_files,on), 
compile_event_file('../examples/and_01/test_01.event'), 
event(a(1)), event(b(1)), event(c(1)),
List = [event(d(1),2)],
(check_fired_events(List) -> write('and_01\t\t\t\tpassed\n') ; write('and_01\t\t\t\tfailed\n') ),halt."