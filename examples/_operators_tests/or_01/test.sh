$XSB/bin/xsb-mt --shared_predicates -e "['etalis.P'], 
set_etalis_flag(store_fired_events,on), 
compile_event_file('../examples/_operators_tests/or_01/test_01.event'), 
event(a(1)), event(b(2)),
List=[event(d(1),1),event(d(2),1)], 
(check_fired_events(List) -> write('or_01\t\t\t\tpassed\n') ; write('or_01\t\t\t\tfailed\n') ),halt."