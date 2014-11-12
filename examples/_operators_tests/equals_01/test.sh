$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'],
set_etalis_flag(store_fired_events,on), 
compile_event_file('equals_01/test_01.event'), 
event(a(1)), event(b(1)),
List=[event(f(1),1)],
(check_fired_events(List) -> write('equals_01\t\tpassed\n') ; write('equals_01\t\tfailed\n')),halt."