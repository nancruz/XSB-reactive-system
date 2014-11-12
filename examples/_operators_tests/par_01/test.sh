$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'],
set_etalis_flag(store_fired_events,on), 
compile_event_file('par_01/test_01.event'), 
event(a(1)), event(c(1)), event(b(1)), event(a(2)), event(b(2)), event(c(2)),
List = [event(d(1),1)], 
(check_fired_events(List) -> write('par_01\t\t\tpassed\n') ; write('par_01\t\t\tfailed\n')),halt."