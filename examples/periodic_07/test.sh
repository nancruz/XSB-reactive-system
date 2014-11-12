$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'],
compile_event_file('../examples/periodic_07/test.event'),
event(start),event(fini),
execute_event_stream_file('../examples/periodic_07/3_25000.P'),halt."
