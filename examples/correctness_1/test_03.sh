# Test stream from case 3
$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'], 
set_etalis_flag(store_fired_events,on), 
compile_event_file('event_specification.event'),
execute_event_stream_file('test_03.stream'),
List=[event(bidWinner(56,5),1)], 
( check_fired_events(List) -> write('correctness_01\t\t\t\tpassed\n') ; write('correctness_01\t\t\t\tfailed\n') ),halt."