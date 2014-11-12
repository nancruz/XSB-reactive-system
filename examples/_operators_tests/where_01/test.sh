$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'], 
set_etalis_flag(store_fired_events,on),
compile_event_file('../examples/_operators_tests/where_01/test_01.event'), 
event(a(0)), event(a(1)), event(b(1)), event(b(2)), event(c(3)),
List=[event(d(1),1),event(d(2),1),event(d(3),1)],
(check_fired_events(List) -> write('where_01\t\tpassed\n') ; write('where_01\t\tfailed\n')),halt."