$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'],
set_etalis_flag(store_fired_events,on), 
compile_event_file('windows_01/test_01.event'),
event(a(1)), sleep(2), event(b(1)), 
List=[event(d(1),1)],
(check_fired_events(List) -> write('windows_01\t\tpassed\n') ; write('windows_01\t\tfailed\n')),halt."