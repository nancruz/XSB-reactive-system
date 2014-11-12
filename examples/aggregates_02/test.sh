$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'], 
set_etalis_flag(store_fired_events,on), 
compile_event_file('aggregates_02/test_01.event'), 
event(start_aggr), event(a(1)), event(a(2)), event(a(3)), 
List=[event(d(0),1), event(d(1),1), event(d(3),1), event(d(6),1)], 
(check_fired_events(List) -> write('aggregates_02\t\t\tpassed\n') ;  write('aggregates_02\t\t\tfailed\n') ),halt."
