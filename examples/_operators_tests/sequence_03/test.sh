$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'], 
set_etalis_flag(store_fired_events,on), 
compile_event_file('sequence_03/test_01.event'), 
event(a(1)), event(b(1)), event(c(1)), event(a(2)),
List = [event(d(1),1), event(d(2),1)], 
(check_fired_events(List) -> write('sequence_03\t\t\tpassed\n') ; write('sequence_03\t\t\tfailed\n') ),halt."
