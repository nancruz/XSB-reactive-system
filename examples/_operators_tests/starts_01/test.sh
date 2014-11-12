$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'], 
set_etalis_flag(store_fired_events,on), 
compile_event_file('starts_01/test_01.event'), 
event(a(1)), event(f(1)), event(b(1)),
List=[event(e(1),1)],
(check_fired_events(List) -> write('starts_01\t\t\tpassed\n') ; write('starts_01\t\t\tfailed\n') ),halt."