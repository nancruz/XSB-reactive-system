$XSB/bin/xsb -e "['etalis.P'],
set_etalis_flag(logging,off), 
compile_event_file('../examples/flower_delivery/flower_specification.event'), 
load_static_rules('../examples/flower_delivery/flower_specification_static_rules.P'), 
load_database('../examples/flower_delivery/use_cases/flower_interface_01.db'), 
flower_use_case_interface."
################################################################################
rm -rf *.bin *.ctr