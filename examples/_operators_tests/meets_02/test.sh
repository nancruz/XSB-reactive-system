$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'], 
set_etalis_flag(store_fired_events,on), 
compile_event_file('meets_02/test_01.event'), 
event(a), event(b),
List =[event(ce2, 1)],
(check_fired_events(List) ->write('meets_01\t\t\tpassed\n') ; write('meets_01\t\t\tfailed\n') ),halt."