$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'],	
set_etalis_flag(logging_to_file,on), set_etalis_flag(store_fired_events,on), 
compile_event_file('../examples/periodic_01/test_01.event'),
event(start), sleep(7), event(fini), sleep(1), 
List=[event(a(1),2)],
(check_fired_events(List) -> write('periodic_01\t\t\tpassed\n') ; write('periodic_01\t\t\tfailed\n')),halt."
