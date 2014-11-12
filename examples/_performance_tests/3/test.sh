$XSB/bin/xsb --quietload -e "['etalis.P'], 
set_etalis_flag(store_fired_events,on),
compile_event_file('../examples/_performance_tests/3/test.event'),
execute_event_stream_file('../examples/_performance_tests/data/3_1000.P')."