$XSB/bin/xsb-mt --shared_predicates -e "['etalis.P'], set_etalis_flag(logging_to_file,on),
set_etalis_flag(output_temporary_files,on),  set_etalis_flag(store_fired_events,on), 
compile_event_file('../examples/sequence_01/test_01.event'),
execute_event_stream_file('../examples/sequence_01/stream')".
