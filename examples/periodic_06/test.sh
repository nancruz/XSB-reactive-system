$XSB/bin/xsb-mt --shared_predicates --quietload -e "['etalis.P'],
compile_event_file('../examples/periodic_06/test.event'),
event(start),event(fini),
execute_event_stream_file('../examples/periodic_06/1_25000.P'),halt."
