$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'], 
set_etalis_flag(store_fired_events,on), 
compile_event_file('during_02/test_01.event'), 
event(a0(1)), sleep(2), event(a(1)), sleep(2), event(b(1)), sleep(2), event(b0(1)), 
List=[event(e(1), 1)],
(check_fired_events(List) -> write('during_02\t\t passed') ; write('during_02\t\t failed')), halt."