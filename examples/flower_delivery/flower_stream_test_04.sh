$XSB/bin/xsb -e "['etalis.P'],
set_etalis_flag(logging,off), 
compile_event_file('../examples/flower_delivery/flower_specification.event'), 
load_static_rules('../examples/flower_delivery/flower_specification_static_rules.P'), 
load_database('../examples/flower_delivery/use_cases/flower_stream_test_04.db'), 
execute_event_stream_file('../examples/flower_delivery/use_cases/flower_stream_test_04.stream')."
################################################################################
rm -rf *.bin *.ctr